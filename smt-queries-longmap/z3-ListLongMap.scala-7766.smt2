; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97342 () Bool)

(assert start!97342)

(declare-fun b_free!23313 () Bool)

(declare-fun b_next!23313 () Bool)

(assert (=> start!97342 (= b_free!23313 (not b_next!23313))))

(declare-fun tp!82237 () Bool)

(declare-fun b_and!37461 () Bool)

(assert (=> start!97342 (= tp!82237 b_and!37461)))

(declare-fun b!1109219 () Bool)

(declare-fun res!740232 () Bool)

(declare-fun e!632709 () Bool)

(assert (=> b!1109219 (=> (not res!740232) (not e!632709))))

(declare-datatypes ((array!72063 0))(
  ( (array!72064 (arr!34684 (Array (_ BitVec 32) (_ BitVec 64))) (size!35220 (_ BitVec 32))) )
))
(declare-fun lt!495947 () array!72063)

(declare-datatypes ((List!24182 0))(
  ( (Nil!24179) (Cons!24178 (h!25387 (_ BitVec 64)) (t!34541 List!24182)) )
))
(declare-fun arrayNoDuplicates!0 (array!72063 (_ BitVec 32) List!24182) Bool)

(assert (=> b!1109219 (= res!740232 (arrayNoDuplicates!0 lt!495947 #b00000000000000000000000000000000 Nil!24179))))

(declare-fun mapNonEmpty!43177 () Bool)

(declare-fun mapRes!43177 () Bool)

(declare-fun tp!82238 () Bool)

(declare-fun e!632705 () Bool)

(assert (=> mapNonEmpty!43177 (= mapRes!43177 (and tp!82238 e!632705))))

(declare-fun mapKey!43177 () (_ BitVec 32))

(declare-datatypes ((V!41891 0))(
  ( (V!41892 (val!13843 Int)) )
))
(declare-datatypes ((ValueCell!13077 0))(
  ( (ValueCellFull!13077 (v!16476 V!41891)) (EmptyCell!13077) )
))
(declare-fun mapRest!43177 () (Array (_ BitVec 32) ValueCell!13077))

(declare-datatypes ((array!72065 0))(
  ( (array!72066 (arr!34685 (Array (_ BitVec 32) ValueCell!13077)) (size!35221 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72065)

(declare-fun mapValue!43177 () ValueCell!13077)

(assert (=> mapNonEmpty!43177 (= (arr!34685 _values!996) (store mapRest!43177 mapKey!43177 mapValue!43177))))

(declare-fun b!1109220 () Bool)

(declare-fun tp_is_empty!27573 () Bool)

(assert (=> b!1109220 (= e!632705 tp_is_empty!27573)))

(declare-fun res!740238 () Bool)

(declare-fun e!632704 () Bool)

(assert (=> start!97342 (=> (not res!740238) (not e!632704))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!72063)

(assert (=> start!97342 (= res!740238 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35220 _keys!1208))))))

(assert (=> start!97342 e!632704))

(assert (=> start!97342 tp_is_empty!27573))

(declare-fun array_inv!26690 (array!72063) Bool)

(assert (=> start!97342 (array_inv!26690 _keys!1208)))

(assert (=> start!97342 true))

(assert (=> start!97342 tp!82237))

(declare-fun e!632703 () Bool)

(declare-fun array_inv!26691 (array!72065) Bool)

(assert (=> start!97342 (and (array_inv!26691 _values!996) e!632703)))

(declare-fun b!1109221 () Bool)

(declare-fun res!740236 () Bool)

(assert (=> b!1109221 (=> (not res!740236) (not e!632704))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1109221 (= res!740236 (= (select (arr!34684 _keys!1208) i!673) k0!934))))

(declare-fun b!1109222 () Bool)

(declare-fun e!632702 () Bool)

(declare-datatypes ((tuple2!17500 0))(
  ( (tuple2!17501 (_1!8761 (_ BitVec 64)) (_2!8761 V!41891)) )
))
(declare-datatypes ((List!24183 0))(
  ( (Nil!24180) (Cons!24179 (h!25388 tuple2!17500) (t!34542 List!24183)) )
))
(declare-datatypes ((ListLongMap!15469 0))(
  ( (ListLongMap!15470 (toList!7750 List!24183)) )
))
(declare-fun call!46635 () ListLongMap!15469)

(declare-fun call!46636 () ListLongMap!15469)

(declare-fun -!1026 (ListLongMap!15469 (_ BitVec 64)) ListLongMap!15469)

(assert (=> b!1109222 (= e!632702 (= call!46636 (-!1026 call!46635 k0!934)))))

(declare-fun b!1109223 () Bool)

(declare-fun res!740231 () Bool)

(assert (=> b!1109223 (=> (not res!740231) (not e!632704))))

(assert (=> b!1109223 (= res!740231 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24179))))

(declare-fun b!1109224 () Bool)

(declare-fun e!632706 () Bool)

(assert (=> b!1109224 (= e!632709 (not e!632706))))

(declare-fun res!740229 () Bool)

(assert (=> b!1109224 (=> res!740229 e!632706)))

(assert (=> b!1109224 (= res!740229 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35220 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109224 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36404 0))(
  ( (Unit!36405) )
))
(declare-fun lt!495946 () Unit!36404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72063 (_ BitVec 64) (_ BitVec 32)) Unit!36404)

(assert (=> b!1109224 (= lt!495946 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun zeroValue!944 () V!41891)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!46632 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41891)

(declare-fun getCurrentListMapNoExtraKeys!4244 (array!72063 array!72065 (_ BitVec 32) (_ BitVec 32) V!41891 V!41891 (_ BitVec 32) Int) ListLongMap!15469)

(declare-fun dynLambda!2374 (Int (_ BitVec 64)) V!41891)

(assert (=> bm!46632 (= call!46636 (getCurrentListMapNoExtraKeys!4244 lt!495947 (array!72066 (store (arr!34685 _values!996) i!673 (ValueCellFull!13077 (dynLambda!2374 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35221 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109225 () Bool)

(assert (=> b!1109225 (= e!632704 e!632709)))

(declare-fun res!740235 () Bool)

(assert (=> b!1109225 (=> (not res!740235) (not e!632709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72063 (_ BitVec 32)) Bool)

(assert (=> b!1109225 (= res!740235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495947 mask!1564))))

(assert (=> b!1109225 (= lt!495947 (array!72064 (store (arr!34684 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35220 _keys!1208)))))

(declare-fun b!1109226 () Bool)

(declare-fun res!740230 () Bool)

(assert (=> b!1109226 (=> (not res!740230) (not e!632704))))

(assert (=> b!1109226 (= res!740230 (and (= (size!35221 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35220 _keys!1208) (size!35221 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109227 () Bool)

(declare-fun res!740234 () Bool)

(assert (=> b!1109227 (=> (not res!740234) (not e!632704))))

(assert (=> b!1109227 (= res!740234 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35220 _keys!1208))))))

(declare-fun b!1109228 () Bool)

(assert (=> b!1109228 (= e!632706 true)))

(assert (=> b!1109228 e!632702))

(declare-fun c!109161 () Bool)

(assert (=> b!1109228 (= c!109161 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495945 () Unit!36404)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!271 (array!72063 array!72065 (_ BitVec 32) (_ BitVec 32) V!41891 V!41891 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36404)

(assert (=> b!1109228 (= lt!495945 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!271 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43177 () Bool)

(assert (=> mapIsEmpty!43177 mapRes!43177))

(declare-fun b!1109229 () Bool)

(declare-fun res!740237 () Bool)

(assert (=> b!1109229 (=> (not res!740237) (not e!632704))))

(assert (=> b!1109229 (= res!740237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109230 () Bool)

(declare-fun res!740239 () Bool)

(assert (=> b!1109230 (=> (not res!740239) (not e!632704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109230 (= res!740239 (validKeyInArray!0 k0!934))))

(declare-fun b!1109231 () Bool)

(declare-fun e!632708 () Bool)

(assert (=> b!1109231 (= e!632703 (and e!632708 mapRes!43177))))

(declare-fun condMapEmpty!43177 () Bool)

(declare-fun mapDefault!43177 () ValueCell!13077)

(assert (=> b!1109231 (= condMapEmpty!43177 (= (arr!34685 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13077)) mapDefault!43177)))))

(declare-fun b!1109232 () Bool)

(assert (=> b!1109232 (= e!632708 tp_is_empty!27573)))

(declare-fun b!1109233 () Bool)

(declare-fun res!740233 () Bool)

(assert (=> b!1109233 (=> (not res!740233) (not e!632704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109233 (= res!740233 (validMask!0 mask!1564))))

(declare-fun bm!46633 () Bool)

(assert (=> bm!46633 (= call!46635 (getCurrentListMapNoExtraKeys!4244 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109234 () Bool)

(assert (=> b!1109234 (= e!632702 (= call!46636 call!46635))))

(assert (= (and start!97342 res!740238) b!1109233))

(assert (= (and b!1109233 res!740233) b!1109226))

(assert (= (and b!1109226 res!740230) b!1109229))

(assert (= (and b!1109229 res!740237) b!1109223))

(assert (= (and b!1109223 res!740231) b!1109227))

(assert (= (and b!1109227 res!740234) b!1109230))

(assert (= (and b!1109230 res!740239) b!1109221))

(assert (= (and b!1109221 res!740236) b!1109225))

(assert (= (and b!1109225 res!740235) b!1109219))

(assert (= (and b!1109219 res!740232) b!1109224))

(assert (= (and b!1109224 (not res!740229)) b!1109228))

(assert (= (and b!1109228 c!109161) b!1109222))

(assert (= (and b!1109228 (not c!109161)) b!1109234))

(assert (= (or b!1109222 b!1109234) bm!46632))

(assert (= (or b!1109222 b!1109234) bm!46633))

(assert (= (and b!1109231 condMapEmpty!43177) mapIsEmpty!43177))

(assert (= (and b!1109231 (not condMapEmpty!43177)) mapNonEmpty!43177))

(get-info :version)

(assert (= (and mapNonEmpty!43177 ((_ is ValueCellFull!13077) mapValue!43177)) b!1109220))

(assert (= (and b!1109231 ((_ is ValueCellFull!13077) mapDefault!43177)) b!1109232))

(assert (= start!97342 b!1109231))

(declare-fun b_lambda!18335 () Bool)

(assert (=> (not b_lambda!18335) (not bm!46632)))

(declare-fun t!34540 () Bool)

(declare-fun tb!8179 () Bool)

(assert (=> (and start!97342 (= defaultEntry!1004 defaultEntry!1004) t!34540) tb!8179))

(declare-fun result!16919 () Bool)

(assert (=> tb!8179 (= result!16919 tp_is_empty!27573)))

(assert (=> bm!46632 t!34540))

(declare-fun b_and!37463 () Bool)

(assert (= b_and!37461 (and (=> t!34540 result!16919) b_and!37463)))

(declare-fun m!1027549 () Bool)

(assert (=> b!1109219 m!1027549))

(declare-fun m!1027551 () Bool)

(assert (=> b!1109229 m!1027551))

(declare-fun m!1027553 () Bool)

(assert (=> b!1109223 m!1027553))

(declare-fun m!1027555 () Bool)

(assert (=> b!1109230 m!1027555))

(declare-fun m!1027557 () Bool)

(assert (=> b!1109222 m!1027557))

(declare-fun m!1027559 () Bool)

(assert (=> b!1109224 m!1027559))

(declare-fun m!1027561 () Bool)

(assert (=> b!1109224 m!1027561))

(declare-fun m!1027563 () Bool)

(assert (=> start!97342 m!1027563))

(declare-fun m!1027565 () Bool)

(assert (=> start!97342 m!1027565))

(declare-fun m!1027567 () Bool)

(assert (=> b!1109228 m!1027567))

(declare-fun m!1027569 () Bool)

(assert (=> bm!46632 m!1027569))

(declare-fun m!1027571 () Bool)

(assert (=> bm!46632 m!1027571))

(declare-fun m!1027573 () Bool)

(assert (=> bm!46632 m!1027573))

(declare-fun m!1027575 () Bool)

(assert (=> b!1109221 m!1027575))

(declare-fun m!1027577 () Bool)

(assert (=> mapNonEmpty!43177 m!1027577))

(declare-fun m!1027579 () Bool)

(assert (=> b!1109233 m!1027579))

(declare-fun m!1027581 () Bool)

(assert (=> bm!46633 m!1027581))

(declare-fun m!1027583 () Bool)

(assert (=> b!1109225 m!1027583))

(declare-fun m!1027585 () Bool)

(assert (=> b!1109225 m!1027585))

(check-sat (not mapNonEmpty!43177) (not start!97342) (not b!1109228) (not b!1109229) (not b!1109225) (not b!1109230) b_and!37463 (not b_next!23313) (not b!1109222) (not bm!46632) (not b!1109233) (not b!1109224) (not b!1109223) (not b!1109219) (not b_lambda!18335) tp_is_empty!27573 (not bm!46633))
(check-sat b_and!37463 (not b_next!23313))
