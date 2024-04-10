; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97302 () Bool)

(assert start!97302)

(declare-fun b_free!23273 () Bool)

(declare-fun b_next!23273 () Bool)

(assert (=> start!97302 (= b_free!23273 (not b_next!23273))))

(declare-fun tp!82118 () Bool)

(declare-fun b_and!37377 () Bool)

(assert (=> start!97302 (= tp!82118 b_and!37377)))

(declare-fun res!739579 () Bool)

(declare-fun e!632215 () Bool)

(assert (=> start!97302 (=> (not res!739579) (not e!632215))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71983 0))(
  ( (array!71984 (arr!34644 (Array (_ BitVec 32) (_ BitVec 64))) (size!35180 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71983)

(assert (=> start!97302 (= res!739579 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35180 _keys!1208))))))

(assert (=> start!97302 e!632215))

(declare-fun tp_is_empty!27533 () Bool)

(assert (=> start!97302 tp_is_empty!27533))

(declare-fun array_inv!26662 (array!71983) Bool)

(assert (=> start!97302 (array_inv!26662 _keys!1208)))

(assert (=> start!97302 true))

(assert (=> start!97302 tp!82118))

(declare-datatypes ((V!41837 0))(
  ( (V!41838 (val!13823 Int)) )
))
(declare-datatypes ((ValueCell!13057 0))(
  ( (ValueCellFull!13057 (v!16456 V!41837)) (EmptyCell!13057) )
))
(declare-datatypes ((array!71985 0))(
  ( (array!71986 (arr!34645 (Array (_ BitVec 32) ValueCell!13057)) (size!35181 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71985)

(declare-fun e!632213 () Bool)

(declare-fun array_inv!26663 (array!71985) Bool)

(assert (=> start!97302 (and (array_inv!26663 _values!996) e!632213)))

(declare-fun mapIsEmpty!43117 () Bool)

(declare-fun mapRes!43117 () Bool)

(assert (=> mapIsEmpty!43117 mapRes!43117))

(declare-fun b!1108195 () Bool)

(declare-fun res!739570 () Bool)

(assert (=> b!1108195 (=> (not res!739570) (not e!632215))))

(declare-datatypes ((List!24153 0))(
  ( (Nil!24150) (Cons!24149 (h!25358 (_ BitVec 64)) (t!34472 List!24153)) )
))
(declare-fun arrayNoDuplicates!0 (array!71983 (_ BitVec 32) List!24153) Bool)

(assert (=> b!1108195 (= res!739570 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24150))))

(declare-fun mapNonEmpty!43117 () Bool)

(declare-fun tp!82117 () Bool)

(declare-fun e!632211 () Bool)

(assert (=> mapNonEmpty!43117 (= mapRes!43117 (and tp!82117 e!632211))))

(declare-fun mapRest!43117 () (Array (_ BitVec 32) ValueCell!13057))

(declare-fun mapValue!43117 () ValueCell!13057)

(declare-fun mapKey!43117 () (_ BitVec 32))

(assert (=> mapNonEmpty!43117 (= (arr!34645 _values!996) (store mapRest!43117 mapKey!43117 mapValue!43117))))

(declare-fun b!1108196 () Bool)

(declare-fun e!632210 () Bool)

(assert (=> b!1108196 (= e!632210 tp_is_empty!27533)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun zeroValue!944 () V!41837)

(declare-datatypes ((tuple2!17470 0))(
  ( (tuple2!17471 (_1!8746 (_ BitVec 64)) (_2!8746 V!41837)) )
))
(declare-datatypes ((List!24154 0))(
  ( (Nil!24151) (Cons!24150 (h!25359 tuple2!17470) (t!34473 List!24154)) )
))
(declare-datatypes ((ListLongMap!15439 0))(
  ( (ListLongMap!15440 (toList!7735 List!24154)) )
))
(declare-fun call!46515 () ListLongMap!15439)

(declare-fun bm!46512 () Bool)

(declare-fun minValue!944 () V!41837)

(declare-fun getCurrentListMapNoExtraKeys!4231 (array!71983 array!71985 (_ BitVec 32) (_ BitVec 32) V!41837 V!41837 (_ BitVec 32) Int) ListLongMap!15439)

(assert (=> bm!46512 (= call!46515 (getCurrentListMapNoExtraKeys!4231 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108197 () Bool)

(declare-fun res!739572 () Bool)

(assert (=> b!1108197 (=> (not res!739572) (not e!632215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108197 (= res!739572 (validMask!0 mask!1564))))

(declare-fun b!1108198 () Bool)

(declare-fun res!739574 () Bool)

(assert (=> b!1108198 (=> (not res!739574) (not e!632215))))

(assert (=> b!1108198 (= res!739574 (and (= (size!35181 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35180 _keys!1208) (size!35181 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108199 () Bool)

(declare-fun res!739576 () Bool)

(assert (=> b!1108199 (=> (not res!739576) (not e!632215))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1108199 (= res!739576 (= (select (arr!34644 _keys!1208) i!673) k!934))))

(declare-fun e!632216 () Bool)

(declare-fun call!46516 () ListLongMap!15439)

(declare-fun b!1108200 () Bool)

(declare-fun -!1014 (ListLongMap!15439 (_ BitVec 64)) ListLongMap!15439)

(assert (=> b!1108200 (= e!632216 (= call!46516 (-!1014 call!46515 k!934)))))

(declare-fun b!1108201 () Bool)

(declare-fun e!632214 () Bool)

(declare-fun e!632217 () Bool)

(assert (=> b!1108201 (= e!632214 (not e!632217))))

(declare-fun res!739575 () Bool)

(assert (=> b!1108201 (=> res!739575 e!632217)))

(assert (=> b!1108201 (= res!739575 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35180 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108201 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36374 0))(
  ( (Unit!36375) )
))
(declare-fun lt!495765 () Unit!36374)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71983 (_ BitVec 64) (_ BitVec 32)) Unit!36374)

(assert (=> b!1108201 (= lt!495765 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1108202 () Bool)

(assert (=> b!1108202 (= e!632217 true)))

(assert (=> b!1108202 e!632216))

(declare-fun c!109089 () Bool)

(assert (=> b!1108202 (= c!109089 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495766 () Unit!36374)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!259 (array!71983 array!71985 (_ BitVec 32) (_ BitVec 32) V!41837 V!41837 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36374)

(assert (=> b!1108202 (= lt!495766 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!259 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108203 () Bool)

(declare-fun res!739571 () Bool)

(assert (=> b!1108203 (=> (not res!739571) (not e!632215))))

(assert (=> b!1108203 (= res!739571 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35180 _keys!1208))))))

(declare-fun bm!46513 () Bool)

(declare-fun lt!495767 () array!71983)

(declare-fun dynLambda!2363 (Int (_ BitVec 64)) V!41837)

(assert (=> bm!46513 (= call!46516 (getCurrentListMapNoExtraKeys!4231 lt!495767 (array!71986 (store (arr!34645 _values!996) i!673 (ValueCellFull!13057 (dynLambda!2363 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35181 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108204 () Bool)

(assert (=> b!1108204 (= e!632211 tp_is_empty!27533)))

(declare-fun b!1108205 () Bool)

(declare-fun res!739569 () Bool)

(assert (=> b!1108205 (=> (not res!739569) (not e!632215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71983 (_ BitVec 32)) Bool)

(assert (=> b!1108205 (= res!739569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108206 () Bool)

(declare-fun res!739573 () Bool)

(assert (=> b!1108206 (=> (not res!739573) (not e!632214))))

(assert (=> b!1108206 (= res!739573 (arrayNoDuplicates!0 lt!495767 #b00000000000000000000000000000000 Nil!24150))))

(declare-fun b!1108207 () Bool)

(declare-fun res!739578 () Bool)

(assert (=> b!1108207 (=> (not res!739578) (not e!632215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108207 (= res!739578 (validKeyInArray!0 k!934))))

(declare-fun b!1108208 () Bool)

(assert (=> b!1108208 (= e!632216 (= call!46516 call!46515))))

(declare-fun b!1108209 () Bool)

(assert (=> b!1108209 (= e!632213 (and e!632210 mapRes!43117))))

(declare-fun condMapEmpty!43117 () Bool)

(declare-fun mapDefault!43117 () ValueCell!13057)

