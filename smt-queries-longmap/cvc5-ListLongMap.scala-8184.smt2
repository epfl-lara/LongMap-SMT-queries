; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99970 () Bool)

(assert start!99970)

(declare-fun b_free!25549 () Bool)

(declare-fun b_next!25549 () Bool)

(assert (=> start!99970 (= b_free!25549 (not b_next!25549))))

(declare-fun tp!89361 () Bool)

(declare-fun b_and!41965 () Bool)

(assert (=> start!99970 (= tp!89361 b_and!41965)))

(declare-fun b!1190575 () Bool)

(declare-fun e!676831 () Bool)

(assert (=> b!1190575 (= e!676831 true)))

(declare-datatypes ((V!45233 0))(
  ( (V!45234 (val!15096 Int)) )
))
(declare-fun zeroValue!944 () V!45233)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14330 0))(
  ( (ValueCellFull!14330 (v!17734 V!45233)) (EmptyCell!14330) )
))
(declare-datatypes ((array!76949 0))(
  ( (array!76950 (arr!37124 (Array (_ BitVec 32) ValueCell!14330)) (size!37660 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76949)

(declare-fun lt!541505 () array!76949)

(declare-fun minValue!944 () V!45233)

(declare-datatypes ((array!76951 0))(
  ( (array!76952 (arr!37125 (Array (_ BitVec 32) (_ BitVec 64))) (size!37661 (_ BitVec 32))) )
))
(declare-fun lt!541503 () array!76951)

(declare-fun _keys!1208 () array!76951)

(declare-datatypes ((tuple2!19392 0))(
  ( (tuple2!19393 (_1!9707 (_ BitVec 64)) (_2!9707 V!45233)) )
))
(declare-datatypes ((List!26139 0))(
  ( (Nil!26136) (Cons!26135 (h!27344 tuple2!19392) (t!38680 List!26139)) )
))
(declare-datatypes ((ListLongMap!17361 0))(
  ( (ListLongMap!17362 (toList!8696 List!26139)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5137 (array!76951 array!76949 (_ BitVec 32) (_ BitVec 32) V!45233 V!45233 (_ BitVec 32) Int) ListLongMap!17361)

(declare-fun -!1723 (ListLongMap!17361 (_ BitVec 64)) ListLongMap!17361)

(assert (=> b!1190575 (= (getCurrentListMapNoExtraKeys!5137 lt!541503 lt!541505 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1723 (getCurrentListMapNoExtraKeys!5137 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39490 0))(
  ( (Unit!39491) )
))
(declare-fun lt!541502 () Unit!39490)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!932 (array!76951 array!76949 (_ BitVec 32) (_ BitVec 32) V!45233 V!45233 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39490)

(assert (=> b!1190575 (= lt!541502 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!932 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190576 () Bool)

(declare-fun e!676832 () Bool)

(declare-fun e!676830 () Bool)

(assert (=> b!1190576 (= e!676832 (not e!676830))))

(declare-fun res!791825 () Bool)

(assert (=> b!1190576 (=> res!791825 e!676830)))

(assert (=> b!1190576 (= res!791825 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190576 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!541506 () Unit!39490)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76951 (_ BitVec 64) (_ BitVec 32)) Unit!39490)

(assert (=> b!1190576 (= lt!541506 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1190577 () Bool)

(declare-fun e!676828 () Bool)

(declare-fun e!676834 () Bool)

(declare-fun mapRes!46946 () Bool)

(assert (=> b!1190577 (= e!676828 (and e!676834 mapRes!46946))))

(declare-fun condMapEmpty!46946 () Bool)

(declare-fun mapDefault!46946 () ValueCell!14330)

