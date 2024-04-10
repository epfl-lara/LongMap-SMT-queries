; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98008 () Bool)

(assert start!98008)

(declare-fun b_free!23709 () Bool)

(declare-fun b_next!23709 () Bool)

(assert (=> start!98008 (= b_free!23709 (not b_next!23709))))

(declare-fun tp!83830 () Bool)

(declare-fun b_and!38201 () Bool)

(assert (=> start!98008 (= tp!83830 b_and!38201)))

(declare-fun b!1124326 () Bool)

(declare-fun res!751218 () Bool)

(declare-fun e!640040 () Bool)

(assert (=> b!1124326 (=> (not res!751218) (not e!640040))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124326 (= res!751218 (validMask!0 mask!1564))))

(declare-fun b!1124327 () Bool)

(declare-fun e!640045 () Bool)

(declare-fun e!640043 () Bool)

(assert (=> b!1124327 (= e!640045 e!640043)))

(declare-fun res!751212 () Bool)

(assert (=> b!1124327 (=> res!751212 e!640043)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124327 (= res!751212 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42779 0))(
  ( (V!42780 (val!14176 Int)) )
))
(declare-fun zeroValue!944 () V!42779)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!73345 0))(
  ( (array!73346 (arr!35325 (Array (_ BitVec 32) (_ BitVec 64))) (size!35861 (_ BitVec 32))) )
))
(declare-fun lt!499419 () array!73345)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42779)

(declare-datatypes ((tuple2!17806 0))(
  ( (tuple2!17807 (_1!8914 (_ BitVec 64)) (_2!8914 V!42779)) )
))
(declare-datatypes ((List!24585 0))(
  ( (Nil!24582) (Cons!24581 (h!25790 tuple2!17806) (t!35286 List!24585)) )
))
(declare-datatypes ((ListLongMap!15775 0))(
  ( (ListLongMap!15776 (toList!7903 List!24585)) )
))
(declare-fun lt!499417 () ListLongMap!15775)

(declare-datatypes ((ValueCell!13410 0))(
  ( (ValueCellFull!13410 (v!16809 V!42779)) (EmptyCell!13410) )
))
(declare-datatypes ((array!73347 0))(
  ( (array!73348 (arr!35326 (Array (_ BitVec 32) ValueCell!13410)) (size!35862 (_ BitVec 32))) )
))
(declare-fun lt!499423 () array!73347)

(declare-fun getCurrentListMapNoExtraKeys!4391 (array!73345 array!73347 (_ BitVec 32) (_ BitVec 32) V!42779 V!42779 (_ BitVec 32) Int) ListLongMap!15775)

