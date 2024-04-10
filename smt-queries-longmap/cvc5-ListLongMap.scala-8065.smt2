; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99230 () Bool)

(assert start!99230)

(declare-fun b_free!24835 () Bool)

(declare-fun b_next!24835 () Bool)

(assert (=> start!99230 (= b_free!24835 (not b_next!24835))))

(declare-fun tp!87216 () Bool)

(declare-fun b_and!40519 () Bool)

(assert (=> start!99230 (= tp!87216 b_and!40519)))

(declare-fun b!1168705 () Bool)

(declare-fun e!664207 () Bool)

(declare-fun e!664212 () Bool)

(assert (=> b!1168705 (= e!664207 e!664212)))

(declare-fun res!775435 () Bool)

(assert (=> b!1168705 (=> res!775435 e!664212)))

(declare-datatypes ((array!75551 0))(
  ( (array!75552 (arr!36426 (Array (_ BitVec 32) (_ BitVec 64))) (size!36962 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75551)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168705 (= res!775435 (not (validKeyInArray!0 (select (arr!36426 _keys!1208) from!1455))))))

(declare-datatypes ((V!44281 0))(
  ( (V!44282 (val!14739 Int)) )
))
(declare-datatypes ((tuple2!18814 0))(
  ( (tuple2!18815 (_1!9418 (_ BitVec 64)) (_2!9418 V!44281)) )
))
(declare-datatypes ((List!25553 0))(
  ( (Nil!25550) (Cons!25549 (h!26758 tuple2!18814) (t!37380 List!25553)) )
))
(declare-datatypes ((ListLongMap!16783 0))(
  ( (ListLongMap!16784 (toList!8407 List!25553)) )
))
(declare-fun lt!526188 () ListLongMap!16783)

(declare-fun lt!526196 () ListLongMap!16783)

(assert (=> b!1168705 (= lt!526188 lt!526196)))

(declare-fun lt!526189 () ListLongMap!16783)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1479 (ListLongMap!16783 (_ BitVec 64)) ListLongMap!16783)

(assert (=> b!1168705 (= lt!526196 (-!1479 lt!526189 k!934))))

(declare-fun zeroValue!944 () V!44281)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13973 0))(
  ( (ValueCellFull!13973 (v!17376 V!44281)) (EmptyCell!13973) )
))
(declare-datatypes ((array!75553 0))(
  ( (array!75554 (arr!36427 (Array (_ BitVec 32) ValueCell!13973)) (size!36963 (_ BitVec 32))) )
))
(declare-fun lt!526192 () array!75553)

(declare-fun minValue!944 () V!44281)

(declare-fun lt!526190 () array!75551)

(declare-fun getCurrentListMapNoExtraKeys!4871 (array!75551 array!75553 (_ BitVec 32) (_ BitVec 32) V!44281 V!44281 (_ BitVec 32) Int) ListLongMap!16783)

(assert (=> b!1168705 (= lt!526188 (getCurrentListMapNoExtraKeys!4871 lt!526190 lt!526192 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75553)

(assert (=> b!1168705 (= lt!526189 (getCurrentListMapNoExtraKeys!4871 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38566 0))(
  ( (Unit!38567) )
))
(declare-fun lt!526195 () Unit!38566)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!706 (array!75551 array!75553 (_ BitVec 32) (_ BitVec 32) V!44281 V!44281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38566)

(assert (=> b!1168705 (= lt!526195 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!706 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168706 () Bool)

(assert (=> b!1168706 (= e!664212 (or (not (= (select (arr!36426 _keys!1208) from!1455) k!934)) (bvslt (size!36962 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun lt!526194 () ListLongMap!16783)

(declare-fun lt!526193 () V!44281)

(declare-fun +!3741 (ListLongMap!16783 tuple2!18814) ListLongMap!16783)

(declare-fun get!18565 (ValueCell!13973 V!44281) V!44281)

(assert (=> b!1168706 (= lt!526194 (+!3741 lt!526196 (tuple2!18815 (select (arr!36426 _keys!1208) from!1455) (get!18565 (select (arr!36427 _values!996) from!1455) lt!526193))))))

(declare-fun b!1168707 () Bool)

(declare-fun res!775440 () Bool)

(declare-fun e!664213 () Bool)

(assert (=> b!1168707 (=> (not res!775440) (not e!664213))))

(assert (=> b!1168707 (= res!775440 (and (= (size!36963 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36962 _keys!1208) (size!36963 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168708 () Bool)

(declare-fun res!775434 () Bool)

(assert (=> b!1168708 (=> (not res!775434) (not e!664213))))

(assert (=> b!1168708 (= res!775434 (validKeyInArray!0 k!934))))

(declare-fun b!1168709 () Bool)

(declare-fun e!664214 () Bool)

(declare-fun tp_is_empty!29365 () Bool)

(assert (=> b!1168709 (= e!664214 tp_is_empty!29365)))

(declare-fun b!1168710 () Bool)

(declare-fun e!664210 () Bool)

(assert (=> b!1168710 (= e!664210 tp_is_empty!29365)))

(declare-fun b!1168711 () Bool)

(declare-fun res!775444 () Bool)

(assert (=> b!1168711 (=> (not res!775444) (not e!664213))))

(assert (=> b!1168711 (= res!775444 (= (select (arr!36426 _keys!1208) i!673) k!934))))

(declare-fun b!1168712 () Bool)

(declare-fun e!664211 () Bool)

(assert (=> b!1168712 (= e!664211 e!664207)))

(declare-fun res!775433 () Bool)

(assert (=> b!1168712 (=> res!775433 e!664207)))

(assert (=> b!1168712 (= res!775433 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1168712 (= lt!526194 (getCurrentListMapNoExtraKeys!4871 lt!526190 lt!526192 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1168712 (= lt!526192 (array!75554 (store (arr!36427 _values!996) i!673 (ValueCellFull!13973 lt!526193)) (size!36963 _values!996)))))

(declare-fun dynLambda!2850 (Int (_ BitVec 64)) V!44281)

(assert (=> b!1168712 (= lt!526193 (dynLambda!2850 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526197 () ListLongMap!16783)

(assert (=> b!1168712 (= lt!526197 (getCurrentListMapNoExtraKeys!4871 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168713 () Bool)

(declare-fun e!664209 () Bool)

(declare-fun mapRes!45872 () Bool)

(assert (=> b!1168713 (= e!664209 (and e!664214 mapRes!45872))))

(declare-fun condMapEmpty!45872 () Bool)

(declare-fun mapDefault!45872 () ValueCell!13973)

