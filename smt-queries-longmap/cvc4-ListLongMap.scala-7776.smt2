; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97404 () Bool)

(assert start!97404)

(declare-fun b_free!23375 () Bool)

(declare-fun b_next!23375 () Bool)

(assert (=> start!97404 (= b_free!23375 (not b_next!23375))))

(declare-fun tp!82424 () Bool)

(declare-fun b_and!37585 () Bool)

(assert (=> start!97404 (= tp!82424 b_and!37585)))

(declare-datatypes ((V!41973 0))(
  ( (V!41974 (val!13874 Int)) )
))
(declare-fun zeroValue!944 () V!41973)

(declare-datatypes ((array!72187 0))(
  ( (array!72188 (arr!34746 (Array (_ BitVec 32) (_ BitVec 64))) (size!35282 (_ BitVec 32))) )
))
(declare-fun lt!496226 () array!72187)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46818 () Bool)

(declare-datatypes ((ValueCell!13108 0))(
  ( (ValueCellFull!13108 (v!16507 V!41973)) (EmptyCell!13108) )
))
(declare-datatypes ((array!72189 0))(
  ( (array!72190 (arr!34747 (Array (_ BitVec 32) ValueCell!13108)) (size!35283 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72189)

(declare-datatypes ((tuple2!17550 0))(
  ( (tuple2!17551 (_1!8786 (_ BitVec 64)) (_2!8786 V!41973)) )
))
(declare-datatypes ((List!24234 0))(
  ( (Nil!24231) (Cons!24230 (h!25439 tuple2!17550) (t!34655 List!24234)) )
))
(declare-datatypes ((ListLongMap!15519 0))(
  ( (ListLongMap!15520 (toList!7775 List!24234)) )
))
(declare-fun call!46822 () ListLongMap!15519)

(declare-fun minValue!944 () V!41973)

(declare-fun getCurrentListMapNoExtraKeys!4268 (array!72187 array!72189 (_ BitVec 32) (_ BitVec 32) V!41973 V!41973 (_ BitVec 32) Int) ListLongMap!15519)

(declare-fun dynLambda!2396 (Int (_ BitVec 64)) V!41973)

(assert (=> bm!46818 (= call!46822 (getCurrentListMapNoExtraKeys!4268 lt!496226 (array!72190 (store (arr!34747 _values!996) i!673 (ValueCellFull!13108 (dynLambda!2396 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35283 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110769 () Bool)

(declare-fun res!741262 () Bool)

(declare-fun e!633447 () Bool)

(assert (=> b!1110769 (=> (not res!741262) (not e!633447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110769 (= res!741262 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43270 () Bool)

(declare-fun mapRes!43270 () Bool)

(declare-fun tp!82423 () Bool)

(declare-fun e!633453 () Bool)

(assert (=> mapNonEmpty!43270 (= mapRes!43270 (and tp!82423 e!633453))))

(declare-fun mapValue!43270 () ValueCell!13108)

(declare-fun mapRest!43270 () (Array (_ BitVec 32) ValueCell!13108))

(declare-fun mapKey!43270 () (_ BitVec 32))

(assert (=> mapNonEmpty!43270 (= (arr!34747 _values!996) (store mapRest!43270 mapKey!43270 mapValue!43270))))

(declare-fun mapIsEmpty!43270 () Bool)

(assert (=> mapIsEmpty!43270 mapRes!43270))

(declare-fun res!741254 () Bool)

(assert (=> start!97404 (=> (not res!741254) (not e!633447))))

(declare-fun _keys!1208 () array!72187)

(assert (=> start!97404 (= res!741254 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35282 _keys!1208))))))

(assert (=> start!97404 e!633447))

(declare-fun tp_is_empty!27635 () Bool)

(assert (=> start!97404 tp_is_empty!27635))

(declare-fun array_inv!26730 (array!72187) Bool)

(assert (=> start!97404 (array_inv!26730 _keys!1208)))

(assert (=> start!97404 true))

(assert (=> start!97404 tp!82424))

(declare-fun e!633448 () Bool)

(declare-fun array_inv!26731 (array!72189) Bool)

(assert (=> start!97404 (and (array_inv!26731 _values!996) e!633448)))

(declare-fun b!1110770 () Bool)

(declare-fun res!741259 () Bool)

(assert (=> b!1110770 (=> (not res!741259) (not e!633447))))

(declare-datatypes ((List!24235 0))(
  ( (Nil!24232) (Cons!24231 (h!25440 (_ BitVec 64)) (t!34656 List!24235)) )
))
(declare-fun arrayNoDuplicates!0 (array!72187 (_ BitVec 32) List!24235) Bool)

(assert (=> b!1110770 (= res!741259 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24232))))

(declare-fun b!1110771 () Bool)

(declare-fun res!741258 () Bool)

(declare-fun e!633450 () Bool)

(assert (=> b!1110771 (=> (not res!741258) (not e!633450))))

(assert (=> b!1110771 (= res!741258 (arrayNoDuplicates!0 lt!496226 #b00000000000000000000000000000000 Nil!24232))))

(declare-fun b!1110772 () Bool)

(declare-fun res!741260 () Bool)

(assert (=> b!1110772 (=> (not res!741260) (not e!633447))))

(assert (=> b!1110772 (= res!741260 (and (= (size!35283 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35282 _keys!1208) (size!35283 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!46821 () ListLongMap!15519)

(declare-fun b!1110773 () Bool)

(declare-fun e!633452 () Bool)

(declare-fun -!1046 (ListLongMap!15519 (_ BitVec 64)) ListLongMap!15519)

(assert (=> b!1110773 (= e!633452 (= call!46822 (-!1046 call!46821 k!934)))))

(declare-fun b!1110774 () Bool)

(declare-fun e!633451 () Bool)

(assert (=> b!1110774 (= e!633450 (not e!633451))))

(declare-fun res!741252 () Bool)

(assert (=> b!1110774 (=> res!741252 e!633451)))

(assert (=> b!1110774 (= res!741252 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35282 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110774 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36452 0))(
  ( (Unit!36453) )
))
(declare-fun lt!496225 () Unit!36452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72187 (_ BitVec 64) (_ BitVec 32)) Unit!36452)

(assert (=> b!1110774 (= lt!496225 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1110775 () Bool)

(declare-fun res!741256 () Bool)

(assert (=> b!1110775 (=> (not res!741256) (not e!633447))))

(assert (=> b!1110775 (= res!741256 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35282 _keys!1208))))))

(declare-fun b!1110776 () Bool)

(assert (=> b!1110776 (= e!633451 true)))

(assert (=> b!1110776 e!633452))

(declare-fun c!109254 () Bool)

(assert (=> b!1110776 (= c!109254 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496224 () Unit!36452)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!295 (array!72187 array!72189 (_ BitVec 32) (_ BitVec 32) V!41973 V!41973 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36452)

(assert (=> b!1110776 (= lt!496224 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!295 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110777 () Bool)

(declare-fun res!741257 () Bool)

(assert (=> b!1110777 (=> (not res!741257) (not e!633447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110777 (= res!741257 (validKeyInArray!0 k!934))))

(declare-fun b!1110778 () Bool)

(declare-fun res!741253 () Bool)

(assert (=> b!1110778 (=> (not res!741253) (not e!633447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72187 (_ BitVec 32)) Bool)

(assert (=> b!1110778 (= res!741253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110779 () Bool)

(assert (=> b!1110779 (= e!633453 tp_is_empty!27635)))

(declare-fun b!1110780 () Bool)

(declare-fun e!633449 () Bool)

(assert (=> b!1110780 (= e!633448 (and e!633449 mapRes!43270))))

(declare-fun condMapEmpty!43270 () Bool)

(declare-fun mapDefault!43270 () ValueCell!13108)

