; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98422 () Bool)

(assert start!98422)

(declare-fun b_free!24027 () Bool)

(declare-fun b_next!24027 () Bool)

(assert (=> start!98422 (= b_free!24027 (not b_next!24027))))

(declare-fun tp!84791 () Bool)

(declare-fun b_and!38903 () Bool)

(assert (=> start!98422 (= tp!84791 b_and!38903)))

(declare-fun b!1136502 () Bool)

(declare-fun res!758518 () Bool)

(declare-fun e!646731 () Bool)

(assert (=> b!1136502 (=> res!758518 e!646731)))

(declare-datatypes ((List!24857 0))(
  ( (Nil!24854) (Cons!24853 (h!26062 (_ BitVec 64)) (t!35876 List!24857)) )
))
(declare-fun contains!6587 (List!24857 (_ BitVec 64)) Bool)

(assert (=> b!1136502 (= res!758518 (contains!6587 Nil!24854 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!49863 () Bool)

(declare-datatypes ((Unit!37218 0))(
  ( (Unit!37219) )
))
(declare-fun call!49866 () Unit!37218)

(declare-fun call!49868 () Unit!37218)

(assert (=> bm!49863 (= call!49866 call!49868)))

(declare-fun b!1136503 () Bool)

(declare-fun e!646738 () Bool)

(declare-fun e!646730 () Bool)

(assert (=> b!1136503 (= e!646738 e!646730)))

(declare-fun res!758531 () Bool)

(assert (=> b!1136503 (=> (not res!758531) (not e!646730))))

(declare-datatypes ((array!73975 0))(
  ( (array!73976 (arr!35638 (Array (_ BitVec 32) (_ BitVec 64))) (size!36174 (_ BitVec 32))) )
))
(declare-fun lt!505324 () array!73975)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73975 (_ BitVec 32)) Bool)

(assert (=> b!1136503 (= res!758531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505324 mask!1564))))

(declare-fun _keys!1208 () array!73975)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1136503 (= lt!505324 (array!73976 (store (arr!35638 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36174 _keys!1208)))))

(declare-datatypes ((V!43203 0))(
  ( (V!43204 (val!14335 Int)) )
))
(declare-fun zeroValue!944 () V!43203)

(declare-fun c!111106 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!111107 () Bool)

(declare-fun minValue!944 () V!43203)

(declare-datatypes ((tuple2!18098 0))(
  ( (tuple2!18099 (_1!9060 (_ BitVec 64)) (_2!9060 V!43203)) )
))
(declare-datatypes ((List!24858 0))(
  ( (Nil!24855) (Cons!24854 (h!26063 tuple2!18098) (t!35877 List!24858)) )
))
(declare-datatypes ((ListLongMap!16067 0))(
  ( (ListLongMap!16068 (toList!8049 List!24858)) )
))
(declare-fun lt!505326 () ListLongMap!16067)

(declare-fun lt!505330 () ListLongMap!16067)

(declare-fun bm!49864 () Bool)

(declare-fun addStillContains!746 (ListLongMap!16067 (_ BitVec 64) V!43203 (_ BitVec 64)) Unit!37218)

(assert (=> bm!49864 (= call!49868 (addStillContains!746 (ite c!111107 lt!505326 lt!505330) (ite c!111107 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111106 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111107 minValue!944 (ite c!111106 zeroValue!944 minValue!944)) k0!934))))

(declare-fun call!49871 () ListLongMap!16067)

(declare-fun call!49869 () ListLongMap!16067)

(declare-fun b!1136504 () Bool)

(declare-fun e!646724 () Bool)

(declare-fun -!1210 (ListLongMap!16067 (_ BitVec 64)) ListLongMap!16067)

(assert (=> b!1136504 (= e!646724 (= call!49869 (-!1210 call!49871 k0!934)))))

(declare-fun e!646732 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1136505 () Bool)

