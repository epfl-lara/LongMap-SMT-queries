; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98178 () Bool)

(assert start!98178)

(declare-fun b_free!23879 () Bool)

(declare-fun b_next!23879 () Bool)

(assert (=> start!98178 (= b_free!23879 (not b_next!23879))))

(declare-fun tp!84340 () Bool)

(declare-fun b_and!38541 () Bool)

(assert (=> start!98178 (= tp!84340 b_and!38541)))

(declare-fun b!1129356 () Bool)

(declare-fun res!754698 () Bool)

(declare-fun e!642739 () Bool)

(assert (=> b!1129356 (=> (not res!754698) (not e!642739))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129356 (= res!754698 (validKeyInArray!0 k!934))))

(declare-fun b!1129357 () Bool)

(declare-datatypes ((V!43005 0))(
  ( (V!43006 (val!14261 Int)) )
))
(declare-datatypes ((tuple2!17956 0))(
  ( (tuple2!17957 (_1!8989 (_ BitVec 64)) (_2!8989 V!43005)) )
))
(declare-datatypes ((List!24723 0))(
  ( (Nil!24720) (Cons!24719 (h!25928 tuple2!17956) (t!35594 List!24723)) )
))
(declare-datatypes ((ListLongMap!15925 0))(
  ( (ListLongMap!15926 (toList!7978 List!24723)) )
))
(declare-fun call!48022 () ListLongMap!15925)

(declare-fun call!48027 () ListLongMap!15925)

(declare-fun e!642740 () Bool)

(declare-fun -!1159 (ListLongMap!15925 (_ BitVec 64)) ListLongMap!15925)

(assert (=> b!1129357 (= e!642740 (= call!48022 (-!1159 call!48027 k!934)))))

(declare-fun zeroValue!944 () V!43005)

(declare-fun c!109862 () Bool)

(declare-fun lt!501390 () ListLongMap!15925)

(declare-fun c!109861 () Bool)

(declare-fun bm!48018 () Bool)

(declare-datatypes ((Unit!36997 0))(
  ( (Unit!36998) )
))
(declare-fun call!48024 () Unit!36997)

(declare-fun minValue!944 () V!43005)

(declare-fun addStillContains!692 (ListLongMap!15925 (_ BitVec 64) V!43005 (_ BitVec 64)) Unit!36997)

(assert (=> bm!48018 (= call!48024 (addStillContains!692 lt!501390 (ite (or c!109862 c!109861) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!109862 c!109861) zeroValue!944 minValue!944) k!934))))

(declare-fun bm!48019 () Bool)

(declare-fun call!48028 () Bool)

(declare-fun call!48025 () Bool)

(assert (=> bm!48019 (= call!48028 call!48025)))

(declare-fun bm!48020 () Bool)

(declare-fun call!48021 () ListLongMap!15925)

(declare-fun lt!501386 () ListLongMap!15925)

(declare-fun contains!6501 (ListLongMap!15925 (_ BitVec 64)) Bool)

(assert (=> bm!48020 (= call!48025 (contains!6501 (ite c!109862 lt!501386 call!48021) k!934))))

(declare-fun b!1129358 () Bool)

(assert (=> b!1129358 call!48028))

(declare-fun lt!501380 () Unit!36997)

(declare-fun call!48026 () Unit!36997)

(assert (=> b!1129358 (= lt!501380 call!48026)))

(declare-fun e!642734 () Unit!36997)

(assert (=> b!1129358 (= e!642734 lt!501380)))

(declare-fun b!1129359 () Bool)

(declare-fun e!642747 () Bool)

(declare-fun e!642741 () Bool)

(assert (=> b!1129359 (= e!642747 e!642741)))

(declare-fun res!754703 () Bool)

(assert (=> b!1129359 (=> res!754703 e!642741)))

(assert (=> b!1129359 (= res!754703 (not (contains!6501 lt!501390 k!934)))))

