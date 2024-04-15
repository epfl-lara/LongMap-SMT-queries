; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97268 () Bool)

(assert start!97268)

(declare-fun b_free!23245 () Bool)

(declare-fun b_next!23245 () Bool)

(assert (=> start!97268 (= b_free!23245 (not b_next!23245))))

(declare-fun tp!82034 () Bool)

(declare-fun b_and!37295 () Bool)

(assert (=> start!97268 (= tp!82034 b_and!37295)))

(declare-fun b!1107342 () Bool)

(declare-fun e!631788 () Bool)

(declare-fun tp_is_empty!27505 () Bool)

(assert (=> b!1107342 (= e!631788 tp_is_empty!27505)))

(declare-fun mapIsEmpty!43075 () Bool)

(declare-fun mapRes!43075 () Bool)

(assert (=> mapIsEmpty!43075 mapRes!43075))

(declare-fun b!1107343 () Bool)

(declare-fun res!739039 () Bool)

(declare-fun e!631787 () Bool)

(assert (=> b!1107343 (=> (not res!739039) (not e!631787))))

(declare-datatypes ((array!71830 0))(
  ( (array!71831 (arr!34568 (Array (_ BitVec 32) (_ BitVec 64))) (size!35106 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71830)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41801 0))(
  ( (V!41802 (val!13809 Int)) )
))
(declare-datatypes ((ValueCell!13043 0))(
  ( (ValueCellFull!13043 (v!16441 V!41801)) (EmptyCell!13043) )
))
(declare-datatypes ((array!71832 0))(
  ( (array!71833 (arr!34569 (Array (_ BitVec 32) ValueCell!13043)) (size!35107 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71832)

(assert (=> b!1107343 (= res!739039 (and (= (size!35107 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35106 _keys!1208) (size!35107 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107344 () Bool)

(declare-fun res!739040 () Bool)

(assert (=> b!1107344 (=> (not res!739040) (not e!631787))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107344 (= res!739040 (validKeyInArray!0 k0!934))))

(declare-fun b!1107345 () Bool)

(declare-fun e!631786 () Bool)

(declare-datatypes ((tuple2!17494 0))(
  ( (tuple2!17495 (_1!8758 (_ BitVec 64)) (_2!8758 V!41801)) )
))
(declare-datatypes ((List!24154 0))(
  ( (Nil!24151) (Cons!24150 (h!25359 tuple2!17494) (t!34436 List!24154)) )
))
(declare-datatypes ((ListLongMap!15463 0))(
  ( (ListLongMap!15464 (toList!7747 List!24154)) )
))
(declare-fun call!46408 () ListLongMap!15463)

(declare-fun call!46409 () ListLongMap!15463)

(assert (=> b!1107345 (= e!631786 (= call!46408 call!46409))))

(declare-fun b!1107346 () Bool)

(declare-fun res!739042 () Bool)

(assert (=> b!1107346 (=> (not res!739042) (not e!631787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71830 (_ BitVec 32)) Bool)

(assert (=> b!1107346 (= res!739042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107347 () Bool)

(declare-fun e!631782 () Bool)

(declare-fun e!631784 () Bool)

(assert (=> b!1107347 (= e!631782 (not e!631784))))

(declare-fun res!739043 () Bool)

(assert (=> b!1107347 (=> res!739043 e!631784)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1107347 (= res!739043 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35106 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107347 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36161 0))(
  ( (Unit!36162) )
))
(declare-fun lt!495439 () Unit!36161)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71830 (_ BitVec 64) (_ BitVec 32)) Unit!36161)

(assert (=> b!1107347 (= lt!495439 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107348 () Bool)

(declare-fun -!972 (ListLongMap!15463 (_ BitVec 64)) ListLongMap!15463)

(assert (=> b!1107348 (= e!631786 (= call!46408 (-!972 call!46409 k0!934)))))

(declare-fun b!1107349 () Bool)

(declare-fun res!739048 () Bool)

(assert (=> b!1107349 (=> (not res!739048) (not e!631787))))

(assert (=> b!1107349 (= res!739048 (= (select (arr!34568 _keys!1208) i!673) k0!934))))

(declare-fun b!1107350 () Bool)

(assert (=> b!1107350 (= e!631787 e!631782)))

(declare-fun res!739041 () Bool)

(assert (=> b!1107350 (=> (not res!739041) (not e!631782))))

(declare-fun lt!495441 () array!71830)

(assert (=> b!1107350 (= res!739041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495441 mask!1564))))

(assert (=> b!1107350 (= lt!495441 (array!71831 (store (arr!34568 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35106 _keys!1208)))))

(declare-fun b!1107351 () Bool)

(declare-fun res!739045 () Bool)

(assert (=> b!1107351 (=> (not res!739045) (not e!631787))))

(assert (=> b!1107351 (= res!739045 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35106 _keys!1208))))))

(declare-fun zeroValue!944 () V!41801)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46406 () Bool)

(declare-fun minValue!944 () V!41801)

(declare-fun getCurrentListMapNoExtraKeys!4265 (array!71830 array!71832 (_ BitVec 32) (_ BitVec 32) V!41801 V!41801 (_ BitVec 32) Int) ListLongMap!15463)

(declare-fun dynLambda!2334 (Int (_ BitVec 64)) V!41801)

(assert (=> bm!46406 (= call!46408 (getCurrentListMapNoExtraKeys!4265 lt!495441 (array!71833 (store (arr!34569 _values!996) i!673 (ValueCellFull!13043 (dynLambda!2334 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35107 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107352 () Bool)

(declare-fun res!739038 () Bool)

(assert (=> b!1107352 (=> (not res!739038) (not e!631787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107352 (= res!739038 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43075 () Bool)

(declare-fun tp!82033 () Bool)

(assert (=> mapNonEmpty!43075 (= mapRes!43075 (and tp!82033 e!631788))))

(declare-fun mapRest!43075 () (Array (_ BitVec 32) ValueCell!13043))

(declare-fun mapKey!43075 () (_ BitVec 32))

(declare-fun mapValue!43075 () ValueCell!13043)

(assert (=> mapNonEmpty!43075 (= (arr!34569 _values!996) (store mapRest!43075 mapKey!43075 mapValue!43075))))

(declare-fun bm!46405 () Bool)

(assert (=> bm!46405 (= call!46409 (getCurrentListMapNoExtraKeys!4265 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!739047 () Bool)

(assert (=> start!97268 (=> (not res!739047) (not e!631787))))

(assert (=> start!97268 (= res!739047 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35106 _keys!1208))))))

(assert (=> start!97268 e!631787))

(assert (=> start!97268 tp_is_empty!27505))

(declare-fun array_inv!26654 (array!71830) Bool)

(assert (=> start!97268 (array_inv!26654 _keys!1208)))

(assert (=> start!97268 true))

(assert (=> start!97268 tp!82034))

(declare-fun e!631783 () Bool)

(declare-fun array_inv!26655 (array!71832) Bool)

(assert (=> start!97268 (and (array_inv!26655 _values!996) e!631783)))

(declare-fun b!1107353 () Bool)

(assert (=> b!1107353 (= e!631784 true)))

(assert (=> b!1107353 e!631786))

(declare-fun c!109008 () Bool)

(assert (=> b!1107353 (= c!109008 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495440 () Unit!36161)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!246 (array!71830 array!71832 (_ BitVec 32) (_ BitVec 32) V!41801 V!41801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36161)

(assert (=> b!1107353 (= lt!495440 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107354 () Bool)

(declare-fun res!739044 () Bool)

(assert (=> b!1107354 (=> (not res!739044) (not e!631782))))

(declare-datatypes ((List!24155 0))(
  ( (Nil!24152) (Cons!24151 (h!25360 (_ BitVec 64)) (t!34437 List!24155)) )
))
(declare-fun arrayNoDuplicates!0 (array!71830 (_ BitVec 32) List!24155) Bool)

(assert (=> b!1107354 (= res!739044 (arrayNoDuplicates!0 lt!495441 #b00000000000000000000000000000000 Nil!24152))))

(declare-fun b!1107355 () Bool)

(declare-fun e!631785 () Bool)

(assert (=> b!1107355 (= e!631785 tp_is_empty!27505)))

(declare-fun b!1107356 () Bool)

(assert (=> b!1107356 (= e!631783 (and e!631785 mapRes!43075))))

(declare-fun condMapEmpty!43075 () Bool)

(declare-fun mapDefault!43075 () ValueCell!13043)

(assert (=> b!1107356 (= condMapEmpty!43075 (= (arr!34569 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13043)) mapDefault!43075)))))

(declare-fun b!1107357 () Bool)

(declare-fun res!739046 () Bool)

(assert (=> b!1107357 (=> (not res!739046) (not e!631787))))

(assert (=> b!1107357 (= res!739046 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24152))))

(assert (= (and start!97268 res!739047) b!1107352))

(assert (= (and b!1107352 res!739038) b!1107343))

(assert (= (and b!1107343 res!739039) b!1107346))

(assert (= (and b!1107346 res!739042) b!1107357))

(assert (= (and b!1107357 res!739046) b!1107351))

(assert (= (and b!1107351 res!739045) b!1107344))

(assert (= (and b!1107344 res!739040) b!1107349))

(assert (= (and b!1107349 res!739048) b!1107350))

(assert (= (and b!1107350 res!739041) b!1107354))

(assert (= (and b!1107354 res!739044) b!1107347))

(assert (= (and b!1107347 (not res!739043)) b!1107353))

(assert (= (and b!1107353 c!109008) b!1107348))

(assert (= (and b!1107353 (not c!109008)) b!1107345))

(assert (= (or b!1107348 b!1107345) bm!46405))

(assert (= (or b!1107348 b!1107345) bm!46406))

(assert (= (and b!1107356 condMapEmpty!43075) mapIsEmpty!43075))

(assert (= (and b!1107356 (not condMapEmpty!43075)) mapNonEmpty!43075))

(get-info :version)

(assert (= (and mapNonEmpty!43075 ((_ is ValueCellFull!13043) mapValue!43075)) b!1107342))

(assert (= (and b!1107356 ((_ is ValueCellFull!13043) mapDefault!43075)) b!1107355))

(assert (= start!97268 b!1107356))

(declare-fun b_lambda!18241 () Bool)

(assert (=> (not b_lambda!18241) (not bm!46406)))

(declare-fun t!34435 () Bool)

(declare-fun tb!8103 () Bool)

(assert (=> (and start!97268 (= defaultEntry!1004 defaultEntry!1004) t!34435) tb!8103))

(declare-fun result!16775 () Bool)

(assert (=> tb!8103 (= result!16775 tp_is_empty!27505)))

(assert (=> bm!46406 t!34435))

(declare-fun b_and!37297 () Bool)

(assert (= b_and!37295 (and (=> t!34435 result!16775) b_and!37297)))

(declare-fun m!1025631 () Bool)

(assert (=> b!1107348 m!1025631))

(declare-fun m!1025633 () Bool)

(assert (=> b!1107344 m!1025633))

(declare-fun m!1025635 () Bool)

(assert (=> b!1107347 m!1025635))

(declare-fun m!1025637 () Bool)

(assert (=> b!1107347 m!1025637))

(declare-fun m!1025639 () Bool)

(assert (=> b!1107350 m!1025639))

(declare-fun m!1025641 () Bool)

(assert (=> b!1107350 m!1025641))

(declare-fun m!1025643 () Bool)

(assert (=> b!1107354 m!1025643))

(declare-fun m!1025645 () Bool)

(assert (=> mapNonEmpty!43075 m!1025645))

(declare-fun m!1025647 () Bool)

(assert (=> b!1107352 m!1025647))

(declare-fun m!1025649 () Bool)

(assert (=> b!1107357 m!1025649))

(declare-fun m!1025651 () Bool)

(assert (=> bm!46406 m!1025651))

(declare-fun m!1025653 () Bool)

(assert (=> bm!46406 m!1025653))

(declare-fun m!1025655 () Bool)

(assert (=> bm!46406 m!1025655))

(declare-fun m!1025657 () Bool)

(assert (=> b!1107349 m!1025657))

(declare-fun m!1025659 () Bool)

(assert (=> bm!46405 m!1025659))

(declare-fun m!1025661 () Bool)

(assert (=> start!97268 m!1025661))

(declare-fun m!1025663 () Bool)

(assert (=> start!97268 m!1025663))

(declare-fun m!1025665 () Bool)

(assert (=> b!1107353 m!1025665))

(declare-fun m!1025667 () Bool)

(assert (=> b!1107346 m!1025667))

(check-sat (not b!1107357) (not b_lambda!18241) (not b!1107346) b_and!37297 (not b!1107353) (not b!1107352) (not bm!46405) (not b!1107350) (not b!1107348) (not b!1107347) (not start!97268) (not b!1107354) (not b_next!23245) (not mapNonEmpty!43075) tp_is_empty!27505 (not bm!46406) (not b!1107344))
(check-sat b_and!37297 (not b_next!23245))
