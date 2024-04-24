; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97504 () Bool)

(assert start!97504)

(declare-fun b_free!23239 () Bool)

(declare-fun b_next!23239 () Bool)

(assert (=> start!97504 (= b_free!23239 (not b_next!23239))))

(declare-fun tp!82016 () Bool)

(declare-fun b_and!37321 () Bool)

(assert (=> start!97504 (= tp!82016 b_and!37321)))

(declare-fun b!1108684 () Bool)

(declare-fun e!632669 () Bool)

(declare-fun tp_is_empty!27499 () Bool)

(assert (=> b!1108684 (= e!632669 tp_is_empty!27499)))

(declare-fun b!1108685 () Bool)

(declare-fun res!739531 () Bool)

(declare-fun e!632668 () Bool)

(assert (=> b!1108685 (=> (not res!739531) (not e!632668))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108685 (= res!739531 (validMask!0 mask!1564))))

(declare-fun b!1108686 () Bool)

(declare-fun res!739540 () Bool)

(assert (=> b!1108686 (=> (not res!739540) (not e!632668))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71951 0))(
  ( (array!71952 (arr!34622 (Array (_ BitVec 32) (_ BitVec 64))) (size!35159 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71951)

(assert (=> b!1108686 (= res!739540 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35159 _keys!1208))))))

(declare-fun b!1108687 () Bool)

(declare-fun res!739533 () Bool)

(assert (=> b!1108687 (=> (not res!739533) (not e!632668))))

(declare-datatypes ((List!24140 0))(
  ( (Nil!24137) (Cons!24136 (h!25354 (_ BitVec 64)) (t!34417 List!24140)) )
))
(declare-fun arrayNoDuplicates!0 (array!71951 (_ BitVec 32) List!24140) Bool)

(assert (=> b!1108687 (= res!739533 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24137))))

(declare-fun b!1108688 () Bool)

(declare-fun res!739536 () Bool)

(assert (=> b!1108688 (=> (not res!739536) (not e!632668))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108688 (= res!739536 (validKeyInArray!0 k0!934))))

(declare-fun b!1108689 () Bool)

(declare-fun e!632667 () Bool)

(declare-datatypes ((V!41793 0))(
  ( (V!41794 (val!13806 Int)) )
))
(declare-datatypes ((tuple2!17452 0))(
  ( (tuple2!17453 (_1!8737 (_ BitVec 64)) (_2!8737 V!41793)) )
))
(declare-datatypes ((List!24141 0))(
  ( (Nil!24138) (Cons!24137 (h!25355 tuple2!17452) (t!34418 List!24141)) )
))
(declare-datatypes ((ListLongMap!15429 0))(
  ( (ListLongMap!15430 (toList!7730 List!24141)) )
))
(declare-fun call!46480 () ListLongMap!15429)

(declare-fun call!46481 () ListLongMap!15429)

(assert (=> b!1108689 (= e!632667 (= call!46480 call!46481))))

(declare-fun b!1108690 () Bool)

(declare-fun e!632664 () Bool)

(assert (=> b!1108690 (= e!632664 true)))

(assert (=> b!1108690 e!632667))

(declare-fun c!109454 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1108690 (= c!109454 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41793)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36325 0))(
  ( (Unit!36326) )
))
(declare-fun lt!496128 () Unit!36325)

