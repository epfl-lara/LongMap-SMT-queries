; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97438 () Bool)

(assert start!97438)

(declare-fun b_free!23409 () Bool)

(declare-fun b_next!23409 () Bool)

(assert (=> start!97438 (= b_free!23409 (not b_next!23409))))

(declare-fun tp!82526 () Bool)

(declare-fun b_and!37655 () Bool)

(assert (=> start!97438 (= tp!82526 b_and!37655)))

(declare-fun b!1111631 () Bool)

(declare-fun res!741823 () Bool)

(declare-fun e!633867 () Bool)

(assert (=> b!1111631 (=> (not res!741823) (not e!633867))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111631 (= res!741823 (validMask!0 mask!1564))))

(declare-fun b!1111632 () Bool)

(declare-fun res!741814 () Bool)

(declare-fun e!633860 () Bool)

(assert (=> b!1111632 (=> (not res!741814) (not e!633860))))

(declare-datatypes ((array!72255 0))(
  ( (array!72256 (arr!34780 (Array (_ BitVec 32) (_ BitVec 64))) (size!35316 (_ BitVec 32))) )
))
(declare-fun lt!496377 () array!72255)

(declare-datatypes ((List!24266 0))(
  ( (Nil!24263) (Cons!24262 (h!25471 (_ BitVec 64)) (t!34721 List!24266)) )
))
(declare-fun arrayNoDuplicates!0 (array!72255 (_ BitVec 32) List!24266) Bool)