(declare-fun arrayContainsKey!0 (array!73975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136505 (= e!646732 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136506 () Bool)

(declare-fun res!758526 () Bool)

(assert (=> b!1136506 (=> (not res!758526) (not e!646738))))

(declare-fun arrayNoDuplicates!0 (array!73975 (_ BitVec 32) List!24857) Bool)

(assert (=> b!1136506 (= res!758526 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24854))))

(declare-fun b!1136507 () Bool)

(assert (=> b!1136507 (= e!646731 true)))

(declare-fun lt!505325 () Bool)

(assert (=> b!1136507 (= lt!505325 (contains!6587 Nil!24854 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1136508 () Bool)

(declare-fun e!646729 () Unit!37218)

(declare-fun lt!505334 () Unit!37218)

(assert (=> b!1136508 (= e!646729 lt!505334)))

(declare-fun lt!505322 () Unit!37218)

(assert (=> b!1136508 (= lt!505322 (addStillContains!746 lt!505330 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun +!3485 (ListLongMap!16067 tuple2!18098) ListLongMap!16067)

(assert (=> b!1136508 (= lt!505326 (+!3485 lt!505330 (tuple2!18099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!49873 () Bool)

(assert (=> b!1136508 call!49873))

(assert (=> b!1136508 (= lt!505334 call!49868)))

(declare-fun call!49870 () ListLongMap!16067)

(declare-fun contains!6588 (ListLongMap!16067 (_ BitVec 64)) Bool)

(assert (=> b!1136508 (contains!6588 call!49870 k0!934)))

(declare-fun b!1136509 () Bool)

(declare-fun res!758516 () Bool)

(assert (=> b!1136509 (=> (not res!758516) (not e!646738))))

(assert (=> b!1136509 (= res!758516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1136510 () Bool)

(declare-fun e!646727 () Bool)

(declare-fun e!646735 () Bool)

(assert (=> b!1136510 (= e!646727 e!646735)))

(declare-fun res!758520 () Bool)

(assert (=> b!1136510 (=> res!758520 e!646735)))

(assert (=> b!1136510 (= res!758520 (not (contains!6588 lt!505330 k0!934)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13569 0))(
  ( (ValueCellFull!13569 (v!16972 V!43203)) (EmptyCell!13569) )
))
(declare-datatypes ((array!73977 0))(
  ( (array!73978 (arr!35639 (Array (_ BitVec 32) ValueCell!13569)) (size!36175 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73977)

(declare-fun getCurrentListMapNoExtraKeys!4533 (array!73975 array!73977 (_ BitVec 32) (_ BitVec 32) V!43203 V!43203 (_ BitVec 32) Int) ListLongMap!16067)

(assert (=> b!1136510 (= lt!505330 (getCurrentListMapNoExtraKeys!4533 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44660 () Bool)

(declare-fun mapRes!44660 () Bool)

(declare-fun tp!84792 () Bool)

(declare-fun e!646740 () Bool)

(assert (=> mapNonEmpty!44660 (= mapRes!44660 (and tp!84792 e!646740))))

(declare-fun mapValue!44660 () ValueCell!13569)

(declare-fun mapRest!44660 () (Array (_ BitVec 32) ValueCell!13569))

(declare-fun mapKey!44660 () (_ BitVec 32))

(assert (=> mapNonEmpty!44660 (= (arr!35639 _values!996) (store mapRest!44660 mapKey!44660 mapValue!44660))))

(declare-fun b!1136511 () Bool)

(declare-fun e!646739 () Bool)

(assert (=> b!1136511 (= e!646739 e!646727)))

(declare-fun res!758530 () Bool)

(assert (=> b!1136511 (=> res!758530 e!646727)))

(assert (=> b!1136511 (= res!758530 (not (= (select (arr!35638 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1136511 e!646724))

(declare-fun c!111108 () Bool)

(assert (=> b!1136511 (= c!111108 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505320 () Unit!37218)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!457 (array!73975 array!73977 (_ BitVec 32) (_ BitVec 32) V!43203 V!43203 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37218)

(assert (=> b!1136511 (= lt!505320 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!457 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136512 () Bool)

(declare-fun e!646728 () Bool)

(assert (=> b!1136512 (= e!646728 e!646739)))

(declare-fun res!758522 () Bool)

(assert (=> b!1136512 (=> res!758522 e!646739)))

(assert (=> b!1136512 (= res!758522 (not (= from!1455 i!673)))))

(declare-fun lt!505332 () ListLongMap!16067)

(declare-fun lt!505335 () array!73977)

(assert (=> b!1136512 (= lt!505332 (getCurrentListMapNoExtraKeys!4533 lt!505324 lt!505335 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2591 (Int (_ BitVec 64)) V!43203)

(assert (=> b!1136512 (= lt!505335 (array!73978 (store (arr!35639 _values!996) i!673 (ValueCellFull!13569 (dynLambda!2591 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36175 _values!996)))))

(declare-fun lt!505328 () ListLongMap!16067)

(assert (=> b!1136512 (= lt!505328 (getCurrentListMapNoExtraKeys!4533 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!49865 () Bool)

(declare-fun call!49867 () Bool)

(assert (=> bm!49865 (= call!49867 call!49873)))

(declare-fun b!1136513 () Bool)

(declare-fun res!758529 () Bool)

(assert (=> b!1136513 (=> (not res!758529) (not e!646738))))

(assert (=> b!1136513 (= res!758529 (= (select (arr!35638 _keys!1208) i!673) k0!934))))

(declare-fun b!1136514 () Bool)

(declare-fun lt!505329 () Bool)

(assert (=> b!1136514 (= e!646732 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505329) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1136515 () Bool)

(declare-fun res!758523 () Bool)

(assert (=> b!1136515 (=> (not res!758523) (not e!646738))))

(assert (=> b!1136515 (= res!758523 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36174 _keys!1208))))))

(declare-fun b!1136516 () Bool)

(assert (=> b!1136516 (= e!646724 (= call!49869 call!49871))))

(declare-fun b!1136517 () Bool)

(declare-fun res!758515 () Bool)

(assert (=> b!1136517 (=> res!758515 e!646731)))

(declare-fun noDuplicate!1604 (List!24857) Bool)

(assert (=> b!1136517 (= res!758515 (not (noDuplicate!1604 Nil!24854)))))

(declare-fun b!1136518 () Bool)

(declare-fun tp_is_empty!28557 () Bool)

(assert (=> b!1136518 (= e!646740 tp_is_empty!28557)))

(declare-fun b!1136519 () Bool)

(declare-fun res!758528 () Bool)

(assert (=> b!1136519 (=> (not res!758528) (not e!646738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1136519 (= res!758528 (validMask!0 mask!1564))))

(declare-fun b!1136520 () Bool)

(declare-fun c!111105 () Bool)

(assert (=> b!1136520 (= c!111105 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505329))))

(declare-fun e!646737 () Unit!37218)

(declare-fun e!646725 () Unit!37218)

(assert (=> b!1136520 (= e!646737 e!646725)))

(declare-fun bm!49866 () Bool)

(assert (=> bm!49866 (= call!49869 (getCurrentListMapNoExtraKeys!4533 lt!505324 lt!505335 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136521 () Bool)

(assert (=> b!1136521 (= e!646730 (not e!646728))))

(declare-fun res!758519 () Bool)

(assert (=> b!1136521 (=> res!758519 e!646728)))

(assert (=> b!1136521 (= res!758519 (bvsgt from!1455 i!673))))

(assert (=> b!1136521 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505327 () Unit!37218)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73975 (_ BitVec 64) (_ BitVec 32)) Unit!37218)

(assert (=> b!1136521 (= lt!505327 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!49867 () Bool)

(declare-fun call!49872 () ListLongMap!16067)

(assert (=> bm!49867 (= call!49873 (contains!6588 (ite c!111107 lt!505326 call!49872) k0!934))))

(declare-fun b!1136522 () Bool)

(assert (=> b!1136522 (= e!646735 e!646731)))

(declare-fun res!758517 () Bool)

(assert (=> b!1136522 (=> res!758517 e!646731)))

(assert (=> b!1136522 (= res!758517 (or (bvsge (size!36174 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36174 _keys!1208)) (bvsge from!1455 (size!36174 _keys!1208))))))

(assert (=> b!1136522 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24854)))

(declare-fun lt!505331 () Unit!37218)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73975 (_ BitVec 32) (_ BitVec 32)) Unit!37218)

(assert (=> b!1136522 (= lt!505331 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!646734 () Bool)

(assert (=> b!1136522 e!646734))

(declare-fun res!758514 () Bool)

(assert (=> b!1136522 (=> (not res!758514) (not e!646734))))

(assert (=> b!1136522 (= res!758514 e!646732)))

(declare-fun c!111109 () Bool)

(assert (=> b!1136522 (= c!111109 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!505333 () Unit!37218)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!350 (array!73975 array!73977 (_ BitVec 32) (_ BitVec 32) V!43203 V!43203 (_ BitVec 64) (_ BitVec 32) Int) Unit!37218)

(assert (=> b!1136522 (= lt!505333 (lemmaListMapContainsThenArrayContainsFrom!350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!505321 () Unit!37218)

(assert (=> b!1136522 (= lt!505321 e!646729)))

(assert (=> b!1136522 (= c!111107 (and (not lt!505329) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1136522 (= lt!505329 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1136523 () Bool)

(declare-fun res!758525 () Bool)

(assert (=> b!1136523 (=> (not res!758525) (not e!646738))))

(assert (=> b!1136523 (= res!758525 (and (= (size!36175 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36174 _keys!1208) (size!36175 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1136524 () Bool)

(declare-fun res!758524 () Bool)

(assert (=> b!1136524 (=> (not res!758524) (not e!646730))))

(assert (=> b!1136524 (= res!758524 (arrayNoDuplicates!0 lt!505324 #b00000000000000000000000000000000 Nil!24854))))

(declare-fun bm!49868 () Bool)

(assert (=> bm!49868 (= call!49871 (getCurrentListMapNoExtraKeys!4533 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44660 () Bool)

(assert (=> mapIsEmpty!44660 mapRes!44660))

(declare-fun b!1136525 () Bool)

(declare-fun res!758521 () Bool)

(assert (=> b!1136525 (=> (not res!758521) (not e!646738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1136525 (= res!758521 (validKeyInArray!0 k0!934))))

(declare-fun b!1136526 () Bool)

(declare-fun Unit!37220 () Unit!37218)

(assert (=> b!1136526 (= e!646725 Unit!37220)))

(declare-fun res!758527 () Bool)

(assert (=> start!98422 (=> (not res!758527) (not e!646738))))

(assert (=> start!98422 (= res!758527 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36174 _keys!1208))))))

(assert (=> start!98422 e!646738))

(assert (=> start!98422 tp_is_empty!28557))

(declare-fun array_inv!27328 (array!73975) Bool)

(assert (=> start!98422 (array_inv!27328 _keys!1208)))

(assert (=> start!98422 true))

(assert (=> start!98422 tp!84791))

(declare-fun e!646736 () Bool)

(declare-fun array_inv!27329 (array!73977) Bool)

(assert (=> start!98422 (and (array_inv!27329 _values!996) e!646736)))

(declare-fun b!1136527 () Bool)

(declare-fun e!646733 () Bool)

(assert (=> b!1136527 (= e!646736 (and e!646733 mapRes!44660))))

(declare-fun condMapEmpty!44660 () Bool)

(declare-fun mapDefault!44660 () ValueCell!13569)

(assert (=> b!1136527 (= condMapEmpty!44660 (= (arr!35639 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13569)) mapDefault!44660)))))

(declare-fun bm!49869 () Bool)

(assert (=> bm!49869 (= call!49870 (+!3485 (ite c!111107 lt!505326 lt!505330) (ite c!111107 (tuple2!18099 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111106 (tuple2!18099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18099 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1136528 () Bool)

(assert (=> b!1136528 (= e!646734 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136529 () Bool)

(assert (=> b!1136529 (= e!646729 e!646737)))

(assert (=> b!1136529 (= c!111106 (and (not lt!505329) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!49870 () Bool)

(assert (=> bm!49870 (= call!49872 call!49870)))

(declare-fun b!1136530 () Bool)

(declare-fun lt!505323 () Unit!37218)

(assert (=> b!1136530 (= e!646725 lt!505323)))

(assert (=> b!1136530 (= lt!505323 call!49866)))

(assert (=> b!1136530 call!49867))

(declare-fun b!1136531 () Bool)

(assert (=> b!1136531 (= e!646733 tp_is_empty!28557)))

(declare-fun b!1136532 () Bool)

(assert (=> b!1136532 call!49867))

(declare-fun lt!505319 () Unit!37218)

(assert (=> b!1136532 (= lt!505319 call!49866)))

(assert (=> b!1136532 (= e!646737 lt!505319)))

(assert (= (and start!98422 res!758527) b!1136519))

(assert (= (and b!1136519 res!758528) b!1136523))

(assert (= (and b!1136523 res!758525) b!1136509))

(assert (= (and b!1136509 res!758516) b!1136506))

(assert (= (and b!1136506 res!758526) b!1136515))

(assert (= (and b!1136515 res!758523) b!1136525))

(assert (= (and b!1136525 res!758521) b!1136513))

(assert (= (and b!1136513 res!758529) b!1136503))

(assert (= (and b!1136503 res!758531) b!1136524))

(assert (= (and b!1136524 res!758524) b!1136521))

(assert (= (and b!1136521 (not res!758519)) b!1136512))

(assert (= (and b!1136512 (not res!758522)) b!1136511))

(assert (= (and b!1136511 c!111108) b!1136504))

(assert (= (and b!1136511 (not c!111108)) b!1136516))

(assert (= (or b!1136504 b!1136516) bm!49868))

(assert (= (or b!1136504 b!1136516) bm!49866))

(assert (= (and b!1136511 (not res!758530)) b!1136510))

(assert (= (and b!1136510 (not res!758520)) b!1136522))

(assert (= (and b!1136522 c!111107) b!1136508))

(assert (= (and b!1136522 (not c!111107)) b!1136529))

(assert (= (and b!1136529 c!111106) b!1136532))

(assert (= (and b!1136529 (not c!111106)) b!1136520))

(assert (= (and b!1136520 c!111105) b!1136530))

(assert (= (and b!1136520 (not c!111105)) b!1136526))

(assert (= (or b!1136532 b!1136530) bm!49863))

(assert (= (or b!1136532 b!1136530) bm!49870))

(assert (= (or b!1136532 b!1136530) bm!49865))

(assert (= (or b!1136508 bm!49865) bm!49867))

(assert (= (or b!1136508 bm!49863) bm!49864))

(assert (= (or b!1136508 bm!49870) bm!49869))

(assert (= (and b!1136522 c!111109) b!1136505))

(assert (= (and b!1136522 (not c!111109)) b!1136514))

(assert (= (and b!1136522 res!758514) b!1136528))

(assert (= (and b!1136522 (not res!758517)) b!1136517))

(assert (= (and b!1136517 (not res!758515)) b!1136502))

(assert (= (and b!1136502 (not res!758518)) b!1136507))

(assert (= (and b!1136527 condMapEmpty!44660) mapIsEmpty!44660))

(assert (= (and b!1136527 (not condMapEmpty!44660)) mapNonEmpty!44660))

(get-info :version)

(assert (= (and mapNonEmpty!44660 ((_ is ValueCellFull!13569) mapValue!44660)) b!1136518))

(assert (= (and b!1136527 ((_ is ValueCellFull!13569) mapDefault!44660)) b!1136531))

(assert (= start!98422 b!1136527))

(declare-fun b_lambda!19133 () Bool)

(assert (=> (not b_lambda!19133) (not b!1136512)))

(declare-fun t!35875 () Bool)

(declare-fun tb!8839 () Bool)

(assert (=> (and start!98422 (= defaultEntry!1004 defaultEntry!1004) t!35875) tb!8839))

(declare-fun result!18243 () Bool)

(assert (=> tb!8839 (= result!18243 tp_is_empty!28557)))

(assert (=> b!1136512 t!35875))

(declare-fun b_and!38905 () Bool)

(assert (= b_and!38903 (and (=> t!35875 result!18243) b_and!38905)))

(declare-fun m!1048809 () Bool)

(assert (=> b!1136507 m!1048809))

(declare-fun m!1048811 () Bool)

(assert (=> b!1136522 m!1048811))

(declare-fun m!1048813 () Bool)

(assert (=> b!1136522 m!1048813))

(declare-fun m!1048815 () Bool)

(assert (=> b!1136522 m!1048815))

(declare-fun m!1048817 () Bool)

(assert (=> b!1136513 m!1048817))

(declare-fun m!1048819 () Bool)

(assert (=> b!1136503 m!1048819))

(declare-fun m!1048821 () Bool)

(assert (=> b!1136503 m!1048821))

(declare-fun m!1048823 () Bool)

(assert (=> b!1136528 m!1048823))

(declare-fun m!1048825 () Bool)

(assert (=> b!1136509 m!1048825))

(declare-fun m!1048827 () Bool)

(assert (=> start!98422 m!1048827))

(declare-fun m!1048829 () Bool)

(assert (=> start!98422 m!1048829))

(declare-fun m!1048831 () Bool)

(assert (=> bm!49868 m!1048831))

(declare-fun m!1048833 () Bool)

(assert (=> b!1136524 m!1048833))

(assert (=> b!1136505 m!1048823))

(declare-fun m!1048835 () Bool)

(assert (=> b!1136517 m!1048835))

(declare-fun m!1048837 () Bool)

(assert (=> b!1136521 m!1048837))

(declare-fun m!1048839 () Bool)

(assert (=> b!1136521 m!1048839))

(declare-fun m!1048841 () Bool)

(assert (=> mapNonEmpty!44660 m!1048841))

(declare-fun m!1048843 () Bool)

(assert (=> bm!49867 m!1048843))

(declare-fun m!1048845 () Bool)

(assert (=> b!1136506 m!1048845))

(declare-fun m!1048847 () Bool)

(assert (=> bm!49864 m!1048847))

(declare-fun m!1048849 () Bool)

(assert (=> b!1136512 m!1048849))

(declare-fun m!1048851 () Bool)

(assert (=> b!1136512 m!1048851))

(declare-fun m!1048853 () Bool)

(assert (=> b!1136512 m!1048853))

(declare-fun m!1048855 () Bool)

(assert (=> b!1136512 m!1048855))

(declare-fun m!1048857 () Bool)

(assert (=> b!1136504 m!1048857))

(declare-fun m!1048859 () Bool)

(assert (=> b!1136525 m!1048859))

(declare-fun m!1048861 () Bool)

(assert (=> b!1136511 m!1048861))

(declare-fun m!1048863 () Bool)

(assert (=> b!1136511 m!1048863))

(declare-fun m!1048865 () Bool)

(assert (=> b!1136510 m!1048865))

(assert (=> b!1136510 m!1048831))

(declare-fun m!1048867 () Bool)

(assert (=> bm!49869 m!1048867))

(declare-fun m!1048869 () Bool)

(assert (=> b!1136502 m!1048869))

(declare-fun m!1048871 () Bool)

(assert (=> b!1136508 m!1048871))

(declare-fun m!1048873 () Bool)

(assert (=> b!1136508 m!1048873))

(declare-fun m!1048875 () Bool)

(assert (=> b!1136508 m!1048875))

(declare-fun m!1048877 () Bool)

(assert (=> b!1136519 m!1048877))

(declare-fun m!1048879 () Bool)

(assert (=> bm!49866 m!1048879))

(check-sat (not start!98422) (not b!1136508) (not b!1136525) (not b_next!24027) (not b!1136505) (not b!1136528) (not b!1136502) (not b!1136517) (not mapNonEmpty!44660) (not bm!49864) (not bm!49868) (not b!1136522) (not b!1136521) (not bm!49867) (not b!1136510) (not b!1136512) (not b!1136511) (not b!1136507) tp_is_empty!28557 (not bm!49866) b_and!38905 (not b!1136524) (not b!1136519) (not b!1136509) (not b!1136503) (not b!1136506) (not bm!49869) (not b_lambda!19133) (not b!1136504))
(check-sat b_and!38905 (not b_next!24027))
