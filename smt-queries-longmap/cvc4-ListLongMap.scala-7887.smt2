; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98070 () Bool)

(assert start!98070)

(declare-fun b_free!23771 () Bool)

(declare-fun b_next!23771 () Bool)

(assert (=> start!98070 (= b_free!23771 (not b_next!23771))))

(declare-fun tp!84016 () Bool)

(declare-fun b_and!38325 () Bool)

(assert (=> start!98070 (= tp!84016 b_and!38325)))

(declare-fun b!1126178 () Bool)

(declare-fun e!641028 () Bool)

(declare-fun e!641032 () Bool)

(assert (=> b!1126178 (= e!641028 e!641032)))

(declare-fun res!752536 () Bool)

(assert (=> b!1126178 (=> res!752536 e!641032)))

(declare-datatypes ((array!73465 0))(
  ( (array!73466 (arr!35385 (Array (_ BitVec 32) (_ BitVec 64))) (size!35921 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73465)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1126178 (= res!752536 (not (= (select (arr!35385 _keys!1208) from!1455) k!934)))))

(declare-fun e!641033 () Bool)

(assert (=> b!1126178 e!641033))

(declare-fun c!109647 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126178 (= c!109647 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42861 0))(
  ( (V!42862 (val!14207 Int)) )
))
(declare-fun zeroValue!944 () V!42861)

(declare-datatypes ((Unit!36910 0))(
  ( (Unit!36911) )
))
(declare-fun lt!500130 () Unit!36910)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13441 0))(
  ( (ValueCellFull!13441 (v!16840 V!42861)) (EmptyCell!13441) )
))
(declare-datatypes ((array!73467 0))(
  ( (array!73468 (arr!35386 (Array (_ BitVec 32) ValueCell!13441)) (size!35922 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73467)

(declare-fun minValue!944 () V!42861)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!376 (array!73465 array!73467 (_ BitVec 32) (_ BitVec 32) V!42861 V!42861 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36910)

(assert (=> b!1126178 (= lt!500130 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!376 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126179 () Bool)

(declare-fun e!641037 () Bool)

(declare-fun e!641035 () Bool)

(assert (=> b!1126179 (= e!641037 e!641035)))

(declare-fun res!752545 () Bool)

(assert (=> b!1126179 (=> (not res!752545) (not e!641035))))

(declare-fun lt!500131 () array!73465)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73465 (_ BitVec 32)) Bool)

(assert (=> b!1126179 (= res!752545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500131 mask!1564))))

(assert (=> b!1126179 (= lt!500131 (array!73466 (store (arr!35385 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35921 _keys!1208)))))

(declare-fun b!1126180 () Bool)

(declare-fun res!752543 () Bool)

(assert (=> b!1126180 (=> (not res!752543) (not e!641037))))

(assert (=> b!1126180 (= res!752543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1126181 () Bool)

(declare-fun e!641034 () Bool)

(assert (=> b!1126181 (= e!641034 e!641028)))

(declare-fun res!752542 () Bool)

(assert (=> b!1126181 (=> res!752542 e!641028)))

(assert (=> b!1126181 (= res!752542 (not (= from!1455 i!673)))))

(declare-fun lt!500128 () array!73467)

(declare-datatypes ((tuple2!17862 0))(
  ( (tuple2!17863 (_1!8942 (_ BitVec 64)) (_2!8942 V!42861)) )
))
(declare-datatypes ((List!24638 0))(
  ( (Nil!24635) (Cons!24634 (h!25843 tuple2!17862) (t!35401 List!24638)) )
))
(declare-datatypes ((ListLongMap!15831 0))(
  ( (ListLongMap!15832 (toList!7931 List!24638)) )
))
(declare-fun lt!500129 () ListLongMap!15831)

(declare-fun getCurrentListMapNoExtraKeys!4419 (array!73465 array!73467 (_ BitVec 32) (_ BitVec 32) V!42861 V!42861 (_ BitVec 32) Int) ListLongMap!15831)

(assert (=> b!1126181 (= lt!500129 (getCurrentListMapNoExtraKeys!4419 lt!500131 lt!500128 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2509 (Int (_ BitVec 64)) V!42861)

(assert (=> b!1126181 (= lt!500128 (array!73468 (store (arr!35386 _values!996) i!673 (ValueCellFull!13441 (dynLambda!2509 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35922 _values!996)))))

(declare-fun lt!500126 () ListLongMap!15831)

(assert (=> b!1126181 (= lt!500126 (getCurrentListMapNoExtraKeys!4419 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!44269 () Bool)

(declare-fun mapRes!44269 () Bool)

(assert (=> mapIsEmpty!44269 mapRes!44269))

(declare-fun b!1126182 () Bool)

(declare-fun e!641036 () Bool)

(declare-fun e!641031 () Bool)

(assert (=> b!1126182 (= e!641036 (and e!641031 mapRes!44269))))

(declare-fun condMapEmpty!44269 () Bool)

(declare-fun mapDefault!44269 () ValueCell!13441)

