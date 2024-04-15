; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97976 () Bool)

(assert start!97976)

(declare-fun b_free!23683 () Bool)

(declare-fun b_next!23683 () Bool)

(assert (=> start!97976 (= b_free!23683 (not b_next!23683))))

(declare-fun tp!83753 () Bool)

(declare-fun b_and!38127 () Bool)

(assert (=> start!97976 (= tp!83753 b_and!38127)))

(declare-fun b!1123405 () Bool)

(declare-fun res!750579 () Bool)

(declare-fun e!639541 () Bool)

(assert (=> b!1123405 (=> (not res!750579) (not e!639541))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73218 0))(
  ( (array!73219 (arr!35262 (Array (_ BitVec 32) (_ BitVec 64))) (size!35800 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73218)

(assert (=> b!1123405 (= res!750579 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35800 _keys!1208))))))

(declare-fun b!1123406 () Bool)

(declare-fun e!639542 () Bool)

(declare-datatypes ((V!42745 0))(
  ( (V!42746 (val!14163 Int)) )
))
(declare-datatypes ((tuple2!17866 0))(
  ( (tuple2!17867 (_1!8944 (_ BitVec 64)) (_2!8944 V!42745)) )
))
(declare-datatypes ((List!24630 0))(
  ( (Nil!24627) (Cons!24626 (h!25835 tuple2!17866) (t!35296 List!24630)) )
))
(declare-datatypes ((ListLongMap!15835 0))(
  ( (ListLongMap!15836 (toList!7933 List!24630)) )
))
(declare-fun call!47309 () ListLongMap!15835)

(declare-fun call!47308 () ListLongMap!15835)

(assert (=> b!1123406 (= e!639542 (= call!47309 call!47308))))

(declare-fun b!1123407 () Bool)

(declare-fun res!750576 () Bool)

(assert (=> b!1123407 (=> (not res!750576) (not e!639541))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123407 (= res!750576 (validMask!0 mask!1564))))

(declare-fun b!1123408 () Bool)

(declare-fun e!639538 () Bool)

(declare-fun e!639545 () Bool)

(assert (=> b!1123408 (= e!639538 e!639545)))

(declare-fun res!750582 () Bool)

