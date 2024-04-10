; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98090 () Bool)

(assert start!98090)

(declare-fun b_free!23791 () Bool)

(declare-fun b_next!23791 () Bool)

(assert (=> start!98090 (= b_free!23791 (not b_next!23791))))

(declare-fun tp!84076 () Bool)

(declare-fun b_and!38365 () Bool)

(assert (=> start!98090 (= tp!84076 b_and!38365)))

(declare-fun b!1126738 () Bool)

(declare-fun e!641332 () Bool)

(declare-datatypes ((V!42889 0))(
  ( (V!42890 (val!14217 Int)) )
))
(declare-datatypes ((tuple2!17876 0))(
  ( (tuple2!17877 (_1!8949 (_ BitVec 64)) (_2!8949 V!42889)) )
))
(declare-datatypes ((List!24652 0))(
  ( (Nil!24649) (Cons!24648 (h!25857 tuple2!17876) (t!35435 List!24652)) )
))
(declare-datatypes ((ListLongMap!15845 0))(
  ( (ListLongMap!15846 (toList!7938 List!24652)) )
))
(declare-fun call!47656 () ListLongMap!15845)

(declare-fun call!47655 () ListLongMap!15845)

(assert (=> b!1126738 (= e!641332 (= call!47656 call!47655))))

(declare-fun b!1126739 () Bool)

(declare-fun res!752933 () Bool)

(declare-fun e!641335 () Bool)

(assert (=> b!1126739 (=> (not res!752933) (not e!641335))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126739 (= res!752933 (validKeyInArray!0 k!934))))

(declare-fun zeroValue!944 () V!42889)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47652 () Bool)

(declare-datatypes ((array!73503 0))(
  ( (array!73504 (arr!35404 (Array (_ BitVec 32) (_ BitVec 64))) (size!35940 (_ BitVec 32))) )
))
(declare-fun lt!500342 () array!73503)

(declare-fun minValue!944 () V!42889)

(declare-datatypes ((ValueCell!13451 0))(
  ( (ValueCellFull!13451 (v!16850 V!42889)) (EmptyCell!13451) )
))
(declare-datatypes ((array!73505 0))(
  ( (array!73506 (arr!35405 (Array (_ BitVec 32) ValueCell!13451)) (size!35941 (_ BitVec 32))) )
))
(declare-fun lt!500341 () array!73505)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4426 (array!73503 array!73505 (_ BitVec 32) (_ BitVec 32) V!42889 V!42889 (_ BitVec 32) Int) ListLongMap!15845)

(assert (=> bm!47652 (= call!47656 (getCurrentListMapNoExtraKeys!4426 lt!500342 lt!500341 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126740 () Bool)

(declare-fun e!641337 () Bool)

(declare-fun e!641329 () Bool)

(assert (=> b!1126740 (= e!641337 e!641329)))

(declare-fun res!752935 () Bool)

(assert (=> b!1126740 (=> res!752935 e!641329)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126740 (= res!752935 (not (= from!1455 i!673)))))

(declare-fun lt!500336 () ListLongMap!15845)

(assert (=> b!1126740 (= lt!500336 (getCurrentListMapNoExtraKeys!4426 lt!500342 lt!500341 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73505)

(declare-fun dynLambda!2515 (Int (_ BitVec 64)) V!42889)

(assert (=> b!1126740 (= lt!500341 (array!73506 (store (arr!35405 _values!996) i!673 (ValueCellFull!13451 (dynLambda!2515 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35941 _values!996)))))

(declare-fun _keys!1208 () array!73503)

(declare-fun lt!500340 () ListLongMap!15845)

(assert (=> b!1126740 (= lt!500340 (getCurrentListMapNoExtraKeys!4426 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126741 () Bool)

(declare-fun e!641328 () Bool)

(declare-fun tp_is_empty!28321 () Bool)

(assert (=> b!1126741 (= e!641328 tp_is_empty!28321)))

(declare-fun b!1126742 () Bool)

(declare-fun e!641330 () Bool)

(declare-fun mapRes!44299 () Bool)

(assert (=> b!1126742 (= e!641330 (and e!641328 mapRes!44299))))

(declare-fun condMapEmpty!44299 () Bool)

(declare-fun mapDefault!44299 () ValueCell!13451)

