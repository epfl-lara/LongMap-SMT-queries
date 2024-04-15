; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98042 () Bool)

(assert start!98042)

(declare-fun b_free!23749 () Bool)

(declare-fun b_next!23749 () Bool)

(assert (=> start!98042 (= b_free!23749 (not b_next!23749))))

(declare-fun tp!83951 () Bool)

(declare-fun b_and!38259 () Bool)

(assert (=> start!98042 (= tp!83951 b_and!38259)))

(declare-fun b!1125433 () Bool)

(declare-fun e!640621 () Bool)

(declare-datatypes ((V!42833 0))(
  ( (V!42834 (val!14196 Int)) )
))
(declare-datatypes ((tuple2!17932 0))(
  ( (tuple2!17933 (_1!8977 (_ BitVec 64)) (_2!8977 V!42833)) )
))
(declare-datatypes ((List!24693 0))(
  ( (Nil!24690) (Cons!24689 (h!25898 tuple2!17932) (t!35425 List!24693)) )
))
(declare-datatypes ((ListLongMap!15901 0))(
  ( (ListLongMap!15902 (toList!7966 List!24693)) )
))
(declare-fun call!47507 () ListLongMap!15901)

(declare-fun call!47506 () ListLongMap!15901)

(assert (=> b!1125433 (= e!640621 (= call!47507 call!47506))))

(declare-fun b!1125434 () Bool)

(declare-fun res!752047 () Bool)

(declare-fun e!640623 () Bool)

(assert (=> b!1125434 (=> (not res!752047) (not e!640623))))

