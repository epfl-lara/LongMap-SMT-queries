; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97564 () Bool)

(assert start!97564)

(declare-fun b_free!23299 () Bool)

(declare-fun b_next!23299 () Bool)

(assert (=> start!97564 (= b_free!23299 (not b_next!23299))))

(declare-fun tp!82195 () Bool)

(declare-fun b_and!37441 () Bool)

(assert (=> start!97564 (= tp!82195 b_and!37441)))

(declare-fun b!1110184 () Bool)

(declare-fun res!740526 () Bool)

(declare-fun e!633384 () Bool)

(assert (=> b!1110184 (=> (not res!740526) (not e!633384))))

(declare-datatypes ((array!72069 0))(
  ( (array!72070 (arr!34681 (Array (_ BitVec 32) (_ BitVec 64))) (size!35218 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72069)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72069 (_ BitVec 32)) Bool)

(assert (=> b!1110184 (= res!740526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110185 () Bool)

(declare-fun e!633387 () Bool)

(declare-fun e!633389 () Bool)

(declare-fun mapRes!43156 () Bool)

(assert (=> b!1110185 (= e!633387 (and e!633389 mapRes!43156))))

(declare-fun condMapEmpty!43156 () Bool)

(declare-datatypes ((V!41873 0))(
  ( (V!41874 (val!13836 Int)) )
))
(declare-datatypes ((ValueCell!13070 0))(
  ( (ValueCellFull!13070 (v!16465 V!41873)) (EmptyCell!13070) )
))
(declare-datatypes ((array!72071 0))(
  ( (array!72072 (arr!34682 (Array (_ BitVec 32) ValueCell!13070)) (size!35219 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72071)

(declare-fun mapDefault!43156 () ValueCell!13070)

(assert (=> b!1110185 (= condMapEmpty!43156 (= (arr!34682 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13070)) mapDefault!43156)))))

(declare-fun b!1110186 () Bool)

(declare-fun res!740523 () Bool)

(declare-fun e!633386 () Bool)

(assert (=> b!1110186 (=> (not res!740523) (not e!633386))))

(declare-fun lt!496398 () array!72069)

(declare-datatypes ((List!24181 0))(
  ( (Nil!24178) (Cons!24177 (h!25395 (_ BitVec 64)) (t!34518 List!24181)) )
))
(declare-fun arrayNoDuplicates!0 (array!72069 (_ BitVec 32) List!24181) Bool)

(assert (=> b!1110186 (= res!740523 (arrayNoDuplicates!0 lt!496398 #b00000000000000000000000000000000 Nil!24178))))

(declare-fun b!1110187 () Bool)

(declare-fun res!740529 () Bool)

(assert (=> b!1110187 (=> (not res!740529) (not e!633384))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110187 (= res!740529 (validKeyInArray!0 k0!934))))

(declare-fun res!740524 () Bool)

(assert (=> start!97564 (=> (not res!740524) (not e!633384))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97564 (= res!740524 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35218 _keys!1208))))))

(assert (=> start!97564 e!633384))

(declare-fun tp_is_empty!27559 () Bool)

(assert (=> start!97564 tp_is_empty!27559))

(declare-fun array_inv!26722 (array!72069) Bool)

(assert (=> start!97564 (array_inv!26722 _keys!1208)))

(assert (=> start!97564 true))

(assert (=> start!97564 tp!82195))

(declare-fun array_inv!26723 (array!72071) Bool)

(assert (=> start!97564 (and (array_inv!26723 _values!996) e!633387)))

(declare-fun mapNonEmpty!43156 () Bool)

(declare-fun tp!82196 () Bool)

(declare-fun e!633388 () Bool)

(assert (=> mapNonEmpty!43156 (= mapRes!43156 (and tp!82196 e!633388))))

(declare-fun mapKey!43156 () (_ BitVec 32))

(declare-fun mapValue!43156 () ValueCell!13070)

(declare-fun mapRest!43156 () (Array (_ BitVec 32) ValueCell!13070))

(assert (=> mapNonEmpty!43156 (= (arr!34682 _values!996) (store mapRest!43156 mapKey!43156 mapValue!43156))))

(declare-fun b!1110188 () Bool)

(declare-fun res!740527 () Bool)

(assert (=> b!1110188 (=> (not res!740527) (not e!633384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110188 (= res!740527 (validMask!0 mask!1564))))

(declare-fun zeroValue!944 () V!41873)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17494 0))(
  ( (tuple2!17495 (_1!8758 (_ BitVec 64)) (_2!8758 V!41873)) )
))
(declare-datatypes ((List!24182 0))(
  ( (Nil!24179) (Cons!24178 (h!25396 tuple2!17494) (t!34519 List!24182)) )
))
(declare-datatypes ((ListLongMap!15471 0))(
  ( (ListLongMap!15472 (toList!7751 List!24182)) )
))
(declare-fun call!46660 () ListLongMap!15471)

(declare-fun bm!46657 () Bool)

(declare-fun minValue!944 () V!41873)

(declare-fun getCurrentListMapNoExtraKeys!4286 (array!72069 array!72071 (_ BitVec 32) (_ BitVec 32) V!41873 V!41873 (_ BitVec 32) Int) ListLongMap!15471)

(declare-fun dynLambda!2400 (Int (_ BitVec 64)) V!41873)

(assert (=> bm!46657 (= call!46660 (getCurrentListMapNoExtraKeys!4286 lt!496398 (array!72072 (store (arr!34682 _values!996) i!673 (ValueCellFull!13070 (dynLambda!2400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35219 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46658 () Bool)

(declare-fun call!46661 () ListLongMap!15471)

(assert (=> bm!46658 (= call!46661 (getCurrentListMapNoExtraKeys!4286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110189 () Bool)

(declare-fun res!740520 () Bool)

(assert (=> b!1110189 (=> (not res!740520) (not e!633384))))

(assert (=> b!1110189 (= res!740520 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24178))))

(declare-fun b!1110190 () Bool)

(declare-fun e!633385 () Bool)

(assert (=> b!1110190 (= e!633386 (not e!633385))))

(declare-fun res!740530 () Bool)

(assert (=> b!1110190 (=> res!740530 e!633385)))

(assert (=> b!1110190 (= res!740530 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35218 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110190 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36367 0))(
  ( (Unit!36368) )
))
(declare-fun lt!496397 () Unit!36367)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72069 (_ BitVec 64) (_ BitVec 32)) Unit!36367)

(assert (=> b!1110190 (= lt!496397 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110191 () Bool)

(assert (=> b!1110191 (= e!633384 e!633386)))

(declare-fun res!740525 () Bool)

(assert (=> b!1110191 (=> (not res!740525) (not e!633386))))

(assert (=> b!1110191 (= res!740525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496398 mask!1564))))

(assert (=> b!1110191 (= lt!496398 (array!72070 (store (arr!34681 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35218 _keys!1208)))))

(declare-fun b!1110192 () Bool)

(declare-fun res!740521 () Bool)

(assert (=> b!1110192 (=> (not res!740521) (not e!633384))))

(assert (=> b!1110192 (= res!740521 (= (select (arr!34681 _keys!1208) i!673) k0!934))))

(declare-fun b!1110193 () Bool)

(declare-fun e!633390 () Bool)

(declare-fun -!1008 (ListLongMap!15471 (_ BitVec 64)) ListLongMap!15471)

(assert (=> b!1110193 (= e!633390 (= call!46660 (-!1008 call!46661 k0!934)))))

(declare-fun b!1110194 () Bool)

(declare-fun res!740528 () Bool)

(assert (=> b!1110194 (=> (not res!740528) (not e!633384))))

(assert (=> b!1110194 (= res!740528 (and (= (size!35219 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35218 _keys!1208) (size!35219 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110195 () Bool)

(assert (=> b!1110195 (= e!633385 true)))

(assert (=> b!1110195 e!633390))

(declare-fun c!109544 () Bool)

(assert (=> b!1110195 (= c!109544 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496399 () Unit!36367)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!279 (array!72069 array!72071 (_ BitVec 32) (_ BitVec 32) V!41873 V!41873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36367)

(assert (=> b!1110195 (= lt!496399 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!279 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110196 () Bool)

(declare-fun res!740522 () Bool)

(assert (=> b!1110196 (=> (not res!740522) (not e!633384))))

(assert (=> b!1110196 (= res!740522 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35218 _keys!1208))))))

(declare-fun b!1110197 () Bool)

(assert (=> b!1110197 (= e!633389 tp_is_empty!27559)))

(declare-fun b!1110198 () Bool)

(assert (=> b!1110198 (= e!633388 tp_is_empty!27559)))

(declare-fun b!1110199 () Bool)

(assert (=> b!1110199 (= e!633390 (= call!46660 call!46661))))

(declare-fun mapIsEmpty!43156 () Bool)

(assert (=> mapIsEmpty!43156 mapRes!43156))

(assert (= (and start!97564 res!740524) b!1110188))

(assert (= (and b!1110188 res!740527) b!1110194))

(assert (= (and b!1110194 res!740528) b!1110184))

(assert (= (and b!1110184 res!740526) b!1110189))

(assert (= (and b!1110189 res!740520) b!1110196))

(assert (= (and b!1110196 res!740522) b!1110187))

(assert (= (and b!1110187 res!740529) b!1110192))

(assert (= (and b!1110192 res!740521) b!1110191))

(assert (= (and b!1110191 res!740525) b!1110186))

(assert (= (and b!1110186 res!740523) b!1110190))

(assert (= (and b!1110190 (not res!740530)) b!1110195))

(assert (= (and b!1110195 c!109544) b!1110193))

(assert (= (and b!1110195 (not c!109544)) b!1110199))

(assert (= (or b!1110193 b!1110199) bm!46657))

(assert (= (or b!1110193 b!1110199) bm!46658))

(assert (= (and b!1110185 condMapEmpty!43156) mapIsEmpty!43156))

(assert (= (and b!1110185 (not condMapEmpty!43156)) mapNonEmpty!43156))

(get-info :version)

(assert (= (and mapNonEmpty!43156 ((_ is ValueCellFull!13070) mapValue!43156)) b!1110198))

(assert (= (and b!1110185 ((_ is ValueCellFull!13070) mapDefault!43156)) b!1110197))

(assert (= start!97564 b!1110185))

(declare-fun b_lambda!18329 () Bool)

(assert (=> (not b_lambda!18329) (not bm!46657)))

(declare-fun t!34517 () Bool)

(declare-fun tb!8157 () Bool)

(assert (=> (and start!97564 (= defaultEntry!1004 defaultEntry!1004) t!34517) tb!8157))

(declare-fun result!16883 () Bool)

(assert (=> tb!8157 (= result!16883 tp_is_empty!27559)))

(assert (=> bm!46657 t!34517))

(declare-fun b_and!37443 () Bool)

(assert (= b_and!37441 (and (=> t!34517 result!16883) b_and!37443)))

(declare-fun m!1028955 () Bool)

(assert (=> bm!46657 m!1028955))

(declare-fun m!1028957 () Bool)

(assert (=> bm!46657 m!1028957))

(declare-fun m!1028959 () Bool)

(assert (=> bm!46657 m!1028959))

(declare-fun m!1028961 () Bool)

(assert (=> b!1110191 m!1028961))

(declare-fun m!1028963 () Bool)

(assert (=> b!1110191 m!1028963))

(declare-fun m!1028965 () Bool)

(assert (=> b!1110184 m!1028965))

(declare-fun m!1028967 () Bool)

(assert (=> start!97564 m!1028967))

(declare-fun m!1028969 () Bool)

(assert (=> start!97564 m!1028969))

(declare-fun m!1028971 () Bool)

(assert (=> b!1110188 m!1028971))

(declare-fun m!1028973 () Bool)

(assert (=> b!1110195 m!1028973))

(declare-fun m!1028975 () Bool)

(assert (=> b!1110186 m!1028975))

(declare-fun m!1028977 () Bool)

(assert (=> mapNonEmpty!43156 m!1028977))

(declare-fun m!1028979 () Bool)

(assert (=> b!1110190 m!1028979))

(declare-fun m!1028981 () Bool)

(assert (=> b!1110190 m!1028981))

(declare-fun m!1028983 () Bool)

(assert (=> b!1110192 m!1028983))

(declare-fun m!1028985 () Bool)

(assert (=> b!1110187 m!1028985))

(declare-fun m!1028987 () Bool)

(assert (=> bm!46658 m!1028987))

(declare-fun m!1028989 () Bool)

(assert (=> b!1110193 m!1028989))

(declare-fun m!1028991 () Bool)

(assert (=> b!1110189 m!1028991))

(check-sat (not b_next!23299) (not b!1110191) (not b_lambda!18329) (not b!1110193) (not start!97564) (not b!1110188) (not bm!46657) (not bm!46658) (not b!1110189) (not b!1110195) (not mapNonEmpty!43156) tp_is_empty!27559 (not b!1110184) b_and!37443 (not b!1110187) (not b!1110190) (not b!1110186))
(check-sat b_and!37443 (not b_next!23299))
