; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98598 () Bool)

(assert start!98598)

(declare-fun b_free!24203 () Bool)

(declare-fun b_next!24203 () Bool)

(assert (=> start!98598 (= b_free!24203 (not b_next!24203))))

(declare-fun tp!85319 () Bool)

(declare-fun b_and!39255 () Bool)

(assert (=> start!98598 (= tp!85319 b_and!39255)))

(declare-fun b!1144350 () Bool)

(declare-datatypes ((Unit!37559 0))(
  ( (Unit!37560) )
))
(declare-fun e!650966 () Unit!37559)

(declare-fun Unit!37561 () Unit!37559)

(assert (=> b!1144350 (= e!650966 Unit!37561)))

(declare-fun lt!510589 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1144350 (= lt!510589 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112689 () Bool)

(assert (=> b!1144350 (= c!112689 (and (not lt!510589) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510604 () Unit!37559)

(declare-fun e!650972 () Unit!37559)

(assert (=> b!1144350 (= lt!510604 e!650972)))

(declare-datatypes ((V!43437 0))(
  ( (V!43438 (val!14423 Int)) )
))
(declare-fun zeroValue!944 () V!43437)

(declare-datatypes ((array!74319 0))(
  ( (array!74320 (arr!35810 (Array (_ BitVec 32) (_ BitVec 64))) (size!36346 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74319)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13657 0))(
  ( (ValueCellFull!13657 (v!17060 V!43437)) (EmptyCell!13657) )
))
(declare-datatypes ((array!74321 0))(
  ( (array!74322 (arr!35811 (Array (_ BitVec 32) ValueCell!13657)) (size!36347 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74321)

(declare-fun minValue!944 () V!43437)

(declare-fun lt!510594 () Unit!37559)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!407 (array!74319 array!74321 (_ BitVec 32) (_ BitVec 32) V!43437 V!43437 (_ BitVec 64) (_ BitVec 32) Int) Unit!37559)

(assert (=> b!1144350 (= lt!510594 (lemmaListMapContainsThenArrayContainsFrom!407 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112686 () Bool)

(assert (=> b!1144350 (= c!112686 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762239 () Bool)

(declare-fun e!650969 () Bool)

(assert (=> b!1144350 (= res!762239 e!650969)))

(declare-fun e!650970 () Bool)

(assert (=> b!1144350 (=> (not res!762239) (not e!650970))))

(assert (=> b!1144350 e!650970))

(declare-fun lt!510596 () Unit!37559)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74319 (_ BitVec 32) (_ BitVec 32)) Unit!37559)

(assert (=> b!1144350 (= lt!510596 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25018 0))(
  ( (Nil!25015) (Cons!25014 (h!26223 (_ BitVec 64)) (t!36213 List!25018)) )
))
(declare-fun arrayNoDuplicates!0 (array!74319 (_ BitVec 32) List!25018) Bool)

(assert (=> b!1144350 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25015)))

(declare-fun lt!510601 () Unit!37559)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74319 (_ BitVec 64) (_ BitVec 32) List!25018) Unit!37559)

(assert (=> b!1144350 (= lt!510601 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25015))))

(assert (=> b!1144350 false))

(declare-fun b!1144351 () Bool)

(declare-fun e!650968 () Bool)

(declare-fun e!650960 () Bool)

(declare-fun mapRes!44924 () Bool)

(assert (=> b!1144351 (= e!650968 (and e!650960 mapRes!44924))))

(declare-fun condMapEmpty!44924 () Bool)

(declare-fun mapDefault!44924 () ValueCell!13657)

