; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97288 () Bool)

(assert start!97288)

(declare-fun b_free!23259 () Bool)

(declare-fun b_next!23259 () Bool)

(assert (=> start!97288 (= b_free!23259 (not b_next!23259))))

(declare-fun tp!82075 () Bool)

(declare-fun b_and!37349 () Bool)

(assert (=> start!97288 (= tp!82075 b_and!37349)))

(declare-fun b!1107845 () Bool)

(declare-fun res!739344 () Bool)

(declare-fun e!632047 () Bool)

(assert (=> b!1107845 (=> (not res!739344) (not e!632047))))

(declare-datatypes ((array!71955 0))(
  ( (array!71956 (arr!34630 (Array (_ BitVec 32) (_ BitVec 64))) (size!35166 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71955)

(declare-datatypes ((List!24140 0))(
  ( (Nil!24137) (Cons!24136 (h!25345 (_ BitVec 64)) (t!34445 List!24140)) )
))
(declare-fun arrayNoDuplicates!0 (array!71955 (_ BitVec 32) List!24140) Bool)

(assert (=> b!1107845 (= res!739344 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24137))))

(declare-fun b!1107846 () Bool)

(declare-fun e!632045 () Bool)

(declare-fun tp_is_empty!27519 () Bool)

(assert (=> b!1107846 (= e!632045 tp_is_empty!27519)))

(declare-fun b!1107847 () Bool)

(declare-fun res!739343 () Bool)

(assert (=> b!1107847 (=> (not res!739343) (not e!632047))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41819 0))(
  ( (V!41820 (val!13816 Int)) )
))
(declare-datatypes ((ValueCell!13050 0))(
  ( (ValueCellFull!13050 (v!16449 V!41819)) (EmptyCell!13050) )
))
(declare-datatypes ((array!71957 0))(
  ( (array!71958 (arr!34631 (Array (_ BitVec 32) ValueCell!13050)) (size!35167 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71957)

(assert (=> b!1107847 (= res!739343 (and (= (size!35167 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35166 _keys!1208) (size!35167 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107848 () Bool)

(declare-fun res!739348 () Bool)

(assert (=> b!1107848 (=> (not res!739348) (not e!632047))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107848 (= res!739348 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35166 _keys!1208))))))

(declare-fun b!1107849 () Bool)

(declare-fun res!739338 () Bool)

(declare-fun e!632042 () Bool)

(assert (=> b!1107849 (=> (not res!739338) (not e!632042))))

(declare-fun lt!495702 () array!71955)

(assert (=> b!1107849 (= res!739338 (arrayNoDuplicates!0 lt!495702 #b00000000000000000000000000000000 Nil!24137))))

(declare-fun b!1107850 () Bool)

(assert (=> b!1107850 (= e!632047 e!632042)))

(declare-fun res!739340 () Bool)

(assert (=> b!1107850 (=> (not res!739340) (not e!632042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71955 (_ BitVec 32)) Bool)

(assert (=> b!1107850 (= res!739340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495702 mask!1564))))

(assert (=> b!1107850 (= lt!495702 (array!71956 (store (arr!34630 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35166 _keys!1208)))))

(declare-fun res!739345 () Bool)

(assert (=> start!97288 (=> (not res!739345) (not e!632047))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97288 (= res!739345 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35166 _keys!1208))))))

(assert (=> start!97288 e!632047))

(assert (=> start!97288 tp_is_empty!27519))

(declare-fun array_inv!26652 (array!71955) Bool)

(assert (=> start!97288 (array_inv!26652 _keys!1208)))

(assert (=> start!97288 true))

(assert (=> start!97288 tp!82075))

(declare-fun e!632048 () Bool)

(declare-fun array_inv!26653 (array!71957) Bool)

(assert (=> start!97288 (and (array_inv!26653 _values!996) e!632048)))

(declare-fun b!1107851 () Bool)

(declare-fun res!739342 () Bool)

(assert (=> b!1107851 (=> (not res!739342) (not e!632047))))

(assert (=> b!1107851 (= res!739342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107852 () Bool)

(declare-fun e!632043 () Bool)

(assert (=> b!1107852 (= e!632042 (not e!632043))))

(declare-fun res!739347 () Bool)

(assert (=> b!1107852 (=> res!739347 e!632043)))

(assert (=> b!1107852 (= res!739347 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35166 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107852 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36360 0))(
  ( (Unit!36361) )
))
(declare-fun lt!495704 () Unit!36360)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71955 (_ BitVec 64) (_ BitVec 32)) Unit!36360)

(assert (=> b!1107852 (= lt!495704 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107853 () Bool)

(declare-fun e!632049 () Bool)

(assert (=> b!1107853 (= e!632049 tp_is_empty!27519)))

(declare-fun mapNonEmpty!43096 () Bool)

(declare-fun mapRes!43096 () Bool)

(declare-fun tp!82076 () Bool)

(assert (=> mapNonEmpty!43096 (= mapRes!43096 (and tp!82076 e!632045))))

(declare-fun mapKey!43096 () (_ BitVec 32))

(declare-fun mapRest!43096 () (Array (_ BitVec 32) ValueCell!13050))

(declare-fun mapValue!43096 () ValueCell!13050)

(assert (=> mapNonEmpty!43096 (= (arr!34631 _values!996) (store mapRest!43096 mapKey!43096 mapValue!43096))))

(declare-fun zeroValue!944 () V!41819)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41819)

(declare-datatypes ((tuple2!17456 0))(
  ( (tuple2!17457 (_1!8739 (_ BitVec 64)) (_2!8739 V!41819)) )
))
(declare-datatypes ((List!24141 0))(
  ( (Nil!24138) (Cons!24137 (h!25346 tuple2!17456) (t!34446 List!24141)) )
))
(declare-datatypes ((ListLongMap!15425 0))(
  ( (ListLongMap!15426 (toList!7728 List!24141)) )
))
(declare-fun call!46473 () ListLongMap!15425)

(declare-fun bm!46470 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4224 (array!71955 array!71957 (_ BitVec 32) (_ BitVec 32) V!41819 V!41819 (_ BitVec 32) Int) ListLongMap!15425)

(assert (=> bm!46470 (= call!46473 (getCurrentListMapNoExtraKeys!4224 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107854 () Bool)

(declare-fun res!739346 () Bool)

(assert (=> b!1107854 (=> (not res!739346) (not e!632047))))

(assert (=> b!1107854 (= res!739346 (= (select (arr!34630 _keys!1208) i!673) k0!934))))

(declare-fun b!1107855 () Bool)

(declare-fun res!739339 () Bool)

(assert (=> b!1107855 (=> (not res!739339) (not e!632047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107855 (= res!739339 (validKeyInArray!0 k0!934))))

(declare-fun call!46474 () ListLongMap!15425)

(declare-fun bm!46471 () Bool)

(declare-fun dynLambda!2356 (Int (_ BitVec 64)) V!41819)

(assert (=> bm!46471 (= call!46474 (getCurrentListMapNoExtraKeys!4224 lt!495702 (array!71958 (store (arr!34631 _values!996) i!673 (ValueCellFull!13050 (dynLambda!2356 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35167 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107856 () Bool)

(assert (=> b!1107856 (= e!632048 (and e!632049 mapRes!43096))))

(declare-fun condMapEmpty!43096 () Bool)

(declare-fun mapDefault!43096 () ValueCell!13050)

(assert (=> b!1107856 (= condMapEmpty!43096 (= (arr!34631 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13050)) mapDefault!43096)))))

(declare-fun b!1107857 () Bool)

(declare-fun e!632044 () Bool)

(declare-fun -!1008 (ListLongMap!15425 (_ BitVec 64)) ListLongMap!15425)

(assert (=> b!1107857 (= e!632044 (= call!46474 (-!1008 call!46473 k0!934)))))

(declare-fun b!1107858 () Bool)

(assert (=> b!1107858 (= e!632044 (= call!46474 call!46473))))

(declare-fun mapIsEmpty!43096 () Bool)

(assert (=> mapIsEmpty!43096 mapRes!43096))

(declare-fun b!1107859 () Bool)

(declare-fun res!739341 () Bool)

(assert (=> b!1107859 (=> (not res!739341) (not e!632047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107859 (= res!739341 (validMask!0 mask!1564))))

(declare-fun b!1107860 () Bool)

(assert (=> b!1107860 (= e!632043 true)))

(assert (=> b!1107860 e!632044))

(declare-fun c!109068 () Bool)

(assert (=> b!1107860 (= c!109068 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495703 () Unit!36360)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!253 (array!71955 array!71957 (_ BitVec 32) (_ BitVec 32) V!41819 V!41819 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36360)

(assert (=> b!1107860 (= lt!495703 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!253 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97288 res!739345) b!1107859))

(assert (= (and b!1107859 res!739341) b!1107847))

(assert (= (and b!1107847 res!739343) b!1107851))

(assert (= (and b!1107851 res!739342) b!1107845))

(assert (= (and b!1107845 res!739344) b!1107848))

(assert (= (and b!1107848 res!739348) b!1107855))

(assert (= (and b!1107855 res!739339) b!1107854))

(assert (= (and b!1107854 res!739346) b!1107850))

(assert (= (and b!1107850 res!739340) b!1107849))

(assert (= (and b!1107849 res!739338) b!1107852))

(assert (= (and b!1107852 (not res!739347)) b!1107860))

(assert (= (and b!1107860 c!109068) b!1107857))

(assert (= (and b!1107860 (not c!109068)) b!1107858))

(assert (= (or b!1107857 b!1107858) bm!46471))

(assert (= (or b!1107857 b!1107858) bm!46470))

(assert (= (and b!1107856 condMapEmpty!43096) mapIsEmpty!43096))

(assert (= (and b!1107856 (not condMapEmpty!43096)) mapNonEmpty!43096))

(get-info :version)

(assert (= (and mapNonEmpty!43096 ((_ is ValueCellFull!13050) mapValue!43096)) b!1107846))

(assert (= (and b!1107856 ((_ is ValueCellFull!13050) mapDefault!43096)) b!1107853))

(assert (= start!97288 b!1107856))

(declare-fun b_lambda!18277 () Bool)

(assert (=> (not b_lambda!18277) (not bm!46471)))

(declare-fun t!34444 () Bool)

(declare-fun tb!8125 () Bool)

(assert (=> (and start!97288 (= defaultEntry!1004 defaultEntry!1004) t!34444) tb!8125))

(declare-fun result!16811 () Bool)

(assert (=> tb!8125 (= result!16811 tp_is_empty!27519)))

(assert (=> bm!46471 t!34444))

(declare-fun b_and!37351 () Bool)

(assert (= b_and!37349 (and (=> t!34444 result!16811) b_and!37351)))

(declare-fun m!1026523 () Bool)

(assert (=> mapNonEmpty!43096 m!1026523))

(declare-fun m!1026525 () Bool)

(assert (=> b!1107850 m!1026525))

(declare-fun m!1026527 () Bool)

(assert (=> b!1107850 m!1026527))

(declare-fun m!1026529 () Bool)

(assert (=> b!1107859 m!1026529))

(declare-fun m!1026531 () Bool)

(assert (=> start!97288 m!1026531))

(declare-fun m!1026533 () Bool)

(assert (=> start!97288 m!1026533))

(declare-fun m!1026535 () Bool)

(assert (=> bm!46470 m!1026535))

(declare-fun m!1026537 () Bool)

(assert (=> b!1107855 m!1026537))

(declare-fun m!1026539 () Bool)

(assert (=> b!1107851 m!1026539))

(declare-fun m!1026541 () Bool)

(assert (=> b!1107854 m!1026541))

(declare-fun m!1026543 () Bool)

(assert (=> b!1107857 m!1026543))

(declare-fun m!1026545 () Bool)

(assert (=> b!1107849 m!1026545))

(declare-fun m!1026547 () Bool)

(assert (=> bm!46471 m!1026547))

(declare-fun m!1026549 () Bool)

(assert (=> bm!46471 m!1026549))

(declare-fun m!1026551 () Bool)

(assert (=> bm!46471 m!1026551))

(declare-fun m!1026553 () Bool)

(assert (=> b!1107845 m!1026553))

(declare-fun m!1026555 () Bool)

(assert (=> b!1107852 m!1026555))

(declare-fun m!1026557 () Bool)

(assert (=> b!1107852 m!1026557))

(declare-fun m!1026559 () Bool)

(assert (=> b!1107860 m!1026559))

(check-sat (not b_lambda!18277) (not b!1107857) (not b!1107845) (not bm!46470) (not b!1107850) tp_is_empty!27519 (not start!97288) (not b!1107860) (not b!1107851) b_and!37351 (not b_next!23259) (not b!1107849) (not bm!46471) (not b!1107852) (not b!1107855) (not b!1107859) (not mapNonEmpty!43096))
(check-sat b_and!37351 (not b_next!23259))
