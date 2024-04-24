; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97546 () Bool)

(assert start!97546)

(declare-fun b_free!23281 () Bool)

(declare-fun b_next!23281 () Bool)

(assert (=> start!97546 (= b_free!23281 (not b_next!23281))))

(declare-fun tp!82142 () Bool)

(declare-fun b_and!37405 () Bool)

(assert (=> start!97546 (= tp!82142 b_and!37405)))

(declare-datatypes ((V!41849 0))(
  ( (V!41850 (val!13827 Int)) )
))
(declare-fun zeroValue!944 () V!41849)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!72033 0))(
  ( (array!72034 (arr!34663 (Array (_ BitVec 32) (_ BitVec 64))) (size!35200 (_ BitVec 32))) )
))
(declare-fun lt!496318 () array!72033)

(declare-fun bm!46603 () Bool)

(declare-datatypes ((ValueCell!13061 0))(
  ( (ValueCellFull!13061 (v!16456 V!41849)) (EmptyCell!13061) )
))
(declare-datatypes ((array!72035 0))(
  ( (array!72036 (arr!34664 (Array (_ BitVec 32) ValueCell!13061)) (size!35201 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72035)

(declare-fun minValue!944 () V!41849)

(declare-datatypes ((tuple2!17482 0))(
  ( (tuple2!17483 (_1!8752 (_ BitVec 64)) (_2!8752 V!41849)) )
))
(declare-datatypes ((List!24169 0))(
  ( (Nil!24166) (Cons!24165 (h!25383 tuple2!17482) (t!34488 List!24169)) )
))
(declare-datatypes ((ListLongMap!15459 0))(
  ( (ListLongMap!15460 (toList!7745 List!24169)) )
))
(declare-fun call!46607 () ListLongMap!15459)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4280 (array!72033 array!72035 (_ BitVec 32) (_ BitVec 32) V!41849 V!41849 (_ BitVec 32) Int) ListLongMap!15459)

(declare-fun dynLambda!2396 (Int (_ BitVec 64)) V!41849)

(assert (=> bm!46603 (= call!46607 (getCurrentListMapNoExtraKeys!4280 lt!496318 (array!72036 (store (arr!34664 _values!996) i!673 (ValueCellFull!13061 (dynLambda!2396 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35201 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109734 () Bool)

(declare-fun res!740223 () Bool)

(declare-fun e!633167 () Bool)

(assert (=> b!1109734 (=> (not res!740223) (not e!633167))))

(declare-fun _keys!1208 () array!72033)

(assert (=> b!1109734 (= res!740223 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35200 _keys!1208))))))

(declare-fun b!1109735 () Bool)

(declare-fun e!633168 () Bool)

(assert (=> b!1109735 (= e!633168 true)))

(declare-fun e!633169 () Bool)

(assert (=> b!1109735 e!633169))

(declare-fun c!109517 () Bool)

(assert (=> b!1109735 (= c!109517 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((Unit!36355 0))(
  ( (Unit!36356) )
))
(declare-fun lt!496316 () Unit!36355)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!274 (array!72033 array!72035 (_ BitVec 32) (_ BitVec 32) V!41849 V!41849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36355)

(assert (=> b!1109735 (= lt!496316 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!274 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109736 () Bool)

(declare-fun e!633173 () Bool)

(assert (=> b!1109736 (= e!633167 e!633173)))

(declare-fun res!740233 () Bool)

(assert (=> b!1109736 (=> (not res!740233) (not e!633173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72033 (_ BitVec 32)) Bool)

(assert (=> b!1109736 (= res!740233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496318 mask!1564))))

(assert (=> b!1109736 (= lt!496318 (array!72034 (store (arr!34663 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35200 _keys!1208)))))

(declare-fun b!1109737 () Bool)

(declare-fun res!740231 () Bool)

(assert (=> b!1109737 (=> (not res!740231) (not e!633167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109737 (= res!740231 (validMask!0 mask!1564))))

(declare-fun b!1109738 () Bool)

(declare-fun call!46606 () ListLongMap!15459)

(declare-fun -!1003 (ListLongMap!15459 (_ BitVec 64)) ListLongMap!15459)

(assert (=> b!1109738 (= e!633169 (= call!46607 (-!1003 call!46606 k0!934)))))

(declare-fun b!1109739 () Bool)

(declare-fun res!740227 () Bool)

(assert (=> b!1109739 (=> (not res!740227) (not e!633167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109739 (= res!740227 (validKeyInArray!0 k0!934))))

(declare-fun b!1109740 () Bool)

(assert (=> b!1109740 (= e!633173 (not e!633168))))

(declare-fun res!740229 () Bool)

(assert (=> b!1109740 (=> res!740229 e!633168)))

(assert (=> b!1109740 (= res!740229 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35200 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109740 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496317 () Unit!36355)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72033 (_ BitVec 64) (_ BitVec 32)) Unit!36355)

(assert (=> b!1109740 (= lt!496317 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1109741 () Bool)

(declare-fun res!740226 () Bool)

(assert (=> b!1109741 (=> (not res!740226) (not e!633167))))

(assert (=> b!1109741 (= res!740226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43129 () Bool)

(declare-fun mapRes!43129 () Bool)

(assert (=> mapIsEmpty!43129 mapRes!43129))

(declare-fun mapNonEmpty!43129 () Bool)

(declare-fun tp!82141 () Bool)

(declare-fun e!633174 () Bool)

(assert (=> mapNonEmpty!43129 (= mapRes!43129 (and tp!82141 e!633174))))

(declare-fun mapValue!43129 () ValueCell!13061)

(declare-fun mapRest!43129 () (Array (_ BitVec 32) ValueCell!13061))

(declare-fun mapKey!43129 () (_ BitVec 32))

(assert (=> mapNonEmpty!43129 (= (arr!34664 _values!996) (store mapRest!43129 mapKey!43129 mapValue!43129))))

(declare-fun b!1109743 () Bool)

(declare-fun e!633170 () Bool)

(declare-fun e!633172 () Bool)

(assert (=> b!1109743 (= e!633170 (and e!633172 mapRes!43129))))

(declare-fun condMapEmpty!43129 () Bool)

(declare-fun mapDefault!43129 () ValueCell!13061)

(assert (=> b!1109743 (= condMapEmpty!43129 (= (arr!34664 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13061)) mapDefault!43129)))))

(declare-fun b!1109744 () Bool)

(declare-fun res!740224 () Bool)

(assert (=> b!1109744 (=> (not res!740224) (not e!633167))))

(assert (=> b!1109744 (= res!740224 (and (= (size!35201 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35200 _keys!1208) (size!35201 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!46604 () Bool)

(assert (=> bm!46604 (= call!46606 (getCurrentListMapNoExtraKeys!4280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109745 () Bool)

(declare-fun tp_is_empty!27541 () Bool)

(assert (=> b!1109745 (= e!633172 tp_is_empty!27541)))

(declare-fun b!1109746 () Bool)

(assert (=> b!1109746 (= e!633169 (= call!46607 call!46606))))

(declare-fun b!1109747 () Bool)

(declare-fun res!740230 () Bool)

(assert (=> b!1109747 (=> (not res!740230) (not e!633167))))

(assert (=> b!1109747 (= res!740230 (= (select (arr!34663 _keys!1208) i!673) k0!934))))

(declare-fun b!1109748 () Bool)

(declare-fun res!740228 () Bool)

(assert (=> b!1109748 (=> (not res!740228) (not e!633167))))

(declare-datatypes ((List!24170 0))(
  ( (Nil!24167) (Cons!24166 (h!25384 (_ BitVec 64)) (t!34489 List!24170)) )
))
(declare-fun arrayNoDuplicates!0 (array!72033 (_ BitVec 32) List!24170) Bool)

(assert (=> b!1109748 (= res!740228 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24167))))

(declare-fun b!1109749 () Bool)

(declare-fun res!740225 () Bool)

(assert (=> b!1109749 (=> (not res!740225) (not e!633173))))

(assert (=> b!1109749 (= res!740225 (arrayNoDuplicates!0 lt!496318 #b00000000000000000000000000000000 Nil!24167))))

(declare-fun b!1109742 () Bool)

(assert (=> b!1109742 (= e!633174 tp_is_empty!27541)))

(declare-fun res!740232 () Bool)

(assert (=> start!97546 (=> (not res!740232) (not e!633167))))

(assert (=> start!97546 (= res!740232 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35200 _keys!1208))))))

(assert (=> start!97546 e!633167))

(assert (=> start!97546 tp_is_empty!27541))

(declare-fun array_inv!26708 (array!72033) Bool)

(assert (=> start!97546 (array_inv!26708 _keys!1208)))

(assert (=> start!97546 true))

(assert (=> start!97546 tp!82142))

(declare-fun array_inv!26709 (array!72035) Bool)

(assert (=> start!97546 (and (array_inv!26709 _values!996) e!633170)))

(assert (= (and start!97546 res!740232) b!1109737))

(assert (= (and b!1109737 res!740231) b!1109744))

(assert (= (and b!1109744 res!740224) b!1109741))

(assert (= (and b!1109741 res!740226) b!1109748))

(assert (= (and b!1109748 res!740228) b!1109734))

(assert (= (and b!1109734 res!740223) b!1109739))

(assert (= (and b!1109739 res!740227) b!1109747))

(assert (= (and b!1109747 res!740230) b!1109736))

(assert (= (and b!1109736 res!740233) b!1109749))

(assert (= (and b!1109749 res!740225) b!1109740))

(assert (= (and b!1109740 (not res!740229)) b!1109735))

(assert (= (and b!1109735 c!109517) b!1109738))

(assert (= (and b!1109735 (not c!109517)) b!1109746))

(assert (= (or b!1109738 b!1109746) bm!46604))

(assert (= (or b!1109738 b!1109746) bm!46603))

(assert (= (and b!1109743 condMapEmpty!43129) mapIsEmpty!43129))

(assert (= (and b!1109743 (not condMapEmpty!43129)) mapNonEmpty!43129))

(get-info :version)

(assert (= (and mapNonEmpty!43129 ((_ is ValueCellFull!13061) mapValue!43129)) b!1109742))

(assert (= (and b!1109743 ((_ is ValueCellFull!13061) mapDefault!43129)) b!1109745))

(assert (= start!97546 b!1109743))

(declare-fun b_lambda!18311 () Bool)

(assert (=> (not b_lambda!18311) (not bm!46603)))

(declare-fun t!34487 () Bool)

(declare-fun tb!8139 () Bool)

(assert (=> (and start!97546 (= defaultEntry!1004 defaultEntry!1004) t!34487) tb!8139))

(declare-fun result!16847 () Bool)

(assert (=> tb!8139 (= result!16847 tp_is_empty!27541)))

(assert (=> bm!46603 t!34487))

(declare-fun b_and!37407 () Bool)

(assert (= b_and!37405 (and (=> t!34487 result!16847) b_and!37407)))

(declare-fun m!1028613 () Bool)

(assert (=> start!97546 m!1028613))

(declare-fun m!1028615 () Bool)

(assert (=> start!97546 m!1028615))

(declare-fun m!1028617 () Bool)

(assert (=> b!1109748 m!1028617))

(declare-fun m!1028619 () Bool)

(assert (=> b!1109736 m!1028619))

(declare-fun m!1028621 () Bool)

(assert (=> b!1109736 m!1028621))

(declare-fun m!1028623 () Bool)

(assert (=> b!1109747 m!1028623))

(declare-fun m!1028625 () Bool)

(assert (=> bm!46604 m!1028625))

(declare-fun m!1028627 () Bool)

(assert (=> b!1109735 m!1028627))

(declare-fun m!1028629 () Bool)

(assert (=> b!1109739 m!1028629))

(declare-fun m!1028631 () Bool)

(assert (=> b!1109738 m!1028631))

(declare-fun m!1028633 () Bool)

(assert (=> mapNonEmpty!43129 m!1028633))

(declare-fun m!1028635 () Bool)

(assert (=> b!1109741 m!1028635))

(declare-fun m!1028637 () Bool)

(assert (=> b!1109737 m!1028637))

(declare-fun m!1028639 () Bool)

(assert (=> b!1109749 m!1028639))

(declare-fun m!1028641 () Bool)

(assert (=> b!1109740 m!1028641))

(declare-fun m!1028643 () Bool)

(assert (=> b!1109740 m!1028643))

(declare-fun m!1028645 () Bool)

(assert (=> bm!46603 m!1028645))

(declare-fun m!1028647 () Bool)

(assert (=> bm!46603 m!1028647))

(declare-fun m!1028649 () Bool)

(assert (=> bm!46603 m!1028649))

(check-sat tp_is_empty!27541 b_and!37407 (not bm!46604) (not b!1109736) (not bm!46603) (not b!1109738) (not b!1109748) (not start!97546) (not mapNonEmpty!43129) (not b!1109740) (not b!1109749) (not b_next!23281) (not b_lambda!18311) (not b!1109741) (not b!1109739) (not b!1109735) (not b!1109737))
(check-sat b_and!37407 (not b_next!23281))
