; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98210 () Bool)

(assert start!98210)

(declare-fun b_free!23911 () Bool)

(declare-fun b_next!23911 () Bool)

(assert (=> start!98210 (= b_free!23911 (not b_next!23911))))

(declare-fun tp!84436 () Bool)

(declare-fun b_and!38605 () Bool)

(assert (=> start!98210 (= tp!84436 b_and!38605)))

(declare-fun mapIsEmpty!44479 () Bool)

(declare-fun mapRes!44479 () Bool)

(assert (=> mapIsEmpty!44479 mapRes!44479))

(declare-fun b!1130636 () Bool)

(declare-fun call!48407 () Bool)

(assert (=> b!1130636 call!48407))

(declare-datatypes ((Unit!37040 0))(
  ( (Unit!37041) )
))
(declare-fun lt!502100 () Unit!37040)

(declare-fun call!48405 () Unit!37040)

(assert (=> b!1130636 (= lt!502100 call!48405)))

(declare-fun e!643459 () Unit!37040)

(assert (=> b!1130636 (= e!643459 lt!502100)))

(declare-datatypes ((V!43049 0))(
  ( (V!43050 (val!14277 Int)) )
))
(declare-datatypes ((tuple2!17988 0))(
  ( (tuple2!17989 (_1!9005 (_ BitVec 64)) (_2!9005 V!43049)) )
))
(declare-datatypes ((List!24752 0))(
  ( (Nil!24749) (Cons!24748 (h!25957 tuple2!17988) (t!35655 List!24752)) )
))
(declare-datatypes ((ListLongMap!15957 0))(
  ( (ListLongMap!15958 (toList!7994 List!24752)) )
))
(declare-fun call!48406 () ListLongMap!15957)

(declare-fun call!48411 () ListLongMap!15957)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1130637 () Bool)

(declare-fun e!643455 () Bool)

(declare-fun -!1173 (ListLongMap!15957 (_ BitVec 64)) ListLongMap!15957)

(assert (=> b!1130637 (= e!643455 (= call!48406 (-!1173 call!48411 k!934)))))

(declare-fun b!1130638 () Bool)

(declare-fun e!643463 () Unit!37040)

(declare-fun lt!502106 () Unit!37040)

(assert (=> b!1130638 (= e!643463 lt!502106)))

(assert (=> b!1130638 (= lt!502106 call!48405)))

(assert (=> b!1130638 call!48407))

(declare-fun b!1130639 () Bool)

(declare-fun Unit!37042 () Unit!37040)

(assert (=> b!1130639 (= e!643463 Unit!37042)))

(declare-fun b!1130640 () Bool)

(declare-fun res!755419 () Bool)

(declare-fun e!643461 () Bool)

(assert (=> b!1130640 (=> (not res!755419) (not e!643461))))

