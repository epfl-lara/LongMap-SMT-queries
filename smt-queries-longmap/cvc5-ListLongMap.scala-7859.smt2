; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97898 () Bool)

(assert start!97898)

(declare-fun b_free!23599 () Bool)

(declare-fun b_next!23599 () Bool)

(assert (=> start!97898 (= b_free!23599 (not b_next!23599))))

(declare-fun tp!83501 () Bool)

(declare-fun b_and!37981 () Bool)

(assert (=> start!97898 (= tp!83501 b_and!37981)))

(declare-fun mapNonEmpty!44011 () Bool)

(declare-fun mapRes!44011 () Bool)

(declare-fun tp!83500 () Bool)

(declare-fun e!638407 () Bool)

(assert (=> mapNonEmpty!44011 (= mapRes!44011 (and tp!83500 e!638407))))

(declare-fun mapKey!44011 () (_ BitVec 32))

(declare-datatypes ((V!42633 0))(
  ( (V!42634 (val!14121 Int)) )
))
(declare-datatypes ((ValueCell!13355 0))(
  ( (ValueCellFull!13355 (v!16754 V!42633)) (EmptyCell!13355) )
))
(declare-fun mapRest!44011 () (Array (_ BitVec 32) ValueCell!13355))

(declare-datatypes ((array!73139 0))(
  ( (array!73140 (arr!35222 (Array (_ BitVec 32) ValueCell!13355)) (size!35758 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73139)

(declare-fun mapValue!44011 () ValueCell!13355)

(assert (=> mapNonEmpty!44011 (= (arr!35222 _values!996) (store mapRest!44011 mapKey!44011 mapValue!44011))))

(declare-fun b!1121216 () Bool)

(declare-fun e!638404 () Bool)

(declare-datatypes ((tuple2!17722 0))(
  ( (tuple2!17723 (_1!8872 (_ BitVec 64)) (_2!8872 V!42633)) )
))
(declare-datatypes ((List!24507 0))(
  ( (Nil!24504) (Cons!24503 (h!25712 tuple2!17722) (t!35098 List!24507)) )
))
(declare-datatypes ((ListLongMap!15691 0))(
  ( (ListLongMap!15692 (toList!7861 List!24507)) )
))
(declare-fun call!47080 () ListLongMap!15691)

(declare-fun call!47079 () ListLongMap!15691)

(assert (=> b!1121216 (= e!638404 (= call!47080 call!47079))))

(declare-fun zeroValue!944 () V!42633)

(declare-datatypes ((array!73141 0))(
  ( (array!73142 (arr!35223 (Array (_ BitVec 32) (_ BitVec 64))) (size!35759 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73141)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47076 () Bool)

(declare-fun minValue!944 () V!42633)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4350 (array!73141 array!73139 (_ BitVec 32) (_ BitVec 32) V!42633 V!42633 (_ BitVec 32) Int) ListLongMap!15691)

(assert (=> bm!47076 (= call!47079 (getCurrentListMapNoExtraKeys!4350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121217 () Bool)

(declare-fun e!638401 () Bool)

(assert (=> b!1121217 (= e!638401 true)))

(assert (=> b!1121217 e!638404))

(declare-fun c!109389 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121217 (= c!109389 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36784 0))(
  ( (Unit!36785) )
))
(declare-fun lt!498284 () Unit!36784)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!321 (array!73141 array!73139 (_ BitVec 32) (_ BitVec 32) V!42633 V!42633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36784)

(assert (=> b!1121217 (= lt!498284 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!498285 () array!73139)

(declare-fun lt!498282 () array!73141)

(declare-fun bm!47077 () Bool)

(assert (=> bm!47077 (= call!47080 (getCurrentListMapNoExtraKeys!4350 lt!498282 lt!498285 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121219 () Bool)

(declare-fun tp_is_empty!28129 () Bool)

(assert (=> b!1121219 (= e!638407 tp_is_empty!28129)))

(declare-fun b!1121220 () Bool)

(declare-fun res!749038 () Bool)

(declare-fun e!638403 () Bool)

(assert (=> b!1121220 (=> (not res!749038) (not e!638403))))

(declare-datatypes ((List!24508 0))(
  ( (Nil!24505) (Cons!24504 (h!25713 (_ BitVec 64)) (t!35099 List!24508)) )
))
(declare-fun arrayNoDuplicates!0 (array!73141 (_ BitVec 32) List!24508) Bool)

(assert (=> b!1121220 (= res!749038 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24505))))

(declare-fun b!1121221 () Bool)

(declare-fun res!749043 () Bool)

(assert (=> b!1121221 (=> (not res!749043) (not e!638403))))

(assert (=> b!1121221 (= res!749043 (= (select (arr!35223 _keys!1208) i!673) k!934))))

(declare-fun b!1121222 () Bool)

(declare-fun e!638409 () Bool)

(assert (=> b!1121222 (= e!638409 e!638401)))

(declare-fun res!749047 () Bool)

(assert (=> b!1121222 (=> res!749047 e!638401)))

(assert (=> b!1121222 (= res!749047 (not (= from!1455 i!673)))))

(declare-fun lt!498283 () ListLongMap!15691)

(assert (=> b!1121222 (= lt!498283 (getCurrentListMapNoExtraKeys!4350 lt!498282 lt!498285 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2452 (Int (_ BitVec 64)) V!42633)

(assert (=> b!1121222 (= lt!498285 (array!73140 (store (arr!35222 _values!996) i!673 (ValueCellFull!13355 (dynLambda!2452 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35758 _values!996)))))

(declare-fun lt!498286 () ListLongMap!15691)

(assert (=> b!1121222 (= lt!498286 (getCurrentListMapNoExtraKeys!4350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121223 () Bool)

(declare-fun e!638408 () Bool)

(declare-fun e!638402 () Bool)

(assert (=> b!1121223 (= e!638408 (and e!638402 mapRes!44011))))

(declare-fun condMapEmpty!44011 () Bool)

(declare-fun mapDefault!44011 () ValueCell!13355)

