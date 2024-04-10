; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99092 () Bool)

(assert start!99092)

(declare-fun b_free!24697 () Bool)

(declare-fun b_next!24697 () Bool)

(assert (=> start!99092 (= b_free!24697 (not b_next!24697))))

(declare-fun tp!86802 () Bool)

(declare-fun b_and!40243 () Bool)

(assert (=> start!99092 (= tp!86802 b_and!40243)))

(declare-fun b!1165458 () Bool)

(declare-fun e!662552 () Bool)

(declare-fun e!662551 () Bool)

(assert (=> b!1165458 (= e!662552 (not e!662551))))

(declare-fun res!772945 () Bool)

(assert (=> b!1165458 (=> res!772945 e!662551)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165458 (= res!772945 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75285 0))(
  ( (array!75286 (arr!36293 (Array (_ BitVec 32) (_ BitVec 64))) (size!36829 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75285)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165458 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38458 0))(
  ( (Unit!38459) )
))
(declare-fun lt!524919 () Unit!38458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75285 (_ BitVec 64) (_ BitVec 32)) Unit!38458)

(assert (=> b!1165458 (= lt!524919 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1165459 () Bool)

(declare-fun e!662550 () Bool)

(assert (=> b!1165459 (= e!662550 e!662552)))

(declare-fun res!772955 () Bool)

(assert (=> b!1165459 (=> (not res!772955) (not e!662552))))

(declare-fun lt!524917 () array!75285)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75285 (_ BitVec 32)) Bool)

(assert (=> b!1165459 (= res!772955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524917 mask!1564))))

(assert (=> b!1165459 (= lt!524917 (array!75286 (store (arr!36293 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36829 _keys!1208)))))

(declare-fun b!1165460 () Bool)

(declare-fun e!662548 () Bool)

(declare-fun tp_is_empty!29227 () Bool)

(assert (=> b!1165460 (= e!662548 tp_is_empty!29227)))

(declare-fun mapNonEmpty!45665 () Bool)

(declare-fun mapRes!45665 () Bool)

(declare-fun tp!86801 () Bool)

(assert (=> mapNonEmpty!45665 (= mapRes!45665 (and tp!86801 e!662548))))

(declare-fun mapKey!45665 () (_ BitVec 32))

(declare-datatypes ((V!44097 0))(
  ( (V!44098 (val!14670 Int)) )
))
(declare-datatypes ((ValueCell!13904 0))(
  ( (ValueCellFull!13904 (v!17307 V!44097)) (EmptyCell!13904) )
))
(declare-fun mapRest!45665 () (Array (_ BitVec 32) ValueCell!13904))

(declare-datatypes ((array!75287 0))(
  ( (array!75288 (arr!36294 (Array (_ BitVec 32) ValueCell!13904)) (size!36830 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75287)

(declare-fun mapValue!45665 () ValueCell!13904)

(assert (=> mapNonEmpty!45665 (= (arr!36294 _values!996) (store mapRest!45665 mapKey!45665 mapValue!45665))))

(declare-fun b!1165461 () Bool)

(declare-fun res!772949 () Bool)

(assert (=> b!1165461 (=> (not res!772949) (not e!662552))))

(declare-datatypes ((List!25443 0))(
  ( (Nil!25440) (Cons!25439 (h!26648 (_ BitVec 64)) (t!37132 List!25443)) )
))
(declare-fun arrayNoDuplicates!0 (array!75285 (_ BitVec 32) List!25443) Bool)

(assert (=> b!1165461 (= res!772949 (arrayNoDuplicates!0 lt!524917 #b00000000000000000000000000000000 Nil!25440))))

(declare-fun b!1165462 () Bool)

(declare-fun res!772954 () Bool)

(assert (=> b!1165462 (=> (not res!772954) (not e!662550))))

(assert (=> b!1165462 (= res!772954 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25440))))

(declare-fun b!1165464 () Bool)

(declare-fun res!772950 () Bool)

(assert (=> b!1165464 (=> (not res!772950) (not e!662550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165464 (= res!772950 (validKeyInArray!0 k!934))))

(declare-fun b!1165465 () Bool)

(declare-fun res!772948 () Bool)

(assert (=> b!1165465 (=> (not res!772948) (not e!662550))))

(assert (=> b!1165465 (= res!772948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165466 () Bool)

(declare-fun res!772946 () Bool)

(assert (=> b!1165466 (=> (not res!772946) (not e!662550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165466 (= res!772946 (validMask!0 mask!1564))))

(declare-fun b!1165467 () Bool)

(declare-fun res!772951 () Bool)

(assert (=> b!1165467 (=> (not res!772951) (not e!662550))))

(assert (=> b!1165467 (= res!772951 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36829 _keys!1208))))))

(declare-fun mapIsEmpty!45665 () Bool)

(assert (=> mapIsEmpty!45665 mapRes!45665))

(declare-fun b!1165468 () Bool)

(declare-fun e!662547 () Bool)

(assert (=> b!1165468 (= e!662547 tp_is_empty!29227)))

(declare-fun b!1165469 () Bool)

(declare-fun res!772952 () Bool)

(assert (=> b!1165469 (=> (not res!772952) (not e!662550))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1165469 (= res!772952 (and (= (size!36830 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36829 _keys!1208) (size!36830 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165470 () Bool)

(declare-fun e!662549 () Bool)

(assert (=> b!1165470 (= e!662549 (and e!662547 mapRes!45665))))

(declare-fun condMapEmpty!45665 () Bool)

(declare-fun mapDefault!45665 () ValueCell!13904)

