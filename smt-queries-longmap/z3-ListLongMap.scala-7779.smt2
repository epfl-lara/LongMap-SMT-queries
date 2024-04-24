; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97654 () Bool)

(assert start!97654)

(declare-fun b_free!23389 () Bool)

(declare-fun b_next!23389 () Bool)

(assert (=> start!97654 (= b_free!23389 (not b_next!23389))))

(declare-fun tp!82465 () Bool)

(declare-fun b_and!37621 () Bool)

(assert (=> start!97654 (= tp!82465 b_and!37621)))

(declare-fun b!1112434 () Bool)

(declare-fun e!634463 () Bool)

(declare-fun tp_is_empty!27649 () Bool)

(assert (=> b!1112434 (= e!634463 tp_is_empty!27649)))

(declare-fun b!1112435 () Bool)

(declare-fun e!634465 () Bool)

(assert (=> b!1112435 (= e!634465 tp_is_empty!27649)))

(declare-fun b!1112436 () Bool)

(declare-fun res!742011 () Bool)

(declare-fun e!634464 () Bool)

(assert (=> b!1112436 (=> (not res!742011) (not e!634464))))

(declare-datatypes ((array!72249 0))(
  ( (array!72250 (arr!34771 (Array (_ BitVec 32) (_ BitVec 64))) (size!35308 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72249)

(declare-datatypes ((List!24264 0))(
  ( (Nil!24261) (Cons!24260 (h!25478 (_ BitVec 64)) (t!34691 List!24264)) )
))
(declare-fun arrayNoDuplicates!0 (array!72249 (_ BitVec 32) List!24264) Bool)

(assert (=> b!1112436 (= res!742011 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24261))))

(declare-fun b!1112437 () Bool)

(declare-fun res!742014 () Bool)

(assert (=> b!1112437 (=> (not res!742014) (not e!634464))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112437 (= res!742014 (validMask!0 mask!1564))))

(declare-fun b!1112438 () Bool)

(declare-fun e!634470 () Bool)

(declare-fun mapRes!43291 () Bool)

(assert (=> b!1112438 (= e!634470 (and e!634465 mapRes!43291))))

(declare-fun condMapEmpty!43291 () Bool)

(declare-datatypes ((V!41993 0))(
  ( (V!41994 (val!13881 Int)) )
))
(declare-datatypes ((ValueCell!13115 0))(
  ( (ValueCellFull!13115 (v!16510 V!41993)) (EmptyCell!13115) )
))
(declare-datatypes ((array!72251 0))(
  ( (array!72252 (arr!34772 (Array (_ BitVec 32) ValueCell!13115)) (size!35309 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72251)

(declare-fun mapDefault!43291 () ValueCell!13115)

(assert (=> b!1112438 (= condMapEmpty!43291 (= (arr!34772 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13115)) mapDefault!43291)))))

(declare-fun e!634468 () Bool)

(declare-datatypes ((tuple2!17582 0))(
  ( (tuple2!17583 (_1!8802 (_ BitVec 64)) (_2!8802 V!41993)) )
))
(declare-datatypes ((List!24265 0))(
  ( (Nil!24262) (Cons!24261 (h!25479 tuple2!17582) (t!34692 List!24265)) )
))
(declare-datatypes ((ListLongMap!15559 0))(
  ( (ListLongMap!15560 (toList!7795 List!24265)) )
))
(declare-fun call!46931 () ListLongMap!15559)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1112439 () Bool)

(declare-fun call!46930 () ListLongMap!15559)

(declare-fun -!1044 (ListLongMap!15559 (_ BitVec 64)) ListLongMap!15559)

(assert (=> b!1112439 (= e!634468 (= call!46931 (-!1044 call!46930 k0!934)))))

(declare-fun b!1112440 () Bool)

(declare-fun e!634469 () Bool)

(assert (=> b!1112440 (= e!634464 e!634469)))

(declare-fun res!742009 () Bool)

(assert (=> b!1112440 (=> (not res!742009) (not e!634469))))

(declare-fun lt!496802 () array!72249)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72249 (_ BitVec 32)) Bool)

(assert (=> b!1112440 (= res!742009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496802 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112440 (= lt!496802 (array!72250 (store (arr!34771 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35308 _keys!1208)))))

(declare-fun b!1112441 () Bool)

(declare-fun res!742008 () Bool)

(assert (=> b!1112441 (=> (not res!742008) (not e!634464))))

(assert (=> b!1112441 (= res!742008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112442 () Bool)

(declare-fun res!742006 () Bool)

(assert (=> b!1112442 (=> (not res!742006) (not e!634464))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1112442 (= res!742006 (and (= (size!35309 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35308 _keys!1208) (size!35309 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112443 () Bool)

(declare-fun res!742015 () Bool)

(assert (=> b!1112443 (=> (not res!742015) (not e!634464))))

(assert (=> b!1112443 (= res!742015 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35308 _keys!1208))))))

(declare-fun mapIsEmpty!43291 () Bool)

(assert (=> mapIsEmpty!43291 mapRes!43291))

(declare-fun zeroValue!944 () V!41993)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!41993)

(declare-fun bm!46927 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4327 (array!72249 array!72251 (_ BitVec 32) (_ BitVec 32) V!41993 V!41993 (_ BitVec 32) Int) ListLongMap!15559)

(assert (=> bm!46927 (= call!46930 (getCurrentListMapNoExtraKeys!4327 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46928 () Bool)

(declare-fun dynLambda!2439 (Int (_ BitVec 64)) V!41993)

(assert (=> bm!46928 (= call!46931 (getCurrentListMapNoExtraKeys!4327 lt!496802 (array!72252 (store (arr!34772 _values!996) i!673 (ValueCellFull!13115 (dynLambda!2439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35309 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112445 () Bool)

(declare-fun e!634466 () Bool)

(assert (=> b!1112445 (= e!634469 (not e!634466))))

(declare-fun res!742010 () Bool)

(assert (=> b!1112445 (=> res!742010 e!634466)))

(assert (=> b!1112445 (= res!742010 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35308 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112445 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36439 0))(
  ( (Unit!36440) )
))
(declare-fun lt!496804 () Unit!36439)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72249 (_ BitVec 64) (_ BitVec 32)) Unit!36439)

(assert (=> b!1112445 (= lt!496804 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112446 () Bool)

(assert (=> b!1112446 (= e!634466 true)))

(assert (=> b!1112446 e!634468))

(declare-fun c!109679 () Bool)

(assert (=> b!1112446 (= c!109679 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496803 () Unit!36439)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!309 (array!72249 array!72251 (_ BitVec 32) (_ BitVec 32) V!41993 V!41993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36439)

(assert (=> b!1112446 (= lt!496803 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!309 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112447 () Bool)

(assert (=> b!1112447 (= e!634468 (= call!46931 call!46930))))

(declare-fun mapNonEmpty!43291 () Bool)

(declare-fun tp!82466 () Bool)

(assert (=> mapNonEmpty!43291 (= mapRes!43291 (and tp!82466 e!634463))))

(declare-fun mapRest!43291 () (Array (_ BitVec 32) ValueCell!13115))

(declare-fun mapKey!43291 () (_ BitVec 32))

(declare-fun mapValue!43291 () ValueCell!13115)

(assert (=> mapNonEmpty!43291 (= (arr!34772 _values!996) (store mapRest!43291 mapKey!43291 mapValue!43291))))

(declare-fun b!1112444 () Bool)

(declare-fun res!742005 () Bool)

(assert (=> b!1112444 (=> (not res!742005) (not e!634464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112444 (= res!742005 (validKeyInArray!0 k0!934))))

(declare-fun res!742012 () Bool)

(assert (=> start!97654 (=> (not res!742012) (not e!634464))))

(assert (=> start!97654 (= res!742012 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35308 _keys!1208))))))

(assert (=> start!97654 e!634464))

(assert (=> start!97654 tp_is_empty!27649))

(declare-fun array_inv!26794 (array!72249) Bool)

(assert (=> start!97654 (array_inv!26794 _keys!1208)))

(assert (=> start!97654 true))

(assert (=> start!97654 tp!82465))

(declare-fun array_inv!26795 (array!72251) Bool)

(assert (=> start!97654 (and (array_inv!26795 _values!996) e!634470)))

(declare-fun b!1112448 () Bool)

(declare-fun res!742007 () Bool)

(assert (=> b!1112448 (=> (not res!742007) (not e!634469))))

(assert (=> b!1112448 (= res!742007 (arrayNoDuplicates!0 lt!496802 #b00000000000000000000000000000000 Nil!24261))))

(declare-fun b!1112449 () Bool)

(declare-fun res!742013 () Bool)

(assert (=> b!1112449 (=> (not res!742013) (not e!634464))))

(assert (=> b!1112449 (= res!742013 (= (select (arr!34771 _keys!1208) i!673) k0!934))))

(assert (= (and start!97654 res!742012) b!1112437))

(assert (= (and b!1112437 res!742014) b!1112442))

(assert (= (and b!1112442 res!742006) b!1112441))

(assert (= (and b!1112441 res!742008) b!1112436))

(assert (= (and b!1112436 res!742011) b!1112443))

(assert (= (and b!1112443 res!742015) b!1112444))

(assert (= (and b!1112444 res!742005) b!1112449))

(assert (= (and b!1112449 res!742013) b!1112440))

(assert (= (and b!1112440 res!742009) b!1112448))

(assert (= (and b!1112448 res!742007) b!1112445))

(assert (= (and b!1112445 (not res!742010)) b!1112446))

(assert (= (and b!1112446 c!109679) b!1112439))

(assert (= (and b!1112446 (not c!109679)) b!1112447))

(assert (= (or b!1112439 b!1112447) bm!46928))

(assert (= (or b!1112439 b!1112447) bm!46927))

(assert (= (and b!1112438 condMapEmpty!43291) mapIsEmpty!43291))

(assert (= (and b!1112438 (not condMapEmpty!43291)) mapNonEmpty!43291))

(get-info :version)

(assert (= (and mapNonEmpty!43291 ((_ is ValueCellFull!13115) mapValue!43291)) b!1112434))

(assert (= (and b!1112438 ((_ is ValueCellFull!13115) mapDefault!43291)) b!1112435))

(assert (= start!97654 b!1112438))

(declare-fun b_lambda!18419 () Bool)

(assert (=> (not b_lambda!18419) (not bm!46928)))

(declare-fun t!34690 () Bool)

(declare-fun tb!8247 () Bool)

(assert (=> (and start!97654 (= defaultEntry!1004 defaultEntry!1004) t!34690) tb!8247))

(declare-fun result!17063 () Bool)

(assert (=> tb!8247 (= result!17063 tp_is_empty!27649)))

(assert (=> bm!46928 t!34690))

(declare-fun b_and!37623 () Bool)

(assert (= b_and!37621 (and (=> t!34690 result!17063) b_and!37623)))

(declare-fun m!1030665 () Bool)

(assert (=> b!1112441 m!1030665))

(declare-fun m!1030667 () Bool)

(assert (=> b!1112446 m!1030667))

(declare-fun m!1030669 () Bool)

(assert (=> mapNonEmpty!43291 m!1030669))

(declare-fun m!1030671 () Bool)

(assert (=> bm!46928 m!1030671))

(declare-fun m!1030673 () Bool)

(assert (=> bm!46928 m!1030673))

(declare-fun m!1030675 () Bool)

(assert (=> bm!46928 m!1030675))

(declare-fun m!1030677 () Bool)

(assert (=> b!1112444 m!1030677))

(declare-fun m!1030679 () Bool)

(assert (=> b!1112448 m!1030679))

(declare-fun m!1030681 () Bool)

(assert (=> bm!46927 m!1030681))

(declare-fun m!1030683 () Bool)

(assert (=> b!1112437 m!1030683))

(declare-fun m!1030685 () Bool)

(assert (=> b!1112436 m!1030685))

(declare-fun m!1030687 () Bool)

(assert (=> b!1112440 m!1030687))

(declare-fun m!1030689 () Bool)

(assert (=> b!1112440 m!1030689))

(declare-fun m!1030691 () Bool)

(assert (=> b!1112449 m!1030691))

(declare-fun m!1030693 () Bool)

(assert (=> b!1112445 m!1030693))

(declare-fun m!1030695 () Bool)

(assert (=> b!1112445 m!1030695))

(declare-fun m!1030697 () Bool)

(assert (=> start!97654 m!1030697))

(declare-fun m!1030699 () Bool)

(assert (=> start!97654 m!1030699))

(declare-fun m!1030701 () Bool)

(assert (=> b!1112439 m!1030701))

(check-sat (not mapNonEmpty!43291) (not bm!46927) b_and!37623 (not b_lambda!18419) (not b_next!23389) (not b!1112448) (not b!1112440) (not b!1112441) (not b!1112444) (not b!1112445) (not b!1112446) (not b!1112436) (not b!1112437) (not start!97654) (not bm!46928) tp_is_empty!27649 (not b!1112439))
(check-sat b_and!37623 (not b_next!23389))
