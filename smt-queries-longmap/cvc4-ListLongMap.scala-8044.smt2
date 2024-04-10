; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99108 () Bool)

(assert start!99108)

(declare-fun b_free!24713 () Bool)

(declare-fun b_next!24713 () Bool)

(assert (=> start!99108 (= b_free!24713 (not b_next!24713))))

(declare-fun tp!86849 () Bool)

(declare-fun b_and!40275 () Bool)

(assert (=> start!99108 (= tp!86849 b_and!40275)))

(declare-fun b!1165810 () Bool)

(declare-fun res!773219 () Bool)

(declare-fun e!662718 () Bool)

(assert (=> b!1165810 (=> (not res!773219) (not e!662718))))

(declare-datatypes ((array!75317 0))(
  ( (array!75318 (arr!36309 (Array (_ BitVec 32) (_ BitVec 64))) (size!36845 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75317)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44117 0))(
  ( (V!44118 (val!14678 Int)) )
))
(declare-datatypes ((ValueCell!13912 0))(
  ( (ValueCellFull!13912 (v!17315 V!44117)) (EmptyCell!13912) )
))
(declare-datatypes ((array!75319 0))(
  ( (array!75320 (arr!36310 (Array (_ BitVec 32) ValueCell!13912)) (size!36846 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75319)

(assert (=> b!1165810 (= res!773219 (and (= (size!36846 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36845 _keys!1208) (size!36846 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165811 () Bool)

(declare-fun res!773209 () Bool)

(assert (=> b!1165811 (=> (not res!773209) (not e!662718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75317 (_ BitVec 32)) Bool)

(assert (=> b!1165811 (= res!773209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165812 () Bool)

(declare-fun res!773215 () Bool)

(declare-fun e!662715 () Bool)

(assert (=> b!1165812 (=> (not res!773215) (not e!662715))))

(declare-fun lt!525015 () array!75317)

(declare-datatypes ((List!25455 0))(
  ( (Nil!25452) (Cons!25451 (h!26660 (_ BitVec 64)) (t!37160 List!25455)) )
))
(declare-fun arrayNoDuplicates!0 (array!75317 (_ BitVec 32) List!25455) Bool)

(assert (=> b!1165812 (= res!773215 (arrayNoDuplicates!0 lt!525015 #b00000000000000000000000000000000 Nil!25452))))

(declare-fun b!1165813 () Bool)

(declare-fun res!773217 () Bool)

(assert (=> b!1165813 (=> (not res!773217) (not e!662718))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165813 (= res!773217 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36845 _keys!1208))))))

(declare-fun mapNonEmpty!45689 () Bool)

(declare-fun mapRes!45689 () Bool)

(declare-fun tp!86850 () Bool)

(declare-fun e!662721 () Bool)

(assert (=> mapNonEmpty!45689 (= mapRes!45689 (and tp!86850 e!662721))))

(declare-fun mapValue!45689 () ValueCell!13912)

(declare-fun mapKey!45689 () (_ BitVec 32))

(declare-fun mapRest!45689 () (Array (_ BitVec 32) ValueCell!13912))

(assert (=> mapNonEmpty!45689 (= (arr!36310 _values!996) (store mapRest!45689 mapKey!45689 mapValue!45689))))

(declare-fun b!1165814 () Bool)

(declare-fun e!662717 () Bool)

(assert (=> b!1165814 (= e!662717 true)))

(declare-fun zeroValue!944 () V!44117)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18718 0))(
  ( (tuple2!18719 (_1!9370 (_ BitVec 64)) (_2!9370 V!44117)) )
))
(declare-datatypes ((List!25456 0))(
  ( (Nil!25453) (Cons!25452 (h!26661 tuple2!18718) (t!37161 List!25456)) )
))
(declare-datatypes ((ListLongMap!16687 0))(
  ( (ListLongMap!16688 (toList!8359 List!25456)) )
))
(declare-fun lt!525012 () ListLongMap!16687)

(declare-fun minValue!944 () V!44117)

(declare-fun getCurrentListMapNoExtraKeys!4823 (array!75317 array!75319 (_ BitVec 32) (_ BitVec 32) V!44117 V!44117 (_ BitVec 32) Int) ListLongMap!16687)

(declare-fun dynLambda!2813 (Int (_ BitVec 64)) V!44117)

(assert (=> b!1165814 (= lt!525012 (getCurrentListMapNoExtraKeys!4823 lt!525015 (array!75320 (store (arr!36310 _values!996) i!673 (ValueCellFull!13912 (dynLambda!2813 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36846 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525014 () ListLongMap!16687)

(assert (=> b!1165814 (= lt!525014 (getCurrentListMapNoExtraKeys!4823 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165815 () Bool)

(assert (=> b!1165815 (= e!662715 (not e!662717))))

(declare-fun res!773216 () Bool)

(assert (=> b!1165815 (=> res!773216 e!662717)))

(assert (=> b!1165815 (= res!773216 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165815 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38468 0))(
  ( (Unit!38469) )
))
(declare-fun lt!525013 () Unit!38468)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75317 (_ BitVec 64) (_ BitVec 32)) Unit!38468)

(assert (=> b!1165815 (= lt!525013 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1165816 () Bool)

(declare-fun tp_is_empty!29243 () Bool)

(assert (=> b!1165816 (= e!662721 tp_is_empty!29243)))

(declare-fun b!1165817 () Bool)

(declare-fun res!773213 () Bool)

(assert (=> b!1165817 (=> (not res!773213) (not e!662718))))

(assert (=> b!1165817 (= res!773213 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25452))))

(declare-fun res!773218 () Bool)

(assert (=> start!99108 (=> (not res!773218) (not e!662718))))

(assert (=> start!99108 (= res!773218 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36845 _keys!1208))))))

(assert (=> start!99108 e!662718))

(assert (=> start!99108 tp_is_empty!29243))

(declare-fun array_inv!27770 (array!75317) Bool)

(assert (=> start!99108 (array_inv!27770 _keys!1208)))

(assert (=> start!99108 true))

(assert (=> start!99108 tp!86849))

(declare-fun e!662719 () Bool)

(declare-fun array_inv!27771 (array!75319) Bool)

(assert (=> start!99108 (and (array_inv!27771 _values!996) e!662719)))

(declare-fun b!1165818 () Bool)

(assert (=> b!1165818 (= e!662718 e!662715)))

(declare-fun res!773211 () Bool)

(assert (=> b!1165818 (=> (not res!773211) (not e!662715))))

(assert (=> b!1165818 (= res!773211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525015 mask!1564))))

(assert (=> b!1165818 (= lt!525015 (array!75318 (store (arr!36309 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36845 _keys!1208)))))

(declare-fun b!1165819 () Bool)

(declare-fun res!773212 () Bool)

(assert (=> b!1165819 (=> (not res!773212) (not e!662718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165819 (= res!773212 (validMask!0 mask!1564))))

(declare-fun b!1165820 () Bool)

(declare-fun res!773210 () Bool)

(assert (=> b!1165820 (=> (not res!773210) (not e!662718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165820 (= res!773210 (validKeyInArray!0 k!934))))

(declare-fun b!1165821 () Bool)

(declare-fun res!773214 () Bool)

(assert (=> b!1165821 (=> (not res!773214) (not e!662718))))

(assert (=> b!1165821 (= res!773214 (= (select (arr!36309 _keys!1208) i!673) k!934))))

(declare-fun b!1165822 () Bool)

(declare-fun e!662720 () Bool)

(assert (=> b!1165822 (= e!662719 (and e!662720 mapRes!45689))))

(declare-fun condMapEmpty!45689 () Bool)

(declare-fun mapDefault!45689 () ValueCell!13912)

