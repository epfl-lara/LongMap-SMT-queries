; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99424 () Bool)

(assert start!99424)

(declare-fun b_free!25003 () Bool)

(declare-fun b_next!25003 () Bool)

(assert (=> start!99424 (= b_free!25003 (not b_next!25003))))

(declare-fun tp!87722 () Bool)

(declare-fun b_and!40873 () Bool)

(assert (=> start!99424 (= tp!87722 b_and!40873)))

(declare-fun b!1174037 () Bool)

(declare-datatypes ((Unit!38723 0))(
  ( (Unit!38724) )
))
(declare-fun e!667338 () Unit!38723)

(declare-fun Unit!38725 () Unit!38723)

(assert (=> b!1174037 (= e!667338 Unit!38725)))

(declare-datatypes ((array!75877 0))(
  ( (array!75878 (arr!36588 (Array (_ BitVec 32) (_ BitVec 64))) (size!37124 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75877)

(declare-fun lt!529331 () Unit!38723)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75877 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38723)

(assert (=> b!1174037 (= lt!529331 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174037 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529344 () Unit!38723)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75877 (_ BitVec 32) (_ BitVec 32)) Unit!38723)

(assert (=> b!1174037 (= lt!529344 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25684 0))(
  ( (Nil!25681) (Cons!25680 (h!26889 (_ BitVec 64)) (t!37679 List!25684)) )
))
(declare-fun arrayNoDuplicates!0 (array!75877 (_ BitVec 32) List!25684) Bool)

(assert (=> b!1174037 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25681)))

(declare-fun lt!529337 () Unit!38723)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75877 (_ BitVec 64) (_ BitVec 32) List!25684) Unit!38723)

(assert (=> b!1174037 (= lt!529337 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25681))))

(assert (=> b!1174037 false))

(declare-fun b!1174038 () Bool)

(declare-fun res!779632 () Bool)

(declare-fun e!667337 () Bool)

(assert (=> b!1174038 (=> (not res!779632) (not e!667337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174038 (= res!779632 (validKeyInArray!0 k!934))))

(declare-fun b!1174040 () Bool)

(declare-fun res!779641 () Bool)

(assert (=> b!1174040 (=> (not res!779641) (not e!667337))))

(assert (=> b!1174040 (= res!779641 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37124 _keys!1208))))))

(declare-fun b!1174041 () Bool)

(declare-fun e!667340 () Bool)

(declare-fun tp_is_empty!29533 () Bool)

(assert (=> b!1174041 (= e!667340 tp_is_empty!29533)))

(declare-fun b!1174042 () Bool)

(declare-fun Unit!38726 () Unit!38723)

(assert (=> b!1174042 (= e!667338 Unit!38726)))

(declare-fun b!1174043 () Bool)

(declare-fun res!779627 () Bool)

(assert (=> b!1174043 (=> (not res!779627) (not e!667337))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174043 (= res!779627 (validMask!0 mask!1564))))

(declare-fun b!1174044 () Bool)

(declare-fun e!667335 () Bool)

(declare-fun mapRes!46127 () Bool)

(assert (=> b!1174044 (= e!667335 (and e!667340 mapRes!46127))))

(declare-fun condMapEmpty!46127 () Bool)

(declare-datatypes ((V!44505 0))(
  ( (V!44506 (val!14823 Int)) )
))
(declare-datatypes ((ValueCell!14057 0))(
  ( (ValueCellFull!14057 (v!17461 V!44505)) (EmptyCell!14057) )
))
(declare-datatypes ((array!75879 0))(
  ( (array!75880 (arr!36589 (Array (_ BitVec 32) ValueCell!14057)) (size!37125 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75879)

(declare-fun mapDefault!46127 () ValueCell!14057)

