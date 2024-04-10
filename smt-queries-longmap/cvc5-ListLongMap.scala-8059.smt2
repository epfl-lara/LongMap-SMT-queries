; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99194 () Bool)

(assert start!99194)

(declare-fun b_free!24799 () Bool)

(declare-fun b_next!24799 () Bool)

(assert (=> start!99194 (= b_free!24799 (not b_next!24799))))

(declare-fun tp!87108 () Bool)

(declare-fun b_and!40447 () Bool)

(assert (=> start!99194 (= tp!87108 b_and!40447)))

(declare-fun b!1167830 () Bool)

(declare-fun e!663752 () Bool)

(declare-fun e!663751 () Bool)

(assert (=> b!1167830 (= e!663752 e!663751)))

(declare-fun res!774765 () Bool)

(assert (=> b!1167830 (=> res!774765 e!663751)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167830 (= res!774765 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44233 0))(
  ( (V!44234 (val!14721 Int)) )
))
(declare-datatypes ((tuple2!18780 0))(
  ( (tuple2!18781 (_1!9401 (_ BitVec 64)) (_2!9401 V!44233)) )
))
(declare-datatypes ((List!25521 0))(
  ( (Nil!25518) (Cons!25517 (h!26726 tuple2!18780) (t!37312 List!25521)) )
))
(declare-datatypes ((ListLongMap!16749 0))(
  ( (ListLongMap!16750 (toList!8390 List!25521)) )
))
(declare-fun lt!525786 () ListLongMap!16749)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13955 0))(
  ( (ValueCellFull!13955 (v!17358 V!44233)) (EmptyCell!13955) )
))
(declare-datatypes ((array!75481 0))(
  ( (array!75482 (arr!36391 (Array (_ BitVec 32) ValueCell!13955)) (size!36927 (_ BitVec 32))) )
))
(declare-fun lt!525788 () array!75481)

(declare-fun minValue!944 () V!44233)

(declare-datatypes ((array!75483 0))(
  ( (array!75484 (arr!36392 (Array (_ BitVec 32) (_ BitVec 64))) (size!36928 (_ BitVec 32))) )
))
(declare-fun lt!525787 () array!75483)

(declare-fun zeroValue!944 () V!44233)

(declare-fun getCurrentListMapNoExtraKeys!4854 (array!75483 array!75481 (_ BitVec 32) (_ BitVec 32) V!44233 V!44233 (_ BitVec 32) Int) ListLongMap!16749)

(assert (=> b!1167830 (= lt!525786 (getCurrentListMapNoExtraKeys!4854 lt!525787 lt!525788 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75481)

(declare-fun dynLambda!2835 (Int (_ BitVec 64)) V!44233)

(assert (=> b!1167830 (= lt!525788 (array!75482 (store (arr!36391 _values!996) i!673 (ValueCellFull!13955 (dynLambda!2835 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36927 _values!996)))))

(declare-fun _keys!1208 () array!75483)

(declare-fun lt!525789 () ListLongMap!16749)

(assert (=> b!1167830 (= lt!525789 (getCurrentListMapNoExtraKeys!4854 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167831 () Bool)

(declare-fun res!774759 () Bool)

(declare-fun e!663747 () Bool)

(assert (=> b!1167831 (=> (not res!774759) (not e!663747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167831 (= res!774759 (validMask!0 mask!1564))))

(declare-fun b!1167832 () Bool)

(assert (=> b!1167832 (= e!663751 true)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1465 (ListLongMap!16749 (_ BitVec 64)) ListLongMap!16749)

(assert (=> b!1167832 (= (getCurrentListMapNoExtraKeys!4854 lt!525787 lt!525788 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1465 (getCurrentListMapNoExtraKeys!4854 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!38532 0))(
  ( (Unit!38533) )
))
(declare-fun lt!525784 () Unit!38532)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!692 (array!75483 array!75481 (_ BitVec 32) (_ BitVec 32) V!44233 V!44233 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38532)

(assert (=> b!1167832 (= lt!525784 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!692 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167833 () Bool)

(declare-fun e!663746 () Bool)

(declare-fun e!663753 () Bool)

(declare-fun mapRes!45818 () Bool)

(assert (=> b!1167833 (= e!663746 (and e!663753 mapRes!45818))))

(declare-fun condMapEmpty!45818 () Bool)

(declare-fun mapDefault!45818 () ValueCell!13955)

