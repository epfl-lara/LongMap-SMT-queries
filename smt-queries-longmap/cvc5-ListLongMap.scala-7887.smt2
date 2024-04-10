; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98066 () Bool)

(assert start!98066)

(declare-fun b_free!23767 () Bool)

(declare-fun b_next!23767 () Bool)

(assert (=> start!98066 (= b_free!23767 (not b_next!23767))))

(declare-fun tp!84004 () Bool)

(declare-fun b_and!38317 () Bool)

(assert (=> start!98066 (= tp!84004 b_and!38317)))

(declare-fun b!1126066 () Bool)

(declare-fun res!752461 () Bool)

(declare-fun e!640976 () Bool)

(assert (=> b!1126066 (=> (not res!752461) (not e!640976))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73457 0))(
  ( (array!73458 (arr!35381 (Array (_ BitVec 32) (_ BitVec 64))) (size!35917 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73457)

(assert (=> b!1126066 (= res!752461 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35917 _keys!1208))))))

(declare-fun b!1126067 () Bool)

(declare-fun e!640975 () Bool)

(declare-fun e!640971 () Bool)

(assert (=> b!1126067 (= e!640975 e!640971)))

(declare-fun res!752463 () Bool)

(assert (=> b!1126067 (=> res!752463 e!640971)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1126067 (= res!752463 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42857 0))(
  ( (V!42858 (val!14205 Int)) )
))
(declare-fun zeroValue!944 () V!42857)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!500088 () array!73457)

(declare-datatypes ((tuple2!17858 0))(
  ( (tuple2!17859 (_1!8940 (_ BitVec 64)) (_2!8940 V!42857)) )
))
(declare-datatypes ((List!24635 0))(
  ( (Nil!24632) (Cons!24631 (h!25840 tuple2!17858) (t!35394 List!24635)) )
))
(declare-datatypes ((ListLongMap!15827 0))(
  ( (ListLongMap!15828 (toList!7929 List!24635)) )
))
(declare-fun lt!500090 () ListLongMap!15827)

(declare-fun minValue!944 () V!42857)

(declare-datatypes ((ValueCell!13439 0))(
  ( (ValueCellFull!13439 (v!16838 V!42857)) (EmptyCell!13439) )
))
(declare-datatypes ((array!73459 0))(
  ( (array!73460 (arr!35382 (Array (_ BitVec 32) ValueCell!13439)) (size!35918 (_ BitVec 32))) )
))
(declare-fun lt!500085 () array!73459)

(declare-fun getCurrentListMapNoExtraKeys!4417 (array!73457 array!73459 (_ BitVec 32) (_ BitVec 32) V!42857 V!42857 (_ BitVec 32) Int) ListLongMap!15827)

(assert (=> b!1126067 (= lt!500090 (getCurrentListMapNoExtraKeys!4417 lt!500088 lt!500085 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73459)

(declare-fun dynLambda!2507 (Int (_ BitVec 64)) V!42857)

(assert (=> b!1126067 (= lt!500085 (array!73460 (store (arr!35382 _values!996) i!673 (ValueCellFull!13439 (dynLambda!2507 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35918 _values!996)))))

(declare-fun lt!500086 () ListLongMap!15827)

(assert (=> b!1126067 (= lt!500086 (getCurrentListMapNoExtraKeys!4417 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126068 () Bool)

(declare-fun e!640974 () Bool)

(declare-fun call!47584 () ListLongMap!15827)

(declare-fun call!47583 () ListLongMap!15827)

(assert (=> b!1126068 (= e!640974 (= call!47584 call!47583))))

(declare-fun bm!47580 () Bool)

(assert (=> bm!47580 (= call!47583 (getCurrentListMapNoExtraKeys!4417 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126069 () Bool)

(declare-fun res!752464 () Bool)

(assert (=> b!1126069 (=> (not res!752464) (not e!640976))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126069 (= res!752464 (validKeyInArray!0 k!934))))

(declare-fun bm!47581 () Bool)

(assert (=> bm!47581 (= call!47584 (getCurrentListMapNoExtraKeys!4417 lt!500088 lt!500085 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126070 () Bool)

(declare-fun e!640969 () Bool)

(declare-fun tp_is_empty!28297 () Bool)

(assert (=> b!1126070 (= e!640969 tp_is_empty!28297)))

(declare-fun res!752465 () Bool)

(assert (=> start!98066 (=> (not res!752465) (not e!640976))))

(assert (=> start!98066 (= res!752465 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35917 _keys!1208))))))

(assert (=> start!98066 e!640976))

(assert (=> start!98066 tp_is_empty!28297))

(declare-fun array_inv!27158 (array!73457) Bool)

(assert (=> start!98066 (array_inv!27158 _keys!1208)))

(assert (=> start!98066 true))

(assert (=> start!98066 tp!84004))

(declare-fun e!640977 () Bool)

(declare-fun array_inv!27159 (array!73459) Bool)

(assert (=> start!98066 (and (array_inv!27159 _values!996) e!640977)))

(declare-fun b!1126071 () Bool)

(declare-fun e!640972 () Bool)

(assert (=> b!1126071 (= e!640971 e!640972)))

(declare-fun res!752469 () Bool)

(assert (=> b!1126071 (=> res!752469 e!640972)))

(assert (=> b!1126071 (= res!752469 (not (= (select (arr!35381 _keys!1208) from!1455) k!934)))))

(assert (=> b!1126071 e!640974))

(declare-fun c!109641 () Bool)

(assert (=> b!1126071 (= c!109641 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36906 0))(
  ( (Unit!36907) )
))
(declare-fun lt!500087 () Unit!36906)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!374 (array!73457 array!73459 (_ BitVec 32) (_ BitVec 32) V!42857 V!42857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36906)

(assert (=> b!1126071 (= lt!500087 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!374 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126072 () Bool)

(declare-fun e!640973 () Bool)

(assert (=> b!1126072 (= e!640973 (not e!640975))))

(declare-fun res!752467 () Bool)

(assert (=> b!1126072 (=> res!752467 e!640975)))

(assert (=> b!1126072 (= res!752467 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126072 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!500084 () Unit!36906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73457 (_ BitVec 64) (_ BitVec 32)) Unit!36906)

(assert (=> b!1126072 (= lt!500084 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1126073 () Bool)

(declare-fun e!640970 () Bool)

(declare-fun mapRes!44263 () Bool)

(assert (=> b!1126073 (= e!640977 (and e!640970 mapRes!44263))))

(declare-fun condMapEmpty!44263 () Bool)

(declare-fun mapDefault!44263 () ValueCell!13439)

