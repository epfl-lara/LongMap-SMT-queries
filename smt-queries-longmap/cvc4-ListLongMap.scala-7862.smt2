; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97920 () Bool)

(assert start!97920)

(declare-fun b_free!23621 () Bool)

(declare-fun b_next!23621 () Bool)

(assert (=> start!97920 (= b_free!23621 (not b_next!23621))))

(declare-fun tp!83566 () Bool)

(declare-fun b_and!38025 () Bool)

(assert (=> start!97920 (= tp!83566 b_and!38025)))

(declare-fun b!1121799 () Bool)

(declare-fun e!638699 () Bool)

(assert (=> b!1121799 (= e!638699 true)))

(declare-fun e!638702 () Bool)

(assert (=> b!1121799 e!638702))

(declare-fun c!109422 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121799 (= c!109422 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42661 0))(
  ( (V!42662 (val!14132 Int)) )
))
(declare-fun zeroValue!944 () V!42661)

(declare-datatypes ((array!73183 0))(
  ( (array!73184 (arr!35244 (Array (_ BitVec 32) (_ BitVec 64))) (size!35780 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73183)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((ValueCell!13366 0))(
  ( (ValueCellFull!13366 (v!16765 V!42661)) (EmptyCell!13366) )
))
(declare-datatypes ((array!73185 0))(
  ( (array!73186 (arr!35245 (Array (_ BitVec 32) ValueCell!13366)) (size!35781 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73185)

(declare-datatypes ((Unit!36800 0))(
  ( (Unit!36801) )
))
(declare-fun lt!498485 () Unit!36800)

(declare-fun minValue!944 () V!42661)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!328 (array!73183 array!73185 (_ BitVec 32) (_ BitVec 32) V!42661 V!42661 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36800)

(assert (=> b!1121799 (= lt!498485 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121801 () Bool)

(declare-fun res!749443 () Bool)

(declare-fun e!638704 () Bool)

(assert (=> b!1121801 (=> (not res!749443) (not e!638704))))

(assert (=> b!1121801 (= res!749443 (= (select (arr!35244 _keys!1208) i!673) k!934))))

(declare-datatypes ((tuple2!17742 0))(
  ( (tuple2!17743 (_1!8882 (_ BitVec 64)) (_2!8882 V!42661)) )
))
(declare-datatypes ((List!24523 0))(
  ( (Nil!24520) (Cons!24519 (h!25728 tuple2!17742) (t!35136 List!24523)) )
))
(declare-datatypes ((ListLongMap!15711 0))(
  ( (ListLongMap!15712 (toList!7871 List!24523)) )
))
(declare-fun call!47145 () ListLongMap!15711)

(declare-fun lt!498484 () array!73185)

(declare-fun bm!47142 () Bool)

(declare-fun lt!498480 () array!73183)

(declare-fun getCurrentListMapNoExtraKeys!4360 (array!73183 array!73185 (_ BitVec 32) (_ BitVec 32) V!42661 V!42661 (_ BitVec 32) Int) ListLongMap!15711)

(assert (=> bm!47142 (= call!47145 (getCurrentListMapNoExtraKeys!4360 lt!498480 lt!498484 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121802 () Bool)

(declare-fun e!638698 () Bool)

(declare-fun tp_is_empty!28151 () Bool)

(assert (=> b!1121802 (= e!638698 tp_is_empty!28151)))

(declare-fun b!1121803 () Bool)

(declare-fun e!638705 () Bool)

(assert (=> b!1121803 (= e!638705 tp_is_empty!28151)))

(declare-fun bm!47143 () Bool)

(declare-fun call!47146 () ListLongMap!15711)

(assert (=> bm!47143 (= call!47146 (getCurrentListMapNoExtraKeys!4360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121804 () Bool)

(declare-fun res!749438 () Bool)

(assert (=> b!1121804 (=> (not res!749438) (not e!638704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73183 (_ BitVec 32)) Bool)

(assert (=> b!1121804 (= res!749438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121805 () Bool)

(declare-fun res!749432 () Bool)

(assert (=> b!1121805 (=> (not res!749432) (not e!638704))))

(assert (=> b!1121805 (= res!749432 (and (= (size!35781 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35780 _keys!1208) (size!35781 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121806 () Bool)

(declare-fun res!749440 () Bool)

(assert (=> b!1121806 (=> (not res!749440) (not e!638704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121806 (= res!749440 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!44044 () Bool)

(declare-fun mapRes!44044 () Bool)

(assert (=> mapIsEmpty!44044 mapRes!44044))

(declare-fun b!1121807 () Bool)

(declare-fun res!749433 () Bool)

(assert (=> b!1121807 (=> (not res!749433) (not e!638704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121807 (= res!749433 (validMask!0 mask!1564))))

(declare-fun res!749434 () Bool)

(assert (=> start!97920 (=> (not res!749434) (not e!638704))))

(assert (=> start!97920 (= res!749434 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35780 _keys!1208))))))

(assert (=> start!97920 e!638704))

(assert (=> start!97920 tp_is_empty!28151))

(declare-fun array_inv!27060 (array!73183) Bool)

(assert (=> start!97920 (array_inv!27060 _keys!1208)))

(assert (=> start!97920 true))

(assert (=> start!97920 tp!83566))

(declare-fun e!638700 () Bool)

(declare-fun array_inv!27061 (array!73185) Bool)

(assert (=> start!97920 (and (array_inv!27061 _values!996) e!638700)))

(declare-fun b!1121800 () Bool)

(declare-fun -!1080 (ListLongMap!15711 (_ BitVec 64)) ListLongMap!15711)

(assert (=> b!1121800 (= e!638702 (= call!47145 (-!1080 call!47146 k!934)))))

(declare-fun b!1121808 () Bool)

(declare-fun res!749442 () Bool)

(assert (=> b!1121808 (=> (not res!749442) (not e!638704))))

(assert (=> b!1121808 (= res!749442 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35780 _keys!1208))))))

(declare-fun mapNonEmpty!44044 () Bool)

(declare-fun tp!83567 () Bool)

(assert (=> mapNonEmpty!44044 (= mapRes!44044 (and tp!83567 e!638698))))

(declare-fun mapRest!44044 () (Array (_ BitVec 32) ValueCell!13366))

(declare-fun mapKey!44044 () (_ BitVec 32))

(declare-fun mapValue!44044 () ValueCell!13366)

(assert (=> mapNonEmpty!44044 (= (arr!35245 _values!996) (store mapRest!44044 mapKey!44044 mapValue!44044))))

(declare-fun b!1121809 () Bool)

(declare-fun e!638703 () Bool)

(assert (=> b!1121809 (= e!638703 e!638699)))

(declare-fun res!749439 () Bool)

(assert (=> b!1121809 (=> res!749439 e!638699)))

(assert (=> b!1121809 (= res!749439 (not (= from!1455 i!673)))))

(declare-fun lt!498481 () ListLongMap!15711)

(assert (=> b!1121809 (= lt!498481 (getCurrentListMapNoExtraKeys!4360 lt!498480 lt!498484 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2459 (Int (_ BitVec 64)) V!42661)

(assert (=> b!1121809 (= lt!498484 (array!73186 (store (arr!35245 _values!996) i!673 (ValueCellFull!13366 (dynLambda!2459 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35781 _values!996)))))

(declare-fun lt!498482 () ListLongMap!15711)

(assert (=> b!1121809 (= lt!498482 (getCurrentListMapNoExtraKeys!4360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121810 () Bool)

(assert (=> b!1121810 (= e!638702 (= call!47145 call!47146))))

(declare-fun b!1121811 () Bool)

(declare-fun res!749435 () Bool)

(assert (=> b!1121811 (=> (not res!749435) (not e!638704))))

(declare-datatypes ((List!24524 0))(
  ( (Nil!24521) (Cons!24520 (h!25729 (_ BitVec 64)) (t!35137 List!24524)) )
))
(declare-fun arrayNoDuplicates!0 (array!73183 (_ BitVec 32) List!24524) Bool)

(assert (=> b!1121811 (= res!749435 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24521))))

(declare-fun b!1121812 () Bool)

(declare-fun e!638706 () Bool)

(assert (=> b!1121812 (= e!638706 (not e!638703))))

(declare-fun res!749436 () Bool)

(assert (=> b!1121812 (=> res!749436 e!638703)))

(assert (=> b!1121812 (= res!749436 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121812 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!498483 () Unit!36800)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73183 (_ BitVec 64) (_ BitVec 32)) Unit!36800)

(assert (=> b!1121812 (= lt!498483 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1121813 () Bool)

(assert (=> b!1121813 (= e!638704 e!638706)))

(declare-fun res!749441 () Bool)

(assert (=> b!1121813 (=> (not res!749441) (not e!638706))))

(assert (=> b!1121813 (= res!749441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498480 mask!1564))))

(assert (=> b!1121813 (= lt!498480 (array!73184 (store (arr!35244 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35780 _keys!1208)))))

(declare-fun b!1121814 () Bool)

(assert (=> b!1121814 (= e!638700 (and e!638705 mapRes!44044))))

(declare-fun condMapEmpty!44044 () Bool)

(declare-fun mapDefault!44044 () ValueCell!13366)

