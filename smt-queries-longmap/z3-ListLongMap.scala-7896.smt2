; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98122 () Bool)

(assert start!98122)

(declare-fun b_free!23823 () Bool)

(declare-fun b_next!23823 () Bool)

(assert (=> start!98122 (= b_free!23823 (not b_next!23823))))

(declare-fun tp!84173 () Bool)

(declare-fun b_and!38429 () Bool)

(assert (=> start!98122 (= tp!84173 b_and!38429)))

(declare-fun mapIsEmpty!44347 () Bool)

(declare-fun mapRes!44347 () Bool)

(assert (=> mapIsEmpty!44347 mapRes!44347))

(declare-fun b!1127644 () Bool)

(declare-fun res!753570 () Bool)

(declare-fun e!641809 () Bool)

(assert (=> b!1127644 (=> (not res!753570) (not e!641809))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127644 (= res!753570 (validKeyInArray!0 k0!934))))

(declare-fun b!1127645 () Bool)

(declare-fun e!641815 () Bool)

(declare-fun tp_is_empty!28353 () Bool)

(assert (=> b!1127645 (= e!641815 tp_is_empty!28353)))

(declare-fun b!1127646 () Bool)

(declare-fun res!753564 () Bool)

(assert (=> b!1127646 (=> (not res!753564) (not e!641809))))

