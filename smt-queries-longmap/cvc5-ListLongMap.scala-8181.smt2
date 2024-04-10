; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99952 () Bool)

(assert start!99952)

(declare-fun b_free!25531 () Bool)

(declare-fun b_next!25531 () Bool)

(assert (=> start!99952 (= b_free!25531 (not b_next!25531))))

(declare-fun tp!89306 () Bool)

(declare-fun b_and!41929 () Bool)

(assert (=> start!99952 (= tp!89306 b_and!41929)))

(declare-fun b!1190152 () Bool)

(declare-fun e!676616 () Bool)

(declare-fun e!676615 () Bool)

(assert (=> b!1190152 (= e!676616 (not e!676615))))

(declare-fun res!791501 () Bool)

(assert (=> b!1190152 (=> res!791501 e!676615)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190152 (= res!791501 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76913 0))(
  ( (array!76914 (arr!37106 (Array (_ BitVec 32) (_ BitVec 64))) (size!37642 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76913)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190152 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39472 0))(
  ( (Unit!39473) )
))
(declare-fun lt!541342 () Unit!39472)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76913 (_ BitVec 64) (_ BitVec 32)) Unit!39472)

(assert (=> b!1190152 (= lt!541342 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1190153 () Bool)

(declare-fun e!676617 () Bool)

(assert (=> b!1190153 (= e!676617 true)))

(declare-datatypes ((V!45209 0))(
  ( (V!45210 (val!15087 Int)) )
))
(declare-fun zeroValue!944 () V!45209)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541339 () array!76913)

(declare-datatypes ((ValueCell!14321 0))(
  ( (ValueCellFull!14321 (v!17725 V!45209)) (EmptyCell!14321) )
))
(declare-datatypes ((array!76915 0))(
  ( (array!76916 (arr!37107 (Array (_ BitVec 32) ValueCell!14321)) (size!37643 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76915)

(declare-fun minValue!944 () V!45209)

(declare-fun lt!541340 () array!76915)

(declare-datatypes ((tuple2!19376 0))(
  ( (tuple2!19377 (_1!9699 (_ BitVec 64)) (_2!9699 V!45209)) )
))
(declare-datatypes ((List!26123 0))(
  ( (Nil!26120) (Cons!26119 (h!27328 tuple2!19376) (t!38646 List!26123)) )
))
(declare-datatypes ((ListLongMap!17345 0))(
  ( (ListLongMap!17346 (toList!8688 List!26123)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5129 (array!76913 array!76915 (_ BitVec 32) (_ BitVec 32) V!45209 V!45209 (_ BitVec 32) Int) ListLongMap!17345)

(declare-fun -!1715 (ListLongMap!17345 (_ BitVec 64)) ListLongMap!17345)

(assert (=> b!1190153 (= (getCurrentListMapNoExtraKeys!5129 lt!541339 lt!541340 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1715 (getCurrentListMapNoExtraKeys!5129 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!541341 () Unit!39472)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!924 (array!76913 array!76915 (_ BitVec 32) (_ BitVec 32) V!45209 V!45209 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39472)

(assert (=> b!1190153 (= lt!541341 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!924 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190154 () Bool)

(declare-fun e!676618 () Bool)

(declare-fun e!676614 () Bool)

(declare-fun mapRes!46919 () Bool)

(assert (=> b!1190154 (= e!676618 (and e!676614 mapRes!46919))))

(declare-fun condMapEmpty!46919 () Bool)

(declare-fun mapDefault!46919 () ValueCell!14321)