(assert (=> b!1123408 (=> res!750582 e!639545)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1123408 (= res!750582 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!498913 () ListLongMap!15835)

(declare-fun lt!498914 () array!73218)

(declare-fun minValue!944 () V!42745)

(declare-datatypes ((ValueCell!13397 0))(
  ( (ValueCellFull!13397 (v!16795 V!42745)) (EmptyCell!13397) )
))
(declare-datatypes ((array!73220 0))(
  ( (array!73221 (arr!35263 (Array (_ BitVec 32) ValueCell!13397)) (size!35801 (_ BitVec 32))) )
))
(declare-fun lt!498917 () array!73220)

(declare-fun zeroValue!944 () V!42745)

(declare-fun getCurrentListMapNoExtraKeys!4440 (array!73218 array!73220 (_ BitVec 32) (_ BitVec 32) V!42745 V!42745 (_ BitVec 32) Int) ListLongMap!15835)

(assert (=> b!1123408 (= lt!498913 (getCurrentListMapNoExtraKeys!4440 lt!498914 lt!498917 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73220)

(declare-fun dynLambda!2469 (Int (_ BitVec 64)) V!42745)

(assert (=> b!1123408 (= lt!498917 (array!73221 (store (arr!35263 _values!996) i!673 (ValueCellFull!13397 (dynLambda!2469 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35801 _values!996)))))

(declare-fun lt!498918 () ListLongMap!15835)

(assert (=> b!1123408 (= lt!498918 (getCurrentListMapNoExtraKeys!4440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123409 () Bool)

(declare-fun e!639544 () Bool)

(declare-fun tp_is_empty!28213 () Bool)

(assert (=> b!1123409 (= e!639544 tp_is_empty!28213)))

(declare-fun b!1123410 () Bool)

(declare-fun res!750580 () Bool)

(assert (=> b!1123410 (=> (not res!750580) (not e!639541))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123410 (= res!750580 (validKeyInArray!0 k0!934))))

(declare-fun b!1123411 () Bool)

(declare-fun e!639539 () Bool)

(assert (=> b!1123411 (= e!639541 e!639539)))

(declare-fun res!750572 () Bool)

(assert (=> b!1123411 (=> (not res!750572) (not e!639539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73218 (_ BitVec 32)) Bool)

(assert (=> b!1123411 (= res!750572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498914 mask!1564))))

(assert (=> b!1123411 (= lt!498914 (array!73219 (store (arr!35262 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35800 _keys!1208)))))

(declare-fun b!1123413 () Bool)

(declare-fun e!639537 () Bool)

(assert (=> b!1123413 (= e!639537 true)))

(declare-fun lt!498915 () Bool)

(declare-fun contains!6408 (ListLongMap!15835 (_ BitVec 64)) Bool)

(assert (=> b!1123413 (= lt!498915 (contains!6408 (getCurrentListMapNoExtraKeys!4440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1123414 () Bool)

(declare-fun res!750574 () Bool)

(assert (=> b!1123414 (=> (not res!750574) (not e!639539))))

(declare-datatypes ((List!24631 0))(
  ( (Nil!24628) (Cons!24627 (h!25836 (_ BitVec 64)) (t!35297 List!24631)) )
))
(declare-fun arrayNoDuplicates!0 (array!73218 (_ BitVec 32) List!24631) Bool)

(assert (=> b!1123414 (= res!750574 (arrayNoDuplicates!0 lt!498914 #b00000000000000000000000000000000 Nil!24628))))

(declare-fun bm!47305 () Bool)

(assert (=> bm!47305 (= call!47308 (getCurrentListMapNoExtraKeys!4440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123415 () Bool)

(declare-fun res!750578 () Bool)

(assert (=> b!1123415 (=> (not res!750578) (not e!639541))))

(assert (=> b!1123415 (= res!750578 (= (select (arr!35262 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!44137 () Bool)

(declare-fun mapRes!44137 () Bool)

(declare-fun tp!83752 () Bool)

(assert (=> mapNonEmpty!44137 (= mapRes!44137 (and tp!83752 e!639544))))

(declare-fun mapRest!44137 () (Array (_ BitVec 32) ValueCell!13397))

(declare-fun mapKey!44137 () (_ BitVec 32))

(declare-fun mapValue!44137 () ValueCell!13397)

(assert (=> mapNonEmpty!44137 (= (arr!35263 _values!996) (store mapRest!44137 mapKey!44137 mapValue!44137))))

(declare-fun b!1123416 () Bool)

(declare-fun res!750571 () Bool)

(assert (=> b!1123416 (=> (not res!750571) (not e!639541))))

(assert (=> b!1123416 (= res!750571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123417 () Bool)

(assert (=> b!1123417 (= e!639539 (not e!639538))))

(declare-fun res!750577 () Bool)

(assert (=> b!1123417 (=> res!750577 e!639538)))

(assert (=> b!1123417 (= res!750577 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123417 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36681 0))(
  ( (Unit!36682) )
))
(declare-fun lt!498912 () Unit!36681)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73218 (_ BitVec 64) (_ BitVec 32)) Unit!36681)

(assert (=> b!1123417 (= lt!498912 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1123418 () Bool)

(declare-fun res!750575 () Bool)

(assert (=> b!1123418 (=> (not res!750575) (not e!639541))))

(assert (=> b!1123418 (= res!750575 (and (= (size!35801 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35800 _keys!1208) (size!35801 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123419 () Bool)

(declare-fun res!750573 () Bool)

(assert (=> b!1123419 (=> (not res!750573) (not e!639541))))

(assert (=> b!1123419 (= res!750573 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24628))))

(declare-fun mapIsEmpty!44137 () Bool)

(assert (=> mapIsEmpty!44137 mapRes!44137))

(declare-fun b!1123420 () Bool)

(declare-fun e!639546 () Bool)

(assert (=> b!1123420 (= e!639546 tp_is_empty!28213)))

(declare-fun b!1123421 () Bool)

(assert (=> b!1123421 (= e!639545 e!639537)))

(declare-fun res!750581 () Bool)

(assert (=> b!1123421 (=> res!750581 e!639537)))

(assert (=> b!1123421 (= res!750581 (not (= (select (arr!35262 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1123421 e!639542))

(declare-fun c!109488 () Bool)

(assert (=> b!1123421 (= c!109488 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498916 () Unit!36681)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!351 (array!73218 array!73220 (_ BitVec 32) (_ BitVec 32) V!42745 V!42745 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36681)

(assert (=> b!1123421 (= lt!498916 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123422 () Bool)

(declare-fun -!1075 (ListLongMap!15835 (_ BitVec 64)) ListLongMap!15835)

(assert (=> b!1123422 (= e!639542 (= call!47309 (-!1075 call!47308 k0!934)))))

(declare-fun bm!47306 () Bool)

(assert (=> bm!47306 (= call!47309 (getCurrentListMapNoExtraKeys!4440 lt!498914 lt!498917 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123412 () Bool)

(declare-fun e!639540 () Bool)

(assert (=> b!1123412 (= e!639540 (and e!639546 mapRes!44137))))

(declare-fun condMapEmpty!44137 () Bool)

(declare-fun mapDefault!44137 () ValueCell!13397)

(assert (=> b!1123412 (= condMapEmpty!44137 (= (arr!35263 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13397)) mapDefault!44137)))))

(declare-fun res!750583 () Bool)

(assert (=> start!97976 (=> (not res!750583) (not e!639541))))

(assert (=> start!97976 (= res!750583 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35800 _keys!1208))))))

(assert (=> start!97976 e!639541))

(assert (=> start!97976 tp_is_empty!28213))

(declare-fun array_inv!27142 (array!73218) Bool)

(assert (=> start!97976 (array_inv!27142 _keys!1208)))

(assert (=> start!97976 true))

(assert (=> start!97976 tp!83753))

(declare-fun array_inv!27143 (array!73220) Bool)

(assert (=> start!97976 (and (array_inv!27143 _values!996) e!639540)))

(assert (= (and start!97976 res!750583) b!1123407))

(assert (= (and b!1123407 res!750576) b!1123418))

(assert (= (and b!1123418 res!750575) b!1123416))

(assert (= (and b!1123416 res!750571) b!1123419))

(assert (= (and b!1123419 res!750573) b!1123405))

(assert (= (and b!1123405 res!750579) b!1123410))

(assert (= (and b!1123410 res!750580) b!1123415))

(assert (= (and b!1123415 res!750578) b!1123411))

(assert (= (and b!1123411 res!750572) b!1123414))

(assert (= (and b!1123414 res!750574) b!1123417))

(assert (= (and b!1123417 (not res!750577)) b!1123408))

(assert (= (and b!1123408 (not res!750582)) b!1123421))

(assert (= (and b!1123421 c!109488) b!1123422))

(assert (= (and b!1123421 (not c!109488)) b!1123406))

(assert (= (or b!1123422 b!1123406) bm!47306))

(assert (= (or b!1123422 b!1123406) bm!47305))

(assert (= (and b!1123421 (not res!750581)) b!1123413))

(assert (= (and b!1123412 condMapEmpty!44137) mapIsEmpty!44137))

(assert (= (and b!1123412 (not condMapEmpty!44137)) mapNonEmpty!44137))

(get-info :version)

(assert (= (and mapNonEmpty!44137 ((_ is ValueCellFull!13397) mapValue!44137)) b!1123409))

(assert (= (and b!1123412 ((_ is ValueCellFull!13397) mapDefault!44137)) b!1123420))

(assert (= start!97976 b!1123412))

(declare-fun b_lambda!18635 () Bool)

(assert (=> (not b_lambda!18635) (not b!1123408)))

(declare-fun t!35295 () Bool)

(declare-fun tb!8487 () Bool)

(assert (=> (and start!97976 (= defaultEntry!1004 defaultEntry!1004) t!35295) tb!8487))

(declare-fun result!17543 () Bool)

(assert (=> tb!8487 (= result!17543 tp_is_empty!28213)))

(assert (=> b!1123408 t!35295))

(declare-fun b_and!38129 () Bool)

(assert (= b_and!38127 (and (=> t!35295 result!17543) b_and!38129)))

(declare-fun m!1037355 () Bool)

(assert (=> b!1123416 m!1037355))

(declare-fun m!1037357 () Bool)

(assert (=> b!1123419 m!1037357))

(declare-fun m!1037359 () Bool)

(assert (=> b!1123408 m!1037359))

(declare-fun m!1037361 () Bool)

(assert (=> b!1123408 m!1037361))

(declare-fun m!1037363 () Bool)

(assert (=> b!1123408 m!1037363))

(declare-fun m!1037365 () Bool)

(assert (=> b!1123408 m!1037365))

(declare-fun m!1037367 () Bool)

(assert (=> b!1123417 m!1037367))

(declare-fun m!1037369 () Bool)

(assert (=> b!1123417 m!1037369))

(declare-fun m!1037371 () Bool)

(assert (=> b!1123415 m!1037371))

(declare-fun m!1037373 () Bool)

(assert (=> b!1123414 m!1037373))

(declare-fun m!1037375 () Bool)

(assert (=> mapNonEmpty!44137 m!1037375))

(declare-fun m!1037377 () Bool)

(assert (=> bm!47305 m!1037377))

(declare-fun m!1037379 () Bool)

(assert (=> b!1123410 m!1037379))

(declare-fun m!1037381 () Bool)

(assert (=> bm!47306 m!1037381))

(declare-fun m!1037383 () Bool)

(assert (=> b!1123407 m!1037383))

(declare-fun m!1037385 () Bool)

(assert (=> b!1123411 m!1037385))

(declare-fun m!1037387 () Bool)

(assert (=> b!1123411 m!1037387))

(assert (=> b!1123413 m!1037377))

(assert (=> b!1123413 m!1037377))

(declare-fun m!1037389 () Bool)

(assert (=> b!1123413 m!1037389))

(declare-fun m!1037391 () Bool)

(assert (=> b!1123421 m!1037391))

(declare-fun m!1037393 () Bool)

(assert (=> b!1123421 m!1037393))

(declare-fun m!1037395 () Bool)

(assert (=> b!1123422 m!1037395))

(declare-fun m!1037397 () Bool)

(assert (=> start!97976 m!1037397))

(declare-fun m!1037399 () Bool)

(assert (=> start!97976 m!1037399))

(check-sat (not b!1123410) (not b!1123419) (not b!1123417) (not b!1123422) tp_is_empty!28213 (not b!1123413) (not b!1123416) (not b!1123408) (not b_next!23683) (not b_lambda!18635) (not mapNonEmpty!44137) b_and!38129 (not b!1123407) (not b!1123421) (not bm!47305) (not start!97976) (not b!1123414) (not b!1123411) (not bm!47306))
(check-sat b_and!38129 (not b_next!23683))
