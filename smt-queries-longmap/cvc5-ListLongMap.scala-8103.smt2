; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99484 () Bool)

(assert start!99484)

(declare-fun b_free!25063 () Bool)

(declare-fun b_next!25063 () Bool)

(assert (=> start!99484 (= b_free!25063 (not b_next!25063))))

(declare-fun tp!87902 () Bool)

(declare-fun b_and!40993 () Bool)

(assert (=> start!99484 (= tp!87902 b_and!40993)))

(declare-fun b!1175897 () Bool)

(declare-fun res!780989 () Bool)

(declare-fun e!668421 () Bool)

(assert (=> b!1175897 (=> (not res!780989) (not e!668421))))

(declare-datatypes ((array!75993 0))(
  ( (array!75994 (arr!36646 (Array (_ BitVec 32) (_ BitVec 64))) (size!37182 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75993)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44585 0))(
  ( (V!44586 (val!14853 Int)) )
))
(declare-datatypes ((ValueCell!14087 0))(
  ( (ValueCellFull!14087 (v!17491 V!44585)) (EmptyCell!14087) )
))
(declare-datatypes ((array!75995 0))(
  ( (array!75996 (arr!36647 (Array (_ BitVec 32) ValueCell!14087)) (size!37183 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75995)

(assert (=> b!1175897 (= res!780989 (and (= (size!37183 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37182 _keys!1208) (size!37183 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175898 () Bool)

(declare-datatypes ((Unit!38809 0))(
  ( (Unit!38810) )
))
(declare-fun e!668411 () Unit!38809)

(declare-fun Unit!38811 () Unit!38809)

(assert (=> b!1175898 (= e!668411 Unit!38811)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!530600 () Unit!38809)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75993 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38809)

(assert (=> b!1175898 (= lt!530600 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175898 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530601 () Unit!38809)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75993 (_ BitVec 32) (_ BitVec 32)) Unit!38809)

(assert (=> b!1175898 (= lt!530601 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25730 0))(
  ( (Nil!25727) (Cons!25726 (h!26935 (_ BitVec 64)) (t!37785 List!25730)) )
))
(declare-fun arrayNoDuplicates!0 (array!75993 (_ BitVec 32) List!25730) Bool)

(assert (=> b!1175898 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25727)))

(declare-fun lt!530594 () Unit!38809)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75993 (_ BitVec 64) (_ BitVec 32) List!25730) Unit!38809)

(assert (=> b!1175898 (= lt!530594 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25727))))

(assert (=> b!1175898 false))

(declare-fun b!1175899 () Bool)

(declare-fun res!780984 () Bool)

(declare-fun e!668418 () Bool)

(assert (=> b!1175899 (=> (not res!780984) (not e!668418))))

(declare-fun lt!530595 () array!75993)

(assert (=> b!1175899 (= res!780984 (arrayNoDuplicates!0 lt!530595 #b00000000000000000000000000000000 Nil!25727))))

(declare-fun b!1175900 () Bool)

(declare-fun e!668416 () Bool)

(declare-fun e!668419 () Bool)

(declare-fun mapRes!46217 () Bool)

(assert (=> b!1175900 (= e!668416 (and e!668419 mapRes!46217))))

(declare-fun condMapEmpty!46217 () Bool)

(declare-fun mapDefault!46217 () ValueCell!14087)

