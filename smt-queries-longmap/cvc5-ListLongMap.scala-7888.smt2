; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98072 () Bool)

(assert start!98072)

(declare-fun b_free!23773 () Bool)

(declare-fun b_next!23773 () Bool)

(assert (=> start!98072 (= b_free!23773 (not b_next!23773))))

(declare-fun tp!84022 () Bool)

(declare-fun b_and!38329 () Bool)

(assert (=> start!98072 (= tp!84022 b_and!38329)))

(declare-fun b!1126234 () Bool)

(declare-fun res!752583 () Bool)

(declare-fun e!641066 () Bool)

(assert (=> b!1126234 (=> (not res!752583) (not e!641066))))

(declare-datatypes ((array!73469 0))(
  ( (array!73470 (arr!35387 (Array (_ BitVec 32) (_ BitVec 64))) (size!35923 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73469)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73469 (_ BitVec 32)) Bool)

(assert (=> b!1126234 (= res!752583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!42865 0))(
  ( (V!42866 (val!14208 Int)) )
))
(declare-fun zeroValue!944 () V!42865)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!47598 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17864 0))(
  ( (tuple2!17865 (_1!8943 (_ BitVec 64)) (_2!8943 V!42865)) )
))
(declare-datatypes ((List!24639 0))(
  ( (Nil!24636) (Cons!24635 (h!25844 tuple2!17864) (t!35404 List!24639)) )
))
(declare-datatypes ((ListLongMap!15833 0))(
  ( (ListLongMap!15834 (toList!7932 List!24639)) )
))
(declare-fun call!47601 () ListLongMap!15833)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13442 0))(
  ( (ValueCellFull!13442 (v!16841 V!42865)) (EmptyCell!13442) )
))
(declare-datatypes ((array!73471 0))(
  ( (array!73472 (arr!35388 (Array (_ BitVec 32) ValueCell!13442)) (size!35924 (_ BitVec 32))) )
))
(declare-fun lt!500153 () array!73471)

(declare-fun lt!500147 () array!73469)

(declare-fun minValue!944 () V!42865)

(declare-fun getCurrentListMapNoExtraKeys!4420 (array!73469 array!73471 (_ BitVec 32) (_ BitVec 32) V!42865 V!42865 (_ BitVec 32) Int) ListLongMap!15833)

