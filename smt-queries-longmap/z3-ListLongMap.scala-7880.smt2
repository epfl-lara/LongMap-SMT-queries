; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98018 () Bool)

(assert start!98018)

(declare-fun b_free!23725 () Bool)

(declare-fun b_next!23725 () Bool)

(assert (=> start!98018 (= b_free!23725 (not b_next!23725))))

(declare-fun tp!83878 () Bool)

(declare-fun b_and!38211 () Bool)

(assert (=> start!98018 (= tp!83878 b_and!38211)))

(declare-fun e!640233 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1124693 () Bool)

(declare-datatypes ((V!42801 0))(
  ( (V!42802 (val!14184 Int)) )
))
(declare-datatypes ((tuple2!17908 0))(
  ( (tuple2!17909 (_1!8965 (_ BitVec 64)) (_2!8965 V!42801)) )
))
(declare-datatypes ((List!24670 0))(
  ( (Nil!24667) (Cons!24666 (h!25875 tuple2!17908) (t!35378 List!24670)) )
))
(declare-datatypes ((ListLongMap!15877 0))(
  ( (ListLongMap!15878 (toList!7954 List!24670)) )
))
(declare-fun call!47435 () ListLongMap!15877)

(declare-fun call!47434 () ListLongMap!15877)

(declare-fun -!1089 (ListLongMap!15877 (_ BitVec 64)) ListLongMap!15877)

(assert (=> b!1124693 (= e!640233 (= call!47434 (-!1089 call!47435 k0!934)))))

(declare-fun zeroValue!944 () V!42801)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!73300 0))(
  ( (array!73301 (arr!35303 (Array (_ BitVec 32) (_ BitVec 64))) (size!35841 (_ BitVec 32))) )
))
(declare-fun lt!499411 () array!73300)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13418 0))(
  ( (ValueCellFull!13418 (v!16816 V!42801)) (EmptyCell!13418) )
))
(declare-datatypes ((array!73302 0))(
  ( (array!73303 (arr!35304 (Array (_ BitVec 32) ValueCell!13418)) (size!35842 (_ BitVec 32))) )
))
(declare-fun lt!499409 () array!73302)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47431 () Bool)

(declare-fun minValue!944 () V!42801)

(declare-fun getCurrentListMapNoExtraKeys!4459 (array!73300 array!73302 (_ BitVec 32) (_ BitVec 32) V!42801 V!42801 (_ BitVec 32) Int) ListLongMap!15877)

