; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97320 () Bool)

(assert start!97320)

(declare-fun b_free!23291 () Bool)

(declare-fun b_next!23291 () Bool)

(assert (=> start!97320 (= b_free!23291 (not b_next!23291))))

(declare-fun tp!82171 () Bool)

(declare-fun b_and!37415 () Bool)

(assert (=> start!97320 (= tp!82171 b_and!37415)))

(declare-fun b!1108657 () Bool)

(declare-datatypes ((V!41861 0))(
  ( (V!41862 (val!13832 Int)) )
))
(declare-datatypes ((tuple2!17480 0))(
  ( (tuple2!17481 (_1!8751 (_ BitVec 64)) (_2!8751 V!41861)) )
))
(declare-datatypes ((List!24164 0))(
  ( (Nil!24161) (Cons!24160 (h!25369 tuple2!17480) (t!34501 List!24164)) )
))
(declare-datatypes ((ListLongMap!15449 0))(
  ( (ListLongMap!15450 (toList!7740 List!24164)) )
))
(declare-fun call!46569 () ListLongMap!15449)

(declare-fun call!46570 () ListLongMap!15449)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!632435 () Bool)

(declare-fun -!1019 (ListLongMap!15449 (_ BitVec 64)) ListLongMap!15449)

(assert (=> b!1108657 (= e!632435 (= call!46570 (-!1019 call!46569 k!934)))))

(declare-fun b!1108658 () Bool)

(declare-fun e!632437 () Bool)

(declare-fun e!632433 () Bool)

(assert (=> b!1108658 (= e!632437 (not e!632433))))

(declare-fun res!739867 () Bool)

(assert (=> b!1108658 (=> res!739867 e!632433)))

(declare-datatypes ((array!72019 0))(
  ( (array!72020 (arr!34662 (Array (_ BitVec 32) (_ BitVec 64))) (size!35198 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72019)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1108658 (= res!739867 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35198 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108658 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36386 0))(
  ( (Unit!36387) )
))
(declare-fun lt!495846 () Unit!36386)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72019 (_ BitVec 64) (_ BitVec 32)) Unit!36386)

(assert (=> b!1108658 (= lt!495846 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1108659 () Bool)

(assert (=> b!1108659 (= e!632433 true)))

(assert (=> b!1108659 e!632435))

(declare-fun c!109122 () Bool)

(assert (=> b!1108659 (= c!109122 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41861)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!495847 () Unit!36386)

(declare-datatypes ((ValueCell!13066 0))(
  ( (ValueCellFull!13066 (v!16465 V!41861)) (EmptyCell!13066) )
))
(declare-datatypes ((array!72021 0))(
  ( (array!72022 (arr!34663 (Array (_ BitVec 32) ValueCell!13066)) (size!35199 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72021)

(declare-fun minValue!944 () V!41861)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!265 (array!72019 array!72021 (_ BitVec 32) (_ BitVec 32) V!41861 V!41861 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36386)

(assert (=> b!1108659 (= lt!495847 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!265 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!495848 () array!72019)

(declare-fun bm!46566 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4235 (array!72019 array!72021 (_ BitVec 32) (_ BitVec 32) V!41861 V!41861 (_ BitVec 32) Int) ListLongMap!15449)

(declare-fun dynLambda!2367 (Int (_ BitVec 64)) V!41861)

(assert (=> bm!46566 (= call!46570 (getCurrentListMapNoExtraKeys!4235 lt!495848 (array!72022 (store (arr!34663 _values!996) i!673 (ValueCellFull!13066 (dynLambda!2367 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35199 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108660 () Bool)

(declare-fun res!739876 () Bool)

(declare-fun e!632439 () Bool)

(assert (=> b!1108660 (=> (not res!739876) (not e!632439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72019 (_ BitVec 32)) Bool)

(assert (=> b!1108660 (= res!739876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!739875 () Bool)

(assert (=> start!97320 (=> (not res!739875) (not e!632439))))

(assert (=> start!97320 (= res!739875 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35198 _keys!1208))))))

(assert (=> start!97320 e!632439))

(declare-fun tp_is_empty!27551 () Bool)

(assert (=> start!97320 tp_is_empty!27551))

(declare-fun array_inv!26676 (array!72019) Bool)

(assert (=> start!97320 (array_inv!26676 _keys!1208)))

(assert (=> start!97320 true))

(assert (=> start!97320 tp!82171))

(declare-fun e!632432 () Bool)

(declare-fun array_inv!26677 (array!72021) Bool)

(assert (=> start!97320 (and (array_inv!26677 _values!996) e!632432)))

(declare-fun b!1108661 () Bool)

(declare-fun res!739872 () Bool)

(assert (=> b!1108661 (=> (not res!739872) (not e!632439))))

(assert (=> b!1108661 (= res!739872 (= (select (arr!34662 _keys!1208) i!673) k!934))))

(declare-fun b!1108662 () Bool)

(declare-fun res!739873 () Bool)

(assert (=> b!1108662 (=> (not res!739873) (not e!632439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108662 (= res!739873 (validKeyInArray!0 k!934))))

(declare-fun b!1108663 () Bool)

(declare-fun e!632436 () Bool)

(assert (=> b!1108663 (= e!632436 tp_is_empty!27551)))

(declare-fun b!1108664 () Bool)

(declare-fun res!739874 () Bool)

(assert (=> b!1108664 (=> (not res!739874) (not e!632439))))

(assert (=> b!1108664 (= res!739874 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35198 _keys!1208))))))

(declare-fun b!1108665 () Bool)

(declare-fun e!632438 () Bool)

(assert (=> b!1108665 (= e!632438 tp_is_empty!27551)))

(declare-fun b!1108666 () Bool)

(declare-fun res!739868 () Bool)

(assert (=> b!1108666 (=> (not res!739868) (not e!632439))))

(assert (=> b!1108666 (= res!739868 (and (= (size!35199 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35198 _keys!1208) (size!35199 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43144 () Bool)

(declare-fun mapRes!43144 () Bool)

(declare-fun tp!82172 () Bool)

(assert (=> mapNonEmpty!43144 (= mapRes!43144 (and tp!82172 e!632438))))

(declare-fun mapRest!43144 () (Array (_ BitVec 32) ValueCell!13066))

(declare-fun mapValue!43144 () ValueCell!13066)

(declare-fun mapKey!43144 () (_ BitVec 32))

(assert (=> mapNonEmpty!43144 (= (arr!34663 _values!996) (store mapRest!43144 mapKey!43144 mapValue!43144))))

(declare-fun b!1108667 () Bool)

(assert (=> b!1108667 (= e!632432 (and e!632436 mapRes!43144))))

(declare-fun condMapEmpty!43144 () Bool)

(declare-fun mapDefault!43144 () ValueCell!13066)

