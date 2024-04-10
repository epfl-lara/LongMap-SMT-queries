; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99440 () Bool)

(assert start!99440)

(declare-fun b_free!25019 () Bool)

(declare-fun b_next!25019 () Bool)

(assert (=> start!99440 (= b_free!25019 (not b_next!25019))))

(declare-fun tp!87770 () Bool)

(declare-fun b_and!40905 () Bool)

(assert (=> start!99440 (= tp!87770 b_and!40905)))

(declare-fun b!1174533 () Bool)

(declare-fun res!780000 () Bool)

(declare-fun e!667619 () Bool)

(assert (=> b!1174533 (=> (not res!780000) (not e!667619))))

(declare-datatypes ((array!75909 0))(
  ( (array!75910 (arr!36604 (Array (_ BitVec 32) (_ BitVec 64))) (size!37140 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75909)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1174533 (= res!780000 (= (select (arr!36604 _keys!1208) i!673) k!934))))

(declare-fun b!1174534 () Bool)

(declare-fun e!667625 () Bool)

(assert (=> b!1174534 (= e!667625 true)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1174534 (not (= (select (arr!36604 _keys!1208) from!1455) k!934))))

(declare-datatypes ((Unit!38753 0))(
  ( (Unit!38754) )
))
(declare-fun lt!529675 () Unit!38753)

(declare-fun e!667630 () Unit!38753)

(assert (=> b!1174534 (= lt!529675 e!667630)))

(declare-fun c!116652 () Bool)

(assert (=> b!1174534 (= c!116652 (= (select (arr!36604 _keys!1208) from!1455) k!934))))

(declare-fun e!667627 () Bool)

(assert (=> b!1174534 e!667627))

(declare-fun res!779996 () Bool)

(assert (=> b!1174534 (=> (not res!779996) (not e!667627))))

(declare-datatypes ((V!44525 0))(
  ( (V!44526 (val!14831 Int)) )
))
(declare-datatypes ((ValueCell!14065 0))(
  ( (ValueCellFull!14065 (v!17469 V!44525)) (EmptyCell!14065) )
))
(declare-datatypes ((array!75911 0))(
  ( (array!75912 (arr!36605 (Array (_ BitVec 32) ValueCell!14065)) (size!37141 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75911)

(declare-datatypes ((tuple2!18960 0))(
  ( (tuple2!18961 (_1!9491 (_ BitVec 64)) (_2!9491 V!44525)) )
))
(declare-datatypes ((List!25698 0))(
  ( (Nil!25695) (Cons!25694 (h!26903 tuple2!18960) (t!37709 List!25698)) )
))
(declare-datatypes ((ListLongMap!16929 0))(
  ( (ListLongMap!16930 (toList!8480 List!25698)) )
))
(declare-fun lt!529677 () ListLongMap!16929)

(declare-fun lt!529670 () V!44525)

(declare-fun lt!529674 () ListLongMap!16929)

(declare-fun +!3797 (ListLongMap!16929 tuple2!18960) ListLongMap!16929)

(declare-fun get!18683 (ValueCell!14065 V!44525) V!44525)

(assert (=> b!1174534 (= res!779996 (= lt!529677 (+!3797 lt!529674 (tuple2!18961 (select (arr!36604 _keys!1208) from!1455) (get!18683 (select (arr!36605 _values!996) from!1455) lt!529670)))))))

(declare-fun mapNonEmpty!46151 () Bool)

(declare-fun mapRes!46151 () Bool)

(declare-fun tp!87771 () Bool)

(declare-fun e!667624 () Bool)

(assert (=> mapNonEmpty!46151 (= mapRes!46151 (and tp!87771 e!667624))))

(declare-fun mapKey!46151 () (_ BitVec 32))

(declare-fun mapValue!46151 () ValueCell!14065)

(declare-fun mapRest!46151 () (Array (_ BitVec 32) ValueCell!14065))

(assert (=> mapNonEmpty!46151 (= (arr!36605 _values!996) (store mapRest!46151 mapKey!46151 mapValue!46151))))

(declare-fun b!1174535 () Bool)

(declare-fun e!667623 () Bool)

(assert (=> b!1174535 (= e!667619 e!667623)))

(declare-fun res!779987 () Bool)

(assert (=> b!1174535 (=> (not res!779987) (not e!667623))))

(declare-fun lt!529678 () array!75909)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75909 (_ BitVec 32)) Bool)

(assert (=> b!1174535 (= res!779987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529678 mask!1564))))

(assert (=> b!1174535 (= lt!529678 (array!75910 (store (arr!36604 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37140 _keys!1208)))))

(declare-fun b!1174536 () Bool)

(declare-fun e!667621 () Bool)

(declare-fun e!667628 () Bool)

(assert (=> b!1174536 (= e!667621 (and e!667628 mapRes!46151))))

(declare-fun condMapEmpty!46151 () Bool)

(declare-fun mapDefault!46151 () ValueCell!14065)