(assert (=> bm!47431 (= call!47434 (getCurrentListMapNoExtraKeys!4459 lt!499411 lt!499409 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124694 () Bool)

(declare-fun e!640224 () Bool)

(declare-fun e!640230 () Bool)

(assert (=> b!1124694 (= e!640224 e!640230)))

(declare-fun res!751515 () Bool)

(assert (=> b!1124694 (=> (not res!751515) (not e!640230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73300 (_ BitVec 32)) Bool)

(assert (=> b!1124694 (= res!751515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499411 mask!1564))))

(declare-fun _keys!1208 () array!73300)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124694 (= lt!499411 (array!73301 (store (arr!35303 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35841 _keys!1208)))))

(declare-fun b!1124695 () Bool)

(declare-fun res!751514 () Bool)

(assert (=> b!1124695 (=> (not res!751514) (not e!640224))))

(declare-fun _values!996 () array!73302)

(assert (=> b!1124695 (= res!751514 (and (= (size!35842 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35841 _keys!1208) (size!35842 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1124696 () Bool)

(declare-fun res!751504 () Bool)

(assert (=> b!1124696 (=> (not res!751504) (not e!640224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124696 (= res!751504 (validKeyInArray!0 k0!934))))

(declare-fun b!1124697 () Bool)

(declare-fun res!751505 () Bool)

(assert (=> b!1124697 (=> (not res!751505) (not e!640224))))

(declare-datatypes ((List!24671 0))(
  ( (Nil!24668) (Cons!24667 (h!25876 (_ BitVec 64)) (t!35379 List!24671)) )
))
(declare-fun arrayNoDuplicates!0 (array!73300 (_ BitVec 32) List!24671) Bool)

(assert (=> b!1124697 (= res!751505 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24668))))

(declare-fun b!1124698 () Bool)

(declare-fun e!640227 () Bool)

(declare-fun e!640228 () Bool)

(declare-fun mapRes!44200 () Bool)

(assert (=> b!1124698 (= e!640227 (and e!640228 mapRes!44200))))

(declare-fun condMapEmpty!44200 () Bool)

(declare-fun mapDefault!44200 () ValueCell!13418)

(assert (=> b!1124698 (= condMapEmpty!44200 (= (arr!35304 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13418)) mapDefault!44200)))))

(declare-fun b!1124699 () Bool)

(declare-fun res!751506 () Bool)

(assert (=> b!1124699 (=> (not res!751506) (not e!640224))))

(assert (=> b!1124699 (= res!751506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!44200 () Bool)

(declare-fun tp!83879 () Bool)

(declare-fun e!640226 () Bool)

(assert (=> mapNonEmpty!44200 (= mapRes!44200 (and tp!83879 e!640226))))

(declare-fun mapKey!44200 () (_ BitVec 32))

(declare-fun mapRest!44200 () (Array (_ BitVec 32) ValueCell!13418))

(declare-fun mapValue!44200 () ValueCell!13418)

(assert (=> mapNonEmpty!44200 (= (arr!35304 _values!996) (store mapRest!44200 mapKey!44200 mapValue!44200))))

(declare-fun b!1124701 () Bool)

(declare-fun res!751516 () Bool)

(declare-fun e!640225 () Bool)

(assert (=> b!1124701 (=> res!751516 e!640225)))

(assert (=> b!1124701 (= res!751516 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!47432 () Bool)

(assert (=> bm!47432 (= call!47435 (getCurrentListMapNoExtraKeys!4459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124702 () Bool)

(declare-fun res!751511 () Bool)

(assert (=> b!1124702 (=> (not res!751511) (not e!640224))))

(assert (=> b!1124702 (= res!751511 (= (select (arr!35303 _keys!1208) i!673) k0!934))))

(declare-fun b!1124703 () Bool)

(declare-fun e!640231 () Bool)

(declare-fun e!640232 () Bool)

(assert (=> b!1124703 (= e!640231 e!640232)))

(declare-fun res!751508 () Bool)

(assert (=> b!1124703 (=> res!751508 e!640232)))

(assert (=> b!1124703 (= res!751508 (not (= (select (arr!35303 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1124703 e!640233))

(declare-fun c!109551 () Bool)

(assert (=> b!1124703 (= c!109551 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36719 0))(
  ( (Unit!36720) )
))
(declare-fun lt!499414 () Unit!36719)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!366 (array!73300 array!73302 (_ BitVec 32) (_ BitVec 32) V!42801 V!42801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36719)

(assert (=> b!1124703 (= lt!499414 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!366 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124704 () Bool)

(assert (=> b!1124704 (= e!640225 true)))

(declare-fun lt!499416 () ListLongMap!15877)

(declare-fun contains!6425 (ListLongMap!15877 (_ BitVec 64)) Bool)

(declare-fun +!3456 (ListLongMap!15877 tuple2!17908) ListLongMap!15877)

(assert (=> b!1124704 (contains!6425 (+!3456 lt!499416 (tuple2!17909 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499415 () Unit!36719)

(declare-fun addStillContains!674 (ListLongMap!15877 (_ BitVec 64) V!42801 (_ BitVec 64)) Unit!36719)

(assert (=> b!1124704 (= lt!499415 (addStillContains!674 lt!499416 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1124705 () Bool)

(declare-fun tp_is_empty!28255 () Bool)

(assert (=> b!1124705 (= e!640226 tp_is_empty!28255)))

(declare-fun b!1124706 () Bool)

(declare-fun res!751513 () Bool)

(assert (=> b!1124706 (=> (not res!751513) (not e!640230))))

(assert (=> b!1124706 (= res!751513 (arrayNoDuplicates!0 lt!499411 #b00000000000000000000000000000000 Nil!24668))))

(declare-fun b!1124707 () Bool)

(assert (=> b!1124707 (= e!640233 (= call!47434 call!47435))))

(declare-fun b!1124708 () Bool)

(declare-fun res!751509 () Bool)

(assert (=> b!1124708 (=> (not res!751509) (not e!640224))))

(assert (=> b!1124708 (= res!751509 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35841 _keys!1208))))))

(declare-fun b!1124709 () Bool)

(assert (=> b!1124709 (= e!640232 e!640225)))

(declare-fun res!751503 () Bool)

(assert (=> b!1124709 (=> res!751503 e!640225)))

(assert (=> b!1124709 (= res!751503 (not (contains!6425 lt!499416 k0!934)))))

(assert (=> b!1124709 (= lt!499416 (getCurrentListMapNoExtraKeys!4459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124710 () Bool)

(declare-fun e!640229 () Bool)

(assert (=> b!1124710 (= e!640229 e!640231)))

(declare-fun res!751512 () Bool)

(assert (=> b!1124710 (=> res!751512 e!640231)))

(assert (=> b!1124710 (= res!751512 (not (= from!1455 i!673)))))

(declare-fun lt!499413 () ListLongMap!15877)

(assert (=> b!1124710 (= lt!499413 (getCurrentListMapNoExtraKeys!4459 lt!499411 lt!499409 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2482 (Int (_ BitVec 64)) V!42801)

(assert (=> b!1124710 (= lt!499409 (array!73303 (store (arr!35304 _values!996) i!673 (ValueCellFull!13418 (dynLambda!2482 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35842 _values!996)))))

(declare-fun lt!499412 () ListLongMap!15877)

(assert (=> b!1124710 (= lt!499412 (getCurrentListMapNoExtraKeys!4459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124711 () Bool)

(assert (=> b!1124711 (= e!640230 (not e!640229))))

(declare-fun res!751510 () Bool)

(assert (=> b!1124711 (=> res!751510 e!640229)))

(assert (=> b!1124711 (= res!751510 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73300 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124711 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499410 () Unit!36719)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73300 (_ BitVec 64) (_ BitVec 32)) Unit!36719)

(assert (=> b!1124711 (= lt!499410 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!44200 () Bool)

(assert (=> mapIsEmpty!44200 mapRes!44200))

(declare-fun b!1124712 () Bool)

(assert (=> b!1124712 (= e!640228 tp_is_empty!28255)))

(declare-fun b!1124700 () Bool)

(declare-fun res!751507 () Bool)

(assert (=> b!1124700 (=> (not res!751507) (not e!640224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124700 (= res!751507 (validMask!0 mask!1564))))

(declare-fun res!751502 () Bool)

(assert (=> start!98018 (=> (not res!751502) (not e!640224))))

(assert (=> start!98018 (= res!751502 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35841 _keys!1208))))))

(assert (=> start!98018 e!640224))

(assert (=> start!98018 tp_is_empty!28255))

(declare-fun array_inv!27172 (array!73300) Bool)

(assert (=> start!98018 (array_inv!27172 _keys!1208)))

(assert (=> start!98018 true))

(assert (=> start!98018 tp!83878))

(declare-fun array_inv!27173 (array!73302) Bool)

(assert (=> start!98018 (and (array_inv!27173 _values!996) e!640227)))

(assert (= (and start!98018 res!751502) b!1124700))

(assert (= (and b!1124700 res!751507) b!1124695))

(assert (= (and b!1124695 res!751514) b!1124699))

(assert (= (and b!1124699 res!751506) b!1124697))

(assert (= (and b!1124697 res!751505) b!1124708))

(assert (= (and b!1124708 res!751509) b!1124696))

(assert (= (and b!1124696 res!751504) b!1124702))

(assert (= (and b!1124702 res!751511) b!1124694))

(assert (= (and b!1124694 res!751515) b!1124706))

(assert (= (and b!1124706 res!751513) b!1124711))

(assert (= (and b!1124711 (not res!751510)) b!1124710))

(assert (= (and b!1124710 (not res!751512)) b!1124703))

(assert (= (and b!1124703 c!109551) b!1124693))

(assert (= (and b!1124703 (not c!109551)) b!1124707))

(assert (= (or b!1124693 b!1124707) bm!47431))

(assert (= (or b!1124693 b!1124707) bm!47432))

(assert (= (and b!1124703 (not res!751508)) b!1124709))

(assert (= (and b!1124709 (not res!751503)) b!1124701))

(assert (= (and b!1124701 (not res!751516)) b!1124704))

(assert (= (and b!1124698 condMapEmpty!44200) mapIsEmpty!44200))

(assert (= (and b!1124698 (not condMapEmpty!44200)) mapNonEmpty!44200))

(get-info :version)

(assert (= (and mapNonEmpty!44200 ((_ is ValueCellFull!13418) mapValue!44200)) b!1124705))

(assert (= (and b!1124698 ((_ is ValueCellFull!13418) mapDefault!44200)) b!1124712))

(assert (= start!98018 b!1124698))

(declare-fun b_lambda!18677 () Bool)

(assert (=> (not b_lambda!18677) (not b!1124710)))

(declare-fun t!35377 () Bool)

(declare-fun tb!8529 () Bool)

(assert (=> (and start!98018 (= defaultEntry!1004 defaultEntry!1004) t!35377) tb!8529))

(declare-fun result!17627 () Bool)

(assert (=> tb!8529 (= result!17627 tp_is_empty!28255)))

(assert (=> b!1124710 t!35377))

(declare-fun b_and!38213 () Bool)

(assert (= b_and!38211 (and (=> t!35377 result!17627) b_and!38213)))

(declare-fun m!1038429 () Bool)

(assert (=> b!1124693 m!1038429))

(declare-fun m!1038431 () Bool)

(assert (=> b!1124700 m!1038431))

(declare-fun m!1038433 () Bool)

(assert (=> b!1124702 m!1038433))

(declare-fun m!1038435 () Bool)

(assert (=> b!1124696 m!1038435))

(declare-fun m!1038437 () Bool)

(assert (=> b!1124710 m!1038437))

(declare-fun m!1038439 () Bool)

(assert (=> b!1124710 m!1038439))

(declare-fun m!1038441 () Bool)

(assert (=> b!1124710 m!1038441))

(declare-fun m!1038443 () Bool)

(assert (=> b!1124710 m!1038443))

(declare-fun m!1038445 () Bool)

(assert (=> b!1124694 m!1038445))

(declare-fun m!1038447 () Bool)

(assert (=> b!1124694 m!1038447))

(declare-fun m!1038449 () Bool)

(assert (=> b!1124706 m!1038449))

(declare-fun m!1038451 () Bool)

(assert (=> bm!47432 m!1038451))

(declare-fun m!1038453 () Bool)

(assert (=> b!1124699 m!1038453))

(declare-fun m!1038455 () Bool)

(assert (=> b!1124704 m!1038455))

(assert (=> b!1124704 m!1038455))

(declare-fun m!1038457 () Bool)

(assert (=> b!1124704 m!1038457))

(declare-fun m!1038459 () Bool)

(assert (=> b!1124704 m!1038459))

(declare-fun m!1038461 () Bool)

(assert (=> bm!47431 m!1038461))

(declare-fun m!1038463 () Bool)

(assert (=> b!1124703 m!1038463))

(declare-fun m!1038465 () Bool)

(assert (=> b!1124703 m!1038465))

(declare-fun m!1038467 () Bool)

(assert (=> b!1124711 m!1038467))

(declare-fun m!1038469 () Bool)

(assert (=> b!1124711 m!1038469))

(declare-fun m!1038471 () Bool)

(assert (=> start!98018 m!1038471))

(declare-fun m!1038473 () Bool)

(assert (=> start!98018 m!1038473))

(declare-fun m!1038475 () Bool)

(assert (=> b!1124709 m!1038475))

(assert (=> b!1124709 m!1038451))

(declare-fun m!1038477 () Bool)

(assert (=> mapNonEmpty!44200 m!1038477))

(declare-fun m!1038479 () Bool)

(assert (=> b!1124697 m!1038479))

(check-sat b_and!38213 (not b_next!23725) (not b!1124700) (not b!1124693) (not b!1124710) (not bm!47432) (not b!1124696) (not mapNonEmpty!44200) tp_is_empty!28255 (not b!1124694) (not b!1124704) (not b!1124697) (not b!1124706) (not b_lambda!18677) (not b!1124703) (not start!98018) (not b!1124709) (not b!1124711) (not b!1124699) (not bm!47431))
(check-sat b_and!38213 (not b_next!23725))
