; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97872 () Bool)

(assert start!97872)

(declare-fun b_free!23573 () Bool)

(declare-fun b_next!23573 () Bool)

(assert (=> start!97872 (= b_free!23573 (not b_next!23573))))

(declare-fun tp!83422 () Bool)

(declare-fun b_and!37929 () Bool)

(assert (=> start!97872 (= tp!83422 b_and!37929)))

(declare-fun res!748579 () Bool)

(declare-fun e!638055 () Bool)

(assert (=> start!97872 (=> (not res!748579) (not e!638055))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73087 0))(
  ( (array!73088 (arr!35196 (Array (_ BitVec 32) (_ BitVec 64))) (size!35732 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73087)

(assert (=> start!97872 (= res!748579 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35732 _keys!1208))))))

(assert (=> start!97872 e!638055))

(declare-fun tp_is_empty!28103 () Bool)

(assert (=> start!97872 tp_is_empty!28103))

(declare-fun array_inv!27032 (array!73087) Bool)

(assert (=> start!97872 (array_inv!27032 _keys!1208)))

(assert (=> start!97872 true))

(assert (=> start!97872 tp!83422))

(declare-datatypes ((V!42597 0))(
  ( (V!42598 (val!14108 Int)) )
))
(declare-datatypes ((ValueCell!13342 0))(
  ( (ValueCellFull!13342 (v!16741 V!42597)) (EmptyCell!13342) )
))
(declare-datatypes ((array!73089 0))(
  ( (array!73090 (arr!35197 (Array (_ BitVec 32) ValueCell!13342)) (size!35733 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73089)

(declare-fun e!638052 () Bool)

(declare-fun array_inv!27033 (array!73089) Bool)

(assert (=> start!97872 (and (array_inv!27033 _values!996) e!638052)))

(declare-fun b!1120530 () Bool)

(declare-fun e!638058 () Bool)

(assert (=> b!1120530 (= e!638058 tp_is_empty!28103)))

(declare-fun mapNonEmpty!43972 () Bool)

(declare-fun mapRes!43972 () Bool)

(declare-fun tp!83423 () Bool)

(assert (=> mapNonEmpty!43972 (= mapRes!43972 (and tp!83423 e!638058))))

(declare-fun mapRest!43972 () (Array (_ BitVec 32) ValueCell!13342))

(declare-fun mapValue!43972 () ValueCell!13342)

(declare-fun mapKey!43972 () (_ BitVec 32))

(assert (=> mapNonEmpty!43972 (= (arr!35197 _values!996) (store mapRest!43972 mapKey!43972 mapValue!43972))))

(declare-fun b!1120531 () Bool)

(declare-fun res!748576 () Bool)

(assert (=> b!1120531 (=> (not res!748576) (not e!638055))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1120531 (= res!748576 (= (select (arr!35196 _keys!1208) i!673) k!934))))

(declare-fun b!1120532 () Bool)

(declare-fun res!748575 () Bool)

(assert (=> b!1120532 (=> (not res!748575) (not e!638055))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120532 (= res!748575 (validMask!0 mask!1564))))

(declare-fun b!1120533 () Bool)

(declare-fun e!638056 () Bool)

(declare-fun e!638054 () Bool)

(assert (=> b!1120533 (= e!638056 (not e!638054))))

(declare-fun res!748578 () Bool)

(assert (=> b!1120533 (=> res!748578 e!638054)))

(assert (=> b!1120533 (= res!748578 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120533 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36766 0))(
  ( (Unit!36767) )
))
(declare-fun lt!498051 () Unit!36766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73087 (_ BitVec 64) (_ BitVec 32)) Unit!36766)

(assert (=> b!1120533 (= lt!498051 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1120534 () Bool)

(declare-fun e!638057 () Bool)

(assert (=> b!1120534 (= e!638052 (and e!638057 mapRes!43972))))

(declare-fun condMapEmpty!43972 () Bool)

(declare-fun mapDefault!43972 () ValueCell!13342)