(declare-datatypes ((ValueCell!13040 0))(
  ( (ValueCellFull!13040 (v!16435 V!41793)) (EmptyCell!13040) )
))
(declare-datatypes ((array!71953 0))(
  ( (array!71954 (arr!34623 (Array (_ BitVec 32) ValueCell!13040)) (size!35160 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71953)

(declare-fun minValue!944 () V!41793)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!260 (array!71951 array!71953 (_ BitVec 32) (_ BitVec 32) V!41793 V!41793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36325)

(assert (=> b!1108690 (= lt!496128 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!260 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108691 () Bool)

(declare-fun e!632670 () Bool)

(declare-fun e!632663 () Bool)

(declare-fun mapRes!43066 () Bool)

(assert (=> b!1108691 (= e!632670 (and e!632663 mapRes!43066))))

(declare-fun condMapEmpty!43066 () Bool)

(declare-fun mapDefault!43066 () ValueCell!13040)

(assert (=> b!1108691 (= condMapEmpty!43066 (= (arr!34623 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13040)) mapDefault!43066)))))

(declare-fun b!1108692 () Bool)

(declare-fun res!739537 () Bool)

(assert (=> b!1108692 (=> (not res!739537) (not e!632668))))

(assert (=> b!1108692 (= res!739537 (and (= (size!35160 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35159 _keys!1208) (size!35160 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108693 () Bool)

(declare-fun -!991 (ListLongMap!15429 (_ BitVec 64)) ListLongMap!15429)

(assert (=> b!1108693 (= e!632667 (= call!46480 (-!991 call!46481 k0!934)))))

(declare-fun mapNonEmpty!43066 () Bool)

(declare-fun tp!82015 () Bool)

(assert (=> mapNonEmpty!43066 (= mapRes!43066 (and tp!82015 e!632669))))

(declare-fun mapValue!43066 () ValueCell!13040)

(declare-fun mapRest!43066 () (Array (_ BitVec 32) ValueCell!13040))

(declare-fun mapKey!43066 () (_ BitVec 32))

(assert (=> mapNonEmpty!43066 (= (arr!34623 _values!996) (store mapRest!43066 mapKey!43066 mapValue!43066))))

(declare-fun lt!496129 () array!71951)

(declare-fun bm!46477 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4267 (array!71951 array!71953 (_ BitVec 32) (_ BitVec 32) V!41793 V!41793 (_ BitVec 32) Int) ListLongMap!15429)

(declare-fun dynLambda!2384 (Int (_ BitVec 64)) V!41793)

(assert (=> bm!46477 (= call!46480 (getCurrentListMapNoExtraKeys!4267 lt!496129 (array!71954 (store (arr!34623 _values!996) i!673 (ValueCellFull!13040 (dynLambda!2384 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35160 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108694 () Bool)

(declare-fun e!632665 () Bool)

(assert (=> b!1108694 (= e!632665 (not e!632664))))

(declare-fun res!739534 () Bool)

(assert (=> b!1108694 (=> res!739534 e!632664)))

(assert (=> b!1108694 (= res!739534 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35159 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108694 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496127 () Unit!36325)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71951 (_ BitVec 64) (_ BitVec 32)) Unit!36325)

(assert (=> b!1108694 (= lt!496127 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!46478 () Bool)

(assert (=> bm!46478 (= call!46481 (getCurrentListMapNoExtraKeys!4267 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43066 () Bool)

(assert (=> mapIsEmpty!43066 mapRes!43066))

(declare-fun b!1108695 () Bool)

(declare-fun res!739530 () Bool)

(assert (=> b!1108695 (=> (not res!739530) (not e!632668))))

(assert (=> b!1108695 (= res!739530 (= (select (arr!34622 _keys!1208) i!673) k0!934))))

(declare-fun b!1108696 () Bool)

(declare-fun res!739539 () Bool)

(assert (=> b!1108696 (=> (not res!739539) (not e!632665))))

(assert (=> b!1108696 (= res!739539 (arrayNoDuplicates!0 lt!496129 #b00000000000000000000000000000000 Nil!24137))))

(declare-fun res!739532 () Bool)

(assert (=> start!97504 (=> (not res!739532) (not e!632668))))

(assert (=> start!97504 (= res!739532 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35159 _keys!1208))))))

(assert (=> start!97504 e!632668))

(assert (=> start!97504 tp_is_empty!27499))

(declare-fun array_inv!26676 (array!71951) Bool)

(assert (=> start!97504 (array_inv!26676 _keys!1208)))

(assert (=> start!97504 true))

(assert (=> start!97504 tp!82016))

(declare-fun array_inv!26677 (array!71953) Bool)

(assert (=> start!97504 (and (array_inv!26677 _values!996) e!632670)))

(declare-fun b!1108697 () Bool)

(declare-fun res!739535 () Bool)

(assert (=> b!1108697 (=> (not res!739535) (not e!632668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71951 (_ BitVec 32)) Bool)

(assert (=> b!1108697 (= res!739535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108698 () Bool)

(assert (=> b!1108698 (= e!632668 e!632665)))

(declare-fun res!739538 () Bool)

(assert (=> b!1108698 (=> (not res!739538) (not e!632665))))

(assert (=> b!1108698 (= res!739538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496129 mask!1564))))

(assert (=> b!1108698 (= lt!496129 (array!71952 (store (arr!34622 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35159 _keys!1208)))))

(declare-fun b!1108699 () Bool)

(assert (=> b!1108699 (= e!632663 tp_is_empty!27499)))

(assert (= (and start!97504 res!739532) b!1108685))

(assert (= (and b!1108685 res!739531) b!1108692))

(assert (= (and b!1108692 res!739537) b!1108697))

(assert (= (and b!1108697 res!739535) b!1108687))

(assert (= (and b!1108687 res!739533) b!1108686))

(assert (= (and b!1108686 res!739540) b!1108688))

(assert (= (and b!1108688 res!739536) b!1108695))

(assert (= (and b!1108695 res!739530) b!1108698))

(assert (= (and b!1108698 res!739538) b!1108696))

(assert (= (and b!1108696 res!739539) b!1108694))

(assert (= (and b!1108694 (not res!739534)) b!1108690))

(assert (= (and b!1108690 c!109454) b!1108693))

(assert (= (and b!1108690 (not c!109454)) b!1108689))

(assert (= (or b!1108693 b!1108689) bm!46477))

(assert (= (or b!1108693 b!1108689) bm!46478))

(assert (= (and b!1108691 condMapEmpty!43066) mapIsEmpty!43066))

(assert (= (and b!1108691 (not condMapEmpty!43066)) mapNonEmpty!43066))

(get-info :version)

(assert (= (and mapNonEmpty!43066 ((_ is ValueCellFull!13040) mapValue!43066)) b!1108684))

(assert (= (and b!1108691 ((_ is ValueCellFull!13040) mapDefault!43066)) b!1108699))

(assert (= start!97504 b!1108691))

(declare-fun b_lambda!18269 () Bool)

(assert (=> (not b_lambda!18269) (not bm!46477)))

(declare-fun t!34416 () Bool)

(declare-fun tb!8097 () Bool)

(assert (=> (and start!97504 (= defaultEntry!1004 defaultEntry!1004) t!34416) tb!8097))

(declare-fun result!16763 () Bool)

(assert (=> tb!8097 (= result!16763 tp_is_empty!27499)))

(assert (=> bm!46477 t!34416))

(declare-fun b_and!37323 () Bool)

(assert (= b_and!37321 (and (=> t!34416 result!16763) b_and!37323)))

(declare-fun m!1027815 () Bool)

(assert (=> bm!46477 m!1027815))

(declare-fun m!1027817 () Bool)

(assert (=> bm!46477 m!1027817))

(declare-fun m!1027819 () Bool)

(assert (=> bm!46477 m!1027819))

(declare-fun m!1027821 () Bool)

(assert (=> bm!46478 m!1027821))

(declare-fun m!1027823 () Bool)

(assert (=> b!1108697 m!1027823))

(declare-fun m!1027825 () Bool)

(assert (=> b!1108696 m!1027825))

(declare-fun m!1027827 () Bool)

(assert (=> b!1108688 m!1027827))

(declare-fun m!1027829 () Bool)

(assert (=> mapNonEmpty!43066 m!1027829))

(declare-fun m!1027831 () Bool)

(assert (=> start!97504 m!1027831))

(declare-fun m!1027833 () Bool)

(assert (=> start!97504 m!1027833))

(declare-fun m!1027835 () Bool)

(assert (=> b!1108694 m!1027835))

(declare-fun m!1027837 () Bool)

(assert (=> b!1108694 m!1027837))

(declare-fun m!1027839 () Bool)

(assert (=> b!1108695 m!1027839))

(declare-fun m!1027841 () Bool)

(assert (=> b!1108693 m!1027841))

(declare-fun m!1027843 () Bool)

(assert (=> b!1108687 m!1027843))

(declare-fun m!1027845 () Bool)

(assert (=> b!1108698 m!1027845))

(declare-fun m!1027847 () Bool)

(assert (=> b!1108698 m!1027847))

(declare-fun m!1027849 () Bool)

(assert (=> b!1108685 m!1027849))

(declare-fun m!1027851 () Bool)

(assert (=> b!1108690 m!1027851))

(check-sat (not b!1108685) (not b!1108688) tp_is_empty!27499 (not b!1108698) (not b!1108694) (not b_lambda!18269) (not b!1108697) (not b_next!23239) (not b!1108696) (not mapNonEmpty!43066) (not bm!46477) (not b!1108687) b_and!37323 (not b!1108690) (not bm!46478) (not b!1108693) (not start!97504))
(check-sat b_and!37323 (not b_next!23239))
