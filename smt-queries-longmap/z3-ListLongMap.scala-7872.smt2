; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97970 () Bool)

(assert start!97970)

(declare-fun b_free!23677 () Bool)

(declare-fun b_next!23677 () Bool)

(assert (=> start!97970 (= b_free!23677 (not b_next!23677))))

(declare-fun tp!83735 () Bool)

(declare-fun b_and!38115 () Bool)

(assert (=> start!97970 (= tp!83735 b_and!38115)))

(declare-fun b!1123230 () Bool)

(declare-fun res!750456 () Bool)

(declare-fun e!639454 () Bool)

(assert (=> b!1123230 (=> (not res!750456) (not e!639454))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123230 (= res!750456 (validMask!0 mask!1564))))

(declare-fun res!750460 () Bool)

(assert (=> start!97970 (=> (not res!750460) (not e!639454))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73206 0))(
  ( (array!73207 (arr!35256 (Array (_ BitVec 32) (_ BitVec 64))) (size!35794 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73206)

(assert (=> start!97970 (= res!750460 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35794 _keys!1208))))))

(assert (=> start!97970 e!639454))

(declare-fun tp_is_empty!28207 () Bool)

(assert (=> start!97970 tp_is_empty!28207))

(declare-fun array_inv!27138 (array!73206) Bool)

(assert (=> start!97970 (array_inv!27138 _keys!1208)))

(assert (=> start!97970 true))

(assert (=> start!97970 tp!83735))

