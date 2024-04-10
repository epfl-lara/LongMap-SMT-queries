; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98058 () Bool)

(assert start!98058)

(declare-fun b_free!23759 () Bool)

(declare-fun b_next!23759 () Bool)

(assert (=> start!98058 (= b_free!23759 (not b_next!23759))))

(declare-fun tp!83980 () Bool)

(declare-fun b_and!38301 () Bool)

(assert (=> start!98058 (= tp!83980 b_and!38301)))

(declare-fun b!1125842 () Bool)

(declare-fun res!752307 () Bool)

(declare-fun e!640856 () Bool)

(assert (=> b!1125842 (=> (not res!752307) (not e!640856))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125842 (= res!752307 (validKeyInArray!0 k!934))))

(declare-fun b!1125843 () Bool)

(declare-datatypes ((V!42845 0))(
  ( (V!42846 (val!14201 Int)) )
))
(declare-datatypes ((tuple2!17850 0))(
  ( (tuple2!17851 (_1!8936 (_ BitVec 64)) (_2!8936 V!42845)) )
))
(declare-datatypes ((List!24628 0))(
  ( (Nil!24625) (Cons!24624 (h!25833 tuple2!17850) (t!35379 List!24628)) )
))
(declare-datatypes ((ListLongMap!15819 0))(
  ( (ListLongMap!15820 (toList!7925 List!24628)) )
))
(declare-fun call!47559 () ListLongMap!15819)

(declare-fun e!640850 () Bool)

(declare-fun call!47560 () ListLongMap!15819)

(declare-fun -!1123 (ListLongMap!15819 (_ BitVec 64)) ListLongMap!15819)

(assert (=> b!1125843 (= e!640850 (= call!47559 (-!1123 call!47560 k!934)))))

(declare-fun b!1125844 () Bool)

(declare-fun res!752311 () Bool)

(assert (=> b!1125844 (=> (not res!752311) (not e!640856))))

