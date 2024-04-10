; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98048 () Bool)

(assert start!98048)

(declare-fun b_free!23749 () Bool)

(declare-fun b_next!23749 () Bool)

(assert (=> start!98048 (= b_free!23749 (not b_next!23749))))

(declare-fun tp!83951 () Bool)

(declare-fun b_and!38281 () Bool)

(assert (=> start!98048 (= tp!83951 b_and!38281)))

(declare-fun b!1125562 () Bool)

(declare-fun e!640707 () Bool)

(declare-fun tp_is_empty!28279 () Bool)

(assert (=> b!1125562 (= e!640707 tp_is_empty!28279)))

(declare-fun b!1125563 () Bool)

(declare-fun e!640702 () Bool)

(assert (=> b!1125563 (= e!640702 tp_is_empty!28279)))

(declare-fun b!1125564 () Bool)

(declare-fun res!752117 () Bool)

(declare-fun e!640705 () Bool)

(assert (=> b!1125564 (=> (not res!752117) (not e!640705))))

(declare-datatypes ((array!73421 0))(
  ( (array!73422 (arr!35363 (Array (_ BitVec 32) (_ BitVec 64))) (size!35899 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73421)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73421 (_ BitVec 32)) Bool)

(assert (=> b!1125564 (= res!752117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125565 () Bool)

(declare-fun e!640699 () Bool)

(assert (=> b!1125565 (= e!640705 e!640699)))

(declare-fun res!752119 () Bool)

(assert (=> b!1125565 (=> (not res!752119) (not e!640699))))

(declare-fun lt!499895 () array!73421)

(assert (=> b!1125565 (= res!752119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499895 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125565 (= lt!499895 (array!73422 (store (arr!35363 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35899 _keys!1208)))))

(declare-fun b!1125566 () Bool)

(declare-fun res!752113 () Bool)

(assert (=> b!1125566 (=> (not res!752113) (not e!640705))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42833 0))(
  ( (V!42834 (val!14196 Int)) )
))
(declare-datatypes ((ValueCell!13430 0))(
  ( (ValueCellFull!13430 (v!16829 V!42833)) (EmptyCell!13430) )
))
(declare-datatypes ((array!73423 0))(
  ( (array!73424 (arr!35364 (Array (_ BitVec 32) ValueCell!13430)) (size!35900 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73423)

(assert (=> b!1125566 (= res!752113 (and (= (size!35900 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35899 _keys!1208) (size!35900 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125567 () Bool)

(declare-fun res!752118 () Bool)

(assert (=> b!1125567 (=> (not res!752118) (not e!640705))))

(declare-datatypes ((List!24619 0))(
  ( (Nil!24616) (Cons!24615 (h!25824 (_ BitVec 64)) (t!35360 List!24619)) )
))
(declare-fun arrayNoDuplicates!0 (array!73421 (_ BitVec 32) List!24619) Bool)

(assert (=> b!1125567 (= res!752118 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24616))))

(declare-fun b!1125568 () Bool)

(declare-fun e!640706 () Bool)

(declare-fun e!640698 () Bool)

(assert (=> b!1125568 (= e!640706 e!640698)))

(declare-fun res!752109 () Bool)

(assert (=> b!1125568 (=> res!752109 e!640698)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1125568 (= res!752109 (not (= (select (arr!35363 _keys!1208) from!1455) k!934)))))

(declare-fun e!640704 () Bool)

(assert (=> b!1125568 e!640704))

(declare-fun c!109614 () Bool)

(assert (=> b!1125568 (= c!109614 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42833)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42833)

(declare-datatypes ((Unit!36890 0))(
  ( (Unit!36891) )
))
(declare-fun lt!499901 () Unit!36890)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!366 (array!73421 array!73423 (_ BitVec 32) (_ BitVec 32) V!42833 V!42833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36890)

(assert (=> b!1125568 (= lt!499901 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!366 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((tuple2!17840 0))(
  ( (tuple2!17841 (_1!8931 (_ BitVec 64)) (_2!8931 V!42833)) )
))
(declare-datatypes ((List!24620 0))(
  ( (Nil!24617) (Cons!24616 (h!25825 tuple2!17840) (t!35361 List!24620)) )
))
(declare-datatypes ((ListLongMap!15809 0))(
  ( (ListLongMap!15810 (toList!7920 List!24620)) )
))
(declare-fun call!47530 () ListLongMap!15809)

(declare-fun bm!47526 () Bool)

(declare-fun lt!499900 () array!73423)

(declare-fun getCurrentListMapNoExtraKeys!4408 (array!73421 array!73423 (_ BitVec 32) (_ BitVec 32) V!42833 V!42833 (_ BitVec 32) Int) ListLongMap!15809)

(assert (=> bm!47526 (= call!47530 (getCurrentListMapNoExtraKeys!4408 lt!499895 lt!499900 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125569 () Bool)

(declare-fun res!752115 () Bool)

(assert (=> b!1125569 (=> (not res!752115) (not e!640705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125569 (= res!752115 (validMask!0 mask!1564))))

(declare-fun b!1125570 () Bool)

(declare-fun e!640700 () Bool)

(declare-fun mapRes!44236 () Bool)

(assert (=> b!1125570 (= e!640700 (and e!640702 mapRes!44236))))

(declare-fun condMapEmpty!44236 () Bool)

(declare-fun mapDefault!44236 () ValueCell!13430)