(declare-datatypes ((array!73348 0))(
  ( (array!73349 (arr!35327 (Array (_ BitVec 32) (_ BitVec 64))) (size!35865 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73348)

(declare-datatypes ((List!24694 0))(
  ( (Nil!24691) (Cons!24690 (h!25899 (_ BitVec 64)) (t!35426 List!24694)) )
))
(declare-fun arrayNoDuplicates!0 (array!73348 (_ BitVec 32) List!24694) Bool)

(assert (=> b!1125434 (= res!752047 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24691))))

(declare-fun b!1125435 () Bool)

(declare-fun res!752039 () Bool)

(declare-fun e!640617 () Bool)

(assert (=> b!1125435 (=> (not res!752039) (not e!640617))))

(declare-fun lt!499701 () array!73348)

(assert (=> b!1125435 (= res!752039 (arrayNoDuplicates!0 lt!499701 #b00000000000000000000000000000000 Nil!24691))))

(declare-fun mapNonEmpty!44236 () Bool)

(declare-fun mapRes!44236 () Bool)

(declare-fun tp!83950 () Bool)

(declare-fun e!640620 () Bool)

(assert (=> mapNonEmpty!44236 (= mapRes!44236 (and tp!83950 e!640620))))

(declare-datatypes ((ValueCell!13430 0))(
  ( (ValueCellFull!13430 (v!16828 V!42833)) (EmptyCell!13430) )
))
(declare-datatypes ((array!73350 0))(
  ( (array!73351 (arr!35328 (Array (_ BitVec 32) ValueCell!13430)) (size!35866 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73350)

(declare-fun mapRest!44236 () (Array (_ BitVec 32) ValueCell!13430))

(declare-fun mapValue!44236 () ValueCell!13430)

(declare-fun mapKey!44236 () (_ BitVec 32))

(assert (=> mapNonEmpty!44236 (= (arr!35328 _values!996) (store mapRest!44236 mapKey!44236 mapValue!44236))))

(declare-fun b!1125436 () Bool)

(declare-fun e!640625 () Bool)

(assert (=> b!1125436 (= e!640625 true)))

(declare-fun zeroValue!944 () V!42833)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!499695 () Bool)

(declare-fun minValue!944 () V!42833)

(declare-fun contains!6435 (ListLongMap!15901 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4470 (array!73348 array!73350 (_ BitVec 32) (_ BitVec 32) V!42833 V!42833 (_ BitVec 32) Int) ListLongMap!15901)

(assert (=> b!1125436 (= lt!499695 (contains!6435 (getCurrentListMapNoExtraKeys!4470 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1125437 () Bool)

(declare-fun res!752045 () Bool)

(assert (=> b!1125437 (=> (not res!752045) (not e!640623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125437 (= res!752045 (validKeyInArray!0 k0!934))))

(declare-fun b!1125438 () Bool)

(declare-fun res!752048 () Bool)

(assert (=> b!1125438 (=> (not res!752048) (not e!640623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125438 (= res!752048 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44236 () Bool)

(assert (=> mapIsEmpty!44236 mapRes!44236))

(declare-fun b!1125440 () Bool)

(declare-fun e!640618 () Bool)

(assert (=> b!1125440 (= e!640618 e!640625)))

(declare-fun res!752041 () Bool)

(assert (=> b!1125440 (=> res!752041 e!640625)))

(assert (=> b!1125440 (= res!752041 (not (= (select (arr!35327 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1125440 e!640621))

(declare-fun c!109587 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125440 (= c!109587 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36739 0))(
  ( (Unit!36740) )
))
(declare-fun lt!499696 () Unit!36739)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!376 (array!73348 array!73350 (_ BitVec 32) (_ BitVec 32) V!42833 V!42833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36739)

(assert (=> b!1125440 (= lt!499696 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!376 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125441 () Bool)

(declare-fun res!752038 () Bool)

(assert (=> b!1125441 (=> (not res!752038) (not e!640623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73348 (_ BitVec 32)) Bool)

(assert (=> b!1125441 (= res!752038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125442 () Bool)

(declare-fun res!752040 () Bool)

(assert (=> b!1125442 (=> (not res!752040) (not e!640623))))

(assert (=> b!1125442 (= res!752040 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35865 _keys!1208))))))

(declare-fun bm!47503 () Bool)

(assert (=> bm!47503 (= call!47506 (getCurrentListMapNoExtraKeys!4470 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125443 () Bool)

(declare-fun -!1096 (ListLongMap!15901 (_ BitVec 64)) ListLongMap!15901)

(assert (=> b!1125443 (= e!640621 (= call!47507 (-!1096 call!47506 k0!934)))))

(declare-fun b!1125439 () Bool)

(declare-fun e!640624 () Bool)

(declare-fun tp_is_empty!28279 () Bool)

(assert (=> b!1125439 (= e!640624 tp_is_empty!28279)))

(declare-fun res!752042 () Bool)

(assert (=> start!98042 (=> (not res!752042) (not e!640623))))

(assert (=> start!98042 (= res!752042 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35865 _keys!1208))))))

(assert (=> start!98042 e!640623))

(assert (=> start!98042 tp_is_empty!28279))

(declare-fun array_inv!27190 (array!73348) Bool)

(assert (=> start!98042 (array_inv!27190 _keys!1208)))

(assert (=> start!98042 true))

(assert (=> start!98042 tp!83951))

(declare-fun e!640619 () Bool)

(declare-fun array_inv!27191 (array!73350) Bool)

(assert (=> start!98042 (and (array_inv!27191 _values!996) e!640619)))

(declare-fun b!1125444 () Bool)

(declare-fun res!752049 () Bool)

(assert (=> b!1125444 (=> (not res!752049) (not e!640623))))

(assert (=> b!1125444 (= res!752049 (and (= (size!35866 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35865 _keys!1208) (size!35866 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125445 () Bool)

(declare-fun res!752046 () Bool)

(assert (=> b!1125445 (=> (not res!752046) (not e!640623))))

(assert (=> b!1125445 (= res!752046 (= (select (arr!35327 _keys!1208) i!673) k0!934))))

(declare-fun b!1125446 () Bool)

(declare-fun e!640622 () Bool)

(assert (=> b!1125446 (= e!640622 e!640618)))

(declare-fun res!752044 () Bool)

(assert (=> b!1125446 (=> res!752044 e!640618)))

(assert (=> b!1125446 (= res!752044 (not (= from!1455 i!673)))))

(declare-fun lt!499700 () ListLongMap!15901)

(declare-fun lt!499697 () array!73350)

(assert (=> b!1125446 (= lt!499700 (getCurrentListMapNoExtraKeys!4470 lt!499701 lt!499697 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2488 (Int (_ BitVec 64)) V!42833)

(assert (=> b!1125446 (= lt!499697 (array!73351 (store (arr!35328 _values!996) i!673 (ValueCellFull!13430 (dynLambda!2488 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35866 _values!996)))))

(declare-fun lt!499698 () ListLongMap!15901)

(assert (=> b!1125446 (= lt!499698 (getCurrentListMapNoExtraKeys!4470 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125447 () Bool)

(assert (=> b!1125447 (= e!640619 (and e!640624 mapRes!44236))))

(declare-fun condMapEmpty!44236 () Bool)

(declare-fun mapDefault!44236 () ValueCell!13430)

(assert (=> b!1125447 (= condMapEmpty!44236 (= (arr!35328 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13430)) mapDefault!44236)))))

(declare-fun b!1125448 () Bool)

(assert (=> b!1125448 (= e!640617 (not e!640622))))

(declare-fun res!752043 () Bool)

(assert (=> b!1125448 (=> res!752043 e!640622)))

(assert (=> b!1125448 (= res!752043 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125448 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499699 () Unit!36739)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73348 (_ BitVec 64) (_ BitVec 32)) Unit!36739)

(assert (=> b!1125448 (= lt!499699 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1125449 () Bool)

(assert (=> b!1125449 (= e!640620 tp_is_empty!28279)))

(declare-fun bm!47504 () Bool)

(assert (=> bm!47504 (= call!47507 (getCurrentListMapNoExtraKeys!4470 lt!499701 lt!499697 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125450 () Bool)

(assert (=> b!1125450 (= e!640623 e!640617)))

(declare-fun res!752050 () Bool)

(assert (=> b!1125450 (=> (not res!752050) (not e!640617))))

(assert (=> b!1125450 (= res!752050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499701 mask!1564))))

(assert (=> b!1125450 (= lt!499701 (array!73349 (store (arr!35327 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35865 _keys!1208)))))

(assert (= (and start!98042 res!752042) b!1125438))

(assert (= (and b!1125438 res!752048) b!1125444))

(assert (= (and b!1125444 res!752049) b!1125441))

(assert (= (and b!1125441 res!752038) b!1125434))

(assert (= (and b!1125434 res!752047) b!1125442))

(assert (= (and b!1125442 res!752040) b!1125437))

(assert (= (and b!1125437 res!752045) b!1125445))

(assert (= (and b!1125445 res!752046) b!1125450))

(assert (= (and b!1125450 res!752050) b!1125435))

(assert (= (and b!1125435 res!752039) b!1125448))

(assert (= (and b!1125448 (not res!752043)) b!1125446))

(assert (= (and b!1125446 (not res!752044)) b!1125440))

(assert (= (and b!1125440 c!109587) b!1125443))

(assert (= (and b!1125440 (not c!109587)) b!1125433))

(assert (= (or b!1125443 b!1125433) bm!47504))

(assert (= (or b!1125443 b!1125433) bm!47503))

(assert (= (and b!1125440 (not res!752041)) b!1125436))

(assert (= (and b!1125447 condMapEmpty!44236) mapIsEmpty!44236))

(assert (= (and b!1125447 (not condMapEmpty!44236)) mapNonEmpty!44236))

(get-info :version)

(assert (= (and mapNonEmpty!44236 ((_ is ValueCellFull!13430) mapValue!44236)) b!1125449))

(assert (= (and b!1125447 ((_ is ValueCellFull!13430) mapDefault!44236)) b!1125439))

(assert (= start!98042 b!1125447))

(declare-fun b_lambda!18701 () Bool)

(assert (=> (not b_lambda!18701) (not b!1125446)))

(declare-fun t!35424 () Bool)

(declare-fun tb!8553 () Bool)

(assert (=> (and start!98042 (= defaultEntry!1004 defaultEntry!1004) t!35424) tb!8553))

(declare-fun result!17675 () Bool)

(assert (=> tb!8553 (= result!17675 tp_is_empty!28279)))

(assert (=> b!1125446 t!35424))

(declare-fun b_and!38261 () Bool)

(assert (= b_and!38259 (and (=> t!35424 result!17675) b_and!38261)))

(declare-fun m!1039053 () Bool)

(assert (=> b!1125437 m!1039053))

(declare-fun m!1039055 () Bool)

(assert (=> start!98042 m!1039055))

(declare-fun m!1039057 () Bool)

(assert (=> start!98042 m!1039057))

(declare-fun m!1039059 () Bool)

(assert (=> b!1125434 m!1039059))

(declare-fun m!1039061 () Bool)

(assert (=> b!1125441 m!1039061))

(declare-fun m!1039063 () Bool)

(assert (=> b!1125435 m!1039063))

(declare-fun m!1039065 () Bool)

(assert (=> bm!47503 m!1039065))

(declare-fun m!1039067 () Bool)

(assert (=> b!1125450 m!1039067))

(declare-fun m!1039069 () Bool)

(assert (=> b!1125450 m!1039069))

(declare-fun m!1039071 () Bool)

(assert (=> b!1125445 m!1039071))

(assert (=> b!1125436 m!1039065))

(assert (=> b!1125436 m!1039065))

(declare-fun m!1039073 () Bool)

(assert (=> b!1125436 m!1039073))

(declare-fun m!1039075 () Bool)

(assert (=> b!1125440 m!1039075))

(declare-fun m!1039077 () Bool)

(assert (=> b!1125440 m!1039077))

(declare-fun m!1039079 () Bool)

(assert (=> b!1125443 m!1039079))

(declare-fun m!1039081 () Bool)

(assert (=> mapNonEmpty!44236 m!1039081))

(declare-fun m!1039083 () Bool)

(assert (=> b!1125438 m!1039083))

(declare-fun m!1039085 () Bool)

(assert (=> bm!47504 m!1039085))

(declare-fun m!1039087 () Bool)

(assert (=> b!1125446 m!1039087))

(declare-fun m!1039089 () Bool)

(assert (=> b!1125446 m!1039089))

(declare-fun m!1039091 () Bool)

(assert (=> b!1125446 m!1039091))

(declare-fun m!1039093 () Bool)

(assert (=> b!1125446 m!1039093))

(declare-fun m!1039095 () Bool)

(assert (=> b!1125448 m!1039095))

(declare-fun m!1039097 () Bool)

(assert (=> b!1125448 m!1039097))

(check-sat (not b!1125441) (not b!1125443) (not b!1125437) tp_is_empty!28279 (not b_next!23749) (not start!98042) (not b!1125434) (not bm!47504) (not b!1125440) (not mapNonEmpty!44236) b_and!38261 (not b!1125448) (not b_lambda!18701) (not bm!47503) (not b!1125435) (not b!1125446) (not b!1125438) (not b!1125436) (not b!1125450))
(check-sat b_and!38261 (not b_next!23749))
