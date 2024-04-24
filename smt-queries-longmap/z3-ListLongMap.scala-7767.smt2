; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97582 () Bool)

(assert start!97582)

(declare-fun b_free!23317 () Bool)

(declare-fun b_next!23317 () Bool)

(assert (=> start!97582 (= b_free!23317 (not b_next!23317))))

(declare-fun tp!82249 () Bool)

(declare-fun b_and!37477 () Bool)

(assert (=> start!97582 (= tp!82249 b_and!37477)))

(declare-fun b!1110634 () Bool)

(declare-fun res!740826 () Bool)

(declare-fun e!633604 () Bool)

(assert (=> b!1110634 (=> (not res!740826) (not e!633604))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110634 (= res!740826 (validMask!0 mask!1564))))

(declare-fun b!1110635 () Bool)

(declare-fun e!633600 () Bool)

(assert (=> b!1110635 (= e!633600 true)))

(declare-fun e!633605 () Bool)

(assert (=> b!1110635 e!633605))

(declare-fun c!109571 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110635 (= c!109571 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((array!72105 0))(
  ( (array!72106 (arr!34699 (Array (_ BitVec 32) (_ BitVec 64))) (size!35236 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72105)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((V!41897 0))(
  ( (V!41898 (val!13845 Int)) )
))
(declare-datatypes ((ValueCell!13079 0))(
  ( (ValueCellFull!13079 (v!16474 V!41897)) (EmptyCell!13079) )
))
(declare-datatypes ((array!72107 0))(
  ( (array!72108 (arr!34700 (Array (_ BitVec 32) ValueCell!13079)) (size!35237 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72107)

(declare-fun minValue!944 () V!41897)

(declare-fun zeroValue!944 () V!41897)

(declare-datatypes ((Unit!36383 0))(
  ( (Unit!36384) )
))
(declare-fun lt!496480 () Unit!36383)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!286 (array!72105 array!72107 (_ BitVec 32) (_ BitVec 32) V!41897 V!41897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36383)

(assert (=> b!1110635 (= lt!496480 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110636 () Bool)

(declare-fun res!740821 () Bool)

(assert (=> b!1110636 (=> (not res!740821) (not e!633604))))

(assert (=> b!1110636 (= res!740821 (= (select (arr!34699 _keys!1208) i!673) k0!934))))

(declare-fun b!1110637 () Bool)

(declare-fun res!740824 () Bool)

(assert (=> b!1110637 (=> (not res!740824) (not e!633604))))

(assert (=> b!1110637 (= res!740824 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35236 _keys!1208))))))

(declare-fun b!1110638 () Bool)

(declare-fun res!740818 () Bool)

(assert (=> b!1110638 (=> (not res!740818) (not e!633604))))

(declare-datatypes ((List!24198 0))(
  ( (Nil!24195) (Cons!24194 (h!25412 (_ BitVec 64)) (t!34553 List!24198)) )
))
(declare-fun arrayNoDuplicates!0 (array!72105 (_ BitVec 32) List!24198) Bool)

(assert (=> b!1110638 (= res!740818 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24195))))

(declare-datatypes ((tuple2!17512 0))(
  ( (tuple2!17513 (_1!8767 (_ BitVec 64)) (_2!8767 V!41897)) )
))
(declare-datatypes ((List!24199 0))(
  ( (Nil!24196) (Cons!24195 (h!25413 tuple2!17512) (t!34554 List!24199)) )
))
(declare-datatypes ((ListLongMap!15489 0))(
  ( (ListLongMap!15490 (toList!7760 List!24199)) )
))
(declare-fun call!46715 () ListLongMap!15489)

(declare-fun call!46714 () ListLongMap!15489)

(declare-fun b!1110639 () Bool)

(declare-fun -!1014 (ListLongMap!15489 (_ BitVec 64)) ListLongMap!15489)

(assert (=> b!1110639 (= e!633605 (= call!46715 (-!1014 call!46714 k0!934)))))

(declare-fun b!1110640 () Bool)

(assert (=> b!1110640 (= e!633605 (= call!46715 call!46714))))

(declare-fun b!1110641 () Bool)

(declare-fun e!633602 () Bool)

(declare-fun e!633599 () Bool)

(declare-fun mapRes!43183 () Bool)

(assert (=> b!1110641 (= e!633602 (and e!633599 mapRes!43183))))

(declare-fun condMapEmpty!43183 () Bool)

(declare-fun mapDefault!43183 () ValueCell!13079)

(assert (=> b!1110641 (= condMapEmpty!43183 (= (arr!34700 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13079)) mapDefault!43183)))))

(declare-fun lt!496479 () array!72105)

(declare-fun bm!46711 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4294 (array!72105 array!72107 (_ BitVec 32) (_ BitVec 32) V!41897 V!41897 (_ BitVec 32) Int) ListLongMap!15489)

(declare-fun dynLambda!2407 (Int (_ BitVec 64)) V!41897)

(assert (=> bm!46711 (= call!46715 (getCurrentListMapNoExtraKeys!4294 lt!496479 (array!72108 (store (arr!34700 _values!996) i!673 (ValueCellFull!13079 (dynLambda!2407 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35237 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110642 () Bool)

(declare-fun res!740819 () Bool)

(declare-fun e!633601 () Bool)

(assert (=> b!1110642 (=> (not res!740819) (not e!633601))))

(assert (=> b!1110642 (= res!740819 (arrayNoDuplicates!0 lt!496479 #b00000000000000000000000000000000 Nil!24195))))

(declare-fun b!1110643 () Bool)

(declare-fun e!633606 () Bool)

(declare-fun tp_is_empty!27577 () Bool)

(assert (=> b!1110643 (= e!633606 tp_is_empty!27577)))

(declare-fun res!740817 () Bool)

(assert (=> start!97582 (=> (not res!740817) (not e!633604))))

(assert (=> start!97582 (= res!740817 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35236 _keys!1208))))))

(assert (=> start!97582 e!633604))

(assert (=> start!97582 tp_is_empty!27577))

(declare-fun array_inv!26734 (array!72105) Bool)

(assert (=> start!97582 (array_inv!26734 _keys!1208)))

(assert (=> start!97582 true))

(assert (=> start!97582 tp!82249))

(declare-fun array_inv!26735 (array!72107) Bool)

(assert (=> start!97582 (and (array_inv!26735 _values!996) e!633602)))

(declare-fun mapIsEmpty!43183 () Bool)

(assert (=> mapIsEmpty!43183 mapRes!43183))

(declare-fun bm!46712 () Bool)

(assert (=> bm!46712 (= call!46714 (getCurrentListMapNoExtraKeys!4294 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43183 () Bool)

(declare-fun tp!82250 () Bool)

(assert (=> mapNonEmpty!43183 (= mapRes!43183 (and tp!82250 e!633606))))

(declare-fun mapRest!43183 () (Array (_ BitVec 32) ValueCell!13079))

(declare-fun mapValue!43183 () ValueCell!13079)

(declare-fun mapKey!43183 () (_ BitVec 32))

(assert (=> mapNonEmpty!43183 (= (arr!34700 _values!996) (store mapRest!43183 mapKey!43183 mapValue!43183))))

(declare-fun b!1110644 () Bool)

(declare-fun res!740827 () Bool)

(assert (=> b!1110644 (=> (not res!740827) (not e!633604))))

(assert (=> b!1110644 (= res!740827 (and (= (size!35237 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35236 _keys!1208) (size!35237 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110645 () Bool)

(assert (=> b!1110645 (= e!633599 tp_is_empty!27577)))

(declare-fun b!1110646 () Bool)

(declare-fun res!740825 () Bool)

(assert (=> b!1110646 (=> (not res!740825) (not e!633604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72105 (_ BitVec 32)) Bool)

(assert (=> b!1110646 (= res!740825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110647 () Bool)

(assert (=> b!1110647 (= e!633601 (not e!633600))))

(declare-fun res!740820 () Bool)

(assert (=> b!1110647 (=> res!740820 e!633600)))

(assert (=> b!1110647 (= res!740820 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35236 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110647 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496478 () Unit!36383)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72105 (_ BitVec 64) (_ BitVec 32)) Unit!36383)

(assert (=> b!1110647 (= lt!496478 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110648 () Bool)

(assert (=> b!1110648 (= e!633604 e!633601)))

(declare-fun res!740823 () Bool)

(assert (=> b!1110648 (=> (not res!740823) (not e!633601))))

(assert (=> b!1110648 (= res!740823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496479 mask!1564))))

(assert (=> b!1110648 (= lt!496479 (array!72106 (store (arr!34699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35236 _keys!1208)))))

(declare-fun b!1110649 () Bool)

(declare-fun res!740822 () Bool)

(assert (=> b!1110649 (=> (not res!740822) (not e!633604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110649 (= res!740822 (validKeyInArray!0 k0!934))))

(assert (= (and start!97582 res!740817) b!1110634))

(assert (= (and b!1110634 res!740826) b!1110644))

(assert (= (and b!1110644 res!740827) b!1110646))

(assert (= (and b!1110646 res!740825) b!1110638))

(assert (= (and b!1110638 res!740818) b!1110637))

(assert (= (and b!1110637 res!740824) b!1110649))

(assert (= (and b!1110649 res!740822) b!1110636))

(assert (= (and b!1110636 res!740821) b!1110648))

(assert (= (and b!1110648 res!740823) b!1110642))

(assert (= (and b!1110642 res!740819) b!1110647))

(assert (= (and b!1110647 (not res!740820)) b!1110635))

(assert (= (and b!1110635 c!109571) b!1110639))

(assert (= (and b!1110635 (not c!109571)) b!1110640))

(assert (= (or b!1110639 b!1110640) bm!46711))

(assert (= (or b!1110639 b!1110640) bm!46712))

(assert (= (and b!1110641 condMapEmpty!43183) mapIsEmpty!43183))

(assert (= (and b!1110641 (not condMapEmpty!43183)) mapNonEmpty!43183))

(get-info :version)

(assert (= (and mapNonEmpty!43183 ((_ is ValueCellFull!13079) mapValue!43183)) b!1110643))

(assert (= (and b!1110641 ((_ is ValueCellFull!13079) mapDefault!43183)) b!1110645))

(assert (= start!97582 b!1110641))

(declare-fun b_lambda!18347 () Bool)

(assert (=> (not b_lambda!18347) (not bm!46711)))

(declare-fun t!34552 () Bool)

(declare-fun tb!8175 () Bool)

(assert (=> (and start!97582 (= defaultEntry!1004 defaultEntry!1004) t!34552) tb!8175))

(declare-fun result!16919 () Bool)

(assert (=> tb!8175 (= result!16919 tp_is_empty!27577)))

(assert (=> bm!46711 t!34552))

(declare-fun b_and!37479 () Bool)

(assert (= b_and!37477 (and (=> t!34552 result!16919) b_and!37479)))

(declare-fun m!1029297 () Bool)

(assert (=> bm!46712 m!1029297))

(declare-fun m!1029299 () Bool)

(assert (=> b!1110634 m!1029299))

(declare-fun m!1029301 () Bool)

(assert (=> b!1110642 m!1029301))

(declare-fun m!1029303 () Bool)

(assert (=> start!97582 m!1029303))

(declare-fun m!1029305 () Bool)

(assert (=> start!97582 m!1029305))

(declare-fun m!1029307 () Bool)

(assert (=> b!1110639 m!1029307))

(declare-fun m!1029309 () Bool)

(assert (=> b!1110649 m!1029309))

(declare-fun m!1029311 () Bool)

(assert (=> b!1110638 m!1029311))

(declare-fun m!1029313 () Bool)

(assert (=> b!1110648 m!1029313))

(declare-fun m!1029315 () Bool)

(assert (=> b!1110648 m!1029315))

(declare-fun m!1029317 () Bool)

(assert (=> b!1110647 m!1029317))

(declare-fun m!1029319 () Bool)

(assert (=> b!1110647 m!1029319))

(declare-fun m!1029321 () Bool)

(assert (=> b!1110646 m!1029321))

(declare-fun m!1029323 () Bool)

(assert (=> b!1110635 m!1029323))

(declare-fun m!1029325 () Bool)

(assert (=> mapNonEmpty!43183 m!1029325))

(declare-fun m!1029327 () Bool)

(assert (=> bm!46711 m!1029327))

(declare-fun m!1029329 () Bool)

(assert (=> bm!46711 m!1029329))

(declare-fun m!1029331 () Bool)

(assert (=> bm!46711 m!1029331))

(declare-fun m!1029333 () Bool)

(assert (=> b!1110636 m!1029333))

(check-sat (not b_next!23317) (not b!1110639) (not b!1110646) (not b!1110649) (not b!1110648) (not b!1110635) (not bm!46711) b_and!37479 (not b!1110642) (not b!1110634) tp_is_empty!27577 (not mapNonEmpty!43183) (not bm!46712) (not b!1110638) (not b!1110647) (not b_lambda!18347) (not start!97582))
(check-sat b_and!37479 (not b_next!23317))