(assert (=> b!1124327 (= lt!499417 (getCurrentListMapNoExtraKeys!4391 lt!499419 lt!499423 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73347)

(declare-fun dynLambda!2487 (Int (_ BitVec 64)) V!42779)

(assert (=> b!1124327 (= lt!499423 (array!73348 (store (arr!35326 _values!996) i!673 (ValueCellFull!13410 (dynLambda!2487 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35862 _values!996)))))

(declare-fun _keys!1208 () array!73345)

(declare-fun lt!499420 () ListLongMap!15775)

(assert (=> b!1124327 (= lt!499420 (getCurrentListMapNoExtraKeys!4391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!47410 () ListLongMap!15775)

(declare-fun b!1124328 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!47409 () ListLongMap!15775)

(declare-fun e!640050 () Bool)

(declare-fun -!1107 (ListLongMap!15775 (_ BitVec 64)) ListLongMap!15775)

(assert (=> b!1124328 (= e!640050 (= call!47410 (-!1107 call!47409 k0!934)))))

(declare-fun b!1124329 () Bool)

(declare-fun e!640048 () Bool)

(assert (=> b!1124329 (= e!640048 (not e!640045))))

(declare-fun res!751220 () Bool)

(assert (=> b!1124329 (=> res!751220 e!640045)))

(assert (=> b!1124329 (= res!751220 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124329 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36858 0))(
  ( (Unit!36859) )
))
(declare-fun lt!499424 () Unit!36858)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73345 (_ BitVec 64) (_ BitVec 32)) Unit!36858)

(assert (=> b!1124329 (= lt!499424 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44176 () Bool)

(declare-fun mapRes!44176 () Bool)

(declare-fun tp!83831 () Bool)

(declare-fun e!640042 () Bool)

(assert (=> mapNonEmpty!44176 (= mapRes!44176 (and tp!83831 e!640042))))

(declare-fun mapRest!44176 () (Array (_ BitVec 32) ValueCell!13410))

(declare-fun mapValue!44176 () ValueCell!13410)

(declare-fun mapKey!44176 () (_ BitVec 32))

(assert (=> mapNonEmpty!44176 (= (arr!35326 _values!996) (store mapRest!44176 mapKey!44176 mapValue!44176))))

(declare-fun b!1124331 () Bool)

(declare-fun res!751225 () Bool)

(assert (=> b!1124331 (=> (not res!751225) (not e!640040))))

(assert (=> b!1124331 (= res!751225 (and (= (size!35862 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35861 _keys!1208) (size!35862 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1124332 () Bool)

(declare-fun res!751214 () Bool)

(assert (=> b!1124332 (=> (not res!751214) (not e!640040))))

(assert (=> b!1124332 (= res!751214 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35861 _keys!1208))))))

(declare-fun bm!47406 () Bool)

(assert (=> bm!47406 (= call!47409 (getCurrentListMapNoExtraKeys!4391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124333 () Bool)

(declare-fun res!751215 () Bool)

(assert (=> b!1124333 (=> (not res!751215) (not e!640040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124333 (= res!751215 (validKeyInArray!0 k0!934))))

(declare-fun b!1124334 () Bool)

(declare-fun res!751224 () Bool)

(declare-fun e!640044 () Bool)

(assert (=> b!1124334 (=> res!751224 e!640044)))

(assert (=> b!1124334 (= res!751224 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1124335 () Bool)

(declare-fun e!640049 () Bool)

(declare-fun e!640046 () Bool)

(assert (=> b!1124335 (= e!640049 (and e!640046 mapRes!44176))))

(declare-fun condMapEmpty!44176 () Bool)

(declare-fun mapDefault!44176 () ValueCell!13410)

(assert (=> b!1124335 (= condMapEmpty!44176 (= (arr!35326 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13410)) mapDefault!44176)))))

(declare-fun bm!47407 () Bool)

(assert (=> bm!47407 (= call!47410 (getCurrentListMapNoExtraKeys!4391 lt!499419 lt!499423 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124336 () Bool)

(declare-fun tp_is_empty!28239 () Bool)

(assert (=> b!1124336 (= e!640042 tp_is_empty!28239)))

(declare-fun b!1124330 () Bool)

(assert (=> b!1124330 (= e!640046 tp_is_empty!28239)))

(declare-fun res!751223 () Bool)

(assert (=> start!98008 (=> (not res!751223) (not e!640040))))

(assert (=> start!98008 (= res!751223 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35861 _keys!1208))))))

(assert (=> start!98008 e!640040))

(assert (=> start!98008 tp_is_empty!28239))

(declare-fun array_inv!27114 (array!73345) Bool)

(assert (=> start!98008 (array_inv!27114 _keys!1208)))

(assert (=> start!98008 true))

(assert (=> start!98008 tp!83830))

(declare-fun array_inv!27115 (array!73347) Bool)

(assert (=> start!98008 (and (array_inv!27115 _values!996) e!640049)))

(declare-fun b!1124337 () Bool)

(declare-fun e!640041 () Bool)

(assert (=> b!1124337 (= e!640041 e!640044)))

(declare-fun res!751219 () Bool)

(assert (=> b!1124337 (=> res!751219 e!640044)))

(declare-fun lt!499422 () ListLongMap!15775)

(declare-fun contains!6441 (ListLongMap!15775 (_ BitVec 64)) Bool)

(assert (=> b!1124337 (= res!751219 (not (contains!6441 lt!499422 k0!934)))))

(assert (=> b!1124337 (= lt!499422 (getCurrentListMapNoExtraKeys!4391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124338 () Bool)

(declare-fun res!751222 () Bool)

(assert (=> b!1124338 (=> (not res!751222) (not e!640040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73345 (_ BitVec 32)) Bool)

(assert (=> b!1124338 (= res!751222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1124339 () Bool)

(assert (=> b!1124339 (= e!640043 e!640041)))

(declare-fun res!751213 () Bool)

(assert (=> b!1124339 (=> res!751213 e!640041)))

(assert (=> b!1124339 (= res!751213 (not (= (select (arr!35325 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1124339 e!640050))

(declare-fun c!109554 () Bool)

(assert (=> b!1124339 (= c!109554 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499421 () Unit!36858)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!354 (array!73345 array!73347 (_ BitVec 32) (_ BitVec 32) V!42779 V!42779 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36858)

(assert (=> b!1124339 (= lt!499421 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124340 () Bool)

(declare-fun res!751221 () Bool)

(assert (=> b!1124340 (=> (not res!751221) (not e!640048))))

(declare-datatypes ((List!24586 0))(
  ( (Nil!24583) (Cons!24582 (h!25791 (_ BitVec 64)) (t!35287 List!24586)) )
))
(declare-fun arrayNoDuplicates!0 (array!73345 (_ BitVec 32) List!24586) Bool)

(assert (=> b!1124340 (= res!751221 (arrayNoDuplicates!0 lt!499419 #b00000000000000000000000000000000 Nil!24583))))

(declare-fun b!1124341 () Bool)

(assert (=> b!1124341 (= e!640044 true)))

(declare-fun +!3412 (ListLongMap!15775 tuple2!17806) ListLongMap!15775)

(assert (=> b!1124341 (contains!6441 (+!3412 lt!499422 (tuple2!17807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499418 () Unit!36858)

(declare-fun addStillContains!674 (ListLongMap!15775 (_ BitVec 64) V!42779 (_ BitVec 64)) Unit!36858)

(assert (=> b!1124341 (= lt!499418 (addStillContains!674 lt!499422 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1124342 () Bool)

(declare-fun res!751216 () Bool)

(assert (=> b!1124342 (=> (not res!751216) (not e!640040))))

(assert (=> b!1124342 (= res!751216 (= (select (arr!35325 _keys!1208) i!673) k0!934))))

(declare-fun b!1124343 () Bool)

(declare-fun res!751211 () Bool)

(assert (=> b!1124343 (=> (not res!751211) (not e!640040))))

(assert (=> b!1124343 (= res!751211 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24583))))

(declare-fun b!1124344 () Bool)

(assert (=> b!1124344 (= e!640050 (= call!47410 call!47409))))

(declare-fun b!1124345 () Bool)

(assert (=> b!1124345 (= e!640040 e!640048)))

(declare-fun res!751217 () Bool)

(assert (=> b!1124345 (=> (not res!751217) (not e!640048))))

(assert (=> b!1124345 (= res!751217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499419 mask!1564))))

(assert (=> b!1124345 (= lt!499419 (array!73346 (store (arr!35325 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35861 _keys!1208)))))

(declare-fun mapIsEmpty!44176 () Bool)

(assert (=> mapIsEmpty!44176 mapRes!44176))

(assert (= (and start!98008 res!751223) b!1124326))

(assert (= (and b!1124326 res!751218) b!1124331))

(assert (= (and b!1124331 res!751225) b!1124338))

(assert (= (and b!1124338 res!751222) b!1124343))

(assert (= (and b!1124343 res!751211) b!1124332))

(assert (= (and b!1124332 res!751214) b!1124333))

(assert (= (and b!1124333 res!751215) b!1124342))

(assert (= (and b!1124342 res!751216) b!1124345))

(assert (= (and b!1124345 res!751217) b!1124340))

(assert (= (and b!1124340 res!751221) b!1124329))

(assert (= (and b!1124329 (not res!751220)) b!1124327))

(assert (= (and b!1124327 (not res!751212)) b!1124339))

(assert (= (and b!1124339 c!109554) b!1124328))

(assert (= (and b!1124339 (not c!109554)) b!1124344))

(assert (= (or b!1124328 b!1124344) bm!47407))

(assert (= (or b!1124328 b!1124344) bm!47406))

(assert (= (and b!1124339 (not res!751213)) b!1124337))

(assert (= (and b!1124337 (not res!751219)) b!1124334))

(assert (= (and b!1124334 (not res!751224)) b!1124341))

(assert (= (and b!1124335 condMapEmpty!44176) mapIsEmpty!44176))

(assert (= (and b!1124335 (not condMapEmpty!44176)) mapNonEmpty!44176))

(get-info :version)

(assert (= (and mapNonEmpty!44176 ((_ is ValueCellFull!13410) mapValue!44176)) b!1124336))

(assert (= (and b!1124335 ((_ is ValueCellFull!13410) mapDefault!44176)) b!1124330))

(assert (= start!98008 b!1124335))

(declare-fun b_lambda!18679 () Bool)

(assert (=> (not b_lambda!18679) (not b!1124327)))

(declare-fun t!35285 () Bool)

(declare-fun tb!8521 () Bool)

(assert (=> (and start!98008 (= defaultEntry!1004 defaultEntry!1004) t!35285) tb!8521))

(declare-fun result!17603 () Bool)

(assert (=> tb!8521 (= result!17603 tp_is_empty!28239)))

(assert (=> b!1124327 t!35285))

(declare-fun b_and!38203 () Bool)

(assert (= b_and!38201 (and (=> t!35285 result!17603) b_and!38203)))

(declare-fun m!1038643 () Bool)

(assert (=> b!1124345 m!1038643))

(declare-fun m!1038645 () Bool)

(assert (=> b!1124345 m!1038645))

(declare-fun m!1038647 () Bool)

(assert (=> b!1124342 m!1038647))

(declare-fun m!1038649 () Bool)

(assert (=> b!1124327 m!1038649))

(declare-fun m!1038651 () Bool)

(assert (=> b!1124327 m!1038651))

(declare-fun m!1038653 () Bool)

(assert (=> b!1124327 m!1038653))

(declare-fun m!1038655 () Bool)

(assert (=> b!1124327 m!1038655))

(declare-fun m!1038657 () Bool)

(assert (=> mapNonEmpty!44176 m!1038657))

(declare-fun m!1038659 () Bool)

(assert (=> b!1124328 m!1038659))

(declare-fun m!1038661 () Bool)

(assert (=> b!1124341 m!1038661))

(assert (=> b!1124341 m!1038661))

(declare-fun m!1038663 () Bool)

(assert (=> b!1124341 m!1038663))

(declare-fun m!1038665 () Bool)

(assert (=> b!1124341 m!1038665))

(declare-fun m!1038667 () Bool)

(assert (=> b!1124326 m!1038667))

(declare-fun m!1038669 () Bool)

(assert (=> bm!47407 m!1038669))

(declare-fun m!1038671 () Bool)

(assert (=> bm!47406 m!1038671))

(declare-fun m!1038673 () Bool)

(assert (=> b!1124333 m!1038673))

(declare-fun m!1038675 () Bool)

(assert (=> start!98008 m!1038675))

(declare-fun m!1038677 () Bool)

(assert (=> start!98008 m!1038677))

(declare-fun m!1038679 () Bool)

(assert (=> b!1124329 m!1038679))

(declare-fun m!1038681 () Bool)

(assert (=> b!1124329 m!1038681))

(declare-fun m!1038683 () Bool)

(assert (=> b!1124340 m!1038683))

(declare-fun m!1038685 () Bool)

(assert (=> b!1124337 m!1038685))

(assert (=> b!1124337 m!1038671))

(declare-fun m!1038687 () Bool)

(assert (=> b!1124338 m!1038687))

(declare-fun m!1038689 () Bool)

(assert (=> b!1124343 m!1038689))

(declare-fun m!1038691 () Bool)

(assert (=> b!1124339 m!1038691))

(declare-fun m!1038693 () Bool)

(assert (=> b!1124339 m!1038693))

(check-sat (not b!1124339) tp_is_empty!28239 (not b!1124340) (not bm!47407) (not mapNonEmpty!44176) (not b!1124333) (not b!1124341) (not b!1124327) (not b!1124329) (not b!1124337) (not bm!47406) (not b!1124343) (not b!1124338) (not b!1124326) b_and!38203 (not b!1124328) (not start!98008) (not b_lambda!18679) (not b!1124345) (not b_next!23709))
(check-sat b_and!38203 (not b_next!23709))
