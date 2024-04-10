; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99434 () Bool)

(assert start!99434)

(declare-fun b_free!25013 () Bool)

(declare-fun b_next!25013 () Bool)

(assert (=> start!99434 (= b_free!25013 (not b_next!25013))))

(declare-fun tp!87753 () Bool)

(declare-fun b_and!40893 () Bool)

(assert (=> start!99434 (= tp!87753 b_and!40893)))

(declare-fun res!779858 () Bool)

(declare-fun e!667520 () Bool)

(assert (=> start!99434 (=> (not res!779858) (not e!667520))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75897 0))(
  ( (array!75898 (arr!36598 (Array (_ BitVec 32) (_ BitVec 64))) (size!37134 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75897)

(assert (=> start!99434 (= res!779858 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37134 _keys!1208))))))

(assert (=> start!99434 e!667520))

(declare-fun tp_is_empty!29543 () Bool)

(assert (=> start!99434 tp_is_empty!29543))

(declare-fun array_inv!27958 (array!75897) Bool)

(assert (=> start!99434 (array_inv!27958 _keys!1208)))

(assert (=> start!99434 true))

(assert (=> start!99434 tp!87753))

(declare-datatypes ((V!44517 0))(
  ( (V!44518 (val!14828 Int)) )
))
(declare-datatypes ((ValueCell!14062 0))(
  ( (ValueCellFull!14062 (v!17466 V!44517)) (EmptyCell!14062) )
))
(declare-datatypes ((array!75899 0))(
  ( (array!75900 (arr!36599 (Array (_ BitVec 32) ValueCell!14062)) (size!37135 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75899)

(declare-fun e!667517 () Bool)

(declare-fun array_inv!27959 (array!75899) Bool)

(assert (=> start!99434 (and (array_inv!27959 _values!996) e!667517)))

(declare-fun mapNonEmpty!46142 () Bool)

(declare-fun mapRes!46142 () Bool)

(declare-fun tp!87752 () Bool)

(declare-fun e!667521 () Bool)

(assert (=> mapNonEmpty!46142 (= mapRes!46142 (and tp!87752 e!667521))))

(declare-fun mapValue!46142 () ValueCell!14062)

(declare-fun mapKey!46142 () (_ BitVec 32))

(declare-fun mapRest!46142 () (Array (_ BitVec 32) ValueCell!14062))

(assert (=> mapNonEmpty!46142 (= (arr!36599 _values!996) (store mapRest!46142 mapKey!46142 mapValue!46142))))

(declare-fun b!1174347 () Bool)

(declare-datatypes ((Unit!38742 0))(
  ( (Unit!38743) )
))
(declare-fun e!667513 () Unit!38742)

(declare-fun Unit!38744 () Unit!38742)

(assert (=> b!1174347 (= e!667513 Unit!38744)))

(declare-fun lt!529551 () Unit!38742)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75897 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38742)

(assert (=> b!1174347 (= lt!529551 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174347 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529549 () Unit!38742)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75897 (_ BitVec 32) (_ BitVec 32)) Unit!38742)

(assert (=> b!1174347 (= lt!529549 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25692 0))(
  ( (Nil!25689) (Cons!25688 (h!26897 (_ BitVec 64)) (t!37697 List!25692)) )
))
(declare-fun arrayNoDuplicates!0 (array!75897 (_ BitVec 32) List!25692) Bool)

(assert (=> b!1174347 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25689)))

(declare-fun lt!529542 () Unit!38742)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75897 (_ BitVec 64) (_ BitVec 32) List!25692) Unit!38742)

(assert (=> b!1174347 (= lt!529542 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25689))))

(assert (=> b!1174347 false))

(declare-fun b!1174348 () Bool)

(declare-fun res!779862 () Bool)

(assert (=> b!1174348 (=> (not res!779862) (not e!667520))))

(assert (=> b!1174348 (= res!779862 (= (select (arr!36598 _keys!1208) i!673) k!934))))