(declare-datatypes ((array!73675 0))(
  ( (array!73676 (arr!35490 (Array (_ BitVec 32) (_ BitVec 64))) (size!36026 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73675)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13495 0))(
  ( (ValueCellFull!13495 (v!16894 V!43005)) (EmptyCell!13495) )
))
(declare-datatypes ((array!73677 0))(
  ( (array!73678 (arr!35491 (Array (_ BitVec 32) ValueCell!13495)) (size!36027 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73677)

(declare-fun getCurrentListMapNoExtraKeys!4465 (array!73675 array!73677 (_ BitVec 32) (_ BitVec 32) V!43005 V!43005 (_ BitVec 32) Int) ListLongMap!15925)

(assert (=> b!1129359 (= lt!501390 (getCurrentListMapNoExtraKeys!4465 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44431 () Bool)

(declare-fun mapRes!44431 () Bool)

(declare-fun tp!84341 () Bool)

(declare-fun e!642738 () Bool)

(assert (=> mapNonEmpty!44431 (= mapRes!44431 (and tp!84341 e!642738))))

(declare-fun mapKey!44431 () (_ BitVec 32))

(declare-fun mapValue!44431 () ValueCell!13495)

(declare-fun mapRest!44431 () (Array (_ BitVec 32) ValueCell!13495))

(assert (=> mapNonEmpty!44431 (= (arr!35491 _values!996) (store mapRest!44431 mapKey!44431 mapValue!44431))))

(declare-fun b!1129360 () Bool)

(assert (=> b!1129360 (= e!642740 (= call!48022 call!48027))))

(declare-fun bm!48021 () Bool)

(declare-fun lt!501389 () array!73675)

(declare-fun lt!501392 () array!73677)

(assert (=> bm!48021 (= call!48022 (getCurrentListMapNoExtraKeys!4465 lt!501389 lt!501392 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129361 () Bool)

(declare-fun e!642742 () Bool)

(assert (=> b!1129361 (= e!642742 e!642747)))

(declare-fun res!754697 () Bool)

(assert (=> b!1129361 (=> res!754697 e!642747)))

(assert (=> b!1129361 (= res!754697 (not (= (select (arr!35490 _keys!1208) from!1455) k!934)))))

(assert (=> b!1129361 e!642740))

(declare-fun c!109863 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129361 (= c!109863 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501385 () Unit!36997)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!411 (array!73675 array!73677 (_ BitVec 32) (_ BitVec 32) V!43005 V!43005 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36997)

(assert (=> b!1129361 (= lt!501385 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!411 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48022 () Bool)

(assert (=> bm!48022 (= call!48026 call!48024)))

(declare-fun b!1129362 () Bool)

(declare-fun res!754694 () Bool)

(assert (=> b!1129362 (=> (not res!754694) (not e!642739))))

(assert (=> b!1129362 (= res!754694 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36026 _keys!1208))))))

(declare-fun call!48023 () ListLongMap!15925)

(declare-fun bm!48023 () Bool)

(declare-fun +!3429 (ListLongMap!15925 tuple2!17956) ListLongMap!15925)

(assert (=> bm!48023 (= call!48023 (+!3429 lt!501390 (ite (or c!109862 c!109861) (tuple2!17957 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17957 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1129363 () Bool)

(declare-fun e!642743 () Unit!36997)

(assert (=> b!1129363 (= e!642743 e!642734)))

(declare-fun lt!501381 () Bool)

(assert (=> b!1129363 (= c!109861 (and (not lt!501381) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1129364 () Bool)

(declare-fun res!754699 () Bool)

(assert (=> b!1129364 (=> (not res!754699) (not e!642739))))

(assert (=> b!1129364 (= res!754699 (= (select (arr!35490 _keys!1208) i!673) k!934))))

(declare-fun b!1129365 () Bool)

(declare-fun tp_is_empty!28409 () Bool)

(assert (=> b!1129365 (= e!642738 tp_is_empty!28409)))

(declare-fun b!1129366 () Bool)

(declare-fun e!642733 () Bool)

(assert (=> b!1129366 (= e!642741 e!642733)))

(declare-fun res!754700 () Bool)

(assert (=> b!1129366 (=> res!754700 e!642733)))

(assert (=> b!1129366 (= res!754700 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36026 _keys!1208))))))

(declare-fun lt!501378 () Unit!36997)

(assert (=> b!1129366 (= lt!501378 e!642743)))

(assert (=> b!1129366 (= c!109862 (and (not lt!501381) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1129366 (= lt!501381 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1129367 () Bool)

(assert (=> b!1129367 (= e!642733 true)))

(declare-fun lt!501383 () Bool)

(declare-fun getCurrentListMap!4415 (array!73675 array!73677 (_ BitVec 32) (_ BitVec 32) V!43005 V!43005 (_ BitVec 32) Int) ListLongMap!15925)

(assert (=> b!1129367 (= lt!501383 (contains!6501 (getCurrentListMap!4415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1129368 () Bool)

(declare-fun res!754706 () Bool)

(assert (=> b!1129368 (=> (not res!754706) (not e!642739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129368 (= res!754706 (validMask!0 mask!1564))))

(declare-fun b!1129369 () Bool)

(declare-fun c!109860 () Bool)

(assert (=> b!1129369 (= c!109860 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501381))))

(declare-fun e!642745 () Unit!36997)

(assert (=> b!1129369 (= e!642734 e!642745)))

(declare-fun b!1129370 () Bool)

(declare-fun Unit!36999 () Unit!36997)

(assert (=> b!1129370 (= e!642745 Unit!36999)))

(declare-fun mapIsEmpty!44431 () Bool)

(assert (=> mapIsEmpty!44431 mapRes!44431))

(declare-fun b!1129371 () Bool)

(declare-fun e!642746 () Bool)

(assert (=> b!1129371 (= e!642746 tp_is_empty!28409)))

(declare-fun b!1129372 () Bool)

(declare-fun lt!501388 () Unit!36997)

(assert (=> b!1129372 (= e!642745 lt!501388)))

(assert (=> b!1129372 (= lt!501388 call!48026)))

(assert (=> b!1129372 call!48028))

(declare-fun b!1129373 () Bool)

(declare-fun res!754701 () Bool)

(declare-fun e!642735 () Bool)

(assert (=> b!1129373 (=> (not res!754701) (not e!642735))))

(declare-datatypes ((List!24724 0))(
  ( (Nil!24721) (Cons!24720 (h!25929 (_ BitVec 64)) (t!35595 List!24724)) )
))
(declare-fun arrayNoDuplicates!0 (array!73675 (_ BitVec 32) List!24724) Bool)

(assert (=> b!1129373 (= res!754701 (arrayNoDuplicates!0 lt!501389 #b00000000000000000000000000000000 Nil!24721))))

(declare-fun res!754707 () Bool)

(assert (=> start!98178 (=> (not res!754707) (not e!642739))))

(assert (=> start!98178 (= res!754707 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36026 _keys!1208))))))

(assert (=> start!98178 e!642739))

(assert (=> start!98178 tp_is_empty!28409))

(declare-fun array_inv!27226 (array!73675) Bool)

(assert (=> start!98178 (array_inv!27226 _keys!1208)))

(assert (=> start!98178 true))

(assert (=> start!98178 tp!84340))

(declare-fun e!642737 () Bool)

(declare-fun array_inv!27227 (array!73677) Bool)

(assert (=> start!98178 (and (array_inv!27227 _values!996) e!642737)))

(declare-fun b!1129374 () Bool)

(declare-fun res!754705 () Bool)

(assert (=> b!1129374 (=> (not res!754705) (not e!642739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73675 (_ BitVec 32)) Bool)

(assert (=> b!1129374 (= res!754705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129375 () Bool)

(declare-fun e!642744 () Bool)

(assert (=> b!1129375 (= e!642735 (not e!642744))))

(declare-fun res!754696 () Bool)

(assert (=> b!1129375 (=> res!754696 e!642744)))

(assert (=> b!1129375 (= res!754696 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129375 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!501384 () Unit!36997)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73675 (_ BitVec 64) (_ BitVec 32)) Unit!36997)

(assert (=> b!1129375 (= lt!501384 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!48024 () Bool)

(assert (=> bm!48024 (= call!48021 call!48023)))

(declare-fun b!1129376 () Bool)

(assert (=> b!1129376 (= e!642737 (and e!642746 mapRes!44431))))

(declare-fun condMapEmpty!44431 () Bool)

(declare-fun mapDefault!44431 () ValueCell!13495)

