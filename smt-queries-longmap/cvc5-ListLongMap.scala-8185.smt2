; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99976 () Bool)

(assert start!99976)

(declare-fun b_free!25555 () Bool)

(declare-fun b_next!25555 () Bool)

(assert (=> start!99976 (= b_free!25555 (not b_next!25555))))

(declare-fun tp!89378 () Bool)

(declare-fun b_and!41977 () Bool)

(assert (=> start!99976 (= tp!89378 b_and!41977)))

(declare-fun b!1190716 () Bool)

(declare-fun res!791927 () Bool)

(declare-fun e!676905 () Bool)

(assert (=> b!1190716 (=> (not res!791927) (not e!676905))))

(declare-datatypes ((array!76961 0))(
  ( (array!76962 (arr!37130 (Array (_ BitVec 32) (_ BitVec 64))) (size!37666 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76961)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1190716 (= res!791927 (= (select (arr!37130 _keys!1208) i!673) k!934))))

(declare-fun b!1190717 () Bool)

(declare-fun e!676903 () Bool)

(declare-fun e!676902 () Bool)

(assert (=> b!1190717 (= e!676903 e!676902)))

(declare-fun res!791932 () Bool)

(assert (=> b!1190717 (=> res!791932 e!676902)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1190717 (= res!791932 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45241 0))(
  ( (V!45242 (val!15099 Int)) )
))
(declare-fun zeroValue!944 () V!45241)

(declare-datatypes ((ValueCell!14333 0))(
  ( (ValueCellFull!14333 (v!17737 V!45241)) (EmptyCell!14333) )
))
(declare-datatypes ((array!76963 0))(
  ( (array!76964 (arr!37131 (Array (_ BitVec 32) ValueCell!14333)) (size!37667 (_ BitVec 32))) )
))
(declare-fun lt!541557 () array!76963)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541559 () array!76961)

(declare-datatypes ((tuple2!19398 0))(
  ( (tuple2!19399 (_1!9710 (_ BitVec 64)) (_2!9710 V!45241)) )
))
(declare-datatypes ((List!26144 0))(
  ( (Nil!26141) (Cons!26140 (h!27349 tuple2!19398) (t!38691 List!26144)) )
))
(declare-datatypes ((ListLongMap!17367 0))(
  ( (ListLongMap!17368 (toList!8699 List!26144)) )
))
(declare-fun lt!541558 () ListLongMap!17367)

(declare-fun minValue!944 () V!45241)

(declare-fun getCurrentListMapNoExtraKeys!5140 (array!76961 array!76963 (_ BitVec 32) (_ BitVec 32) V!45241 V!45241 (_ BitVec 32) Int) ListLongMap!17367)

(assert (=> b!1190717 (= lt!541558 (getCurrentListMapNoExtraKeys!5140 lt!541559 lt!541557 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76963)

(declare-fun dynLambda!3078 (Int (_ BitVec 64)) V!45241)

(assert (=> b!1190717 (= lt!541557 (array!76964 (store (arr!37131 _values!996) i!673 (ValueCellFull!14333 (dynLambda!3078 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37667 _values!996)))))

(declare-fun lt!541560 () ListLongMap!17367)

(assert (=> b!1190717 (= lt!541560 (getCurrentListMapNoExtraKeys!5140 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190718 () Bool)

(declare-fun e!676900 () Bool)

(assert (=> b!1190718 (= e!676905 e!676900)))

(declare-fun res!791928 () Bool)

(assert (=> b!1190718 (=> (not res!791928) (not e!676900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76961 (_ BitVec 32)) Bool)

(assert (=> b!1190718 (= res!791928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541559 mask!1564))))

(assert (=> b!1190718 (= lt!541559 (array!76962 (store (arr!37130 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37666 _keys!1208)))))

(declare-fun b!1190719 () Bool)

(assert (=> b!1190719 (= e!676900 (not e!676903))))

(declare-fun res!791931 () Bool)

(assert (=> b!1190719 (=> res!791931 e!676903)))

(assert (=> b!1190719 (= res!791931 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190719 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39496 0))(
  ( (Unit!39497) )
))
(declare-fun lt!541556 () Unit!39496)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76961 (_ BitVec 64) (_ BitVec 32)) Unit!39496)

(assert (=> b!1190719 (= lt!541556 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1190720 () Bool)

(declare-fun e!676899 () Bool)

(declare-fun e!676901 () Bool)

(declare-fun mapRes!46955 () Bool)

(assert (=> b!1190720 (= e!676899 (and e!676901 mapRes!46955))))

(declare-fun condMapEmpty!46955 () Bool)

(declare-fun mapDefault!46955 () ValueCell!14333)

