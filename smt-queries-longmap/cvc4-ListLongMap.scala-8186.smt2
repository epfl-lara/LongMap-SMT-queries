; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99986 () Bool)

(assert start!99986)

(declare-fun b_free!25565 () Bool)

(declare-fun b_next!25565 () Bool)

(assert (=> start!99986 (= b_free!25565 (not b_next!25565))))

(declare-fun tp!89409 () Bool)

(declare-fun b_and!41997 () Bool)

(assert (=> start!99986 (= tp!89409 b_and!41997)))

(declare-fun b!1190951 () Bool)

(declare-fun e!677021 () Bool)

(assert (=> b!1190951 (= e!677021 true)))

(declare-datatypes ((V!45253 0))(
  ( (V!45254 (val!15104 Int)) )
))
(declare-fun zeroValue!944 () V!45253)

(declare-datatypes ((ValueCell!14338 0))(
  ( (ValueCellFull!14338 (v!17742 V!45253)) (EmptyCell!14338) )
))
(declare-datatypes ((array!76981 0))(
  ( (array!76982 (arr!37140 (Array (_ BitVec 32) ValueCell!14338)) (size!37676 (_ BitVec 32))) )
))
(declare-fun lt!541645 () array!76981)

(declare-datatypes ((array!76983 0))(
  ( (array!76984 (arr!37141 (Array (_ BitVec 32) (_ BitVec 64))) (size!37677 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76983)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!541649 () array!76983)

(declare-fun _values!996 () array!76981)

(declare-fun minValue!944 () V!45253)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19408 0))(
  ( (tuple2!19409 (_1!9715 (_ BitVec 64)) (_2!9715 V!45253)) )
))
(declare-datatypes ((List!26153 0))(
  ( (Nil!26150) (Cons!26149 (h!27358 tuple2!19408) (t!38710 List!26153)) )
))
(declare-datatypes ((ListLongMap!17377 0))(
  ( (ListLongMap!17378 (toList!8704 List!26153)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5145 (array!76983 array!76981 (_ BitVec 32) (_ BitVec 32) V!45253 V!45253 (_ BitVec 32) Int) ListLongMap!17377)

(declare-fun -!1730 (ListLongMap!17377 (_ BitVec 64)) ListLongMap!17377)

(assert (=> b!1190951 (= (getCurrentListMapNoExtraKeys!5145 lt!541649 lt!541645 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1730 (getCurrentListMapNoExtraKeys!5145 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39506 0))(
  ( (Unit!39507) )
))
(declare-fun lt!541650 () Unit!39506)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!939 (array!76983 array!76981 (_ BitVec 32) (_ BitVec 32) V!45253 V!45253 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39506)

(assert (=> b!1190951 (= lt!541650 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!939 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190952 () Bool)

(declare-fun e!677019 () Bool)

(declare-fun e!677024 () Bool)

(assert (=> b!1190952 (= e!677019 e!677024)))

(declare-fun res!792104 () Bool)

(assert (=> b!1190952 (=> (not res!792104) (not e!677024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76983 (_ BitVec 32)) Bool)

(assert (=> b!1190952 (= res!792104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541649 mask!1564))))

(assert (=> b!1190952 (= lt!541649 (array!76984 (store (arr!37141 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37677 _keys!1208)))))

(declare-fun b!1190953 () Bool)

(declare-fun res!792112 () Bool)

(assert (=> b!1190953 (=> (not res!792112) (not e!677024))))

(declare-datatypes ((List!26154 0))(
  ( (Nil!26151) (Cons!26150 (h!27359 (_ BitVec 64)) (t!38711 List!26154)) )
))
(declare-fun arrayNoDuplicates!0 (array!76983 (_ BitVec 32) List!26154) Bool)

(assert (=> b!1190953 (= res!792112 (arrayNoDuplicates!0 lt!541649 #b00000000000000000000000000000000 Nil!26151))))

(declare-fun b!1190954 () Bool)

(declare-fun e!677023 () Bool)

(assert (=> b!1190954 (= e!677024 (not e!677023))))

(declare-fun res!792115 () Bool)

(assert (=> b!1190954 (=> res!792115 e!677023)))

(assert (=> b!1190954 (= res!792115 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190954 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!541647 () Unit!39506)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76983 (_ BitVec 64) (_ BitVec 32)) Unit!39506)

(assert (=> b!1190954 (= lt!541647 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1190955 () Bool)

(declare-fun res!792113 () Bool)

(assert (=> b!1190955 (=> (not res!792113) (not e!677019))))

(assert (=> b!1190955 (= res!792113 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26151))))

(declare-fun b!1190956 () Bool)

(declare-fun e!677026 () Bool)

(declare-fun e!677020 () Bool)

(declare-fun mapRes!46970 () Bool)

(assert (=> b!1190956 (= e!677026 (and e!677020 mapRes!46970))))

(declare-fun condMapEmpty!46970 () Bool)

(declare-fun mapDefault!46970 () ValueCell!14338)

