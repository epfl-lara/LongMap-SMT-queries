; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98816 () Bool)

(assert start!98816)

(declare-fun b_free!24421 () Bool)

(declare-fun b_next!24421 () Bool)

(assert (=> start!98816 (= b_free!24421 (not b_next!24421))))

(declare-fun tp!85973 () Bool)

(declare-fun b_and!39691 () Bool)

(assert (=> start!98816 (= tp!85973 b_and!39691)))

(declare-fun b!1154378 () Bool)

(declare-datatypes ((Unit!38000 0))(
  ( (Unit!38001) )
))
(declare-fun e!656519 () Unit!38000)

(declare-fun e!656524 () Unit!38000)

(assert (=> b!1154378 (= e!656519 e!656524)))

(declare-fun c!114651 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!517634 () Bool)

(assert (=> b!1154378 (= c!114651 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517634))))

(declare-datatypes ((array!74749 0))(
  ( (array!74750 (arr!36025 (Array (_ BitVec 32) (_ BitVec 64))) (size!36561 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74749)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!656530 () Bool)

(declare-fun b!1154379 () Bool)

(declare-fun arrayContainsKey!0 (array!74749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154379 (= e!656530 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154380 () Bool)

(declare-fun e!656528 () Bool)

(declare-fun tp_is_empty!28951 () Bool)

(assert (=> b!1154380 (= e!656528 tp_is_empty!28951)))

(declare-datatypes ((V!43729 0))(
  ( (V!43730 (val!14532 Int)) )
))
(declare-fun zeroValue!944 () V!43729)

(declare-fun bm!54591 () Bool)

(declare-datatypes ((tuple2!18472 0))(
  ( (tuple2!18473 (_1!9247 (_ BitVec 64)) (_2!9247 V!43729)) )
))
(declare-datatypes ((List!25216 0))(
  ( (Nil!25213) (Cons!25212 (h!26421 tuple2!18472) (t!36629 List!25216)) )
))
(declare-datatypes ((ListLongMap!16441 0))(
  ( (ListLongMap!16442 (toList!8236 List!25216)) )
))
(declare-fun call!54600 () ListLongMap!16441)

(declare-fun c!114648 () Bool)

(declare-fun minValue!944 () V!43729)

(declare-fun lt!517633 () ListLongMap!16441)

(declare-fun c!114650 () Bool)

(declare-fun +!3649 (ListLongMap!16441 tuple2!18472) ListLongMap!16441)

(assert (=> bm!54591 (= call!54600 (+!3649 lt!517633 (ite (or c!114650 c!114648) (tuple2!18473 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18473 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1154381 () Bool)

(declare-fun res!767148 () Bool)

(declare-fun e!656522 () Bool)

(assert (=> b!1154381 (=> (not res!767148) (not e!656522))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13766 0))(
  ( (ValueCellFull!13766 (v!17169 V!43729)) (EmptyCell!13766) )
))
(declare-datatypes ((array!74751 0))(
  ( (array!74752 (arr!36026 (Array (_ BitVec 32) ValueCell!13766)) (size!36562 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74751)

(assert (=> b!1154381 (= res!767148 (and (= (size!36562 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36561 _keys!1208) (size!36562 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1154382 () Bool)

(declare-fun res!767153 () Bool)

(assert (=> b!1154382 (=> (not res!767153) (not e!656522))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154382 (= res!767153 (= (select (arr!36025 _keys!1208) i!673) k!934))))

(declare-fun b!1154383 () Bool)

(declare-fun res!767152 () Bool)

(assert (=> b!1154383 (=> (not res!767152) (not e!656522))))

(declare-datatypes ((List!25217 0))(
  ( (Nil!25214) (Cons!25213 (h!26422 (_ BitVec 64)) (t!36630 List!25217)) )
))
(declare-fun arrayNoDuplicates!0 (array!74749 (_ BitVec 32) List!25217) Bool)

(assert (=> b!1154383 (= res!767152 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25214))))

(declare-fun e!656531 () Bool)

(declare-fun b!1154384 () Bool)

(assert (=> b!1154384 (= e!656531 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154385 () Bool)

(declare-fun e!656532 () Bool)

(assert (=> b!1154385 (= e!656532 true)))

(declare-fun e!656520 () Bool)

(assert (=> b!1154385 e!656520))

(declare-fun res!767142 () Bool)

(assert (=> b!1154385 (=> (not res!767142) (not e!656520))))

(declare-fun lt!517630 () ListLongMap!16441)

(assert (=> b!1154385 (= res!767142 (= lt!517630 lt!517633))))

(declare-fun lt!517644 () ListLongMap!16441)

(declare-fun -!1357 (ListLongMap!16441 (_ BitVec 64)) ListLongMap!16441)

(assert (=> b!1154385 (= lt!517630 (-!1357 lt!517644 k!934))))

(declare-fun lt!517636 () V!43729)

(assert (=> b!1154385 (= (-!1357 (+!3649 lt!517633 (tuple2!18473 (select (arr!36025 _keys!1208) from!1455) lt!517636)) (select (arr!36025 _keys!1208) from!1455)) lt!517633)))

(declare-fun lt!517643 () Unit!38000)

(declare-fun addThenRemoveForNewKeyIsSame!197 (ListLongMap!16441 (_ BitVec 64) V!43729) Unit!38000)

(assert (=> b!1154385 (= lt!517643 (addThenRemoveForNewKeyIsSame!197 lt!517633 (select (arr!36025 _keys!1208) from!1455) lt!517636))))

(declare-fun lt!517632 () V!43729)

(declare-fun get!18351 (ValueCell!13766 V!43729) V!43729)

(assert (=> b!1154385 (= lt!517636 (get!18351 (select (arr!36026 _values!996) from!1455) lt!517632))))

(declare-fun lt!517628 () Unit!38000)

(declare-fun e!656535 () Unit!38000)

(assert (=> b!1154385 (= lt!517628 e!656535)))

(declare-fun c!114647 () Bool)

(declare-fun contains!6749 (ListLongMap!16441 (_ BitVec 64)) Bool)

(assert (=> b!1154385 (= c!114647 (contains!6749 lt!517633 k!934))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4705 (array!74749 array!74751 (_ BitVec 32) (_ BitVec 32) V!43729 V!43729 (_ BitVec 32) Int) ListLongMap!16441)

(assert (=> b!1154385 (= lt!517633 (getCurrentListMapNoExtraKeys!4705 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54592 () Bool)

(declare-fun call!54595 () Unit!38000)

(declare-fun addStillContains!895 (ListLongMap!16441 (_ BitVec 64) V!43729 (_ BitVec 64)) Unit!38000)

(assert (=> bm!54592 (= call!54595 (addStillContains!895 lt!517633 (ite (or c!114650 c!114648) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114650 c!114648) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1154386 () Bool)

(declare-fun res!767145 () Bool)

(assert (=> b!1154386 (=> (not res!767145) (not e!656522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154386 (= res!767145 (validKeyInArray!0 k!934))))

(declare-fun b!1154387 () Bool)

(declare-fun res!767147 () Bool)

(declare-fun e!656523 () Bool)

(assert (=> b!1154387 (=> (not res!767147) (not e!656523))))

(declare-fun lt!517627 () array!74749)

(assert (=> b!1154387 (= res!767147 (arrayNoDuplicates!0 lt!517627 #b00000000000000000000000000000000 Nil!25214))))

(declare-fun bm!54593 () Bool)

(declare-fun call!54599 () Unit!38000)

(assert (=> bm!54593 (= call!54599 call!54595)))

(declare-fun b!1154388 () Bool)

(declare-fun lt!517629 () array!74751)

(assert (=> b!1154388 (= e!656520 (= lt!517630 (getCurrentListMapNoExtraKeys!4705 lt!517627 lt!517629 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1154389 () Bool)

(declare-fun e!656533 () Bool)

(assert (=> b!1154389 (= e!656523 (not e!656533))))

(declare-fun res!767146 () Bool)

(assert (=> b!1154389 (=> res!767146 e!656533)))

(assert (=> b!1154389 (= res!767146 (bvsgt from!1455 i!673))))

(assert (=> b!1154389 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!517638 () Unit!38000)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74749 (_ BitVec 64) (_ BitVec 32)) Unit!38000)

(assert (=> b!1154389 (= lt!517638 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1154390 () Bool)

(declare-fun e!656521 () Bool)

(assert (=> b!1154390 (= e!656533 e!656521)))

(declare-fun res!767151 () Bool)

(assert (=> b!1154390 (=> res!767151 e!656521)))

(assert (=> b!1154390 (= res!767151 (not (= from!1455 i!673)))))

(declare-fun lt!517647 () ListLongMap!16441)

(assert (=> b!1154390 (= lt!517647 (getCurrentListMapNoExtraKeys!4705 lt!517627 lt!517629 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1154390 (= lt!517629 (array!74752 (store (arr!36026 _values!996) i!673 (ValueCellFull!13766 lt!517632)) (size!36562 _values!996)))))

(declare-fun dynLambda!2718 (Int (_ BitVec 64)) V!43729)

(assert (=> b!1154390 (= lt!517632 (dynLambda!2718 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1154390 (= lt!517644 (getCurrentListMapNoExtraKeys!4705 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!54594 () Bool)

(declare-fun call!54598 () ListLongMap!16441)

(assert (=> bm!54594 (= call!54598 call!54600)))

(declare-fun b!1154391 () Bool)

(declare-fun call!54597 () Bool)

(assert (=> b!1154391 call!54597))

(declare-fun lt!517642 () Unit!38000)

(assert (=> b!1154391 (= lt!517642 call!54599)))

(assert (=> b!1154391 (= e!656524 lt!517642)))

(declare-fun b!1154392 () Bool)

(assert (=> b!1154392 (= c!114648 (and (not lt!517634) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!656534 () Unit!38000)

(assert (=> b!1154392 (= e!656534 e!656519)))

(declare-fun b!1154393 () Bool)

(declare-fun e!656527 () Bool)

(declare-fun e!656525 () Bool)

(declare-fun mapRes!45251 () Bool)

(assert (=> b!1154393 (= e!656527 (and e!656525 mapRes!45251))))

(declare-fun condMapEmpty!45251 () Bool)

(declare-fun mapDefault!45251 () ValueCell!13766)

