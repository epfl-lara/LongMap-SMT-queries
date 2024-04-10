; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98606 () Bool)

(assert start!98606)

(declare-fun b_free!24211 () Bool)

(declare-fun b_next!24211 () Bool)

(assert (=> start!98606 (= b_free!24211 (not b_next!24211))))

(declare-fun tp!85343 () Bool)

(declare-fun b_and!39271 () Bool)

(assert (=> start!98606 (= tp!85343 b_and!39271)))

(declare-fun b!1144718 () Bool)

(declare-datatypes ((Unit!37574 0))(
  ( (Unit!37575) )
))
(declare-fun e!651165 () Unit!37574)

(declare-fun Unit!37576 () Unit!37574)

(assert (=> b!1144718 (= e!651165 Unit!37576)))

(declare-fun lt!510854 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1144718 (= lt!510854 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112762 () Bool)

(assert (=> b!1144718 (= c!112762 (and (not lt!510854) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510850 () Unit!37574)

(declare-fun e!651179 () Unit!37574)

(assert (=> b!1144718 (= lt!510850 e!651179)))

(declare-datatypes ((V!43449 0))(
  ( (V!43450 (val!14427 Int)) )
))
(declare-fun zeroValue!944 () V!43449)

(declare-datatypes ((array!74333 0))(
  ( (array!74334 (arr!35817 (Array (_ BitVec 32) (_ BitVec 64))) (size!36353 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74333)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13661 0))(
  ( (ValueCellFull!13661 (v!17064 V!43449)) (EmptyCell!13661) )
))
(declare-datatypes ((array!74335 0))(
  ( (array!74336 (arr!35818 (Array (_ BitVec 32) ValueCell!13661)) (size!36354 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74335)

(declare-fun minValue!944 () V!43449)

(declare-fun lt!510853 () Unit!37574)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!410 (array!74333 array!74335 (_ BitVec 32) (_ BitVec 32) V!43449 V!43449 (_ BitVec 64) (_ BitVec 32) Int) Unit!37574)

(assert (=> b!1144718 (= lt!510853 (lemmaListMapContainsThenArrayContainsFrom!410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112759 () Bool)

(assert (=> b!1144718 (= c!112759 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762428 () Bool)

(declare-fun e!651172 () Bool)

(assert (=> b!1144718 (= res!762428 e!651172)))

(declare-fun e!651164 () Bool)

(assert (=> b!1144718 (=> (not res!762428) (not e!651164))))

(assert (=> b!1144718 e!651164))

(declare-fun lt!510855 () Unit!37574)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74333 (_ BitVec 32) (_ BitVec 32)) Unit!37574)

(assert (=> b!1144718 (= lt!510855 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25023 0))(
  ( (Nil!25020) (Cons!25019 (h!26228 (_ BitVec 64)) (t!36226 List!25023)) )
))
(declare-fun arrayNoDuplicates!0 (array!74333 (_ BitVec 32) List!25023) Bool)

(assert (=> b!1144718 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25020)))

(declare-fun lt!510858 () Unit!37574)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74333 (_ BitVec 64) (_ BitVec 32) List!25023) Unit!37574)

(assert (=> b!1144718 (= lt!510858 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25020))))

(assert (=> b!1144718 false))

(declare-fun b!1144719 () Bool)

(declare-fun e!651176 () Bool)

(declare-fun e!651173 () Bool)

(declare-fun mapRes!44936 () Bool)

(assert (=> b!1144719 (= e!651176 (and e!651173 mapRes!44936))))

(declare-fun condMapEmpty!44936 () Bool)

(declare-fun mapDefault!44936 () ValueCell!13661)