(declare-datatypes ((array!73441 0))(
  ( (array!73442 (arr!35373 (Array (_ BitVec 32) (_ BitVec 64))) (size!35909 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73441)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125844 (= res!752311 (= (select (arr!35373 _keys!1208) i!673) k!934))))

(declare-fun b!1125845 () Bool)

(declare-fun res!752314 () Bool)

(assert (=> b!1125845 (=> (not res!752314) (not e!640856))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13435 0))(
  ( (ValueCellFull!13435 (v!16834 V!42845)) (EmptyCell!13435) )
))
(declare-datatypes ((array!73443 0))(
  ( (array!73444 (arr!35374 (Array (_ BitVec 32) ValueCell!13435)) (size!35910 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73443)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1125845 (= res!752314 (and (= (size!35910 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35909 _keys!1208) (size!35910 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125846 () Bool)

(declare-fun e!640849 () Bool)

(assert (=> b!1125846 (= e!640856 e!640849)))

(declare-fun res!752306 () Bool)

(assert (=> b!1125846 (=> (not res!752306) (not e!640849))))

(declare-fun lt!500005 () array!73441)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73441 (_ BitVec 32)) Bool)

(assert (=> b!1125846 (= res!752306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500005 mask!1564))))

(assert (=> b!1125846 (= lt!500005 (array!73442 (store (arr!35373 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35909 _keys!1208)))))

(declare-fun b!1125847 () Bool)

(declare-fun e!640848 () Bool)

(declare-fun tp_is_empty!28289 () Bool)

(assert (=> b!1125847 (= e!640848 tp_is_empty!28289)))

(declare-fun b!1125848 () Bool)

(declare-fun res!752308 () Bool)

(assert (=> b!1125848 (=> (not res!752308) (not e!640849))))

(declare-datatypes ((List!24629 0))(
  ( (Nil!24626) (Cons!24625 (h!25834 (_ BitVec 64)) (t!35380 List!24629)) )
))
(declare-fun arrayNoDuplicates!0 (array!73441 (_ BitVec 32) List!24629) Bool)

(assert (=> b!1125848 (= res!752308 (arrayNoDuplicates!0 lt!500005 #b00000000000000000000000000000000 Nil!24626))))

(declare-fun b!1125849 () Bool)

(declare-fun e!640854 () Bool)

(assert (=> b!1125849 (= e!640854 tp_is_empty!28289)))

(declare-fun b!1125850 () Bool)

(declare-fun e!640853 () Bool)

(declare-fun e!640857 () Bool)

(assert (=> b!1125850 (= e!640853 e!640857)))

(declare-fun res!752312 () Bool)

(assert (=> b!1125850 (=> res!752312 e!640857)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1125850 (= res!752312 (not (= (select (arr!35373 _keys!1208) from!1455) k!934)))))

(assert (=> b!1125850 e!640850))

(declare-fun c!109629 () Bool)

(assert (=> b!1125850 (= c!109629 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42845)

(declare-datatypes ((Unit!36898 0))(
  ( (Unit!36899) )
))
(declare-fun lt!500003 () Unit!36898)

(declare-fun zeroValue!944 () V!42845)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!370 (array!73441 array!73443 (_ BitVec 32) (_ BitVec 32) V!42845 V!42845 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36898)

(assert (=> b!1125850 (= lt!500003 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!370 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125851 () Bool)

(assert (=> b!1125851 (= e!640857 true)))

(declare-fun lt!500000 () Bool)

(declare-fun contains!6460 (ListLongMap!15819 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4413 (array!73441 array!73443 (_ BitVec 32) (_ BitVec 32) V!42845 V!42845 (_ BitVec 32) Int) ListLongMap!15819)

(assert (=> b!1125851 (= lt!500000 (contains!6460 (getCurrentListMapNoExtraKeys!4413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1125852 () Bool)

(declare-fun res!752305 () Bool)

(assert (=> b!1125852 (=> (not res!752305) (not e!640856))))

(assert (=> b!1125852 (= res!752305 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35909 _keys!1208))))))

(declare-fun b!1125853 () Bool)

(declare-fun e!640851 () Bool)

(assert (=> b!1125853 (= e!640851 e!640853)))

(declare-fun res!752313 () Bool)

(assert (=> b!1125853 (=> res!752313 e!640853)))

(assert (=> b!1125853 (= res!752313 (not (= from!1455 i!673)))))

(declare-fun lt!500004 () ListLongMap!15819)

(declare-fun lt!500002 () array!73443)

(assert (=> b!1125853 (= lt!500004 (getCurrentListMapNoExtraKeys!4413 lt!500005 lt!500002 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2503 (Int (_ BitVec 64)) V!42845)

(assert (=> b!1125853 (= lt!500002 (array!73444 (store (arr!35374 _values!996) i!673 (ValueCellFull!13435 (dynLambda!2503 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35910 _values!996)))))

(declare-fun lt!500001 () ListLongMap!15819)

(assert (=> b!1125853 (= lt!500001 (getCurrentListMapNoExtraKeys!4413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125854 () Bool)

(declare-fun res!752303 () Bool)

(assert (=> b!1125854 (=> (not res!752303) (not e!640856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125854 (= res!752303 (validMask!0 mask!1564))))

(declare-fun bm!47556 () Bool)

(assert (=> bm!47556 (= call!47559 (getCurrentListMapNoExtraKeys!4413 lt!500005 lt!500002 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125855 () Bool)

(assert (=> b!1125855 (= e!640849 (not e!640851))))

(declare-fun res!752302 () Bool)

(assert (=> b!1125855 (=> res!752302 e!640851)))

(assert (=> b!1125855 (= res!752302 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125855 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!500006 () Unit!36898)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73441 (_ BitVec 64) (_ BitVec 32)) Unit!36898)

(assert (=> b!1125855 (= lt!500006 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!47557 () Bool)

(assert (=> bm!47557 (= call!47560 (getCurrentListMapNoExtraKeys!4413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125856 () Bool)

(declare-fun e!640852 () Bool)

(declare-fun mapRes!44251 () Bool)

(assert (=> b!1125856 (= e!640852 (and e!640848 mapRes!44251))))

(declare-fun condMapEmpty!44251 () Bool)

(declare-fun mapDefault!44251 () ValueCell!13435)

