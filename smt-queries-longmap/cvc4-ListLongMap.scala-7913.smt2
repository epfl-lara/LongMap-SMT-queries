; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98226 () Bool)

(assert start!98226)

(declare-fun b_free!23927 () Bool)

(declare-fun b_next!23927 () Bool)

(assert (=> start!98226 (= b_free!23927 (not b_next!23927))))

(declare-fun tp!84485 () Bool)

(declare-fun b_and!38637 () Bool)

(assert (=> start!98226 (= tp!84485 b_and!38637)))

(declare-fun b!1131276 () Bool)

(declare-fun res!755775 () Bool)

(declare-fun e!643815 () Bool)

(assert (=> b!1131276 (=> (not res!755775) (not e!643815))))

(declare-datatypes ((array!73771 0))(
  ( (array!73772 (arr!35538 (Array (_ BitVec 32) (_ BitVec 64))) (size!36074 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73771)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73771 (_ BitVec 32)) Bool)

(assert (=> b!1131276 (= res!755775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1131277 () Bool)

(declare-fun e!643822 () Bool)

(declare-fun e!643827 () Bool)

(assert (=> b!1131277 (= e!643822 (not e!643827))))

(declare-fun res!755778 () Bool)

(assert (=> b!1131277 (=> res!755778 e!643827)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131277 (= res!755778 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1131277 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37060 0))(
  ( (Unit!37061) )
))
(declare-fun lt!502460 () Unit!37060)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73771 (_ BitVec 64) (_ BitVec 32)) Unit!37060)

(assert (=> b!1131277 (= lt!502460 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1131278 () Bool)

(declare-fun e!643824 () Bool)

(declare-fun e!643816 () Bool)

(assert (=> b!1131278 (= e!643824 e!643816)))

(declare-fun res!755786 () Bool)

(assert (=> b!1131278 (=> res!755786 e!643816)))

(declare-datatypes ((V!43069 0))(
  ( (V!43070 (val!14285 Int)) )
))
(declare-datatypes ((tuple2!18004 0))(
  ( (tuple2!18005 (_1!9013 (_ BitVec 64)) (_2!9013 V!43069)) )
))
(declare-datatypes ((List!24768 0))(
  ( (Nil!24765) (Cons!24764 (h!25973 tuple2!18004) (t!35687 List!24768)) )
))
(declare-datatypes ((ListLongMap!15973 0))(
  ( (ListLongMap!15974 (toList!8002 List!24768)) )
))
(declare-fun lt!502462 () ListLongMap!15973)

(declare-fun contains!6524 (ListLongMap!15973 (_ BitVec 64)) Bool)

(assert (=> b!1131278 (= res!755786 (not (contains!6524 lt!502462 k!934)))))

(declare-fun zeroValue!944 () V!43069)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!43069)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13519 0))(
  ( (ValueCellFull!13519 (v!16918 V!43069)) (EmptyCell!13519) )
))
(declare-datatypes ((array!73773 0))(
  ( (array!73774 (arr!35539 (Array (_ BitVec 32) ValueCell!13519)) (size!36075 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73773)

(declare-fun getCurrentListMapNoExtraKeys!4489 (array!73771 array!73773 (_ BitVec 32) (_ BitVec 32) V!43069 V!43069 (_ BitVec 32) Int) ListLongMap!15973)

(assert (=> b!1131278 (= lt!502462 (getCurrentListMapNoExtraKeys!4489 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48594 () Bool)

(declare-fun call!48597 () Bool)

(declare-fun call!48602 () Bool)

(assert (=> bm!48594 (= call!48597 call!48602)))

(declare-fun b!1131279 () Bool)

(declare-fun e!643817 () Bool)

(declare-fun e!643820 () Bool)

(declare-fun mapRes!44503 () Bool)

(assert (=> b!1131279 (= e!643817 (and e!643820 mapRes!44503))))

(declare-fun condMapEmpty!44503 () Bool)

(declare-fun mapDefault!44503 () ValueCell!13519)