(declare-datatypes ((V!42737 0))(
  ( (V!42738 (val!14160 Int)) )
))
(declare-datatypes ((ValueCell!13394 0))(
  ( (ValueCellFull!13394 (v!16792 V!42737)) (EmptyCell!13394) )
))
(declare-datatypes ((array!73208 0))(
  ( (array!73209 (arr!35257 (Array (_ BitVec 32) ValueCell!13394)) (size!35795 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73208)

(declare-fun e!639452 () Bool)

(declare-fun array_inv!27139 (array!73208) Bool)

(assert (=> start!97970 (and (array_inv!27139 _values!996) e!639452)))

(declare-fun mapIsEmpty!44128 () Bool)

(declare-fun mapRes!44128 () Bool)

(assert (=> mapIsEmpty!44128 mapRes!44128))

(declare-datatypes ((tuple2!17860 0))(
  ( (tuple2!17861 (_1!8941 (_ BitVec 64)) (_2!8941 V!42737)) )
))
(declare-datatypes ((List!24625 0))(
  ( (Nil!24622) (Cons!24621 (h!25830 tuple2!17860) (t!35285 List!24625)) )
))
(declare-datatypes ((ListLongMap!15829 0))(
  ( (ListLongMap!15830 (toList!7930 List!24625)) )
))
(declare-fun call!47290 () ListLongMap!15829)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!639448 () Bool)

(declare-fun call!47291 () ListLongMap!15829)

(declare-fun b!1123231 () Bool)

(declare-fun -!1073 (ListLongMap!15829 (_ BitVec 64)) ListLongMap!15829)

(assert (=> b!1123231 (= e!639448 (= call!47290 (-!1073 call!47291 k0!934)))))

(declare-fun zeroValue!944 () V!42737)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42737)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!47287 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4437 (array!73206 array!73208 (_ BitVec 32) (_ BitVec 32) V!42737 V!42737 (_ BitVec 32) Int) ListLongMap!15829)

(assert (=> bm!47287 (= call!47291 (getCurrentListMapNoExtraKeys!4437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123232 () Bool)

(declare-fun res!750455 () Bool)

(assert (=> b!1123232 (=> (not res!750455) (not e!639454))))

(declare-datatypes ((List!24626 0))(
  ( (Nil!24623) (Cons!24622 (h!25831 (_ BitVec 64)) (t!35286 List!24626)) )
))
(declare-fun arrayNoDuplicates!0 (array!73206 (_ BitVec 32) List!24626) Bool)

(assert (=> b!1123232 (= res!750455 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24623))))

(declare-fun b!1123233 () Bool)

(declare-fun e!639451 () Bool)

(assert (=> b!1123233 (= e!639452 (and e!639451 mapRes!44128))))

(declare-fun condMapEmpty!44128 () Bool)

(declare-fun mapDefault!44128 () ValueCell!13394)

(assert (=> b!1123233 (= condMapEmpty!44128 (= (arr!35257 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13394)) mapDefault!44128)))))

(declare-fun b!1123234 () Bool)

(declare-fun res!750457 () Bool)

(declare-fun e!639449 () Bool)

(assert (=> b!1123234 (=> (not res!750457) (not e!639449))))

(declare-fun lt!498857 () array!73206)

(assert (=> b!1123234 (= res!750457 (arrayNoDuplicates!0 lt!498857 #b00000000000000000000000000000000 Nil!24623))))

(declare-fun b!1123235 () Bool)

(declare-fun res!750449 () Bool)

(assert (=> b!1123235 (=> (not res!750449) (not e!639454))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123235 (= res!750449 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35794 _keys!1208))))))

(declare-fun b!1123236 () Bool)

(assert (=> b!1123236 (= e!639454 e!639449)))

(declare-fun res!750451 () Bool)

(assert (=> b!1123236 (=> (not res!750451) (not e!639449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73206 (_ BitVec 32)) Bool)

(assert (=> b!1123236 (= res!750451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498857 mask!1564))))

(assert (=> b!1123236 (= lt!498857 (array!73207 (store (arr!35256 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35794 _keys!1208)))))

(declare-fun mapNonEmpty!44128 () Bool)

(declare-fun tp!83734 () Bool)

(declare-fun e!639447 () Bool)

(assert (=> mapNonEmpty!44128 (= mapRes!44128 (and tp!83734 e!639447))))

(declare-fun mapKey!44128 () (_ BitVec 32))

(declare-fun mapRest!44128 () (Array (_ BitVec 32) ValueCell!13394))

(declare-fun mapValue!44128 () ValueCell!13394)

(assert (=> mapNonEmpty!44128 (= (arr!35257 _values!996) (store mapRest!44128 mapKey!44128 mapValue!44128))))

(declare-fun b!1123237 () Bool)

(declare-fun res!750452 () Bool)

(assert (=> b!1123237 (=> (not res!750452) (not e!639454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123237 (= res!750452 (validKeyInArray!0 k0!934))))

(declare-fun b!1123238 () Bool)

(declare-fun res!750453 () Bool)

(declare-fun e!639453 () Bool)

(assert (=> b!1123238 (=> res!750453 e!639453)))

(declare-fun contains!6405 (ListLongMap!15829 (_ BitVec 64)) Bool)

(assert (=> b!1123238 (= res!750453 (not (contains!6405 (getCurrentListMapNoExtraKeys!4437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934)))))

(declare-fun b!1123239 () Bool)

(assert (=> b!1123239 (= e!639448 (= call!47290 call!47291))))

(declare-fun b!1123240 () Bool)

(assert (=> b!1123240 (= e!639453 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35794 _keys!1208)))))))

(declare-fun b!1123241 () Bool)

(declare-fun e!639455 () Bool)

(declare-fun e!639450 () Bool)

(assert (=> b!1123241 (= e!639455 e!639450)))

(declare-fun res!750459 () Bool)

(assert (=> b!1123241 (=> res!750459 e!639450)))

(assert (=> b!1123241 (= res!750459 (not (= from!1455 i!673)))))

(declare-fun lt!498859 () array!73208)

(declare-fun lt!498861 () ListLongMap!15829)

(assert (=> b!1123241 (= lt!498861 (getCurrentListMapNoExtraKeys!4437 lt!498857 lt!498859 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2467 (Int (_ BitVec 64)) V!42737)

(assert (=> b!1123241 (= lt!498859 (array!73209 (store (arr!35257 _values!996) i!673 (ValueCellFull!13394 (dynLambda!2467 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35795 _values!996)))))

(declare-fun lt!498860 () ListLongMap!15829)

(assert (=> b!1123241 (= lt!498860 (getCurrentListMapNoExtraKeys!4437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123242 () Bool)

(declare-fun res!750458 () Bool)

(assert (=> b!1123242 (=> (not res!750458) (not e!639454))))

(assert (=> b!1123242 (= res!750458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123243 () Bool)

(declare-fun res!750450 () Bool)

(assert (=> b!1123243 (=> (not res!750450) (not e!639454))))

(assert (=> b!1123243 (= res!750450 (= (select (arr!35256 _keys!1208) i!673) k0!934))))

(declare-fun b!1123244 () Bool)

(assert (=> b!1123244 (= e!639447 tp_is_empty!28207)))

(declare-fun b!1123245 () Bool)

(declare-fun res!750454 () Bool)

(assert (=> b!1123245 (=> (not res!750454) (not e!639454))))

(assert (=> b!1123245 (= res!750454 (and (= (size!35795 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35794 _keys!1208) (size!35795 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123246 () Bool)

(assert (=> b!1123246 (= e!639451 tp_is_empty!28207)))

(declare-fun bm!47288 () Bool)

(assert (=> bm!47288 (= call!47290 (getCurrentListMapNoExtraKeys!4437 lt!498857 lt!498859 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123247 () Bool)

(assert (=> b!1123247 (= e!639450 e!639453)))

(declare-fun res!750448 () Bool)

(assert (=> b!1123247 (=> res!750448 e!639453)))

(assert (=> b!1123247 (= res!750448 (not (= (select (arr!35256 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1123247 e!639448))

(declare-fun c!109479 () Bool)

(assert (=> b!1123247 (= c!109479 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36675 0))(
  ( (Unit!36676) )
))
(declare-fun lt!498858 () Unit!36675)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!350 (array!73206 array!73208 (_ BitVec 32) (_ BitVec 32) V!42737 V!42737 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36675)

(assert (=> b!1123247 (= lt!498858 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123248 () Bool)

(assert (=> b!1123248 (= e!639449 (not e!639455))))

(declare-fun res!750447 () Bool)

(assert (=> b!1123248 (=> res!750447 e!639455)))

(assert (=> b!1123248 (= res!750447 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123248 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498856 () Unit!36675)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73206 (_ BitVec 64) (_ BitVec 32)) Unit!36675)

(assert (=> b!1123248 (= lt!498856 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97970 res!750460) b!1123230))

(assert (= (and b!1123230 res!750456) b!1123245))

(assert (= (and b!1123245 res!750454) b!1123242))

(assert (= (and b!1123242 res!750458) b!1123232))

(assert (= (and b!1123232 res!750455) b!1123235))

(assert (= (and b!1123235 res!750449) b!1123237))

(assert (= (and b!1123237 res!750452) b!1123243))

(assert (= (and b!1123243 res!750450) b!1123236))

(assert (= (and b!1123236 res!750451) b!1123234))

(assert (= (and b!1123234 res!750457) b!1123248))

(assert (= (and b!1123248 (not res!750447)) b!1123241))

(assert (= (and b!1123241 (not res!750459)) b!1123247))

(assert (= (and b!1123247 c!109479) b!1123231))

(assert (= (and b!1123247 (not c!109479)) b!1123239))

(assert (= (or b!1123231 b!1123239) bm!47288))

(assert (= (or b!1123231 b!1123239) bm!47287))

(assert (= (and b!1123247 (not res!750448)) b!1123238))

(assert (= (and b!1123238 (not res!750453)) b!1123240))

(assert (= (and b!1123233 condMapEmpty!44128) mapIsEmpty!44128))

(assert (= (and b!1123233 (not condMapEmpty!44128)) mapNonEmpty!44128))

(get-info :version)

(assert (= (and mapNonEmpty!44128 ((_ is ValueCellFull!13394) mapValue!44128)) b!1123244))

(assert (= (and b!1123233 ((_ is ValueCellFull!13394) mapDefault!44128)) b!1123246))

(assert (= start!97970 b!1123233))

(declare-fun b_lambda!18629 () Bool)

(assert (=> (not b_lambda!18629) (not b!1123241)))

(declare-fun t!35284 () Bool)

(declare-fun tb!8481 () Bool)

(assert (=> (and start!97970 (= defaultEntry!1004 defaultEntry!1004) t!35284) tb!8481))

(declare-fun result!17531 () Bool)

(assert (=> tb!8481 (= result!17531 tp_is_empty!28207)))

(assert (=> b!1123241 t!35284))

(declare-fun b_and!38117 () Bool)

(assert (= b_and!38115 (and (=> t!35284 result!17531) b_and!38117)))

(declare-fun m!1037217 () Bool)

(assert (=> b!1123248 m!1037217))

(declare-fun m!1037219 () Bool)

(assert (=> b!1123248 m!1037219))

(declare-fun m!1037221 () Bool)

(assert (=> b!1123230 m!1037221))

(declare-fun m!1037223 () Bool)

(assert (=> b!1123231 m!1037223))

(declare-fun m!1037225 () Bool)

(assert (=> start!97970 m!1037225))

(declare-fun m!1037227 () Bool)

(assert (=> start!97970 m!1037227))

(declare-fun m!1037229 () Bool)

(assert (=> b!1123241 m!1037229))

(declare-fun m!1037231 () Bool)

(assert (=> b!1123241 m!1037231))

(declare-fun m!1037233 () Bool)

(assert (=> b!1123241 m!1037233))

(declare-fun m!1037235 () Bool)

(assert (=> b!1123241 m!1037235))

(declare-fun m!1037237 () Bool)

(assert (=> bm!47288 m!1037237))

(declare-fun m!1037239 () Bool)

(assert (=> b!1123242 m!1037239))

(declare-fun m!1037241 () Bool)

(assert (=> b!1123232 m!1037241))

(declare-fun m!1037243 () Bool)

(assert (=> b!1123238 m!1037243))

(assert (=> b!1123238 m!1037243))

(declare-fun m!1037245 () Bool)

(assert (=> b!1123238 m!1037245))

(assert (=> bm!47287 m!1037243))

(declare-fun m!1037247 () Bool)

(assert (=> b!1123236 m!1037247))

(declare-fun m!1037249 () Bool)

(assert (=> b!1123236 m!1037249))

(declare-fun m!1037251 () Bool)

(assert (=> b!1123243 m!1037251))

(declare-fun m!1037253 () Bool)

(assert (=> mapNonEmpty!44128 m!1037253))

(declare-fun m!1037255 () Bool)

(assert (=> b!1123247 m!1037255))

(declare-fun m!1037257 () Bool)

(assert (=> b!1123247 m!1037257))

(declare-fun m!1037259 () Bool)

(assert (=> b!1123234 m!1037259))

(declare-fun m!1037261 () Bool)

(assert (=> b!1123237 m!1037261))

(check-sat (not b!1123230) (not b!1123248) (not bm!47287) (not bm!47288) (not start!97970) (not b!1123238) (not b_next!23677) (not mapNonEmpty!44128) (not b!1123231) (not b!1123234) (not b!1123237) (not b!1123242) (not b_lambda!18629) (not b!1123232) (not b!1123236) (not b!1123241) (not b!1123247) tp_is_empty!28207 b_and!38117)
(check-sat b_and!38117 (not b_next!23677))