(assert (=> b!1111632 (= res!741814 (arrayNoDuplicates!0 lt!496377 #b00000000000000000000000000000000 Nil!24263))))

(declare-datatypes ((V!42019 0))(
  ( (V!42020 (val!13891 Int)) )
))
(declare-fun zeroValue!944 () V!42019)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!46920 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13125 0))(
  ( (ValueCellFull!13125 (v!16524 V!42019)) (EmptyCell!13125) )
))
(declare-datatypes ((array!72257 0))(
  ( (array!72258 (arr!34781 (Array (_ BitVec 32) ValueCell!13125)) (size!35317 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72257)

(declare-fun minValue!944 () V!42019)

(declare-datatypes ((tuple2!17584 0))(
  ( (tuple2!17585 (_1!8803 (_ BitVec 64)) (_2!8803 V!42019)) )
))
(declare-datatypes ((List!24267 0))(
  ( (Nil!24264) (Cons!24263 (h!25472 tuple2!17584) (t!34722 List!24267)) )
))
(declare-datatypes ((ListLongMap!15553 0))(
  ( (ListLongMap!15554 (toList!7792 List!24267)) )
))
(declare-fun call!46923 () ListLongMap!15553)

(declare-fun getCurrentListMapNoExtraKeys!4283 (array!72255 array!72257 (_ BitVec 32) (_ BitVec 32) V!42019 V!42019 (_ BitVec 32) Int) ListLongMap!15553)

(declare-fun dynLambda!2410 (Int (_ BitVec 64)) V!42019)

(assert (=> bm!46920 (= call!46923 (getCurrentListMapNoExtraKeys!4283 lt!496377 (array!72258 (store (arr!34781 _values!996) i!673 (ValueCellFull!13125 (dynLambda!2410 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35317 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111633 () Bool)

(declare-fun res!741818 () Bool)

(assert (=> b!1111633 (=> (not res!741818) (not e!633867))))

(declare-fun _keys!1208 () array!72255)

(assert (=> b!1111633 (= res!741818 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35316 _keys!1208))))))

(declare-fun b!1111634 () Bool)

(declare-fun res!741822 () Bool)

(assert (=> b!1111634 (=> (not res!741822) (not e!633867))))

(assert (=> b!1111634 (= res!741822 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24263))))

(declare-fun b!1111635 () Bool)

(declare-fun e!633865 () Bool)

(declare-fun e!633862 () Bool)

(declare-fun mapRes!43321 () Bool)

(assert (=> b!1111635 (= e!633865 (and e!633862 mapRes!43321))))

(declare-fun condMapEmpty!43321 () Bool)

(declare-fun mapDefault!43321 () ValueCell!13125)

(assert (=> b!1111635 (= condMapEmpty!43321 (= (arr!34781 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13125)) mapDefault!43321)))))

(declare-fun mapIsEmpty!43321 () Bool)

(assert (=> mapIsEmpty!43321 mapRes!43321))

(declare-fun b!1111636 () Bool)

(declare-fun res!741816 () Bool)

(assert (=> b!1111636 (=> (not res!741816) (not e!633867))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111636 (= res!741816 (validKeyInArray!0 k0!934))))

(declare-fun b!1111637 () Bool)

(declare-fun res!741821 () Bool)

(assert (=> b!1111637 (=> (not res!741821) (not e!633867))))

(assert (=> b!1111637 (= res!741821 (and (= (size!35317 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35316 _keys!1208) (size!35317 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!46921 () Bool)

(declare-fun call!46924 () ListLongMap!15553)

(assert (=> bm!46921 (= call!46924 (getCurrentListMapNoExtraKeys!4283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111638 () Bool)

(declare-fun res!741819 () Bool)

(assert (=> b!1111638 (=> (not res!741819) (not e!633867))))

(assert (=> b!1111638 (= res!741819 (= (select (arr!34780 _keys!1208) i!673) k0!934))))

(declare-fun b!1111640 () Bool)

(declare-fun e!633864 () Bool)

(declare-fun -!1058 (ListLongMap!15553 (_ BitVec 64)) ListLongMap!15553)

(assert (=> b!1111640 (= e!633864 (= call!46923 (-!1058 call!46924 k0!934)))))

(declare-fun mapNonEmpty!43321 () Bool)

(declare-fun tp!82525 () Bool)

(declare-fun e!633863 () Bool)

(assert (=> mapNonEmpty!43321 (= mapRes!43321 (and tp!82525 e!633863))))

(declare-fun mapKey!43321 () (_ BitVec 32))

(declare-fun mapValue!43321 () ValueCell!13125)

(declare-fun mapRest!43321 () (Array (_ BitVec 32) ValueCell!13125))

(assert (=> mapNonEmpty!43321 (= (arr!34781 _values!996) (store mapRest!43321 mapKey!43321 mapValue!43321))))

(declare-fun b!1111641 () Bool)

(declare-fun tp_is_empty!27669 () Bool)

(assert (=> b!1111641 (= e!633863 tp_is_empty!27669)))

(declare-fun b!1111642 () Bool)

(assert (=> b!1111642 (= e!633867 e!633860)))

(declare-fun res!741813 () Bool)

(assert (=> b!1111642 (=> (not res!741813) (not e!633860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72255 (_ BitVec 32)) Bool)

(assert (=> b!1111642 (= res!741813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496377 mask!1564))))

(assert (=> b!1111642 (= lt!496377 (array!72256 (store (arr!34780 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35316 _keys!1208)))))

(declare-fun b!1111643 () Bool)

(assert (=> b!1111643 (= e!633862 tp_is_empty!27669)))

(declare-fun res!741817 () Bool)

(assert (=> start!97438 (=> (not res!741817) (not e!633867))))

(assert (=> start!97438 (= res!741817 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35316 _keys!1208))))))

(assert (=> start!97438 e!633867))

(assert (=> start!97438 tp_is_empty!27669))

(declare-fun array_inv!26750 (array!72255) Bool)

(assert (=> start!97438 (array_inv!26750 _keys!1208)))

(assert (=> start!97438 true))

(assert (=> start!97438 tp!82526))

(declare-fun array_inv!26751 (array!72257) Bool)

(assert (=> start!97438 (and (array_inv!26751 _values!996) e!633865)))

(declare-fun b!1111639 () Bool)

(declare-fun res!741815 () Bool)

(assert (=> b!1111639 (=> (not res!741815) (not e!633867))))

(assert (=> b!1111639 (= res!741815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111644 () Bool)

(assert (=> b!1111644 (= e!633864 (= call!46923 call!46924))))

(declare-fun b!1111645 () Bool)

(declare-fun e!633861 () Bool)

(assert (=> b!1111645 (= e!633861 true)))

(assert (=> b!1111645 e!633864))

(declare-fun c!109311 () Bool)

(assert (=> b!1111645 (= c!109311 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36482 0))(
  ( (Unit!36483) )
))
(declare-fun lt!496379 () Unit!36482)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!306 (array!72255 array!72257 (_ BitVec 32) (_ BitVec 32) V!42019 V!42019 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36482)

(assert (=> b!1111645 (= lt!496379 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!306 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111646 () Bool)

(assert (=> b!1111646 (= e!633860 (not e!633861))))

(declare-fun res!741820 () Bool)

(assert (=> b!1111646 (=> res!741820 e!633861)))

(assert (=> b!1111646 (= res!741820 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35316 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111646 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496378 () Unit!36482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72255 (_ BitVec 64) (_ BitVec 32)) Unit!36482)

(assert (=> b!1111646 (= lt!496378 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97438 res!741817) b!1111631))

(assert (= (and b!1111631 res!741823) b!1111637))

(assert (= (and b!1111637 res!741821) b!1111639))

(assert (= (and b!1111639 res!741815) b!1111634))

(assert (= (and b!1111634 res!741822) b!1111633))

(assert (= (and b!1111633 res!741818) b!1111636))

(assert (= (and b!1111636 res!741816) b!1111638))

(assert (= (and b!1111638 res!741819) b!1111642))

(assert (= (and b!1111642 res!741813) b!1111632))

(assert (= (and b!1111632 res!741814) b!1111646))

(assert (= (and b!1111646 (not res!741820)) b!1111645))

(assert (= (and b!1111645 c!109311) b!1111640))

(assert (= (and b!1111645 (not c!109311)) b!1111644))

(assert (= (or b!1111640 b!1111644) bm!46920))

(assert (= (or b!1111640 b!1111644) bm!46921))

(assert (= (and b!1111635 condMapEmpty!43321) mapIsEmpty!43321))

(assert (= (and b!1111635 (not condMapEmpty!43321)) mapNonEmpty!43321))

(get-info :version)

(assert (= (and mapNonEmpty!43321 ((_ is ValueCellFull!13125) mapValue!43321)) b!1111641))

(assert (= (and b!1111635 ((_ is ValueCellFull!13125) mapDefault!43321)) b!1111643))

(assert (= start!97438 b!1111635))

(declare-fun b_lambda!18433 () Bool)

(assert (=> (not b_lambda!18433) (not bm!46920)))

(declare-fun t!34720 () Bool)

(declare-fun tb!8275 () Bool)

(assert (=> (and start!97438 (= defaultEntry!1004 defaultEntry!1004) t!34720) tb!8275))

(declare-fun result!17111 () Bool)

(assert (=> tb!8275 (= result!17111 tp_is_empty!27669)))

(assert (=> bm!46920 t!34720))

(declare-fun b_and!37657 () Bool)

(assert (= b_and!37655 (and (=> t!34720 result!17111) b_and!37657)))

(declare-fun m!1029373 () Bool)

(assert (=> start!97438 m!1029373))

(declare-fun m!1029375 () Bool)

(assert (=> start!97438 m!1029375))

(declare-fun m!1029377 () Bool)

(assert (=> b!1111632 m!1029377))

(declare-fun m!1029379 () Bool)

(assert (=> b!1111642 m!1029379))

(declare-fun m!1029381 () Bool)

(assert (=> b!1111642 m!1029381))

(declare-fun m!1029383 () Bool)

(assert (=> b!1111640 m!1029383))

(declare-fun m!1029385 () Bool)

(assert (=> b!1111631 m!1029385))

(declare-fun m!1029387 () Bool)

(assert (=> mapNonEmpty!43321 m!1029387))

(declare-fun m!1029389 () Bool)

(assert (=> b!1111634 m!1029389))

(declare-fun m!1029391 () Bool)

(assert (=> b!1111638 m!1029391))

(declare-fun m!1029393 () Bool)

(assert (=> b!1111645 m!1029393))

(declare-fun m!1029395 () Bool)

(assert (=> b!1111636 m!1029395))

(declare-fun m!1029397 () Bool)

(assert (=> bm!46921 m!1029397))

(declare-fun m!1029399 () Bool)

(assert (=> b!1111639 m!1029399))

(declare-fun m!1029401 () Bool)

(assert (=> bm!46920 m!1029401))

(declare-fun m!1029403 () Bool)

(assert (=> bm!46920 m!1029403))

(declare-fun m!1029405 () Bool)

(assert (=> bm!46920 m!1029405))

(declare-fun m!1029407 () Bool)

(assert (=> b!1111646 m!1029407))

(declare-fun m!1029409 () Bool)

(assert (=> b!1111646 m!1029409))

(check-sat tp_is_empty!27669 (not b_next!23409) (not b!1111646) (not b!1111639) (not b!1111640) (not mapNonEmpty!43321) (not start!97438) (not b!1111631) (not b_lambda!18433) (not b!1111632) (not bm!46920) (not b!1111645) b_and!37657 (not b!1111636) (not bm!46921) (not b!1111634) (not b!1111642))
(check-sat b_and!37657 (not b_next!23409))