(declare-datatypes ((array!73739 0))(
  ( (array!73740 (arr!35522 (Array (_ BitVec 32) (_ BitVec 64))) (size!36058 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73739)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130640 (= res!755419 (= (select (arr!35522 _keys!1208) i!673) k!934))))

(declare-fun b!1130642 () Bool)

(declare-fun e!643454 () Bool)

(declare-fun e!643464 () Bool)

(assert (=> b!1130642 (= e!643454 (not e!643464))))

(declare-fun res!755427 () Bool)

(assert (=> b!1130642 (=> res!755427 e!643464)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1130642 (= res!755427 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130642 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!502098 () Unit!37040)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73739 (_ BitVec 64) (_ BitVec 32)) Unit!37040)

(assert (=> b!1130642 (= lt!502098 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun zeroValue!944 () V!43049)

(declare-fun lt!502099 () array!73739)

(declare-fun bm!48402 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43049)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13511 0))(
  ( (ValueCellFull!13511 (v!16910 V!43049)) (EmptyCell!13511) )
))
(declare-datatypes ((array!73741 0))(
  ( (array!73742 (arr!35523 (Array (_ BitVec 32) ValueCell!13511)) (size!36059 (_ BitVec 32))) )
))
(declare-fun lt!502104 () array!73741)

(declare-fun getCurrentListMapNoExtraKeys!4481 (array!73739 array!73741 (_ BitVec 32) (_ BitVec 32) V!43049 V!43049 (_ BitVec 32) Int) ListLongMap!15957)

(assert (=> bm!48402 (= call!48406 (getCurrentListMapNoExtraKeys!4481 lt!502099 lt!502104 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130643 () Bool)

(declare-fun e!643460 () Bool)

(declare-fun e!643467 () Bool)

(assert (=> b!1130643 (= e!643460 e!643467)))

(declare-fun res!755418 () Bool)

(assert (=> b!1130643 (=> res!755418 e!643467)))

(declare-fun lt!502101 () ListLongMap!15957)

(declare-fun contains!6517 (ListLongMap!15957 (_ BitVec 64)) Bool)

(assert (=> b!1130643 (= res!755418 (not (contains!6517 lt!502101 k!934)))))

(declare-fun _values!996 () array!73741)

(assert (=> b!1130643 (= lt!502101 (getCurrentListMapNoExtraKeys!4481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130644 () Bool)

(declare-fun e!643462 () Bool)

(assert (=> b!1130644 (= e!643464 e!643462)))

(declare-fun res!755415 () Bool)

(assert (=> b!1130644 (=> res!755415 e!643462)))

(assert (=> b!1130644 (= res!755415 (not (= from!1455 i!673)))))

(declare-fun lt!502102 () ListLongMap!15957)

(assert (=> b!1130644 (= lt!502102 (getCurrentListMapNoExtraKeys!4481 lt!502099 lt!502104 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2556 (Int (_ BitVec 64)) V!43049)

(assert (=> b!1130644 (= lt!502104 (array!73742 (store (arr!35523 _values!996) i!673 (ValueCellFull!13511 (dynLambda!2556 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36059 _values!996)))))

(declare-fun lt!502110 () ListLongMap!15957)

(assert (=> b!1130644 (= lt!502110 (getCurrentListMapNoExtraKeys!4481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1130645 () Bool)

(declare-fun e!643458 () Bool)

(declare-fun tp_is_empty!28441 () Bool)

(assert (=> b!1130645 (= e!643458 tp_is_empty!28441)))

(declare-fun b!1130646 () Bool)

(declare-fun res!755423 () Bool)

(assert (=> b!1130646 (=> (not res!755423) (not e!643461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73739 (_ BitVec 32)) Bool)

(assert (=> b!1130646 (= res!755423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130647 () Bool)

(assert (=> b!1130647 (= e!643461 e!643454)))

(declare-fun res!755426 () Bool)

(assert (=> b!1130647 (=> (not res!755426) (not e!643454))))

(assert (=> b!1130647 (= res!755426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502099 mask!1564))))

(assert (=> b!1130647 (= lt!502099 (array!73740 (store (arr!35522 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36058 _keys!1208)))))

(declare-fun bm!48403 () Bool)

(declare-fun call!48412 () ListLongMap!15957)

(declare-fun call!48410 () ListLongMap!15957)

(assert (=> bm!48403 (= call!48412 call!48410)))

(declare-fun b!1130648 () Bool)

(declare-fun res!755425 () Bool)

(assert (=> b!1130648 (=> (not res!755425) (not e!643454))))

(declare-datatypes ((List!24753 0))(
  ( (Nil!24750) (Cons!24749 (h!25958 (_ BitVec 64)) (t!35656 List!24753)) )
))
(declare-fun arrayNoDuplicates!0 (array!73739 (_ BitVec 32) List!24753) Bool)

(assert (=> b!1130648 (= res!755425 (arrayNoDuplicates!0 lt!502099 #b00000000000000000000000000000000 Nil!24750))))

(declare-fun bm!48404 () Bool)

(assert (=> bm!48404 (= call!48411 (getCurrentListMapNoExtraKeys!4481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130649 () Bool)

(declare-fun e!643456 () Unit!37040)

(declare-fun lt!502112 () Unit!37040)

(assert (=> b!1130649 (= e!643456 lt!502112)))

(declare-fun lt!502105 () Unit!37040)

(declare-fun call!48409 () Unit!37040)

(assert (=> b!1130649 (= lt!502105 call!48409)))

(declare-fun lt!502103 () ListLongMap!15957)

(declare-fun +!3443 (ListLongMap!15957 tuple2!17988) ListLongMap!15957)

(assert (=> b!1130649 (= lt!502103 (+!3443 lt!502101 (tuple2!17989 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!48408 () Bool)

(assert (=> b!1130649 call!48408))

(declare-fun addStillContains!705 (ListLongMap!15957 (_ BitVec 64) V!43049 (_ BitVec 64)) Unit!37040)

(assert (=> b!1130649 (= lt!502112 (addStillContains!705 lt!502103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1130649 (contains!6517 call!48410 k!934)))

(declare-fun bm!48405 () Bool)

(declare-fun c!110055 () Bool)

(declare-fun c!110053 () Bool)

(assert (=> bm!48405 (= call!48409 (addStillContains!705 lt!502101 (ite (or c!110053 c!110055) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110053 c!110055) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1130650 () Bool)

(declare-fun e!643465 () Bool)

(assert (=> b!1130650 (= e!643465 tp_is_empty!28441)))

(declare-fun b!1130651 () Bool)

(assert (=> b!1130651 (= e!643456 e!643459)))

(declare-fun lt!502111 () Bool)

(assert (=> b!1130651 (= c!110055 (and (not lt!502111) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1130652 () Bool)

(declare-fun res!755424 () Bool)

(assert (=> b!1130652 (=> (not res!755424) (not e!643461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130652 (= res!755424 (validMask!0 mask!1564))))

(declare-fun b!1130641 () Bool)

(declare-fun e!643453 () Bool)

(assert (=> b!1130641 (= e!643453 (and e!643465 mapRes!44479))))

(declare-fun condMapEmpty!44479 () Bool)

(declare-fun mapDefault!44479 () ValueCell!13511)

