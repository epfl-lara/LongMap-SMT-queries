; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98230 () Bool)

(assert start!98230)

(declare-fun b_free!23931 () Bool)

(declare-fun b_next!23931 () Bool)

(assert (=> start!98230 (= b_free!23931 (not b_next!23931))))

(declare-fun tp!84496 () Bool)

(declare-fun b_and!38645 () Bool)

(assert (=> start!98230 (= tp!84496 b_and!38645)))

(declare-fun b!1131441 () Bool)

(declare-fun e!643908 () Bool)

(declare-fun tp_is_empty!28461 () Bool)

(assert (=> b!1131441 (= e!643908 tp_is_empty!28461)))

(declare-fun b!1131442 () Bool)

(declare-fun e!643914 () Bool)

(declare-fun e!643917 () Bool)

(assert (=> b!1131442 (= e!643914 (not e!643917))))

(declare-fun res!755864 () Bool)

(assert (=> b!1131442 (=> res!755864 e!643917)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131442 (= res!755864 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73779 0))(
  ( (array!73780 (arr!35542 (Array (_ BitVec 32) (_ BitVec 64))) (size!36078 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73779)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1131442 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37064 0))(
  ( (Unit!37065) )
))
(declare-fun lt!502548 () Unit!37064)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73779 (_ BitVec 64) (_ BitVec 32)) Unit!37064)

