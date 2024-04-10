; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98562 () Bool)

(assert start!98562)

(declare-fun b_free!24167 () Bool)

(declare-fun b_next!24167 () Bool)

(assert (=> start!98562 (= b_free!24167 (not b_next!24167))))

(declare-fun tp!85212 () Bool)

(declare-fun b_and!39183 () Bool)

(assert (=> start!98562 (= tp!85212 b_and!39183)))

(declare-fun b!1142740 () Bool)

(declare-datatypes ((Unit!37491 0))(
  ( (Unit!37492) )
))
(declare-fun e!650094 () Unit!37491)

(declare-fun Unit!37493 () Unit!37491)

(assert (=> b!1142740 (= e!650094 Unit!37493)))

(declare-fun b!1142741 () Bool)

(declare-fun e!650102 () Bool)

(declare-fun e!650093 () Bool)

(assert (=> b!1142741 (= e!650102 e!650093)))

(declare-fun res!761472 () Bool)

(assert (=> b!1142741 (=> (not res!761472) (not e!650093))))

(declare-datatypes ((array!74247 0))(
  ( (array!74248 (arr!35774 (Array (_ BitVec 32) (_ BitVec 64))) (size!36310 (_ BitVec 32))) )
))
(declare-fun lt!509456 () array!74247)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74247 (_ BitVec 32)) Bool)

(assert (=> b!1142741 (= res!761472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509456 mask!1564))))

(declare-fun _keys!1208 () array!74247)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1142741 (= lt!509456 (array!74248 (store (arr!35774 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36310 _keys!1208)))))

(declare-fun b!1142742 () Bool)

(declare-fun res!761475 () Bool)

(assert (=> b!1142742 (=> (not res!761475) (not e!650102))))

(assert (=> b!1142742 (= res!761475 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36310 _keys!1208))))))

(declare-fun b!1142743 () Bool)

(declare-fun res!761480 () Bool)

(assert (=> b!1142743 (=> (not res!761480) (not e!650102))))

(assert (=> b!1142743 (= res!761480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!43389 0))(
  ( (V!43390 (val!14405 Int)) )
))
(declare-fun zeroValue!944 () V!43389)

(declare-datatypes ((tuple2!18230 0))(
  ( (tuple2!18231 (_1!9126 (_ BitVec 64)) (_2!9126 V!43389)) )
))
(declare-datatypes ((List!24984 0))(
  ( (Nil!24981) (Cons!24980 (h!26189 tuple2!18230) (t!36143 List!24984)) )
))
(declare-datatypes ((ListLongMap!16199 0))(
  ( (ListLongMap!16200 (toList!8115 List!24984)) )
))
(declare-fun call!51551 () ListLongMap!16199)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13639 0))(
  ( (ValueCellFull!13639 (v!17042 V!43389)) (EmptyCell!13639) )
))
(declare-datatypes ((array!74249 0))(
  ( (array!74250 (arr!35775 (Array (_ BitVec 32) ValueCell!13639)) (size!36311 (_ BitVec 32))) )
))
(declare-fun lt!509469 () array!74249)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43389)

(declare-fun bm!51543 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4595 (array!74247 array!74249 (_ BitVec 32) (_ BitVec 32) V!43389 V!43389 (_ BitVec 32) Int) ListLongMap!16199)

(assert (=> bm!51543 (= call!51551 (getCurrentListMapNoExtraKeys!4595 lt!509456 lt!509469 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142744 () Bool)

(declare-fun e!650098 () Bool)

(declare-fun call!51550 () ListLongMap!16199)

(assert (=> b!1142744 (= e!650098 (= call!51551 call!51550))))

(declare-fun b!1142745 () Bool)

(declare-fun res!761479 () Bool)

(assert (=> b!1142745 (=> (not res!761479) (not e!650102))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142745 (= res!761479 (validKeyInArray!0 k!934))))

(declare-fun b!1142746 () Bool)

(declare-fun e!650099 () Bool)

(declare-fun e!650088 () Bool)

(declare-fun mapRes!44870 () Bool)

(assert (=> b!1142746 (= e!650099 (and e!650088 mapRes!44870))))

(declare-fun condMapEmpty!44870 () Bool)

(declare-fun _values!996 () array!74249)

(declare-fun mapDefault!44870 () ValueCell!13639)

