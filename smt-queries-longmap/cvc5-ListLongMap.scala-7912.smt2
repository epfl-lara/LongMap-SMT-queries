; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98216 () Bool)

(assert start!98216)

(declare-fun b_free!23917 () Bool)

(declare-fun b_next!23917 () Bool)

(assert (=> start!98216 (= b_free!23917 (not b_next!23917))))

(declare-fun tp!84454 () Bool)

(declare-fun b_and!38617 () Bool)

(assert (=> start!98216 (= tp!84454 b_and!38617)))

(declare-fun b!1130876 () Bool)

(declare-fun e!643601 () Bool)

(declare-fun e!643600 () Bool)

(assert (=> b!1130876 (= e!643601 e!643600)))

(declare-fun res!755556 () Bool)

(assert (=> b!1130876 (=> res!755556 e!643600)))

(declare-datatypes ((array!73751 0))(
  ( (array!73752 (arr!35528 (Array (_ BitVec 32) (_ BitVec 64))) (size!36064 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73751)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1130876 (= res!755556 (not (= (select (arr!35528 _keys!1208) from!1455) k!934)))))

(declare-fun e!643602 () Bool)

(assert (=> b!1130876 e!643602))

(declare-fun c!110089 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130876 (= c!110089 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43057 0))(
  ( (V!43058 (val!14280 Int)) )
))
(declare-fun zeroValue!944 () V!43057)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!37048 0))(
  ( (Unit!37049) )
))
(declare-fun lt!502246 () Unit!37048)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13514 0))(
  ( (ValueCellFull!13514 (v!16913 V!43057)) (EmptyCell!13514) )
))
(declare-datatypes ((array!73753 0))(
  ( (array!73754 (arr!35529 (Array (_ BitVec 32) ValueCell!13514)) (size!36065 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73753)

(declare-fun minValue!944 () V!43057)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!426 (array!73751 array!73753 (_ BitVec 32) (_ BitVec 32) V!43057 V!43057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37048)

(assert (=> b!1130876 (= lt!502246 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!426 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130877 () Bool)

(declare-fun e!643594 () Unit!37048)

(declare-fun lt!502244 () Unit!37048)

(assert (=> b!1130877 (= e!643594 lt!502244)))

(declare-fun call!48481 () Unit!37048)

(assert (=> b!1130877 (= lt!502244 call!48481)))

(declare-fun call!48483 () Bool)

(assert (=> b!1130877 call!48483))

(declare-fun b!1130878 () Bool)

(declare-fun res!755551 () Bool)

(declare-fun e!643593 () Bool)

(assert (=> b!1130878 (=> (not res!755551) (not e!643593))))

(declare-fun lt!502241 () array!73751)

(declare-datatypes ((List!24758 0))(
  ( (Nil!24755) (Cons!24754 (h!25963 (_ BitVec 64)) (t!35667 List!24758)) )
))
(declare-fun arrayNoDuplicates!0 (array!73751 (_ BitVec 32) List!24758) Bool)

(assert (=> b!1130878 (= res!755551 (arrayNoDuplicates!0 lt!502241 #b00000000000000000000000000000000 Nil!24755))))

(declare-fun bm!48474 () Bool)

(declare-datatypes ((tuple2!17994 0))(
  ( (tuple2!17995 (_1!9008 (_ BitVec 64)) (_2!9008 V!43057)) )
))
(declare-datatypes ((List!24759 0))(
  ( (Nil!24756) (Cons!24755 (h!25964 tuple2!17994) (t!35668 List!24759)) )
))
(declare-datatypes ((ListLongMap!15963 0))(
  ( (ListLongMap!15964 (toList!7997 List!24759)) )
))
(declare-fun call!48480 () ListLongMap!15963)

(declare-fun call!48478 () ListLongMap!15963)

(assert (=> bm!48474 (= call!48480 call!48478)))

(declare-fun b!1130879 () Bool)

(declare-fun e!643588 () Bool)

(assert (=> b!1130879 (= e!643600 e!643588)))

(declare-fun res!755550 () Bool)

(assert (=> b!1130879 (=> res!755550 e!643588)))

(declare-fun lt!502245 () ListLongMap!15963)

(declare-fun contains!6519 (ListLongMap!15963 (_ BitVec 64)) Bool)

(assert (=> b!1130879 (= res!755550 (not (contains!6519 lt!502245 k!934)))))

(declare-fun getCurrentListMapNoExtraKeys!4484 (array!73751 array!73753 (_ BitVec 32) (_ BitVec 32) V!43057 V!43057 (_ BitVec 32) Int) ListLongMap!15963)

(assert (=> b!1130879 (= lt!502245 (getCurrentListMapNoExtraKeys!4484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130880 () Bool)

(declare-fun res!755553 () Bool)

(declare-fun e!643599 () Bool)

(assert (=> b!1130880 (=> (not res!755553) (not e!643599))))

(assert (=> b!1130880 (= res!755553 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24755))))

(declare-fun call!48484 () ListLongMap!15963)

(declare-fun lt!502243 () array!73753)

(declare-fun bm!48475 () Bool)

(assert (=> bm!48475 (= call!48484 (getCurrentListMapNoExtraKeys!4484 lt!502241 lt!502243 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130882 () Bool)

(declare-fun e!643598 () Bool)

(declare-fun e!643590 () Bool)

(declare-fun mapRes!44488 () Bool)

(assert (=> b!1130882 (= e!643598 (and e!643590 mapRes!44488))))

(declare-fun condMapEmpty!44488 () Bool)

(declare-fun mapDefault!44488 () ValueCell!13514)