(assert (=> b!1131442 (= lt!502548 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1131443 () Bool)

(declare-fun e!643913 () Bool)

(declare-fun e!643905 () Bool)

(declare-fun mapRes!44509 () Bool)

(assert (=> b!1131443 (= e!643913 (and e!643905 mapRes!44509))))

(declare-fun condMapEmpty!44509 () Bool)

(declare-datatypes ((V!43075 0))(
  ( (V!43076 (val!14287 Int)) )
))
(declare-datatypes ((ValueCell!13521 0))(
  ( (ValueCellFull!13521 (v!16920 V!43075)) (EmptyCell!13521) )
))
(declare-datatypes ((array!73781 0))(
  ( (array!73782 (arr!35543 (Array (_ BitVec 32) ValueCell!13521)) (size!36079 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73781)

(declare-fun mapDefault!44509 () ValueCell!13521)

(assert (=> b!1131443 (= condMapEmpty!44509 (= (arr!35543 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13521)) mapDefault!44509)))))

(declare-fun mapNonEmpty!44509 () Bool)

(declare-fun tp!84497 () Bool)

(assert (=> mapNonEmpty!44509 (= mapRes!44509 (and tp!84497 e!643908))))

(declare-fun mapRest!44509 () (Array (_ BitVec 32) ValueCell!13521))

(declare-fun mapKey!44509 () (_ BitVec 32))

(declare-fun mapValue!44509 () ValueCell!13521)

(assert (=> mapNonEmpty!44509 (= (arr!35543 _values!996) (store mapRest!44509 mapKey!44509 mapValue!44509))))

(declare-fun bm!48642 () Bool)

(declare-datatypes ((tuple2!18008 0))(
  ( (tuple2!18009 (_1!9015 (_ BitVec 64)) (_2!9015 V!43075)) )
))
(declare-datatypes ((List!24771 0))(
  ( (Nil!24768) (Cons!24767 (h!25976 tuple2!18008) (t!35694 List!24771)) )
))
(declare-datatypes ((ListLongMap!15977 0))(
  ( (ListLongMap!15978 (toList!8004 List!24771)) )
))
(declare-fun call!48647 () ListLongMap!15977)

(declare-fun call!48651 () ListLongMap!15977)

(assert (=> bm!48642 (= call!48647 call!48651)))

(declare-fun bm!48643 () Bool)

(declare-fun lt!502562 () ListLongMap!15977)

(declare-fun c!110177 () Bool)

(declare-fun minValue!944 () V!43075)

(declare-fun lt!502551 () ListLongMap!15977)

(declare-fun zeroValue!944 () V!43075)

(declare-fun c!110180 () Bool)

(declare-fun +!3448 (ListLongMap!15977 tuple2!18008) ListLongMap!15977)

(assert (=> bm!48643 (= call!48651 (+!3448 (ite c!110180 lt!502551 lt!502562) (ite c!110180 (tuple2!18009 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110177 (tuple2!18009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18009 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun call!48650 () Bool)

(declare-fun bm!48644 () Bool)

(declare-fun contains!6526 (ListLongMap!15977 (_ BitVec 64)) Bool)

(assert (=> bm!48644 (= call!48650 (contains!6526 (ite c!110180 lt!502551 call!48647) k0!934))))

(declare-fun b!1131444 () Bool)

(declare-fun e!643904 () Unit!37064)

(declare-fun e!643915 () Unit!37064)

(assert (=> b!1131444 (= e!643904 e!643915)))

(declare-fun lt!502552 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1131444 (= c!110177 (and (not lt!502552) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1131445 () Bool)

(declare-fun res!755871 () Bool)

(declare-fun e!643906 () Bool)

(assert (=> b!1131445 (=> (not res!755871) (not e!643906))))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1131445 (= res!755871 (and (= (size!36079 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36078 _keys!1208) (size!36079 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1131446 () Bool)

(declare-fun call!48649 () Bool)

(assert (=> b!1131446 call!48649))

(declare-fun lt!502554 () Unit!37064)

(declare-fun call!48648 () Unit!37064)

(assert (=> b!1131446 (= lt!502554 call!48648)))

(assert (=> b!1131446 (= e!643915 lt!502554)))

(declare-fun b!1131447 () Bool)

(assert (=> b!1131447 (= e!643905 tp_is_empty!28461)))

(declare-fun b!1131448 () Bool)

(declare-fun c!110181 () Bool)

(assert (=> b!1131448 (= c!110181 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502552))))

(declare-fun e!643907 () Unit!37064)

(assert (=> b!1131448 (= e!643915 e!643907)))

(declare-fun b!1131449 () Bool)

(declare-fun res!755859 () Bool)

(assert (=> b!1131449 (=> (not res!755859) (not e!643906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1131449 (= res!755859 (validKeyInArray!0 k0!934))))

(declare-fun c!110179 () Bool)

(declare-fun bm!48645 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!502560 () array!73779)

(declare-fun call!48646 () ListLongMap!15977)

(declare-fun lt!502558 () array!73781)

(declare-fun getCurrentListMapNoExtraKeys!4491 (array!73779 array!73781 (_ BitVec 32) (_ BitVec 32) V!43075 V!43075 (_ BitVec 32) Int) ListLongMap!15977)

(assert (=> bm!48645 (= call!48646 (getCurrentListMapNoExtraKeys!4491 (ite c!110179 _keys!1208 lt!502560) (ite c!110179 _values!996 lt!502558) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131450 () Bool)

(declare-fun lt!502553 () Unit!37064)

(assert (=> b!1131450 (= e!643907 lt!502553)))

(assert (=> b!1131450 (= lt!502553 call!48648)))

(assert (=> b!1131450 call!48649))

(declare-fun b!1131451 () Bool)

(declare-fun res!755860 () Bool)

(assert (=> b!1131451 (=> (not res!755860) (not e!643906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131451 (= res!755860 (validMask!0 mask!1564))))

(declare-fun b!1131452 () Bool)

(declare-fun e!643909 () Bool)

(declare-fun e!643912 () Bool)

(assert (=> b!1131452 (= e!643909 e!643912)))

(declare-fun res!755866 () Bool)

(assert (=> b!1131452 (=> res!755866 e!643912)))

(assert (=> b!1131452 (= res!755866 (not (= (select (arr!35542 _keys!1208) from!1455) k0!934)))))

(declare-fun e!643916 () Bool)

(assert (=> b!1131452 e!643916))

(assert (=> b!1131452 (= c!110179 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502555 () Unit!37064)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!432 (array!73779 array!73781 (_ BitVec 32) (_ BitVec 32) V!43075 V!43075 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37064)

(assert (=> b!1131452 (= lt!502555 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131453 () Bool)

(declare-fun e!643903 () Bool)

(assert (=> b!1131453 (= e!643903 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1131454 () Bool)

(declare-fun e!643911 () Bool)

(assert (=> b!1131454 (= e!643911 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000))))

(assert (=> b!1131454 e!643903))

(declare-fun c!110178 () Bool)

(assert (=> b!1131454 (= c!110178 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!502549 () Unit!37064)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!322 (array!73779 array!73781 (_ BitVec 32) (_ BitVec 32) V!43075 V!43075 (_ BitVec 64) (_ BitVec 32) Int) Unit!37064)

(assert (=> b!1131454 (= lt!502549 (lemmaListMapContainsThenArrayContainsFrom!322 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!502559 () Unit!37064)

(assert (=> b!1131454 (= lt!502559 e!643904)))

(assert (=> b!1131454 (= c!110180 (and (not lt!502552) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1131454 (= lt!502552 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!48646 () Bool)

(declare-fun call!48645 () Unit!37064)

(declare-fun addStillContains!712 (ListLongMap!15977 (_ BitVec 64) V!43075 (_ BitVec 64)) Unit!37064)

(assert (=> bm!48646 (= call!48645 (addStillContains!712 (ite c!110180 lt!502551 lt!502562) (ite c!110180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110177 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110180 minValue!944 (ite c!110177 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1131455 () Bool)

(assert (=> b!1131455 (= e!643903 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!502552) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1131456 () Bool)

(declare-fun res!755872 () Bool)

(assert (=> b!1131456 (=> (not res!755872) (not e!643906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73779 (_ BitVec 32)) Bool)

(assert (=> b!1131456 (= res!755872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1131457 () Bool)

(assert (=> b!1131457 (= e!643906 e!643914)))

(declare-fun res!755867 () Bool)

(assert (=> b!1131457 (=> (not res!755867) (not e!643914))))

(assert (=> b!1131457 (= res!755867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502560 mask!1564))))

(assert (=> b!1131457 (= lt!502560 (array!73780 (store (arr!35542 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36078 _keys!1208)))))

(declare-fun b!1131458 () Bool)

(assert (=> b!1131458 (= e!643917 e!643909)))

(declare-fun res!755863 () Bool)

(assert (=> b!1131458 (=> res!755863 e!643909)))

(assert (=> b!1131458 (= res!755863 (not (= from!1455 i!673)))))

(declare-fun lt!502561 () ListLongMap!15977)

(assert (=> b!1131458 (= lt!502561 (getCurrentListMapNoExtraKeys!4491 lt!502560 lt!502558 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2563 (Int (_ BitVec 64)) V!43075)

(assert (=> b!1131458 (= lt!502558 (array!73782 (store (arr!35543 _values!996) i!673 (ValueCellFull!13521 (dynLambda!2563 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36079 _values!996)))))

(declare-fun lt!502556 () ListLongMap!15977)

(assert (=> b!1131458 (= lt!502556 (getCurrentListMapNoExtraKeys!4491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!48647 () Bool)

(assert (=> bm!48647 (= call!48649 call!48650)))

(declare-fun b!1131459 () Bool)

(declare-fun res!755865 () Bool)

(assert (=> b!1131459 (=> (not res!755865) (not e!643906))))

(assert (=> b!1131459 (= res!755865 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36078 _keys!1208))))))

(declare-fun b!1131460 () Bool)

(declare-fun res!755862 () Bool)

(assert (=> b!1131460 (=> (not res!755862) (not e!643906))))

(declare-datatypes ((List!24772 0))(
  ( (Nil!24769) (Cons!24768 (h!25977 (_ BitVec 64)) (t!35695 List!24772)) )
))
(declare-fun arrayNoDuplicates!0 (array!73779 (_ BitVec 32) List!24772) Bool)

(assert (=> b!1131460 (= res!755862 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24769))))

(declare-fun call!48652 () ListLongMap!15977)

(declare-fun bm!48648 () Bool)

(assert (=> bm!48648 (= call!48652 (getCurrentListMapNoExtraKeys!4491 (ite c!110179 lt!502560 _keys!1208) (ite c!110179 lt!502558 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131461 () Bool)

(declare-fun res!755868 () Bool)

(assert (=> b!1131461 (=> (not res!755868) (not e!643914))))

(assert (=> b!1131461 (= res!755868 (arrayNoDuplicates!0 lt!502560 #b00000000000000000000000000000000 Nil!24769))))

(declare-fun b!1131462 () Bool)

(assert (=> b!1131462 (= e!643912 e!643911)))

(declare-fun res!755870 () Bool)

(assert (=> b!1131462 (=> res!755870 e!643911)))

(assert (=> b!1131462 (= res!755870 (not (contains!6526 lt!502562 k0!934)))))

(assert (=> b!1131462 (= lt!502562 (getCurrentListMapNoExtraKeys!4491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131463 () Bool)

(declare-fun Unit!37066 () Unit!37064)

(assert (=> b!1131463 (= e!643907 Unit!37066)))

(declare-fun res!755869 () Bool)

(assert (=> start!98230 (=> (not res!755869) (not e!643906))))

(assert (=> start!98230 (= res!755869 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36078 _keys!1208))))))

(assert (=> start!98230 e!643906))

(assert (=> start!98230 tp_is_empty!28461))

(declare-fun array_inv!27262 (array!73779) Bool)

(assert (=> start!98230 (array_inv!27262 _keys!1208)))

(assert (=> start!98230 true))

(assert (=> start!98230 tp!84496))

(declare-fun array_inv!27263 (array!73781) Bool)

(assert (=> start!98230 (and (array_inv!27263 _values!996) e!643913)))

(declare-fun bm!48649 () Bool)

(assert (=> bm!48649 (= call!48648 call!48645)))

(declare-fun b!1131464 () Bool)

(declare-fun lt!502557 () Unit!37064)

(assert (=> b!1131464 (= e!643904 lt!502557)))

(declare-fun lt!502550 () Unit!37064)

(assert (=> b!1131464 (= lt!502550 (addStillContains!712 lt!502562 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1131464 (= lt!502551 (+!3448 lt!502562 (tuple2!18009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1131464 call!48650))

(assert (=> b!1131464 (= lt!502557 call!48645)))

(assert (=> b!1131464 (contains!6526 call!48651 k0!934)))

(declare-fun mapIsEmpty!44509 () Bool)

(assert (=> mapIsEmpty!44509 mapRes!44509))

(declare-fun b!1131465 () Bool)

(declare-fun res!755861 () Bool)

(assert (=> b!1131465 (=> (not res!755861) (not e!643906))))

(assert (=> b!1131465 (= res!755861 (= (select (arr!35542 _keys!1208) i!673) k0!934))))

(declare-fun b!1131466 () Bool)

(assert (=> b!1131466 (= e!643916 (= call!48646 call!48652))))

(declare-fun b!1131467 () Bool)

(declare-fun -!1178 (ListLongMap!15977 (_ BitVec 64)) ListLongMap!15977)

(assert (=> b!1131467 (= e!643916 (= call!48652 (-!1178 call!48646 k0!934)))))

(assert (= (and start!98230 res!755869) b!1131451))

(assert (= (and b!1131451 res!755860) b!1131445))

(assert (= (and b!1131445 res!755871) b!1131456))

(assert (= (and b!1131456 res!755872) b!1131460))

(assert (= (and b!1131460 res!755862) b!1131459))

(assert (= (and b!1131459 res!755865) b!1131449))

(assert (= (and b!1131449 res!755859) b!1131465))

(assert (= (and b!1131465 res!755861) b!1131457))

(assert (= (and b!1131457 res!755867) b!1131461))

(assert (= (and b!1131461 res!755868) b!1131442))

(assert (= (and b!1131442 (not res!755864)) b!1131458))

(assert (= (and b!1131458 (not res!755863)) b!1131452))

(assert (= (and b!1131452 c!110179) b!1131467))

(assert (= (and b!1131452 (not c!110179)) b!1131466))

(assert (= (or b!1131467 b!1131466) bm!48645))

(assert (= (or b!1131467 b!1131466) bm!48648))

(assert (= (and b!1131452 (not res!755866)) b!1131462))

(assert (= (and b!1131462 (not res!755870)) b!1131454))

(assert (= (and b!1131454 c!110180) b!1131464))

(assert (= (and b!1131454 (not c!110180)) b!1131444))

(assert (= (and b!1131444 c!110177) b!1131446))

(assert (= (and b!1131444 (not c!110177)) b!1131448))

(assert (= (and b!1131448 c!110181) b!1131450))

(assert (= (and b!1131448 (not c!110181)) b!1131463))

(assert (= (or b!1131446 b!1131450) bm!48649))

(assert (= (or b!1131446 b!1131450) bm!48642))

(assert (= (or b!1131446 b!1131450) bm!48647))

(assert (= (or b!1131464 bm!48647) bm!48644))

(assert (= (or b!1131464 bm!48649) bm!48646))

(assert (= (or b!1131464 bm!48642) bm!48643))

(assert (= (and b!1131454 c!110178) b!1131453))

(assert (= (and b!1131454 (not c!110178)) b!1131455))

(assert (= (and b!1131443 condMapEmpty!44509) mapIsEmpty!44509))

(assert (= (and b!1131443 (not condMapEmpty!44509)) mapNonEmpty!44509))

(get-info :version)

(assert (= (and mapNonEmpty!44509 ((_ is ValueCellFull!13521) mapValue!44509)) b!1131441))

(assert (= (and b!1131443 ((_ is ValueCellFull!13521) mapDefault!44509)) b!1131447))

(assert (= start!98230 b!1131443))

(declare-fun b_lambda!18901 () Bool)

(assert (=> (not b_lambda!18901) (not b!1131458)))

(declare-fun t!35693 () Bool)

(declare-fun tb!8743 () Bool)

(assert (=> (and start!98230 (= defaultEntry!1004 defaultEntry!1004) t!35693) tb!8743))

(declare-fun result!18047 () Bool)

(assert (=> tb!8743 (= result!18047 tp_is_empty!28461)))

(assert (=> b!1131458 t!35693))

(declare-fun b_and!38647 () Bool)

(assert (= b_and!38645 (and (=> t!35693 result!18047) b_and!38647)))

(declare-fun m!1044367 () Bool)

(assert (=> bm!48646 m!1044367))

(declare-fun m!1044369 () Bool)

(assert (=> b!1131451 m!1044369))

(declare-fun m!1044371 () Bool)

(assert (=> b!1131449 m!1044371))

(declare-fun m!1044373 () Bool)

(assert (=> b!1131442 m!1044373))

(declare-fun m!1044375 () Bool)

(assert (=> b!1131442 m!1044375))

(declare-fun m!1044377 () Bool)

(assert (=> bm!48644 m!1044377))

(declare-fun m!1044379 () Bool)

(assert (=> bm!48643 m!1044379))

(declare-fun m!1044381 () Bool)

(assert (=> b!1131456 m!1044381))

(declare-fun m!1044383 () Bool)

(assert (=> b!1131460 m!1044383))

(declare-fun m!1044385 () Bool)

(assert (=> start!98230 m!1044385))

(declare-fun m!1044387 () Bool)

(assert (=> start!98230 m!1044387))

(declare-fun m!1044389 () Bool)

(assert (=> b!1131453 m!1044389))

(declare-fun m!1044391 () Bool)

(assert (=> b!1131461 m!1044391))

(declare-fun m!1044393 () Bool)

(assert (=> bm!48648 m!1044393))

(declare-fun m!1044395 () Bool)

(assert (=> b!1131464 m!1044395))

(declare-fun m!1044397 () Bool)

(assert (=> b!1131464 m!1044397))

(declare-fun m!1044399 () Bool)

(assert (=> b!1131464 m!1044399))

(declare-fun m!1044401 () Bool)

(assert (=> b!1131465 m!1044401))

(declare-fun m!1044403 () Bool)

(assert (=> bm!48645 m!1044403))

(declare-fun m!1044405 () Bool)

(assert (=> b!1131452 m!1044405))

(declare-fun m!1044407 () Bool)

(assert (=> b!1131452 m!1044407))

(declare-fun m!1044409 () Bool)

(assert (=> b!1131454 m!1044409))

(declare-fun m!1044411 () Bool)

(assert (=> b!1131458 m!1044411))

(declare-fun m!1044413 () Bool)

(assert (=> b!1131458 m!1044413))

(declare-fun m!1044415 () Bool)

(assert (=> b!1131458 m!1044415))

(declare-fun m!1044417 () Bool)

(assert (=> b!1131458 m!1044417))

(declare-fun m!1044419 () Bool)

(assert (=> mapNonEmpty!44509 m!1044419))

(declare-fun m!1044421 () Bool)

(assert (=> b!1131462 m!1044421))

(declare-fun m!1044423 () Bool)

(assert (=> b!1131462 m!1044423))

(declare-fun m!1044425 () Bool)

(assert (=> b!1131457 m!1044425))

(declare-fun m!1044427 () Bool)

(assert (=> b!1131457 m!1044427))

(declare-fun m!1044429 () Bool)

(assert (=> b!1131467 m!1044429))

(check-sat (not bm!48646) (not b!1131457) (not b!1131454) (not bm!48645) (not mapNonEmpty!44509) (not b!1131464) (not b!1131442) b_and!38647 (not start!98230) (not bm!48644) (not b!1131461) (not b!1131449) (not b!1131467) (not bm!48643) (not b!1131462) tp_is_empty!28461 (not b!1131453) (not bm!48648) (not b!1131458) (not b_next!23931) (not b!1131456) (not b!1131451) (not b!1131460) (not b!1131452) (not b_lambda!18901))
(check-sat b_and!38647 (not b_next!23931))
