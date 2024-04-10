; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99120 () Bool)

(assert start!99120)

(declare-fun b_free!24725 () Bool)

(declare-fun b_next!24725 () Bool)

(assert (=> start!99120 (= b_free!24725 (not b_next!24725))))

(declare-fun tp!86886 () Bool)

(declare-fun b_and!40299 () Bool)

(assert (=> start!99120 (= tp!86886 b_and!40299)))

(declare-fun mapNonEmpty!45707 () Bool)

(declare-fun mapRes!45707 () Bool)

(declare-fun tp!86885 () Bool)

(declare-fun e!662858 () Bool)

(assert (=> mapNonEmpty!45707 (= mapRes!45707 (and tp!86885 e!662858))))

(declare-fun mapKey!45707 () (_ BitVec 32))

(declare-datatypes ((V!44133 0))(
  ( (V!44134 (val!14684 Int)) )
))
(declare-datatypes ((ValueCell!13918 0))(
  ( (ValueCellFull!13918 (v!17321 V!44133)) (EmptyCell!13918) )
))
(declare-datatypes ((array!75341 0))(
  ( (array!75342 (arr!36321 (Array (_ BitVec 32) ValueCell!13918)) (size!36857 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75341)

(declare-fun mapValue!45707 () ValueCell!13918)

(declare-fun mapRest!45707 () (Array (_ BitVec 32) ValueCell!13918))

(assert (=> mapNonEmpty!45707 (= (arr!36321 _values!996) (store mapRest!45707 mapKey!45707 mapValue!45707))))

(declare-fun b!1166091 () Bool)

(declare-fun res!773424 () Bool)

(declare-fun e!662865 () Bool)

(assert (=> b!1166091 (=> (not res!773424) (not e!662865))))

(declare-datatypes ((array!75343 0))(
  ( (array!75344 (arr!36322 (Array (_ BitVec 32) (_ BitVec 64))) (size!36858 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75343)

(declare-datatypes ((List!25466 0))(
  ( (Nil!25463) (Cons!25462 (h!26671 (_ BitVec 64)) (t!37183 List!25466)) )
))
(declare-fun arrayNoDuplicates!0 (array!75343 (_ BitVec 32) List!25466) Bool)

(assert (=> b!1166091 (= res!773424 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25463))))

(declare-fun b!1166092 () Bool)

(declare-fun tp_is_empty!29255 () Bool)

(assert (=> b!1166092 (= e!662858 tp_is_empty!29255)))

(declare-fun b!1166093 () Bool)

(declare-fun e!662864 () Bool)

(assert (=> b!1166093 (= e!662865 e!662864)))

(declare-fun res!773435 () Bool)

(assert (=> b!1166093 (=> (not res!773435) (not e!662864))))

(declare-fun lt!525121 () array!75343)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75343 (_ BitVec 32)) Bool)

(assert (=> b!1166093 (= res!773435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525121 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166093 (= lt!525121 (array!75344 (store (arr!36322 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36858 _keys!1208)))))

(declare-fun b!1166094 () Bool)

(declare-fun e!662859 () Bool)

(assert (=> b!1166094 (= e!662864 (not e!662859))))

(declare-fun res!773426 () Bool)

(assert (=> b!1166094 (=> res!773426 e!662859)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1166094 (= res!773426 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166094 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38478 0))(
  ( (Unit!38479) )
))
(declare-fun lt!525120 () Unit!38478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75343 (_ BitVec 64) (_ BitVec 32)) Unit!38478)

(assert (=> b!1166094 (= lt!525120 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1166095 () Bool)

(declare-fun e!662861 () Bool)

(declare-fun e!662860 () Bool)

(assert (=> b!1166095 (= e!662861 (and e!662860 mapRes!45707))))

(declare-fun condMapEmpty!45707 () Bool)

(declare-fun mapDefault!45707 () ValueCell!13918)

