; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99854 () Bool)

(assert start!99854)

(declare-fun b_free!25433 () Bool)

(declare-fun b_next!25433 () Bool)

(assert (=> start!99854 (= b_free!25433 (not b_next!25433))))

(declare-fun tp!89013 () Bool)

(declare-fun b_and!41733 () Bool)

(assert (=> start!99854 (= tp!89013 b_and!41733)))

(declare-fun b!1187709 () Bool)

(declare-datatypes ((Unit!39392 0))(
  ( (Unit!39393) )
))
(declare-fun e!675330 () Unit!39392)

(declare-fun Unit!39394 () Unit!39392)

(assert (=> b!1187709 (= e!675330 Unit!39394)))

(declare-datatypes ((array!76721 0))(
  ( (array!76722 (arr!37010 (Array (_ BitVec 32) (_ BitVec 64))) (size!37546 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76721)

(declare-fun lt!540099 () Unit!39392)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76721 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39392)

(assert (=> b!1187709 (= lt!540099 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187709 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540104 () Unit!39392)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76721 (_ BitVec 32) (_ BitVec 32)) Unit!39392)

(assert (=> b!1187709 (= lt!540104 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26047 0))(
  ( (Nil!26044) (Cons!26043 (h!27252 (_ BitVec 64)) (t!38472 List!26047)) )
))
(declare-fun arrayNoDuplicates!0 (array!76721 (_ BitVec 32) List!26047) Bool)

(assert (=> b!1187709 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26044)))

(declare-fun lt!540097 () Unit!39392)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76721 (_ BitVec 64) (_ BitVec 32) List!26047) Unit!39392)

(assert (=> b!1187709 (= lt!540097 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26044))))

(assert (=> b!1187709 false))

(declare-fun b!1187710 () Bool)

(declare-fun res!789653 () Bool)

(declare-fun e!675332 () Bool)

(assert (=> b!1187710 (=> (not res!789653) (not e!675332))))

(assert (=> b!1187710 (= res!789653 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26044))))

(declare-fun b!1187711 () Bool)

(declare-fun e!675327 () Bool)

(assert (=> b!1187711 (= e!675327 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1187713 () Bool)

(declare-fun e!675334 () Bool)

(declare-fun e!675328 () Bool)

(declare-fun mapRes!46772 () Bool)

(assert (=> b!1187713 (= e!675334 (and e!675328 mapRes!46772))))

(declare-fun condMapEmpty!46772 () Bool)

(declare-datatypes ((V!45077 0))(
  ( (V!45078 (val!15038 Int)) )
))
(declare-datatypes ((ValueCell!14272 0))(
  ( (ValueCellFull!14272 (v!17676 V!45077)) (EmptyCell!14272) )
))
(declare-datatypes ((array!76723 0))(
  ( (array!76724 (arr!37011 (Array (_ BitVec 32) ValueCell!14272)) (size!37547 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76723)

(declare-fun mapDefault!46772 () ValueCell!14272)

