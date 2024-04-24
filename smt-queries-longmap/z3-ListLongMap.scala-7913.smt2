; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98458 () Bool)

(assert start!98458)

(declare-fun b_free!23923 () Bool)

(declare-fun b_next!23923 () Bool)

(assert (=> start!98458 (= b_free!23923 (not b_next!23923))))

(declare-fun tp!84473 () Bool)

(declare-fun b_and!38639 () Bool)

(assert (=> start!98458 (= tp!84473 b_and!38639)))

(declare-fun b!1132443 () Bool)

(declare-fun res!756213 () Bool)

(declare-fun e!644586 () Bool)

(assert (=> b!1132443 (=> (not res!756213) (not e!644586))))

(declare-datatypes ((array!73809 0))(
  ( (array!73810 (arr!35551 (Array (_ BitVec 32) (_ BitVec 64))) (size!36088 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73809)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43065 0))(
  ( (V!43066 (val!14283 Int)) )
))
(declare-datatypes ((ValueCell!13517 0))(
  ( (ValueCellFull!13517 (v!16912 V!43065)) (EmptyCell!13517) )
))
(declare-datatypes ((array!73811 0))(
  ( (array!73812 (arr!35552 (Array (_ BitVec 32) ValueCell!13517)) (size!36089 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73811)

(assert (=> b!1132443 (= res!756213 (and (= (size!36089 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36088 _keys!1208) (size!36089 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1132444 () Bool)

(declare-fun c!110535 () Bool)

(declare-fun lt!502883 () Bool)

(assert (=> b!1132444 (= c!110535 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502883))))

(declare-datatypes ((Unit!37032 0))(
  ( (Unit!37033) )
))
(declare-fun e!644587 () Unit!37032)

(declare-fun e!644591 () Unit!37032)

(assert (=> b!1132444 (= e!644587 e!644591)))

(declare-fun b!1132445 () Bool)

(declare-fun e!644589 () Bool)

(declare-fun e!644579 () Bool)

(assert (=> b!1132445 (= e!644589 (not e!644579))))

(declare-fun res!756207 () Bool)

(assert (=> b!1132445 (=> res!756207 e!644579)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1132445 (= res!756207 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1132445 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502894 () Unit!37032)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73809 (_ BitVec 64) (_ BitVec 32)) Unit!37032)

(assert (=> b!1132445 (= lt!502894 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1132446 () Bool)

(assert (=> b!1132446 (= e!644586 e!644589)))

(declare-fun res!756216 () Bool)

(assert (=> b!1132446 (=> (not res!756216) (not e!644589))))

(declare-fun lt!502892 () array!73809)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73809 (_ BitVec 32)) Bool)

(assert (=> b!1132446 (= res!756216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502892 mask!1564))))

(assert (=> b!1132446 (= lt!502892 (array!73810 (store (arr!35551 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36088 _keys!1208)))))

(declare-fun b!1132447 () Bool)

(declare-fun e!644588 () Bool)

(declare-fun tp_is_empty!28453 () Bool)

(assert (=> b!1132447 (= e!644588 tp_is_empty!28453)))

(declare-fun b!1132448 () Bool)

(declare-fun e!644590 () Bool)

(declare-fun e!644585 () Bool)

(assert (=> b!1132448 (= e!644590 e!644585)))

(declare-fun res!756212 () Bool)

(assert (=> b!1132448 (=> res!756212 e!644585)))

(assert (=> b!1132448 (= res!756212 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36088 _keys!1208))))))

(declare-fun lt!502885 () Unit!37032)

(declare-fun e!644584 () Unit!37032)

(assert (=> b!1132448 (= lt!502885 e!644584)))

(declare-fun c!110534 () Bool)

(assert (=> b!1132448 (= c!110534 (and (not lt!502883) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1132448 (= lt!502883 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1132449 () Bool)

(declare-fun res!756218 () Bool)

(assert (=> b!1132449 (=> (not res!756218) (not e!644586))))

(assert (=> b!1132449 (= res!756218 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36088 _keys!1208))))))

(declare-fun b!1132450 () Bool)

(declare-fun lt!502893 () Unit!37032)

(assert (=> b!1132450 (= e!644591 lt!502893)))

(declare-fun call!48618 () Unit!37032)

(assert (=> b!1132450 (= lt!502893 call!48618)))

(declare-fun call!48617 () Bool)

(assert (=> b!1132450 call!48617))

(declare-fun zeroValue!944 () V!43065)

(declare-datatypes ((tuple2!18012 0))(
  ( (tuple2!18013 (_1!9017 (_ BitVec 64)) (_2!9017 V!43065)) )
))
(declare-datatypes ((List!24789 0))(
  ( (Nil!24786) (Cons!24785 (h!26003 tuple2!18012) (t!35696 List!24789)) )
))
(declare-datatypes ((ListLongMap!15989 0))(
  ( (ListLongMap!15990 (toList!8010 List!24789)) )
))
(declare-fun call!48623 () ListLongMap!15989)

(declare-fun lt!502886 () array!73811)

(declare-fun minValue!944 () V!43065)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!48613 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4528 (array!73809 array!73811 (_ BitVec 32) (_ BitVec 32) V!43065 V!43065 (_ BitVec 32) Int) ListLongMap!15989)

(assert (=> bm!48613 (= call!48623 (getCurrentListMapNoExtraKeys!4528 lt!502892 lt!502886 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132451 () Bool)

(declare-fun e!644582 () Bool)

(declare-fun call!48619 () ListLongMap!15989)

(assert (=> b!1132451 (= e!644582 (= call!48623 call!48619))))

(declare-fun b!1132452 () Bool)

(assert (=> b!1132452 (= e!644585 true)))

(declare-fun lt!502891 () Bool)

(declare-fun contains!6544 (ListLongMap!15989 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4437 (array!73809 array!73811 (_ BitVec 32) (_ BitVec 32) V!43065 V!43065 (_ BitVec 32) Int) ListLongMap!15989)

(assert (=> b!1132452 (= lt!502891 (contains!6544 (getCurrentListMap!4437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun mapNonEmpty!44497 () Bool)

(declare-fun mapRes!44497 () Bool)

(declare-fun tp!84472 () Bool)

(declare-fun e!644592 () Bool)

(assert (=> mapNonEmpty!44497 (= mapRes!44497 (and tp!84472 e!644592))))

(declare-fun mapRest!44497 () (Array (_ BitVec 32) ValueCell!13517))

(declare-fun mapValue!44497 () ValueCell!13517)

(declare-fun mapKey!44497 () (_ BitVec 32))

(assert (=> mapNonEmpty!44497 (= (arr!35552 _values!996) (store mapRest!44497 mapKey!44497 mapValue!44497))))

(declare-fun bm!48615 () Bool)

(declare-fun call!48622 () Bool)

(assert (=> bm!48615 (= call!48617 call!48622)))

(declare-fun b!1132453 () Bool)

(declare-fun e!644583 () Bool)

(declare-fun e!644580 () Bool)

(assert (=> b!1132453 (= e!644583 e!644580)))

(declare-fun res!756214 () Bool)

(assert (=> b!1132453 (=> res!756214 e!644580)))

(assert (=> b!1132453 (= res!756214 (not (= (select (arr!35551 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1132453 e!644582))

(declare-fun c!110537 () Bool)

(assert (=> b!1132453 (= c!110537 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502884 () Unit!37032)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!428 (array!73809 array!73811 (_ BitVec 32) (_ BitVec 32) V!43065 V!43065 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37032)

(assert (=> b!1132453 (= lt!502884 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!428 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132454 () Bool)

(declare-fun e!644581 () Bool)

(assert (=> b!1132454 (= e!644581 (and e!644588 mapRes!44497))))

(declare-fun condMapEmpty!44497 () Bool)

(declare-fun mapDefault!44497 () ValueCell!13517)

(assert (=> b!1132454 (= condMapEmpty!44497 (= (arr!35552 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13517)) mapDefault!44497)))))

(declare-fun b!1132455 () Bool)

(declare-fun lt!502897 () Unit!37032)

(assert (=> b!1132455 (= e!644584 lt!502897)))

(declare-fun lt!502896 () Unit!37032)

(declare-fun call!48620 () Unit!37032)

(assert (=> b!1132455 (= lt!502896 call!48620)))

(declare-fun lt!502889 () ListLongMap!15989)

(declare-fun call!48616 () ListLongMap!15989)

(assert (=> b!1132455 (= lt!502889 call!48616)))

(assert (=> b!1132455 call!48622))

(declare-fun addStillContains!701 (ListLongMap!15989 (_ BitVec 64) V!43065 (_ BitVec 64)) Unit!37032)

(assert (=> b!1132455 (= lt!502897 (addStillContains!701 lt!502889 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun +!3475 (ListLongMap!15989 tuple2!18012) ListLongMap!15989)

(assert (=> b!1132455 (contains!6544 (+!3475 lt!502889 (tuple2!18013 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1132456 () Bool)

(declare-fun res!756217 () Bool)

(assert (=> b!1132456 (=> (not res!756217) (not e!644586))))

(declare-datatypes ((List!24790 0))(
  ( (Nil!24787) (Cons!24786 (h!26004 (_ BitVec 64)) (t!35697 List!24790)) )
))
(declare-fun arrayNoDuplicates!0 (array!73809 (_ BitVec 32) List!24790) Bool)

(assert (=> b!1132456 (= res!756217 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24787))))

(declare-fun b!1132457 () Bool)

(declare-fun res!756208 () Bool)

(assert (=> b!1132457 (=> (not res!756208) (not e!644589))))

(assert (=> b!1132457 (= res!756208 (arrayNoDuplicates!0 lt!502892 #b00000000000000000000000000000000 Nil!24787))))

(declare-fun b!1132458 () Bool)

(assert (=> b!1132458 (= e!644580 e!644590)))

(declare-fun res!756209 () Bool)

(assert (=> b!1132458 (=> res!756209 e!644590)))

(declare-fun lt!502888 () ListLongMap!15989)

(assert (=> b!1132458 (= res!756209 (not (contains!6544 lt!502888 k0!934)))))

(assert (=> b!1132458 (= lt!502888 (getCurrentListMapNoExtraKeys!4528 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48616 () Bool)

(declare-fun call!48621 () ListLongMap!15989)

(assert (=> bm!48616 (= call!48622 (contains!6544 (ite c!110534 lt!502889 call!48621) k0!934))))

(declare-fun b!1132459 () Bool)

(assert (=> b!1132459 (= e!644592 tp_is_empty!28453)))

(declare-fun bm!48617 () Bool)

(assert (=> bm!48617 (= call!48621 call!48616)))

(declare-fun b!1132460 () Bool)

(assert (=> b!1132460 call!48617))

(declare-fun lt!502895 () Unit!37032)

(assert (=> b!1132460 (= lt!502895 call!48618)))

(assert (=> b!1132460 (= e!644587 lt!502895)))

(declare-fun bm!48618 () Bool)

(assert (=> bm!48618 (= call!48619 (getCurrentListMapNoExtraKeys!4528 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132461 () Bool)

(declare-fun Unit!37034 () Unit!37032)

(assert (=> b!1132461 (= e!644591 Unit!37034)))

(declare-fun c!110536 () Bool)

(declare-fun bm!48619 () Bool)

(assert (=> bm!48619 (= call!48616 (+!3475 lt!502888 (ite (or c!110534 c!110536) (tuple2!18013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18013 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1132462 () Bool)

(declare-fun res!756219 () Bool)

(assert (=> b!1132462 (=> (not res!756219) (not e!644586))))

(assert (=> b!1132462 (= res!756219 (= (select (arr!35551 _keys!1208) i!673) k0!934))))

(declare-fun b!1132463 () Bool)

(declare-fun res!756211 () Bool)

(assert (=> b!1132463 (=> (not res!756211) (not e!644586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1132463 (= res!756211 (validMask!0 mask!1564))))

(declare-fun b!1132464 () Bool)

(declare-fun res!756210 () Bool)

(assert (=> b!1132464 (=> (not res!756210) (not e!644586))))

(assert (=> b!1132464 (= res!756210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1132465 () Bool)

(declare-fun res!756215 () Bool)

(assert (=> b!1132465 (=> (not res!756215) (not e!644586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1132465 (= res!756215 (validKeyInArray!0 k0!934))))

(declare-fun b!1132466 () Bool)

(assert (=> b!1132466 (= e!644579 e!644583)))

(declare-fun res!756220 () Bool)

(assert (=> b!1132466 (=> res!756220 e!644583)))

(assert (=> b!1132466 (= res!756220 (not (= from!1455 i!673)))))

(declare-fun lt!502887 () ListLongMap!15989)

(assert (=> b!1132466 (= lt!502887 (getCurrentListMapNoExtraKeys!4528 lt!502892 lt!502886 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2589 (Int (_ BitVec 64)) V!43065)

(assert (=> b!1132466 (= lt!502886 (array!73812 (store (arr!35552 _values!996) i!673 (ValueCellFull!13517 (dynLambda!2589 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36089 _values!996)))))

(declare-fun lt!502890 () ListLongMap!15989)

(assert (=> b!1132466 (= lt!502890 (getCurrentListMapNoExtraKeys!4528 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!48620 () Bool)

(assert (=> bm!48620 (= call!48620 (addStillContains!701 lt!502888 (ite (or c!110534 c!110536) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110534 c!110536) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1132467 () Bool)

(declare-fun -!1168 (ListLongMap!15989 (_ BitVec 64)) ListLongMap!15989)

(assert (=> b!1132467 (= e!644582 (= call!48623 (-!1168 call!48619 k0!934)))))

(declare-fun bm!48614 () Bool)

(assert (=> bm!48614 (= call!48618 call!48620)))

(declare-fun res!756206 () Bool)

(assert (=> start!98458 (=> (not res!756206) (not e!644586))))

(assert (=> start!98458 (= res!756206 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36088 _keys!1208))))))

(assert (=> start!98458 e!644586))

(assert (=> start!98458 tp_is_empty!28453))

(declare-fun array_inv!27326 (array!73809) Bool)

(assert (=> start!98458 (array_inv!27326 _keys!1208)))

(assert (=> start!98458 true))

(assert (=> start!98458 tp!84473))

(declare-fun array_inv!27327 (array!73811) Bool)

(assert (=> start!98458 (and (array_inv!27327 _values!996) e!644581)))

(declare-fun mapIsEmpty!44497 () Bool)

(assert (=> mapIsEmpty!44497 mapRes!44497))

(declare-fun b!1132468 () Bool)

(assert (=> b!1132468 (= e!644584 e!644587)))

(assert (=> b!1132468 (= c!110536 (and (not lt!502883) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!98458 res!756206) b!1132463))

(assert (= (and b!1132463 res!756211) b!1132443))

(assert (= (and b!1132443 res!756213) b!1132464))

(assert (= (and b!1132464 res!756210) b!1132456))

(assert (= (and b!1132456 res!756217) b!1132449))

(assert (= (and b!1132449 res!756218) b!1132465))

(assert (= (and b!1132465 res!756215) b!1132462))

(assert (= (and b!1132462 res!756219) b!1132446))

(assert (= (and b!1132446 res!756216) b!1132457))

(assert (= (and b!1132457 res!756208) b!1132445))

(assert (= (and b!1132445 (not res!756207)) b!1132466))

(assert (= (and b!1132466 (not res!756220)) b!1132453))

(assert (= (and b!1132453 c!110537) b!1132467))

(assert (= (and b!1132453 (not c!110537)) b!1132451))

(assert (= (or b!1132467 b!1132451) bm!48613))

(assert (= (or b!1132467 b!1132451) bm!48618))

(assert (= (and b!1132453 (not res!756214)) b!1132458))

(assert (= (and b!1132458 (not res!756209)) b!1132448))

(assert (= (and b!1132448 c!110534) b!1132455))

(assert (= (and b!1132448 (not c!110534)) b!1132468))

(assert (= (and b!1132468 c!110536) b!1132460))

(assert (= (and b!1132468 (not c!110536)) b!1132444))

(assert (= (and b!1132444 c!110535) b!1132450))

(assert (= (and b!1132444 (not c!110535)) b!1132461))

(assert (= (or b!1132460 b!1132450) bm!48614))

(assert (= (or b!1132460 b!1132450) bm!48617))

(assert (= (or b!1132460 b!1132450) bm!48615))

(assert (= (or b!1132455 bm!48615) bm!48616))

(assert (= (or b!1132455 bm!48614) bm!48620))

(assert (= (or b!1132455 bm!48617) bm!48619))

(assert (= (and b!1132448 (not res!756212)) b!1132452))

(assert (= (and b!1132454 condMapEmpty!44497) mapIsEmpty!44497))

(assert (= (and b!1132454 (not condMapEmpty!44497)) mapNonEmpty!44497))

(get-info :version)

(assert (= (and mapNonEmpty!44497 ((_ is ValueCellFull!13517) mapValue!44497)) b!1132459))

(assert (= (and b!1132454 ((_ is ValueCellFull!13517) mapDefault!44497)) b!1132447))

(assert (= start!98458 b!1132454))

(declare-fun b_lambda!18903 () Bool)

(assert (=> (not b_lambda!18903) (not b!1132466)))

(declare-fun t!35695 () Bool)

(declare-fun tb!8727 () Bool)

(assert (=> (and start!98458 (= defaultEntry!1004 defaultEntry!1004) t!35695) tb!8727))

(declare-fun result!18023 () Bool)

(assert (=> tb!8727 (= result!18023 tp_is_empty!28453)))

(assert (=> b!1132466 t!35695))

(declare-fun b_and!38641 () Bool)

(assert (= b_and!38639 (and (=> t!35695 result!18023) b_and!38641)))

(declare-fun m!1045797 () Bool)

(assert (=> b!1132467 m!1045797))

(declare-fun m!1045799 () Bool)

(assert (=> b!1132462 m!1045799))

(declare-fun m!1045801 () Bool)

(assert (=> b!1132457 m!1045801))

(declare-fun m!1045803 () Bool)

(assert (=> b!1132453 m!1045803))

(declare-fun m!1045805 () Bool)

(assert (=> b!1132453 m!1045805))

(declare-fun m!1045807 () Bool)

(assert (=> b!1132445 m!1045807))

(declare-fun m!1045809 () Bool)

(assert (=> b!1132445 m!1045809))

(declare-fun m!1045811 () Bool)

(assert (=> bm!48618 m!1045811))

(declare-fun m!1045813 () Bool)

(assert (=> bm!48620 m!1045813))

(declare-fun m!1045815 () Bool)

(assert (=> b!1132452 m!1045815))

(assert (=> b!1132452 m!1045815))

(declare-fun m!1045817 () Bool)

(assert (=> b!1132452 m!1045817))

(declare-fun m!1045819 () Bool)

(assert (=> b!1132446 m!1045819))

(declare-fun m!1045821 () Bool)

(assert (=> b!1132446 m!1045821))

(declare-fun m!1045823 () Bool)

(assert (=> b!1132456 m!1045823))

(declare-fun m!1045825 () Bool)

(assert (=> bm!48619 m!1045825))

(declare-fun m!1045827 () Bool)

(assert (=> bm!48616 m!1045827))

(declare-fun m!1045829 () Bool)

(assert (=> b!1132465 m!1045829))

(declare-fun m!1045831 () Bool)

(assert (=> mapNonEmpty!44497 m!1045831))

(declare-fun m!1045833 () Bool)

(assert (=> bm!48613 m!1045833))

(declare-fun m!1045835 () Bool)

(assert (=> b!1132458 m!1045835))

(assert (=> b!1132458 m!1045811))

(declare-fun m!1045837 () Bool)

(assert (=> start!98458 m!1045837))

(declare-fun m!1045839 () Bool)

(assert (=> start!98458 m!1045839))

(declare-fun m!1045841 () Bool)

(assert (=> b!1132455 m!1045841))

(declare-fun m!1045843 () Bool)

(assert (=> b!1132455 m!1045843))

(assert (=> b!1132455 m!1045843))

(declare-fun m!1045845 () Bool)

(assert (=> b!1132455 m!1045845))

(declare-fun m!1045847 () Bool)

(assert (=> b!1132466 m!1045847))

(declare-fun m!1045849 () Bool)

(assert (=> b!1132466 m!1045849))

(declare-fun m!1045851 () Bool)

(assert (=> b!1132466 m!1045851))

(declare-fun m!1045853 () Bool)

(assert (=> b!1132466 m!1045853))

(declare-fun m!1045855 () Bool)

(assert (=> b!1132463 m!1045855))

(declare-fun m!1045857 () Bool)

(assert (=> b!1132464 m!1045857))

(check-sat (not start!98458) (not b_lambda!18903) (not b!1132466) (not b!1132464) (not b!1132445) (not b!1132457) (not b!1132467) (not b!1132452) b_and!38641 (not b!1132458) (not bm!48616) tp_is_empty!28453 (not b!1132465) (not b!1132463) (not mapNonEmpty!44497) (not bm!48620) (not bm!48613) (not b!1132456) (not b_next!23923) (not b!1132455) (not bm!48618) (not bm!48619) (not b!1132446) (not b!1132453))
(check-sat b_and!38641 (not b_next!23923))
