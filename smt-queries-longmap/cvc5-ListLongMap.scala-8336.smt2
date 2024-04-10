; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101470 () Bool)

(assert start!101470)

(declare-fun b_free!26287 () Bool)

(declare-fun b_next!26287 () Bool)

(assert (=> start!101470 (= b_free!26287 (not b_next!26287))))

(declare-fun tp!91895 () Bool)

(declare-fun b_and!43763 () Bool)

(assert (=> start!101470 (= tp!91895 b_and!43763)))

(declare-fun b!1219664 () Bool)

(declare-fun e!692535 () Bool)

(declare-fun e!692529 () Bool)

(assert (=> b!1219664 (= e!692535 e!692529)))

(declare-fun res!810120 () Bool)

(assert (=> b!1219664 (=> res!810120 e!692529)))

(declare-datatypes ((array!78759 0))(
  ( (array!78760 (arr!38010 (Array (_ BitVec 32) (_ BitVec 64))) (size!38546 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78759)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1219664 (= res!810120 (not (= (select (arr!38010 _keys!1208) from!1455) k!934)))))

(declare-fun e!692526 () Bool)

(assert (=> b!1219664 e!692526))

(declare-fun res!810108 () Bool)

(assert (=> b!1219664 (=> (not res!810108) (not e!692526))))

(declare-datatypes ((V!46449 0))(
  ( (V!46450 (val!15552 Int)) )
))
(declare-datatypes ((tuple2!20016 0))(
  ( (tuple2!20017 (_1!10019 (_ BitVec 64)) (_2!10019 V!46449)) )
))
(declare-datatypes ((List!26816 0))(
  ( (Nil!26813) (Cons!26812 (h!28021 tuple2!20016) (t!40083 List!26816)) )
))
(declare-datatypes ((ListLongMap!17985 0))(
  ( (ListLongMap!17986 (toList!9008 List!26816)) )
))
(declare-fun lt!554565 () ListLongMap!17985)

(declare-fun lt!554557 () V!46449)

(declare-fun lt!554561 () ListLongMap!17985)

(declare-datatypes ((ValueCell!14786 0))(
  ( (ValueCellFull!14786 (v!18209 V!46449)) (EmptyCell!14786) )
))
(declare-datatypes ((array!78761 0))(
  ( (array!78762 (arr!38011 (Array (_ BitVec 32) ValueCell!14786)) (size!38547 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78761)

(declare-fun +!4076 (ListLongMap!17985 tuple2!20016) ListLongMap!17985)

(declare-fun get!19387 (ValueCell!14786 V!46449) V!46449)

(assert (=> b!1219664 (= res!810108 (= lt!554565 (+!4076 lt!554561 (tuple2!20017 (select (arr!38010 _keys!1208) from!1455) (get!19387 (select (arr!38011 _values!996) from!1455) lt!554557)))))))

(declare-fun b!1219665 () Bool)

(declare-fun e!692536 () Bool)

(declare-fun e!692528 () Bool)

(assert (=> b!1219665 (= e!692536 (not e!692528))))

(declare-fun res!810112 () Bool)

(assert (=> b!1219665 (=> res!810112 e!692528)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1219665 (= res!810112 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219665 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40416 0))(
  ( (Unit!40417) )
))
(declare-fun lt!554563 () Unit!40416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78759 (_ BitVec 64) (_ BitVec 32)) Unit!40416)

(assert (=> b!1219665 (= lt!554563 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1219666 () Bool)

(declare-fun res!810115 () Bool)

(declare-fun e!692532 () Bool)

(assert (=> b!1219666 (=> (not res!810115) (not e!692532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219666 (= res!810115 (validKeyInArray!0 k!934))))

(declare-fun b!1219667 () Bool)

(declare-fun e!692530 () Bool)

(declare-fun e!692527 () Bool)

(declare-fun mapRes!48373 () Bool)

(assert (=> b!1219667 (= e!692530 (and e!692527 mapRes!48373))))

(declare-fun condMapEmpty!48373 () Bool)

(declare-fun mapDefault!48373 () ValueCell!14786)