(assert (=> bm!47598 (= call!47601 (getCurrentListMapNoExtraKeys!4420 lt!500147 lt!500153 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1126235 () Bool)

(declare-fun call!47602 () ListLongMap!15833)

(declare-fun e!641064 () Bool)

(declare-fun -!1126 (ListLongMap!15833 (_ BitVec 64)) ListLongMap!15833)

(assert (=> b!1126235 (= e!641064 (= call!47601 (-!1126 call!47602 k!934)))))

(declare-fun mapNonEmpty!44272 () Bool)

(declare-fun mapRes!44272 () Bool)

(declare-fun tp!84023 () Bool)

(declare-fun e!641060 () Bool)

(assert (=> mapNonEmpty!44272 (= mapRes!44272 (and tp!84023 e!641060))))

(declare-fun mapValue!44272 () ValueCell!13442)

(declare-fun mapKey!44272 () (_ BitVec 32))

(declare-fun mapRest!44272 () (Array (_ BitVec 32) ValueCell!13442))

(declare-fun _values!996 () array!73471)

(assert (=> mapNonEmpty!44272 (= (arr!35388 _values!996) (store mapRest!44272 mapKey!44272 mapValue!44272))))

(declare-fun b!1126236 () Bool)

(declare-fun res!752586 () Bool)

(assert (=> b!1126236 (=> (not res!752586) (not e!641066))))

(assert (=> b!1126236 (= res!752586 (and (= (size!35924 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35923 _keys!1208) (size!35924 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!752582 () Bool)

(assert (=> start!98072 (=> (not res!752582) (not e!641066))))

(assert (=> start!98072 (= res!752582 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35923 _keys!1208))))))

(assert (=> start!98072 e!641066))

(declare-fun tp_is_empty!28303 () Bool)

(assert (=> start!98072 tp_is_empty!28303))

(declare-fun array_inv!27162 (array!73469) Bool)

(assert (=> start!98072 (array_inv!27162 _keys!1208)))

(assert (=> start!98072 true))

(assert (=> start!98072 tp!84022))

(declare-fun e!641063 () Bool)

(declare-fun array_inv!27163 (array!73471) Bool)

(assert (=> start!98072 (and (array_inv!27163 _values!996) e!641063)))

(declare-fun b!1126237 () Bool)

(declare-fun res!752587 () Bool)

(declare-fun e!641061 () Bool)

(assert (=> b!1126237 (=> (not res!752587) (not e!641061))))

(declare-datatypes ((List!24640 0))(
  ( (Nil!24637) (Cons!24636 (h!25845 (_ BitVec 64)) (t!35405 List!24640)) )
))
(declare-fun arrayNoDuplicates!0 (array!73469 (_ BitVec 32) List!24640) Bool)

(assert (=> b!1126237 (= res!752587 (arrayNoDuplicates!0 lt!500147 #b00000000000000000000000000000000 Nil!24637))))

(declare-fun b!1126238 () Bool)

(assert (=> b!1126238 (= e!641066 e!641061)))

(declare-fun res!752577 () Bool)

(assert (=> b!1126238 (=> (not res!752577) (not e!641061))))

(assert (=> b!1126238 (= res!752577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500147 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126238 (= lt!500147 (array!73470 (store (arr!35387 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35923 _keys!1208)))))

(declare-fun b!1126239 () Bool)

(declare-fun e!641065 () Bool)

(declare-fun e!641067 () Bool)

(assert (=> b!1126239 (= e!641065 e!641067)))

(declare-fun res!752578 () Bool)

(assert (=> b!1126239 (=> res!752578 e!641067)))

(assert (=> b!1126239 (= res!752578 (not (= from!1455 i!673)))))

(declare-fun lt!500151 () ListLongMap!15833)

(assert (=> b!1126239 (= lt!500151 (getCurrentListMapNoExtraKeys!4420 lt!500147 lt!500153 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2510 (Int (_ BitVec 64)) V!42865)

(assert (=> b!1126239 (= lt!500153 (array!73472 (store (arr!35388 _values!996) i!673 (ValueCellFull!13442 (dynLambda!2510 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35924 _values!996)))))

(declare-fun lt!500152 () ListLongMap!15833)

(assert (=> b!1126239 (= lt!500152 (getCurrentListMapNoExtraKeys!4420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126240 () Bool)

(declare-fun res!752579 () Bool)

(assert (=> b!1126240 (=> (not res!752579) (not e!641066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126240 (= res!752579 (validMask!0 mask!1564))))

(declare-fun b!1126241 () Bool)

(declare-fun res!752580 () Bool)

(assert (=> b!1126241 (=> (not res!752580) (not e!641066))))

(assert (=> b!1126241 (= res!752580 (= (select (arr!35387 _keys!1208) i!673) k!934))))

(declare-fun b!1126242 () Bool)

(assert (=> b!1126242 (= e!641060 tp_is_empty!28303)))

(declare-fun b!1126243 () Bool)

(assert (=> b!1126243 (= e!641064 (= call!47601 call!47602))))

(declare-fun b!1126244 () Bool)

(declare-fun e!641062 () Bool)

(assert (=> b!1126244 (= e!641062 tp_is_empty!28303)))

(declare-fun b!1126245 () Bool)

(declare-fun e!641058 () Bool)

(assert (=> b!1126245 (= e!641058 true)))

(declare-fun lt!500149 () Bool)

(declare-fun contains!6465 (ListLongMap!15833 (_ BitVec 64)) Bool)

(assert (=> b!1126245 (= lt!500149 (contains!6465 (getCurrentListMapNoExtraKeys!4420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1126246 () Bool)

(declare-fun res!752584 () Bool)

(assert (=> b!1126246 (=> (not res!752584) (not e!641066))))

(assert (=> b!1126246 (= res!752584 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35923 _keys!1208))))))

(declare-fun b!1126247 () Bool)

(assert (=> b!1126247 (= e!641067 e!641058)))

(declare-fun res!752581 () Bool)

(assert (=> b!1126247 (=> res!752581 e!641058)))

(assert (=> b!1126247 (= res!752581 (not (= (select (arr!35387 _keys!1208) from!1455) k!934)))))

(assert (=> b!1126247 e!641064))

(declare-fun c!109650 () Bool)

(assert (=> b!1126247 (= c!109650 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36912 0))(
  ( (Unit!36913) )
))
(declare-fun lt!500148 () Unit!36912)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!377 (array!73469 array!73471 (_ BitVec 32) (_ BitVec 32) V!42865 V!42865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36912)

(assert (=> b!1126247 (= lt!500148 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!377 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44272 () Bool)

(assert (=> mapIsEmpty!44272 mapRes!44272))

(declare-fun b!1126248 () Bool)

(assert (=> b!1126248 (= e!641061 (not e!641065))))

(declare-fun res!752576 () Bool)

(assert (=> b!1126248 (=> res!752576 e!641065)))

(assert (=> b!1126248 (= res!752576 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126248 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!500150 () Unit!36912)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73469 (_ BitVec 64) (_ BitVec 32)) Unit!36912)

(assert (=> b!1126248 (= lt!500150 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1126249 () Bool)

(assert (=> b!1126249 (= e!641063 (and e!641062 mapRes!44272))))

(declare-fun condMapEmpty!44272 () Bool)

(declare-fun mapDefault!44272 () ValueCell!13442)

