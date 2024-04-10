; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101584 () Bool)

(assert start!101584)

(declare-fun b_free!26339 () Bool)

(declare-fun b_next!26339 () Bool)

(assert (=> start!101584 (= b_free!26339 (not b_next!26339))))

(declare-fun tp!92057 () Bool)

(declare-fun b_and!43903 () Bool)

(assert (=> start!101584 (= tp!92057 b_and!43903)))

(declare-fun b!1221541 () Bool)

(declare-fun res!811542 () Bool)

(declare-fun e!693709 () Bool)

(assert (=> b!1221541 (=> (not res!811542) (not e!693709))))

(declare-datatypes ((array!78867 0))(
  ( (array!78868 (arr!38062 (Array (_ BitVec 32) (_ BitVec 64))) (size!38598 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78867)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46517 0))(
  ( (V!46518 (val!15578 Int)) )
))
(declare-datatypes ((ValueCell!14812 0))(
  ( (ValueCellFull!14812 (v!18237 V!46517)) (EmptyCell!14812) )
))
(declare-datatypes ((array!78869 0))(
  ( (array!78870 (arr!38063 (Array (_ BitVec 32) ValueCell!14812)) (size!38599 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78869)

(assert (=> b!1221541 (= res!811542 (and (= (size!38599 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38598 _keys!1208) (size!38599 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1221542 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!693700 () Bool)

(declare-fun arrayContainsKey!0 (array!78867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221542 (= e!693700 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1221543 () Bool)

(declare-fun e!693696 () Bool)

(declare-fun e!693702 () Bool)

(assert (=> b!1221543 (= e!693696 e!693702)))

(declare-fun res!811530 () Bool)

(assert (=> b!1221543 (=> (not res!811530) (not e!693702))))

(declare-datatypes ((List!26860 0))(
  ( (Nil!26857) (Cons!26856 (h!28065 (_ BitVec 64)) (t!40179 List!26860)) )
))
(declare-fun contains!7025 (List!26860 (_ BitVec 64)) Bool)

(assert (=> b!1221543 (= res!811530 (not (contains!7025 Nil!26857 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221544 () Bool)

(declare-fun e!693707 () Bool)

(declare-fun e!693705 () Bool)

(assert (=> b!1221544 (= e!693707 e!693705)))

(declare-fun res!811536 () Bool)

(assert (=> b!1221544 (=> res!811536 e!693705)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1221544 (= res!811536 (not (= (select (arr!38062 _keys!1208) from!1455) k!934)))))

(declare-fun e!693697 () Bool)

(assert (=> b!1221544 e!693697))

(declare-fun res!811525 () Bool)

(assert (=> b!1221544 (=> (not res!811525) (not e!693697))))

(declare-datatypes ((tuple2!20060 0))(
  ( (tuple2!20061 (_1!10041 (_ BitVec 64)) (_2!10041 V!46517)) )
))
(declare-datatypes ((List!26861 0))(
  ( (Nil!26858) (Cons!26857 (h!28066 tuple2!20060) (t!40180 List!26861)) )
))
(declare-datatypes ((ListLongMap!18029 0))(
  ( (ListLongMap!18030 (toList!9030 List!26861)) )
))
(declare-fun lt!555644 () ListLongMap!18029)

(declare-fun lt!555638 () ListLongMap!18029)

(declare-fun lt!555640 () V!46517)

(declare-fun +!4093 (ListLongMap!18029 tuple2!20060) ListLongMap!18029)

(declare-fun get!19424 (ValueCell!14812 V!46517) V!46517)

(assert (=> b!1221544 (= res!811525 (= lt!555638 (+!4093 lt!555644 (tuple2!20061 (select (arr!38062 _keys!1208) from!1455) (get!19424 (select (arr!38063 _values!996) from!1455) lt!555640)))))))

(declare-fun b!1221545 () Bool)

(assert (=> b!1221545 (= e!693702 (not (contains!7025 Nil!26857 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221546 () Bool)

(declare-fun e!693701 () Bool)

(declare-fun e!693704 () Bool)

(assert (=> b!1221546 (= e!693701 (not e!693704))))

(declare-fun res!811539 () Bool)

(assert (=> b!1221546 (=> res!811539 e!693704)))

(assert (=> b!1221546 (= res!811539 (bvsgt from!1455 i!673))))

(assert (=> b!1221546 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40464 0))(
  ( (Unit!40465) )
))
(declare-fun lt!555647 () Unit!40464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78867 (_ BitVec 64) (_ BitVec 32)) Unit!40464)

(assert (=> b!1221546 (= lt!555647 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1221548 () Bool)

(declare-fun e!693698 () Bool)

(assert (=> b!1221548 (= e!693698 e!693707)))

(declare-fun res!811538 () Bool)

(assert (=> b!1221548 (=> res!811538 e!693707)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1221548 (= res!811538 (not (validKeyInArray!0 (select (arr!38062 _keys!1208) from!1455))))))

(declare-fun lt!555648 () ListLongMap!18029)

(assert (=> b!1221548 (= lt!555648 lt!555644)))

(declare-fun lt!555643 () ListLongMap!18029)

(declare-fun -!1935 (ListLongMap!18029 (_ BitVec 64)) ListLongMap!18029)

(assert (=> b!1221548 (= lt!555644 (-!1935 lt!555643 k!934))))

(declare-fun zeroValue!944 () V!46517)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555639 () array!78867)

(declare-fun minValue!944 () V!46517)

(declare-fun lt!555646 () array!78869)

(declare-fun getCurrentListMapNoExtraKeys!5452 (array!78867 array!78869 (_ BitVec 32) (_ BitVec 32) V!46517 V!46517 (_ BitVec 32) Int) ListLongMap!18029)

(assert (=> b!1221548 (= lt!555648 (getCurrentListMapNoExtraKeys!5452 lt!555639 lt!555646 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1221548 (= lt!555643 (getCurrentListMapNoExtraKeys!5452 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555637 () Unit!40464)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1142 (array!78867 array!78869 (_ BitVec 32) (_ BitVec 32) V!46517 V!46517 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40464)

(assert (=> b!1221548 (= lt!555637 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1142 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221549 () Bool)

(declare-fun e!693703 () Bool)

(declare-fun e!693708 () Bool)

(declare-fun mapRes!48457 () Bool)

(assert (=> b!1221549 (= e!693703 (and e!693708 mapRes!48457))))

(declare-fun condMapEmpty!48457 () Bool)

(declare-fun mapDefault!48457 () ValueCell!14812)

