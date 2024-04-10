; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98208 () Bool)

(assert start!98208)

(declare-fun b_free!23909 () Bool)

(declare-fun b_next!23909 () Bool)

(assert (=> start!98208 (= b_free!23909 (not b_next!23909))))

(declare-fun tp!84430 () Bool)

(declare-fun b_and!38601 () Bool)

(assert (=> start!98208 (= tp!84430 b_and!38601)))

(declare-fun b!1130556 () Bool)

(declare-fun res!755376 () Bool)

(declare-fun e!643415 () Bool)

(assert (=> b!1130556 (=> (not res!755376) (not e!643415))))

(declare-datatypes ((array!73735 0))(
  ( (array!73736 (arr!35520 (Array (_ BitVec 32) (_ BitVec 64))) (size!36056 (_ BitVec 32))) )
))
(declare-fun lt!502056 () array!73735)

(declare-datatypes ((List!24750 0))(
  ( (Nil!24747) (Cons!24746 (h!25955 (_ BitVec 64)) (t!35651 List!24750)) )
))
(declare-fun arrayNoDuplicates!0 (array!73735 (_ BitVec 32) List!24750) Bool)

(assert (=> b!1130556 (= res!755376 (arrayNoDuplicates!0 lt!502056 #b00000000000000000000000000000000 Nil!24747))))

(declare-fun res!755375 () Bool)

(declare-fun e!643419 () Bool)

(assert (=> start!98208 (=> (not res!755375) (not e!643419))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!73735)

(assert (=> start!98208 (= res!755375 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36056 _keys!1208))))))

(assert (=> start!98208 e!643419))

(declare-fun tp_is_empty!28439 () Bool)

(assert (=> start!98208 tp_is_empty!28439))

(declare-fun array_inv!27250 (array!73735) Bool)

(assert (=> start!98208 (array_inv!27250 _keys!1208)))

(assert (=> start!98208 true))

(assert (=> start!98208 tp!84430))

(declare-datatypes ((V!43045 0))(
  ( (V!43046 (val!14276 Int)) )
))
(declare-datatypes ((ValueCell!13510 0))(
  ( (ValueCellFull!13510 (v!16909 V!43045)) (EmptyCell!13510) )
))
(declare-datatypes ((array!73737 0))(
  ( (array!73738 (arr!35521 (Array (_ BitVec 32) ValueCell!13510)) (size!36057 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73737)

(declare-fun e!643418 () Bool)

(declare-fun array_inv!27251 (array!73737) Bool)

(assert (=> start!98208 (and (array_inv!27251 _values!996) e!643418)))

(declare-fun b!1130557 () Bool)

(assert (=> b!1130557 (= e!643419 e!643415)))

(declare-fun res!755374 () Bool)

(assert (=> b!1130557 (=> (not res!755374) (not e!643415))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73735 (_ BitVec 32)) Bool)

(assert (=> b!1130557 (= res!755374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502056 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130557 (= lt!502056 (array!73736 (store (arr!35520 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36056 _keys!1208)))))

(declare-fun b!1130558 () Bool)

(declare-fun e!643409 () Bool)

(declare-fun e!643414 () Bool)

(assert (=> b!1130558 (= e!643409 e!643414)))

(declare-fun res!755382 () Bool)

(assert (=> b!1130558 (=> res!755382 e!643414)))

(declare-datatypes ((tuple2!17986 0))(
  ( (tuple2!17987 (_1!9004 (_ BitVec 64)) (_2!9004 V!43045)) )
))
(declare-datatypes ((List!24751 0))(
  ( (Nil!24748) (Cons!24747 (h!25956 tuple2!17986) (t!35652 List!24751)) )
))
(declare-datatypes ((ListLongMap!15955 0))(
  ( (ListLongMap!15956 (toList!7993 List!24751)) )
))
(declare-fun lt!502059 () ListLongMap!15955)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6516 (ListLongMap!15955 (_ BitVec 64)) Bool)

(assert (=> b!1130558 (= res!755382 (not (contains!6516 lt!502059 k!934)))))

(declare-fun zeroValue!944 () V!43045)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43045)

(declare-fun getCurrentListMapNoExtraKeys!4480 (array!73735 array!73737 (_ BitVec 32) (_ BitVec 32) V!43045 V!43045 (_ BitVec 32) Int) ListLongMap!15955)

(assert (=> b!1130558 (= lt!502059 (getCurrentListMapNoExtraKeys!4480 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130559 () Bool)

(declare-fun e!643417 () Bool)

(assert (=> b!1130559 (= e!643415 (not e!643417))))

(declare-fun res!755369 () Bool)

(assert (=> b!1130559 (=> res!755369 e!643417)))

(assert (=> b!1130559 (= res!755369 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130559 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37037 0))(
  ( (Unit!37038) )
))
(declare-fun lt!502067 () Unit!37037)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73735 (_ BitVec 64) (_ BitVec 32)) Unit!37037)

(assert (=> b!1130559 (= lt!502067 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1130560 () Bool)

(declare-fun c!110041 () Bool)

(declare-fun lt!502065 () Bool)

(assert (=> b!1130560 (= c!110041 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502065))))

(declare-fun e!643416 () Unit!37037)

(declare-fun e!643422 () Unit!37037)

(assert (=> b!1130560 (= e!643416 e!643422)))

(declare-fun b!1130561 () Bool)

(declare-fun e!643421 () Bool)

(declare-fun call!48384 () ListLongMap!15955)

(declare-fun call!48381 () ListLongMap!15955)

(assert (=> b!1130561 (= e!643421 (= call!48384 call!48381))))

(declare-fun b!1130562 () Bool)

(declare-fun res!755373 () Bool)

(assert (=> b!1130562 (=> (not res!755373) (not e!643419))))

(assert (=> b!1130562 (= res!755373 (= (select (arr!35520 _keys!1208) i!673) k!934))))

(declare-fun b!1130563 () Bool)

(declare-fun call!48388 () Bool)

(assert (=> b!1130563 call!48388))

(declare-fun lt!502058 () Unit!37037)

(declare-fun call!48385 () Unit!37037)

(assert (=> b!1130563 (= lt!502058 call!48385)))

(assert (=> b!1130563 (= e!643416 lt!502058)))

(declare-fun b!1130564 () Bool)

(declare-fun -!1172 (ListLongMap!15955 (_ BitVec 64)) ListLongMap!15955)

(assert (=> b!1130564 (= e!643421 (= call!48384 (-!1172 call!48381 k!934)))))

(declare-fun bm!48378 () Bool)

(assert (=> bm!48378 (= call!48381 (getCurrentListMapNoExtraKeys!4480 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130565 () Bool)

(declare-fun e!643410 () Bool)

(assert (=> b!1130565 (= e!643414 e!643410)))

(declare-fun res!755379 () Bool)

(assert (=> b!1130565 (=> res!755379 e!643410)))

(assert (=> b!1130565 (= res!755379 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36056 _keys!1208))))))

(declare-fun lt!502053 () Unit!37037)

(declare-fun e!643413 () Unit!37037)

(assert (=> b!1130565 (= lt!502053 e!643413)))

(declare-fun c!110042 () Bool)

(assert (=> b!1130565 (= c!110042 (and (not lt!502065) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130565 (= lt!502065 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1130566 () Bool)

(declare-fun res!755377 () Bool)

(assert (=> b!1130566 (=> (not res!755377) (not e!643419))))

(assert (=> b!1130566 (= res!755377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130567 () Bool)

(assert (=> b!1130567 (= e!643413 e!643416)))

(declare-fun c!110043 () Bool)

(assert (=> b!1130567 (= c!110043 (and (not lt!502065) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!48379 () Bool)

(declare-fun call!48383 () Bool)

(assert (=> bm!48379 (= call!48388 call!48383)))

(declare-fun b!1130568 () Bool)

(assert (=> b!1130568 (= e!643410 true)))

(declare-fun lt!502064 () Bool)

(declare-fun getCurrentListMap!4426 (array!73735 array!73737 (_ BitVec 32) (_ BitVec 32) V!43045 V!43045 (_ BitVec 32) Int) ListLongMap!15955)

(assert (=> b!1130568 (= lt!502064 (contains!6516 (getCurrentListMap!4426 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1130569 () Bool)

(declare-fun res!755378 () Bool)

(assert (=> b!1130569 (=> (not res!755378) (not e!643419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130569 (= res!755378 (validMask!0 mask!1564))))

(declare-fun b!1130570 () Bool)

(declare-fun Unit!37039 () Unit!37037)

(assert (=> b!1130570 (= e!643422 Unit!37039)))

(declare-fun b!1130571 () Bool)

(declare-fun e!643408 () Bool)

(assert (=> b!1130571 (= e!643408 tp_is_empty!28439)))

(declare-fun mapIsEmpty!44476 () Bool)

(declare-fun mapRes!44476 () Bool)

(assert (=> mapIsEmpty!44476 mapRes!44476))

(declare-fun b!1130572 () Bool)

(declare-fun e!643411 () Bool)

(assert (=> b!1130572 (= e!643418 (and e!643411 mapRes!44476))))

(declare-fun condMapEmpty!44476 () Bool)

(declare-fun mapDefault!44476 () ValueCell!13510)

