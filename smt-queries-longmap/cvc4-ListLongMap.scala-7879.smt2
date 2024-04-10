; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98022 () Bool)

(assert start!98022)

(declare-fun b_free!23723 () Bool)

(declare-fun b_next!23723 () Bool)

(assert (=> start!98022 (= b_free!23723 (not b_next!23723))))

(declare-fun tp!83872 () Bool)

(declare-fun b_and!38229 () Bool)

(assert (=> start!98022 (= tp!83872 b_and!38229)))

(declare-fun b!1124760 () Bool)

(declare-fun res!751532 () Bool)

(declare-fun e!640277 () Bool)

(assert (=> b!1124760 (=> (not res!751532) (not e!640277))))

(declare-datatypes ((array!73373 0))(
  ( (array!73374 (arr!35339 (Array (_ BitVec 32) (_ BitVec 64))) (size!35875 (_ BitVec 32))) )
))
(declare-fun lt!499591 () array!73373)

(declare-datatypes ((List!24598 0))(
  ( (Nil!24595) (Cons!24594 (h!25803 (_ BitVec 64)) (t!35313 List!24598)) )
))
(declare-fun arrayNoDuplicates!0 (array!73373 (_ BitVec 32) List!24598) Bool)

(assert (=> b!1124760 (= res!751532 (arrayNoDuplicates!0 lt!499591 #b00000000000000000000000000000000 Nil!24595))))

(declare-fun b!1124761 () Bool)

(declare-fun res!751536 () Bool)

(declare-fun e!640276 () Bool)

(assert (=> b!1124761 (=> (not res!751536) (not e!640276))))

(declare-fun _keys!1208 () array!73373)

(assert (=> b!1124761 (= res!751536 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24595))))

(declare-fun mapIsEmpty!44197 () Bool)

(declare-fun mapRes!44197 () Bool)

(assert (=> mapIsEmpty!44197 mapRes!44197))

(declare-fun b!1124762 () Bool)

(declare-fun e!640275 () Bool)

(declare-datatypes ((V!42797 0))(
  ( (V!42798 (val!14183 Int)) )
))
(declare-datatypes ((tuple2!17818 0))(
  ( (tuple2!17819 (_1!8920 (_ BitVec 64)) (_2!8920 V!42797)) )
))
(declare-datatypes ((List!24599 0))(
  ( (Nil!24596) (Cons!24595 (h!25804 tuple2!17818) (t!35314 List!24599)) )
))
(declare-datatypes ((ListLongMap!15787 0))(
  ( (ListLongMap!15788 (toList!7909 List!24599)) )
))
(declare-fun call!47451 () ListLongMap!15787)

(declare-fun call!47452 () ListLongMap!15787)

(assert (=> b!1124762 (= e!640275 (= call!47451 call!47452))))

(declare-fun b!1124763 () Bool)

(declare-fun e!640279 () Bool)

(declare-fun e!640273 () Bool)

(assert (=> b!1124763 (= e!640279 e!640273)))

(declare-fun res!751537 () Bool)

(assert (=> b!1124763 (=> res!751537 e!640273)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124763 (= res!751537 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42797)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!499586 () ListLongMap!15787)

(declare-datatypes ((ValueCell!13417 0))(
  ( (ValueCellFull!13417 (v!16816 V!42797)) (EmptyCell!13417) )
))
(declare-datatypes ((array!73375 0))(
  ( (array!73376 (arr!35340 (Array (_ BitVec 32) ValueCell!13417)) (size!35876 (_ BitVec 32))) )
))
(declare-fun lt!499588 () array!73375)

(declare-fun minValue!944 () V!42797)

(declare-fun getCurrentListMapNoExtraKeys!4397 (array!73373 array!73375 (_ BitVec 32) (_ BitVec 32) V!42797 V!42797 (_ BitVec 32) Int) ListLongMap!15787)

(assert (=> b!1124763 (= lt!499586 (getCurrentListMapNoExtraKeys!4397 lt!499591 lt!499588 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73375)

(declare-fun dynLambda!2491 (Int (_ BitVec 64)) V!42797)

(assert (=> b!1124763 (= lt!499588 (array!73376 (store (arr!35340 _values!996) i!673 (ValueCellFull!13417 (dynLambda!2491 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35876 _values!996)))))

(declare-fun lt!499589 () ListLongMap!15787)

(assert (=> b!1124763 (= lt!499589 (getCurrentListMapNoExtraKeys!4397 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124764 () Bool)

(declare-fun res!751538 () Bool)

(assert (=> b!1124764 (=> (not res!751538) (not e!640276))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124764 (= res!751538 (validKeyInArray!0 k!934))))

(declare-fun b!1124765 () Bool)

(declare-fun res!751530 () Bool)

(assert (=> b!1124765 (=> (not res!751530) (not e!640276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73373 (_ BitVec 32)) Bool)

(assert (=> b!1124765 (= res!751530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47448 () Bool)

(assert (=> bm!47448 (= call!47452 (getCurrentListMapNoExtraKeys!4397 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124766 () Bool)

(declare-fun e!640274 () Bool)

(assert (=> b!1124766 (= e!640274 true)))

(declare-fun lt!499585 () ListLongMap!15787)

(declare-fun contains!6447 (ListLongMap!15787 (_ BitVec 64)) Bool)

(declare-fun +!3417 (ListLongMap!15787 tuple2!17818) ListLongMap!15787)

(assert (=> b!1124766 (contains!6447 (+!3417 lt!499585 (tuple2!17819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k!934)))

(declare-datatypes ((Unit!36870 0))(
  ( (Unit!36871) )
))
(declare-fun lt!499590 () Unit!36870)

(declare-fun addStillContains!679 (ListLongMap!15787 (_ BitVec 64) V!42797 (_ BitVec 64)) Unit!36870)

(assert (=> b!1124766 (= lt!499590 (addStillContains!679 lt!499585 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun b!1124767 () Bool)

(declare-fun e!640272 () Bool)

(declare-fun tp_is_empty!28253 () Bool)

(assert (=> b!1124767 (= e!640272 tp_is_empty!28253)))

(declare-fun b!1124768 () Bool)

(declare-fun res!751533 () Bool)

(assert (=> b!1124768 (=> (not res!751533) (not e!640276))))

(assert (=> b!1124768 (= res!751533 (= (select (arr!35339 _keys!1208) i!673) k!934))))

(declare-fun b!1124770 () Bool)

(declare-fun res!751529 () Bool)

(assert (=> b!1124770 (=> (not res!751529) (not e!640276))))

(assert (=> b!1124770 (= res!751529 (and (= (size!35876 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35875 _keys!1208) (size!35876 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1124771 () Bool)

(assert (=> b!1124771 (= e!640276 e!640277)))

(declare-fun res!751539 () Bool)

(assert (=> b!1124771 (=> (not res!751539) (not e!640277))))

(assert (=> b!1124771 (= res!751539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499591 mask!1564))))

(assert (=> b!1124771 (= lt!499591 (array!73374 (store (arr!35339 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35875 _keys!1208)))))

(declare-fun bm!47449 () Bool)

(assert (=> bm!47449 (= call!47451 (getCurrentListMapNoExtraKeys!4397 lt!499591 lt!499588 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124772 () Bool)

(declare-fun -!1112 (ListLongMap!15787 (_ BitVec 64)) ListLongMap!15787)

(assert (=> b!1124772 (= e!640275 (= call!47451 (-!1112 call!47452 k!934)))))

(declare-fun b!1124773 () Bool)

(assert (=> b!1124773 (= e!640277 (not e!640279))))

(declare-fun res!751527 () Bool)

(assert (=> b!1124773 (=> res!751527 e!640279)))

(assert (=> b!1124773 (= res!751527 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124773 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!499587 () Unit!36870)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73373 (_ BitVec 64) (_ BitVec 32)) Unit!36870)

(assert (=> b!1124773 (= lt!499587 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!44197 () Bool)

(declare-fun tp!83873 () Bool)

(declare-fun e!640280 () Bool)

(assert (=> mapNonEmpty!44197 (= mapRes!44197 (and tp!83873 e!640280))))

(declare-fun mapValue!44197 () ValueCell!13417)

(declare-fun mapKey!44197 () (_ BitVec 32))

(declare-fun mapRest!44197 () (Array (_ BitVec 32) ValueCell!13417))

(assert (=> mapNonEmpty!44197 (= (arr!35340 _values!996) (store mapRest!44197 mapKey!44197 mapValue!44197))))

(declare-fun b!1124774 () Bool)

(declare-fun res!751526 () Bool)

(assert (=> b!1124774 (=> (not res!751526) (not e!640276))))

(assert (=> b!1124774 (= res!751526 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35875 _keys!1208))))))

(declare-fun b!1124775 () Bool)

(declare-fun res!751531 () Bool)

(assert (=> b!1124775 (=> res!751531 e!640274)))

(assert (=> b!1124775 (= res!751531 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!751534 () Bool)

(assert (=> start!98022 (=> (not res!751534) (not e!640276))))

(assert (=> start!98022 (= res!751534 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35875 _keys!1208))))))

(assert (=> start!98022 e!640276))

(assert (=> start!98022 tp_is_empty!28253))

(declare-fun array_inv!27126 (array!73373) Bool)

(assert (=> start!98022 (array_inv!27126 _keys!1208)))

(assert (=> start!98022 true))

(assert (=> start!98022 tp!83872))

(declare-fun e!640271 () Bool)

(declare-fun array_inv!27127 (array!73375) Bool)

(assert (=> start!98022 (and (array_inv!27127 _values!996) e!640271)))

(declare-fun b!1124769 () Bool)

(assert (=> b!1124769 (= e!640280 tp_is_empty!28253)))

(declare-fun b!1124776 () Bool)

(declare-fun e!640281 () Bool)

(assert (=> b!1124776 (= e!640273 e!640281)))

(declare-fun res!751528 () Bool)

(assert (=> b!1124776 (=> res!751528 e!640281)))

(assert (=> b!1124776 (= res!751528 (not (= (select (arr!35339 _keys!1208) from!1455) k!934)))))

(assert (=> b!1124776 e!640275))

(declare-fun c!109575 () Bool)

(assert (=> b!1124776 (= c!109575 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499592 () Unit!36870)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!359 (array!73373 array!73375 (_ BitVec 32) (_ BitVec 32) V!42797 V!42797 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36870)

(assert (=> b!1124776 (= lt!499592 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!359 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124777 () Bool)

(assert (=> b!1124777 (= e!640271 (and e!640272 mapRes!44197))))

(declare-fun condMapEmpty!44197 () Bool)

(declare-fun mapDefault!44197 () ValueCell!13417)