(declare-fun b!1174349 () Bool)

(declare-fun e!667511 () Bool)

(declare-fun e!667518 () Bool)

(assert (=> b!1174349 (= e!667511 e!667518)))

(declare-fun res!779852 () Bool)

(assert (=> b!1174349 (=> res!779852 e!667518)))

(assert (=> b!1174349 (= res!779852 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44517)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!529554 () array!75899)

(declare-fun minValue!944 () V!44517)

(declare-datatypes ((tuple2!18954 0))(
  ( (tuple2!18955 (_1!9488 (_ BitVec 64)) (_2!9488 V!44517)) )
))
(declare-datatypes ((List!25693 0))(
  ( (Nil!25690) (Cons!25689 (h!26898 tuple2!18954) (t!37698 List!25693)) )
))
(declare-datatypes ((ListLongMap!16923 0))(
  ( (ListLongMap!16924 (toList!8477 List!25693)) )
))
(declare-fun lt!529546 () ListLongMap!16923)

(declare-fun lt!529547 () array!75897)

(declare-fun getCurrentListMapNoExtraKeys!4938 (array!75897 array!75899 (_ BitVec 32) (_ BitVec 32) V!44517 V!44517 (_ BitVec 32) Int) ListLongMap!16923)

(assert (=> b!1174349 (= lt!529546 (getCurrentListMapNoExtraKeys!4938 lt!529547 lt!529554 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529545 () V!44517)

(assert (=> b!1174349 (= lt!529554 (array!75900 (store (arr!36599 _values!996) i!673 (ValueCellFull!14062 lt!529545)) (size!37135 _values!996)))))

(declare-fun dynLambda!2906 (Int (_ BitVec 64)) V!44517)

(assert (=> b!1174349 (= lt!529545 (dynLambda!2906 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529543 () ListLongMap!16923)

(assert (=> b!1174349 (= lt!529543 (getCurrentListMapNoExtraKeys!4938 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174350 () Bool)

(declare-fun res!779861 () Bool)

(declare-fun e!667516 () Bool)

(assert (=> b!1174350 (=> (not res!779861) (not e!667516))))

(assert (=> b!1174350 (= res!779861 (arrayNoDuplicates!0 lt!529547 #b00000000000000000000000000000000 Nil!25689))))

(declare-fun b!1174351 () Bool)

(declare-fun res!779865 () Bool)

(assert (=> b!1174351 (=> (not res!779865) (not e!667520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75897 (_ BitVec 32)) Bool)

(assert (=> b!1174351 (= res!779865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174352 () Bool)

(declare-fun e!667514 () Bool)

(assert (=> b!1174352 (= e!667514 tp_is_empty!29543)))

(declare-fun b!1174353 () Bool)

(assert (=> b!1174353 (= e!667516 (not e!667511))))

(declare-fun res!779866 () Bool)

(assert (=> b!1174353 (=> res!779866 e!667511)))

(assert (=> b!1174353 (= res!779866 (bvsgt from!1455 i!673))))

(assert (=> b!1174353 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!529541 () Unit!38742)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75897 (_ BitVec 64) (_ BitVec 32)) Unit!38742)

(assert (=> b!1174353 (= lt!529541 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1174354 () Bool)

(declare-fun e!667522 () Bool)

(declare-fun e!667512 () Bool)

(assert (=> b!1174354 (= e!667522 e!667512)))

(declare-fun res!779854 () Bool)

(assert (=> b!1174354 (=> res!779854 e!667512)))

(assert (=> b!1174354 (= res!779854 (not (= (select (arr!36598 _keys!1208) from!1455) k!934)))))

(declare-fun b!1174355 () Bool)

(assert (=> b!1174355 (= e!667517 (and e!667514 mapRes!46142))))

(declare-fun condMapEmpty!46142 () Bool)

(declare-fun mapDefault!46142 () ValueCell!14062)

