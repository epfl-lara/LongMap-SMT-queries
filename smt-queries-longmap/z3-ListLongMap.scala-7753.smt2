; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97498 () Bool)

(assert start!97498)

(declare-fun b_free!23233 () Bool)

(declare-fun b_next!23233 () Bool)

(assert (=> start!97498 (= b_free!23233 (not b_next!23233))))

(declare-fun tp!81998 () Bool)

(declare-fun b_and!37307 () Bool)

(assert (=> start!97498 (= tp!81998 b_and!37307)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!41785 0))(
  ( (V!41786 (val!13803 Int)) )
))
(declare-datatypes ((ValueCell!13037 0))(
  ( (ValueCellFull!13037 (v!16432 V!41785)) (EmptyCell!13037) )
))
(declare-datatypes ((array!71939 0))(
  ( (array!71940 (arr!34616 (Array (_ BitVec 32) ValueCell!13037)) (size!35153 (_ BitVec 32))) )
))
(declare-fun e!632594 () array!71939)

(declare-fun _values!996 () array!71939)

(declare-fun b!1108530 () Bool)

(declare-fun dynLambda!2381 (Int (_ BitVec 64)) V!41785)

(assert (=> b!1108530 (= e!632594 (array!71940 (store (arr!34616 _values!996) i!673 (ValueCellFull!13037 (dynLambda!2381 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35153 _values!996)))))

(declare-fun b!1108531 () Bool)

(declare-fun res!739432 () Bool)

(declare-fun e!632597 () Bool)

(assert (=> b!1108531 (=> (not res!739432) (not e!632597))))

(declare-datatypes ((array!71941 0))(
  ( (array!71942 (arr!34617 (Array (_ BitVec 32) (_ BitVec 64))) (size!35154 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71941)

(declare-datatypes ((List!24134 0))(
  ( (Nil!24131) (Cons!24130 (h!25348 (_ BitVec 64)) (t!34405 List!24134)) )
))
(declare-fun arrayNoDuplicates!0 (array!71941 (_ BitVec 32) List!24134) Bool)

(assert (=> b!1108531 (= res!739432 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24131))))

(declare-fun b!1108532 () Bool)

(declare-fun e!632593 () Bool)

(declare-fun tp_is_empty!27493 () Bool)

(assert (=> b!1108532 (= e!632593 tp_is_empty!27493)))

(declare-fun b!1108533 () Bool)

(declare-fun res!739433 () Bool)

(assert (=> b!1108533 (=> (not res!739433) (not e!632597))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1108533 (= res!739433 (= (select (arr!34617 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!43057 () Bool)

(declare-fun mapRes!43057 () Bool)

(declare-fun tp!81997 () Bool)

(assert (=> mapNonEmpty!43057 (= mapRes!43057 (and tp!81997 e!632593))))

(declare-fun mapKey!43057 () (_ BitVec 32))

(declare-fun mapValue!43057 () ValueCell!13037)

(declare-fun mapRest!43057 () (Array (_ BitVec 32) ValueCell!13037))

(assert (=> mapNonEmpty!43057 (= (arr!34616 _values!996) (store mapRest!43057 mapKey!43057 mapValue!43057))))

(declare-fun b!1108534 () Bool)

(declare-fun res!739437 () Bool)

(assert (=> b!1108534 (=> (not res!739437) (not e!632597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108534 (= res!739437 (validKeyInArray!0 k0!934))))

(declare-fun e!632590 () array!71939)

(declare-fun b!1108535 () Bool)

(assert (=> b!1108535 (= e!632590 (array!71940 (store (arr!34616 _values!996) i!673 (ValueCellFull!13037 (dynLambda!2381 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35153 _values!996)))))

(declare-fun b!1108536 () Bool)

(assert (=> b!1108536 (= e!632594 _values!996)))

(declare-fun b!1108537 () Bool)

(declare-fun e!632595 () Bool)

(declare-fun e!632592 () Bool)

(assert (=> b!1108537 (= e!632595 (not e!632592))))

(declare-fun res!739435 () Bool)

(assert (=> b!1108537 (=> res!739435 e!632592)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1108537 (= res!739435 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35154 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108537 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36319 0))(
  ( (Unit!36320) )
))
(declare-fun lt!496100 () Unit!36319)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71941 (_ BitVec 64) (_ BitVec 32)) Unit!36319)

(assert (=> b!1108537 (= lt!496100 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!739431 () Bool)

(assert (=> start!97498 (=> (not res!739431) (not e!632597))))

(assert (=> start!97498 (= res!739431 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35154 _keys!1208))))))

(assert (=> start!97498 e!632597))

(assert (=> start!97498 tp_is_empty!27493))

(declare-fun array_inv!26672 (array!71941) Bool)

(assert (=> start!97498 (array_inv!26672 _keys!1208)))

(assert (=> start!97498 true))

(assert (=> start!97498 tp!81998))

(declare-fun e!632596 () Bool)

(declare-fun array_inv!26673 (array!71939) Bool)

(assert (=> start!97498 (and (array_inv!26673 _values!996) e!632596)))

(declare-fun b!1108538 () Bool)

(declare-fun e!632589 () Bool)

(declare-datatypes ((tuple2!17446 0))(
  ( (tuple2!17447 (_1!8734 (_ BitVec 64)) (_2!8734 V!41785)) )
))
(declare-datatypes ((List!24135 0))(
  ( (Nil!24132) (Cons!24131 (h!25349 tuple2!17446) (t!34406 List!24135)) )
))
(declare-datatypes ((ListLongMap!15423 0))(
  ( (ListLongMap!15424 (toList!7727 List!24135)) )
))
(declare-fun call!46462 () ListLongMap!15423)

(declare-fun call!46463 () ListLongMap!15423)

(assert (=> b!1108538 (= e!632589 (= call!46462 call!46463))))

(declare-fun b!1108539 () Bool)

(declare-fun res!739441 () Bool)

(assert (=> b!1108539 (=> (not res!739441) (not e!632597))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108539 (= res!739441 (validMask!0 mask!1564))))

(declare-fun b!1108540 () Bool)

(assert (=> b!1108540 (= e!632590 _values!996)))

(declare-fun b!1108541 () Bool)

(declare-fun res!739439 () Bool)

(assert (=> b!1108541 (=> (not res!739439) (not e!632595))))

(declare-fun lt!496101 () array!71941)

(assert (=> b!1108541 (= res!739439 (arrayNoDuplicates!0 lt!496101 #b00000000000000000000000000000000 Nil!24131))))

(declare-fun zeroValue!944 () V!41785)

(declare-fun minValue!944 () V!41785)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!46459 () Bool)

(declare-fun c!109443 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4264 (array!71941 array!71939 (_ BitVec 32) (_ BitVec 32) V!41785 V!41785 (_ BitVec 32) Int) ListLongMap!15423)

(assert (=> bm!46459 (= call!46463 (getCurrentListMapNoExtraKeys!4264 (ite c!109443 lt!496101 _keys!1208) e!632594 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!109445 () Bool)

(assert (=> bm!46459 (= c!109445 c!109443)))

(declare-fun b!1108542 () Bool)

(assert (=> b!1108542 (= e!632597 e!632595)))

(declare-fun res!739438 () Bool)

(assert (=> b!1108542 (=> (not res!739438) (not e!632595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71941 (_ BitVec 32)) Bool)

(assert (=> b!1108542 (= res!739438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496101 mask!1564))))

(assert (=> b!1108542 (= lt!496101 (array!71942 (store (arr!34617 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35154 _keys!1208)))))

(declare-fun b!1108543 () Bool)

(declare-fun res!739434 () Bool)

(assert (=> b!1108543 (=> (not res!739434) (not e!632597))))

(assert (=> b!1108543 (= res!739434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108544 () Bool)

(assert (=> b!1108544 (= e!632592 true)))

(assert (=> b!1108544 e!632589))

(assert (=> b!1108544 (= c!109443 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496102 () Unit!36319)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!257 (array!71941 array!71939 (_ BitVec 32) (_ BitVec 32) V!41785 V!41785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36319)

(assert (=> b!1108544 (= lt!496102 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!257 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43057 () Bool)

(assert (=> mapIsEmpty!43057 mapRes!43057))

(declare-fun b!1108545 () Bool)

(declare-fun e!632598 () Bool)

(assert (=> b!1108545 (= e!632596 (and e!632598 mapRes!43057))))

(declare-fun condMapEmpty!43057 () Bool)

(declare-fun mapDefault!43057 () ValueCell!13037)

(assert (=> b!1108545 (= condMapEmpty!43057 (= (arr!34616 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13037)) mapDefault!43057)))))

(declare-fun b!1108546 () Bool)

(declare-fun res!739440 () Bool)

(assert (=> b!1108546 (=> (not res!739440) (not e!632597))))

(assert (=> b!1108546 (= res!739440 (and (= (size!35153 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35154 _keys!1208) (size!35153 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108547 () Bool)

(declare-fun -!989 (ListLongMap!15423 (_ BitVec 64)) ListLongMap!15423)

(assert (=> b!1108547 (= e!632589 (= call!46463 (-!989 call!46462 k0!934)))))

(declare-fun b!1108548 () Bool)

(assert (=> b!1108548 (= e!632598 tp_is_empty!27493)))

(declare-fun bm!46460 () Bool)

(assert (=> bm!46460 (= call!46462 (getCurrentListMapNoExtraKeys!4264 (ite c!109443 _keys!1208 lt!496101) e!632590 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!109444 () Bool)

(assert (=> bm!46460 (= c!109444 c!109443)))

(declare-fun b!1108549 () Bool)

(declare-fun res!739436 () Bool)

(assert (=> b!1108549 (=> (not res!739436) (not e!632597))))

(assert (=> b!1108549 (= res!739436 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35154 _keys!1208))))))

(assert (= (and start!97498 res!739431) b!1108539))

(assert (= (and b!1108539 res!739441) b!1108546))

(assert (= (and b!1108546 res!739440) b!1108543))

(assert (= (and b!1108543 res!739434) b!1108531))

(assert (= (and b!1108531 res!739432) b!1108549))

(assert (= (and b!1108549 res!739436) b!1108534))

(assert (= (and b!1108534 res!739437) b!1108533))

(assert (= (and b!1108533 res!739433) b!1108542))

(assert (= (and b!1108542 res!739438) b!1108541))

(assert (= (and b!1108541 res!739439) b!1108537))

(assert (= (and b!1108537 (not res!739435)) b!1108544))

(assert (= (and b!1108544 c!109443) b!1108547))

(assert (= (and b!1108544 (not c!109443)) b!1108538))

(assert (= (or b!1108547 b!1108538) bm!46460))

(assert (= (and bm!46460 c!109444) b!1108540))

(assert (= (and bm!46460 (not c!109444)) b!1108535))

(assert (= (or b!1108547 b!1108538) bm!46459))

(assert (= (and bm!46459 c!109445) b!1108530))

(assert (= (and bm!46459 (not c!109445)) b!1108536))

(assert (= (and b!1108545 condMapEmpty!43057) mapIsEmpty!43057))

(assert (= (and b!1108545 (not condMapEmpty!43057)) mapNonEmpty!43057))

(get-info :version)

(assert (= (and mapNonEmpty!43057 ((_ is ValueCellFull!13037) mapValue!43057)) b!1108532))

(assert (= (and b!1108545 ((_ is ValueCellFull!13037) mapDefault!43057)) b!1108548))

(assert (= start!97498 b!1108545))

(declare-fun b_lambda!18261 () Bool)

(assert (=> (not b_lambda!18261) (not b!1108530)))

(declare-fun t!34404 () Bool)

(declare-fun tb!8091 () Bool)

(assert (=> (and start!97498 (= defaultEntry!1004 defaultEntry!1004) t!34404) tb!8091))

(declare-fun result!16751 () Bool)

(assert (=> tb!8091 (= result!16751 tp_is_empty!27493)))

(assert (=> b!1108530 t!34404))

(declare-fun b_and!37309 () Bool)

(assert (= b_and!37307 (and (=> t!34404 result!16751) b_and!37309)))

(declare-fun b_lambda!18263 () Bool)

(assert (=> (not b_lambda!18263) (not b!1108535)))

(assert (=> b!1108535 t!34404))

(declare-fun b_and!37311 () Bool)

(assert (= b_and!37309 (and (=> t!34404 result!16751) b_and!37311)))

(declare-fun m!1027701 () Bool)

(assert (=> b!1108537 m!1027701))

(declare-fun m!1027703 () Bool)

(assert (=> b!1108537 m!1027703))

(declare-fun m!1027705 () Bool)

(assert (=> bm!46460 m!1027705))

(declare-fun m!1027707 () Bool)

(assert (=> b!1108530 m!1027707))

(declare-fun m!1027709 () Bool)

(assert (=> b!1108530 m!1027709))

(declare-fun m!1027711 () Bool)

(assert (=> bm!46459 m!1027711))

(declare-fun m!1027713 () Bool)

(assert (=> b!1108533 m!1027713))

(assert (=> b!1108535 m!1027707))

(assert (=> b!1108535 m!1027709))

(declare-fun m!1027715 () Bool)

(assert (=> b!1108544 m!1027715))

(declare-fun m!1027717 () Bool)

(assert (=> b!1108531 m!1027717))

(declare-fun m!1027719 () Bool)

(assert (=> mapNonEmpty!43057 m!1027719))

(declare-fun m!1027721 () Bool)

(assert (=> b!1108541 m!1027721))

(declare-fun m!1027723 () Bool)

(assert (=> b!1108543 m!1027723))

(declare-fun m!1027725 () Bool)

(assert (=> start!97498 m!1027725))

(declare-fun m!1027727 () Bool)

(assert (=> start!97498 m!1027727))

(declare-fun m!1027729 () Bool)

(assert (=> b!1108547 m!1027729))

(declare-fun m!1027731 () Bool)

(assert (=> b!1108534 m!1027731))

(declare-fun m!1027733 () Bool)

(assert (=> b!1108539 m!1027733))

(declare-fun m!1027735 () Bool)

(assert (=> b!1108542 m!1027735))

(declare-fun m!1027737 () Bool)

(assert (=> b!1108542 m!1027737))

(check-sat (not b!1108539) tp_is_empty!27493 (not b!1108544) (not b_lambda!18263) (not b_lambda!18261) (not bm!46459) (not b!1108542) (not b!1108531) (not b_next!23233) (not b!1108537) (not b!1108541) (not b!1108547) (not bm!46460) (not mapNonEmpty!43057) b_and!37311 (not b!1108534) (not b!1108543) (not start!97498))
(check-sat b_and!37311 (not b_next!23233))
