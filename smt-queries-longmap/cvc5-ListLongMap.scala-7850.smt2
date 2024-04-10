; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97844 () Bool)

(assert start!97844)

(declare-fun b_free!23545 () Bool)

(declare-fun b_next!23545 () Bool)

(assert (=> start!97844 (= b_free!23545 (not b_next!23545))))

(declare-fun tp!83338 () Bool)

(declare-fun b_and!37873 () Bool)

(assert (=> start!97844 (= tp!83338 b_and!37873)))

(declare-fun mapNonEmpty!43930 () Bool)

(declare-fun mapRes!43930 () Bool)

(declare-fun tp!83339 () Bool)

(declare-fun e!637760 () Bool)

(assert (=> mapNonEmpty!43930 (= mapRes!43930 (and tp!83339 e!637760))))

(declare-datatypes ((V!42561 0))(
  ( (V!42562 (val!14094 Int)) )
))
(declare-datatypes ((ValueCell!13328 0))(
  ( (ValueCellFull!13328 (v!16727 V!42561)) (EmptyCell!13328) )
))
(declare-fun mapRest!43930 () (Array (_ BitVec 32) ValueCell!13328))

(declare-fun mapValue!43930 () ValueCell!13328)

(declare-datatypes ((array!73033 0))(
  ( (array!73034 (arr!35169 (Array (_ BitVec 32) ValueCell!13328)) (size!35705 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73033)

(declare-fun mapKey!43930 () (_ BitVec 32))

(assert (=> mapNonEmpty!43930 (= (arr!35169 _values!996) (store mapRest!43930 mapKey!43930 mapValue!43930))))

(declare-fun b!1119914 () Bool)

(declare-fun e!637764 () Bool)

(declare-fun e!637759 () Bool)

(assert (=> b!1119914 (= e!637764 (not e!637759))))

(declare-fun res!748116 () Bool)

(assert (=> b!1119914 (=> res!748116 e!637759)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119914 (= res!748116 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73035 0))(
  ( (array!73036 (arr!35170 (Array (_ BitVec 32) (_ BitVec 64))) (size!35706 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73035)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119914 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36750 0))(
  ( (Unit!36751) )
))
(declare-fun lt!497883 () Unit!36750)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73035 (_ BitVec 64) (_ BitVec 32)) Unit!36750)

(assert (=> b!1119914 (= lt!497883 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1119915 () Bool)

(declare-fun e!637762 () Bool)

(declare-fun e!637763 () Bool)

(assert (=> b!1119915 (= e!637762 (and e!637763 mapRes!43930))))

(declare-fun condMapEmpty!43930 () Bool)

(declare-fun mapDefault!43930 () ValueCell!13328)

