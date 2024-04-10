; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99442 () Bool)

(assert start!99442)

(declare-fun b_free!25021 () Bool)

(declare-fun b_next!25021 () Bool)

(assert (=> start!99442 (= b_free!25021 (not b_next!25021))))

(declare-fun tp!87776 () Bool)

(declare-fun b_and!40909 () Bool)

(assert (=> start!99442 (= tp!87776 b_and!40909)))

(declare-fun b!1174595 () Bool)

(declare-datatypes ((Unit!38755 0))(
  ( (Unit!38756) )
))
(declare-fun e!667656 () Unit!38755)

(declare-fun Unit!38757 () Unit!38755)

(assert (=> b!1174595 (= e!667656 Unit!38757)))

(declare-fun b!1174596 () Bool)

(declare-fun res!780046 () Bool)

(declare-fun e!667657 () Bool)

(assert (=> b!1174596 (=> (not res!780046) (not e!667657))))

(declare-datatypes ((array!75913 0))(
  ( (array!75914 (arr!36606 (Array (_ BitVec 32) (_ BitVec 64))) (size!37142 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75913)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44529 0))(
  ( (V!44530 (val!14832 Int)) )
))
(declare-datatypes ((ValueCell!14066 0))(
  ( (ValueCellFull!14066 (v!17470 V!44529)) (EmptyCell!14066) )
))
(declare-datatypes ((array!75915 0))(
  ( (array!75916 (arr!36607 (Array (_ BitVec 32) ValueCell!14066)) (size!37143 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75915)

(assert (=> b!1174596 (= res!780046 (and (= (size!37143 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37142 _keys!1208) (size!37143 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174597 () Bool)

(declare-fun res!780032 () Bool)

(assert (=> b!1174597 (=> (not res!780032) (not e!667657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75913 (_ BitVec 32)) Bool)

(assert (=> b!1174597 (= res!780032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174598 () Bool)

(declare-fun e!667666 () Bool)

(assert (=> b!1174598 (= e!667666 true)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1174598 (not (= (select (arr!36606 _keys!1208) from!1455) k!934))))

(declare-fun lt!529720 () Unit!38755)

(assert (=> b!1174598 (= lt!529720 e!667656)))

(declare-fun c!116655 () Bool)

(assert (=> b!1174598 (= c!116655 (= (select (arr!36606 _keys!1208) from!1455) k!934))))

(declare-fun e!667658 () Bool)

(assert (=> b!1174598 e!667658))

(declare-fun res!780040 () Bool)

(assert (=> b!1174598 (=> (not res!780040) (not e!667658))))

(declare-datatypes ((tuple2!18962 0))(
  ( (tuple2!18963 (_1!9492 (_ BitVec 64)) (_2!9492 V!44529)) )
))
(declare-datatypes ((List!25699 0))(
  ( (Nil!25696) (Cons!25695 (h!26904 tuple2!18962) (t!37712 List!25699)) )
))
(declare-datatypes ((ListLongMap!16931 0))(
  ( (ListLongMap!16932 (toList!8481 List!25699)) )
))
(declare-fun lt!529712 () ListLongMap!16931)

(declare-fun lt!529719 () V!44529)

(declare-fun lt!529711 () ListLongMap!16931)

(declare-fun +!3798 (ListLongMap!16931 tuple2!18962) ListLongMap!16931)

(declare-fun get!18686 (ValueCell!14066 V!44529) V!44529)

(assert (=> b!1174598 (= res!780040 (= lt!529712 (+!3798 lt!529711 (tuple2!18963 (select (arr!36606 _keys!1208) from!1455) (get!18686 (select (arr!36607 _values!996) from!1455) lt!529719)))))))

(declare-fun b!1174599 () Bool)

(declare-fun res!780041 () Bool)

(assert (=> b!1174599 (=> (not res!780041) (not e!667657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174599 (= res!780041 (validKeyInArray!0 k!934))))

(declare-fun b!1174600 () Bool)

(declare-fun res!780036 () Bool)

(declare-fun e!667663 () Bool)

(assert (=> b!1174600 (=> (not res!780036) (not e!667663))))

(declare-fun lt!529717 () array!75913)

(declare-datatypes ((List!25700 0))(
  ( (Nil!25697) (Cons!25696 (h!26905 (_ BitVec 64)) (t!37713 List!25700)) )
))
(declare-fun arrayNoDuplicates!0 (array!75913 (_ BitVec 32) List!25700) Bool)

(assert (=> b!1174600 (= res!780036 (arrayNoDuplicates!0 lt!529717 #b00000000000000000000000000000000 Nil!25697))))

(declare-fun b!1174601 () Bool)

(declare-fun res!780045 () Bool)

(assert (=> b!1174601 (=> (not res!780045) (not e!667657))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1174601 (= res!780045 (= (select (arr!36606 _keys!1208) i!673) k!934))))

(declare-fun b!1174602 () Bool)

(declare-fun e!667665 () Bool)

(declare-fun e!667661 () Bool)

(assert (=> b!1174602 (= e!667665 e!667661)))

(declare-fun res!780038 () Bool)

(assert (=> b!1174602 (=> res!780038 e!667661)))

(assert (=> b!1174602 (= res!780038 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44529)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!529715 () array!75915)

(declare-fun minValue!944 () V!44529)

(declare-fun getCurrentListMapNoExtraKeys!4941 (array!75913 array!75915 (_ BitVec 32) (_ BitVec 32) V!44529 V!44529 (_ BitVec 32) Int) ListLongMap!16931)

(assert (=> b!1174602 (= lt!529712 (getCurrentListMapNoExtraKeys!4941 lt!529717 lt!529715 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1174602 (= lt!529715 (array!75916 (store (arr!36607 _values!996) i!673 (ValueCellFull!14066 lt!529719)) (size!37143 _values!996)))))

(declare-fun dynLambda!2909 (Int (_ BitVec 64)) V!44529)

(assert (=> b!1174602 (= lt!529719 (dynLambda!2909 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529713 () ListLongMap!16931)

(assert (=> b!1174602 (= lt!529713 (getCurrentListMapNoExtraKeys!4941 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!780042 () Bool)

(assert (=> start!99442 (=> (not res!780042) (not e!667657))))

(assert (=> start!99442 (= res!780042 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37142 _keys!1208))))))

(assert (=> start!99442 e!667657))

(declare-fun tp_is_empty!29551 () Bool)

(assert (=> start!99442 tp_is_empty!29551))

(declare-fun array_inv!27964 (array!75913) Bool)

(assert (=> start!99442 (array_inv!27964 _keys!1208)))

(assert (=> start!99442 true))

(assert (=> start!99442 tp!87776))

(declare-fun e!667662 () Bool)

(declare-fun array_inv!27965 (array!75915) Bool)

(assert (=> start!99442 (and (array_inv!27965 _values!996) e!667662)))

(declare-fun b!1174603 () Bool)

(declare-fun res!780033 () Bool)

(assert (=> b!1174603 (=> (not res!780033) (not e!667657))))

(assert (=> b!1174603 (= res!780033 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25697))))

(declare-fun b!1174604 () Bool)

(assert (=> b!1174604 (= e!667663 (not e!667665))))

(declare-fun res!780039 () Bool)

(assert (=> b!1174604 (=> res!780039 e!667665)))

(assert (=> b!1174604 (= res!780039 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174604 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!529721 () Unit!38755)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75913 (_ BitVec 64) (_ BitVec 32)) Unit!38755)

(assert (=> b!1174604 (= lt!529721 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1174605 () Bool)

(declare-fun e!667659 () Bool)

(assert (=> b!1174605 (= e!667658 e!667659)))

(declare-fun res!780037 () Bool)

(assert (=> b!1174605 (=> res!780037 e!667659)))

(assert (=> b!1174605 (= res!780037 (not (= (select (arr!36606 _keys!1208) from!1455) k!934)))))

(declare-fun b!1174606 () Bool)

(assert (=> b!1174606 (= e!667657 e!667663)))

(declare-fun res!780035 () Bool)

(assert (=> b!1174606 (=> (not res!780035) (not e!667663))))

(assert (=> b!1174606 (= res!780035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529717 mask!1564))))

(assert (=> b!1174606 (= lt!529717 (array!75914 (store (arr!36606 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37142 _keys!1208)))))

(declare-fun mapIsEmpty!46154 () Bool)

(declare-fun mapRes!46154 () Bool)

(assert (=> mapIsEmpty!46154 mapRes!46154))

(declare-fun mapNonEmpty!46154 () Bool)

(declare-fun tp!87777 () Bool)

(declare-fun e!667664 () Bool)

(assert (=> mapNonEmpty!46154 (= mapRes!46154 (and tp!87777 e!667664))))

(declare-fun mapValue!46154 () ValueCell!14066)

(declare-fun mapRest!46154 () (Array (_ BitVec 32) ValueCell!14066))

(declare-fun mapKey!46154 () (_ BitVec 32))

(assert (=> mapNonEmpty!46154 (= (arr!36607 _values!996) (store mapRest!46154 mapKey!46154 mapValue!46154))))

(declare-fun b!1174607 () Bool)

(declare-fun e!667655 () Bool)

(assert (=> b!1174607 (= e!667662 (and e!667655 mapRes!46154))))

(declare-fun condMapEmpty!46154 () Bool)

(declare-fun mapDefault!46154 () ValueCell!14066)