(declare-datatypes ((array!73567 0))(
  ( (array!73568 (arr!35436 (Array (_ BitVec 32) (_ BitVec 64))) (size!35972 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73567)

(declare-datatypes ((List!24676 0))(
  ( (Nil!24673) (Cons!24672 (h!25881 (_ BitVec 64)) (t!35491 List!24676)) )
))
(declare-fun arrayNoDuplicates!0 (array!73567 (_ BitVec 32) List!24676) Bool)

(assert (=> b!1127646 (= res!753564 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24673))))

(declare-fun b!1127647 () Bool)

(declare-fun res!753565 () Bool)

(declare-fun e!641810 () Bool)

(assert (=> b!1127647 (=> (not res!753565) (not e!641810))))

(declare-fun lt!500667 () array!73567)

(assert (=> b!1127647 (= res!753565 (arrayNoDuplicates!0 lt!500667 #b00000000000000000000000000000000 Nil!24673))))

(declare-fun mapNonEmpty!44347 () Bool)

(declare-fun tp!84172 () Bool)

(declare-fun e!641813 () Bool)

(assert (=> mapNonEmpty!44347 (= mapRes!44347 (and tp!84172 e!641813))))

(declare-datatypes ((V!42931 0))(
  ( (V!42932 (val!14233 Int)) )
))
(declare-datatypes ((ValueCell!13467 0))(
  ( (ValueCellFull!13467 (v!16866 V!42931)) (EmptyCell!13467) )
))
(declare-fun mapValue!44347 () ValueCell!13467)

(declare-fun mapKey!44347 () (_ BitVec 32))

(declare-fun mapRest!44347 () (Array (_ BitVec 32) ValueCell!13467))

(declare-datatypes ((array!73569 0))(
  ( (array!73570 (arr!35437 (Array (_ BitVec 32) ValueCell!13467)) (size!35973 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73569)

(assert (=> mapNonEmpty!44347 (= (arr!35437 _values!996) (store mapRest!44347 mapKey!44347 mapValue!44347))))

(declare-datatypes ((tuple2!17904 0))(
  ( (tuple2!17905 (_1!8963 (_ BitVec 64)) (_2!8963 V!42931)) )
))
(declare-datatypes ((List!24677 0))(
  ( (Nil!24674) (Cons!24673 (h!25882 tuple2!17904) (t!35492 List!24677)) )
))
(declare-datatypes ((ListLongMap!15873 0))(
  ( (ListLongMap!15874 (toList!7952 List!24677)) )
))
(declare-fun call!47751 () ListLongMap!15873)

(declare-fun b!1127648 () Bool)

(declare-fun e!641812 () Bool)

(declare-fun call!47752 () ListLongMap!15873)

(declare-fun -!1140 (ListLongMap!15873 (_ BitVec 64)) ListLongMap!15873)

(assert (=> b!1127648 (= e!641812 (= call!47751 (-!1140 call!47752 k0!934)))))

(declare-fun b!1127649 () Bool)

(assert (=> b!1127649 (= e!641809 e!641810)))

(declare-fun res!753569 () Bool)

(assert (=> b!1127649 (=> (not res!753569) (not e!641810))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73567 (_ BitVec 32)) Bool)

(assert (=> b!1127649 (= res!753569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500667 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127649 (= lt!500667 (array!73568 (store (arr!35436 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35972 _keys!1208)))))

(declare-fun zeroValue!944 () V!42931)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47748 () Bool)

(declare-fun lt!500665 () array!73569)

(declare-fun minValue!944 () V!42931)

(declare-fun getCurrentListMapNoExtraKeys!4440 (array!73567 array!73569 (_ BitVec 32) (_ BitVec 32) V!42931 V!42931 (_ BitVec 32) Int) ListLongMap!15873)

(assert (=> bm!47748 (= call!47751 (getCurrentListMapNoExtraKeys!4440 lt!500667 lt!500665 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127650 () Bool)

(declare-fun res!753560 () Bool)

(assert (=> b!1127650 (=> (not res!753560) (not e!641809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127650 (= res!753560 (validMask!0 mask!1564))))

(declare-fun b!1127651 () Bool)

(declare-fun e!641808 () Bool)

(assert (=> b!1127651 (= e!641808 (and e!641815 mapRes!44347))))

(declare-fun condMapEmpty!44347 () Bool)

(declare-fun mapDefault!44347 () ValueCell!13467)

(assert (=> b!1127651 (= condMapEmpty!44347 (= (arr!35437 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13467)) mapDefault!44347)))))

(declare-fun b!1127652 () Bool)

(declare-fun e!641816 () Bool)

(assert (=> b!1127652 (= e!641810 (not e!641816))))

(declare-fun res!753562 () Bool)

(assert (=> b!1127652 (=> res!753562 e!641816)))

(assert (=> b!1127652 (= res!753562 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127652 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36950 0))(
  ( (Unit!36951) )
))
(declare-fun lt!500663 () Unit!36950)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73567 (_ BitVec 64) (_ BitVec 32)) Unit!36950)

(assert (=> b!1127652 (= lt!500663 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1127653 () Bool)

(assert (=> b!1127653 (= e!641813 tp_is_empty!28353)))

(declare-fun b!1127654 () Bool)

(declare-fun res!753563 () Bool)

(assert (=> b!1127654 (=> (not res!753563) (not e!641809))))

(assert (=> b!1127654 (= res!753563 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35972 _keys!1208))))))

(declare-fun b!1127655 () Bool)

(declare-fun e!641817 () Bool)

(declare-fun e!641811 () Bool)

(assert (=> b!1127655 (= e!641817 e!641811)))

(declare-fun res!753568 () Bool)

(assert (=> b!1127655 (=> res!753568 e!641811)))

(assert (=> b!1127655 (= res!753568 (not (= (select (arr!35436 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127655 e!641812))

(declare-fun c!109725 () Bool)

(assert (=> b!1127655 (= c!109725 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500669 () Unit!36950)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!395 (array!73567 array!73569 (_ BitVec 32) (_ BitVec 32) V!42931 V!42931 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36950)

(assert (=> b!1127655 (= lt!500669 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!395 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127656 () Bool)

(assert (=> b!1127656 (= e!641812 (= call!47751 call!47752))))

(declare-fun b!1127657 () Bool)

(declare-fun res!753567 () Bool)

(assert (=> b!1127657 (=> (not res!753567) (not e!641809))))

(assert (=> b!1127657 (= res!753567 (= (select (arr!35436 _keys!1208) i!673) k0!934))))

(declare-fun res!753571 () Bool)

(assert (=> start!98122 (=> (not res!753571) (not e!641809))))

(assert (=> start!98122 (= res!753571 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35972 _keys!1208))))))

(assert (=> start!98122 e!641809))

(assert (=> start!98122 tp_is_empty!28353))

(declare-fun array_inv!27190 (array!73567) Bool)

(assert (=> start!98122 (array_inv!27190 _keys!1208)))

(assert (=> start!98122 true))

(assert (=> start!98122 tp!84173))

(declare-fun array_inv!27191 (array!73569) Bool)

(assert (=> start!98122 (and (array_inv!27191 _values!996) e!641808)))

(declare-fun b!1127643 () Bool)

(assert (=> b!1127643 (= e!641811 true)))

(declare-fun lt!500664 () Bool)

(declare-fun contains!6482 (ListLongMap!15873 (_ BitVec 64)) Bool)

(assert (=> b!1127643 (= lt!500664 (contains!6482 (getCurrentListMapNoExtraKeys!4440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127658 () Bool)

(assert (=> b!1127658 (= e!641816 e!641817)))

(declare-fun res!753561 () Bool)

(assert (=> b!1127658 (=> res!753561 e!641817)))

(assert (=> b!1127658 (= res!753561 (not (= from!1455 i!673)))))

(declare-fun lt!500666 () ListLongMap!15873)

(assert (=> b!1127658 (= lt!500666 (getCurrentListMapNoExtraKeys!4440 lt!500667 lt!500665 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2526 (Int (_ BitVec 64)) V!42931)

(assert (=> b!1127658 (= lt!500665 (array!73570 (store (arr!35437 _values!996) i!673 (ValueCellFull!13467 (dynLambda!2526 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35973 _values!996)))))

(declare-fun lt!500668 () ListLongMap!15873)

(assert (=> b!1127658 (= lt!500668 (getCurrentListMapNoExtraKeys!4440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127659 () Bool)

(declare-fun res!753559 () Bool)

(assert (=> b!1127659 (=> (not res!753559) (not e!641809))))

(assert (=> b!1127659 (= res!753559 (and (= (size!35973 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35972 _keys!1208) (size!35973 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127660 () Bool)

(declare-fun res!753566 () Bool)

(assert (=> b!1127660 (=> (not res!753566) (not e!641809))))

(assert (=> b!1127660 (= res!753566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47749 () Bool)

(assert (=> bm!47749 (= call!47752 (getCurrentListMapNoExtraKeys!4440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98122 res!753571) b!1127650))

(assert (= (and b!1127650 res!753560) b!1127659))

(assert (= (and b!1127659 res!753559) b!1127660))

(assert (= (and b!1127660 res!753566) b!1127646))

(assert (= (and b!1127646 res!753564) b!1127654))

(assert (= (and b!1127654 res!753563) b!1127644))

(assert (= (and b!1127644 res!753570) b!1127657))

(assert (= (and b!1127657 res!753567) b!1127649))

(assert (= (and b!1127649 res!753569) b!1127647))

(assert (= (and b!1127647 res!753565) b!1127652))

(assert (= (and b!1127652 (not res!753562)) b!1127658))

(assert (= (and b!1127658 (not res!753561)) b!1127655))

(assert (= (and b!1127655 c!109725) b!1127648))

(assert (= (and b!1127655 (not c!109725)) b!1127656))

(assert (= (or b!1127648 b!1127656) bm!47748))

(assert (= (or b!1127648 b!1127656) bm!47749))

(assert (= (and b!1127655 (not res!753568)) b!1127643))

(assert (= (and b!1127651 condMapEmpty!44347) mapIsEmpty!44347))

(assert (= (and b!1127651 (not condMapEmpty!44347)) mapNonEmpty!44347))

(get-info :version)

(assert (= (and mapNonEmpty!44347 ((_ is ValueCellFull!13467) mapValue!44347)) b!1127653))

(assert (= (and b!1127651 ((_ is ValueCellFull!13467) mapDefault!44347)) b!1127645))

(assert (= start!98122 b!1127651))

(declare-fun b_lambda!18793 () Bool)

(assert (=> (not b_lambda!18793) (not b!1127658)))

(declare-fun t!35490 () Bool)

(declare-fun tb!8635 () Bool)

(assert (=> (and start!98122 (= defaultEntry!1004 defaultEntry!1004) t!35490) tb!8635))

(declare-fun result!17831 () Bool)

(assert (=> tb!8635 (= result!17831 tp_is_empty!28353)))

(assert (=> b!1127658 t!35490))

(declare-fun b_and!38431 () Bool)

(assert (= b_and!38429 (and (=> t!35490 result!17831) b_and!38431)))

(declare-fun m!1041385 () Bool)

(assert (=> b!1127657 m!1041385))

(declare-fun m!1041387 () Bool)

(assert (=> b!1127655 m!1041387))

(declare-fun m!1041389 () Bool)

(assert (=> b!1127655 m!1041389))

(declare-fun m!1041391 () Bool)

(assert (=> b!1127648 m!1041391))

(declare-fun m!1041393 () Bool)

(assert (=> bm!47748 m!1041393))

(declare-fun m!1041395 () Bool)

(assert (=> b!1127644 m!1041395))

(declare-fun m!1041397 () Bool)

(assert (=> b!1127649 m!1041397))

(declare-fun m!1041399 () Bool)

(assert (=> b!1127649 m!1041399))

(declare-fun m!1041401 () Bool)

(assert (=> b!1127660 m!1041401))

(declare-fun m!1041403 () Bool)

(assert (=> start!98122 m!1041403))

(declare-fun m!1041405 () Bool)

(assert (=> start!98122 m!1041405))

(declare-fun m!1041407 () Bool)

(assert (=> b!1127652 m!1041407))

(declare-fun m!1041409 () Bool)

(assert (=> b!1127652 m!1041409))

(declare-fun m!1041411 () Bool)

(assert (=> b!1127646 m!1041411))

(declare-fun m!1041413 () Bool)

(assert (=> b!1127643 m!1041413))

(assert (=> b!1127643 m!1041413))

(declare-fun m!1041415 () Bool)

(assert (=> b!1127643 m!1041415))

(declare-fun m!1041417 () Bool)

(assert (=> b!1127650 m!1041417))

(declare-fun m!1041419 () Bool)

(assert (=> b!1127647 m!1041419))

(declare-fun m!1041421 () Bool)

(assert (=> mapNonEmpty!44347 m!1041421))

(assert (=> bm!47749 m!1041413))

(declare-fun m!1041423 () Bool)

(assert (=> b!1127658 m!1041423))

(declare-fun m!1041425 () Bool)

(assert (=> b!1127658 m!1041425))

(declare-fun m!1041427 () Bool)

(assert (=> b!1127658 m!1041427))

(declare-fun m!1041429 () Bool)

(assert (=> b!1127658 m!1041429))

(check-sat (not b!1127658) b_and!38431 (not b!1127652) (not b!1127644) (not b_lambda!18793) (not b!1127660) (not b_next!23823) (not b!1127655) (not b!1127646) (not bm!47749) (not b!1127647) tp_is_empty!28353 (not bm!47748) (not b!1127648) (not b!1127643) (not b!1127650) (not start!98122) (not b!1127649) (not mapNonEmpty!44347))
(check-sat b_and!38431 (not b_next!23823))
