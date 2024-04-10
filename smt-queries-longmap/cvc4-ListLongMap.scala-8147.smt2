; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99752 () Bool)

(assert start!99752)

(declare-fun b_free!25331 () Bool)

(declare-fun b_next!25331 () Bool)

(assert (=> start!99752 (= b_free!25331 (not b_next!25331))))

(declare-fun tp!88707 () Bool)

(declare-fun b_and!41529 () Bool)

(assert (=> start!99752 (= tp!88707 b_and!41529)))

(declare-fun b!1184547 () Bool)

(declare-fun res!787362 () Bool)

(declare-fun e!673496 () Bool)

(assert (=> b!1184547 (=> (not res!787362) (not e!673496))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184547 (= res!787362 (validKeyInArray!0 k!934))))

(declare-fun b!1184548 () Bool)

(declare-datatypes ((Unit!39223 0))(
  ( (Unit!39224) )
))
(declare-fun e!673493 () Unit!39223)

(declare-fun Unit!39225 () Unit!39223)

(assert (=> b!1184548 (= e!673493 Unit!39225)))

(declare-fun b!1184549 () Bool)

(declare-fun res!787356 () Bool)

(assert (=> b!1184549 (=> (not res!787356) (not e!673496))))

(declare-datatypes ((array!76521 0))(
  ( (array!76522 (arr!36910 (Array (_ BitVec 32) (_ BitVec 64))) (size!37446 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76521)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1184549 (= res!787356 (= (select (arr!36910 _keys!1208) i!673) k!934))))

(declare-fun b!1184550 () Bool)

(declare-fun res!787354 () Bool)

(assert (=> b!1184550 (=> (not res!787354) (not e!673496))))

(declare-datatypes ((List!25958 0))(
  ( (Nil!25955) (Cons!25954 (h!27163 (_ BitVec 64)) (t!38281 List!25958)) )
))
(declare-fun arrayNoDuplicates!0 (array!76521 (_ BitVec 32) List!25958) Bool)

(assert (=> b!1184550 (= res!787354 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25955))))

(declare-fun e!673491 () Bool)

(declare-fun b!1184551 () Bool)

(declare-fun arrayContainsKey!0 (array!76521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184551 (= e!673491 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1184552 () Bool)

(declare-fun res!787359 () Bool)

(assert (=> b!1184552 (=> (not res!787359) (not e!673496))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44941 0))(
  ( (V!44942 (val!14987 Int)) )
))
(declare-datatypes ((ValueCell!14221 0))(
  ( (ValueCellFull!14221 (v!17625 V!44941)) (EmptyCell!14221) )
))
(declare-datatypes ((array!76523 0))(
  ( (array!76524 (arr!36911 (Array (_ BitVec 32) ValueCell!14221)) (size!37447 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76523)

(assert (=> b!1184552 (= res!787359 (and (= (size!37447 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37446 _keys!1208) (size!37447 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184553 () Bool)

(declare-fun Unit!39226 () Unit!39223)

(assert (=> b!1184553 (= e!673493 Unit!39226)))

(declare-fun lt!537187 () Unit!39223)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76521 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39223)

(assert (=> b!1184553 (= lt!537187 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1184553 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537202 () Unit!39223)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76521 (_ BitVec 32) (_ BitVec 32)) Unit!39223)

(assert (=> b!1184553 (= lt!537202 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184553 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25955)))

(declare-fun lt!537186 () Unit!39223)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76521 (_ BitVec 64) (_ BitVec 32) List!25958) Unit!39223)

(assert (=> b!1184553 (= lt!537186 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25955))))

(assert (=> b!1184553 false))

(declare-fun b!1184554 () Bool)

(declare-fun e!673494 () Bool)

(assert (=> b!1184554 (= e!673496 e!673494)))

(declare-fun res!787351 () Bool)

(assert (=> b!1184554 (=> (not res!787351) (not e!673494))))

(declare-fun lt!537193 () array!76521)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76521 (_ BitVec 32)) Bool)

(assert (=> b!1184554 (= res!787351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537193 mask!1564))))

(assert (=> b!1184554 (= lt!537193 (array!76522 (store (arr!36910 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37446 _keys!1208)))))

(declare-fun b!1184555 () Bool)

(declare-fun res!787355 () Bool)

(assert (=> b!1184555 (=> (not res!787355) (not e!673494))))

(assert (=> b!1184555 (= res!787355 (arrayNoDuplicates!0 lt!537193 #b00000000000000000000000000000000 Nil!25955))))

(declare-fun mapIsEmpty!46619 () Bool)

(declare-fun mapRes!46619 () Bool)

(assert (=> mapIsEmpty!46619 mapRes!46619))

(declare-fun b!1184557 () Bool)

(declare-fun res!787361 () Bool)

(assert (=> b!1184557 (=> (not res!787361) (not e!673496))))

(assert (=> b!1184557 (= res!787361 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37446 _keys!1208))))))

(declare-fun b!1184558 () Bool)

(declare-fun res!787353 () Bool)

(assert (=> b!1184558 (=> (not res!787353) (not e!673496))))

(assert (=> b!1184558 (= res!787353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46619 () Bool)

(declare-fun tp!88706 () Bool)

(declare-fun e!673497 () Bool)

(assert (=> mapNonEmpty!46619 (= mapRes!46619 (and tp!88706 e!673497))))

(declare-fun mapKey!46619 () (_ BitVec 32))

(declare-fun mapRest!46619 () (Array (_ BitVec 32) ValueCell!14221))

(declare-fun mapValue!46619 () ValueCell!14221)

(assert (=> mapNonEmpty!46619 (= (arr!36911 _values!996) (store mapRest!46619 mapKey!46619 mapValue!46619))))

(declare-fun b!1184559 () Bool)

(declare-fun e!673492 () Bool)

(declare-fun e!673488 () Bool)

(assert (=> b!1184559 (= e!673492 (and e!673488 mapRes!46619))))

(declare-fun condMapEmpty!46619 () Bool)

(declare-fun mapDefault!46619 () ValueCell!14221)

