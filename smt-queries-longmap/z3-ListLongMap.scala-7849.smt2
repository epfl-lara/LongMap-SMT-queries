; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98074 () Bool)

(assert start!98074)

(declare-fun b_free!23539 () Bool)

(declare-fun b_next!23539 () Bool)

(assert (=> start!98074 (= b_free!23539 (not b_next!23539))))

(declare-fun tp!83321 () Bool)

(declare-fun b_and!37871 () Bool)

(assert (=> start!98074 (= tp!83321 b_and!37871)))

(declare-fun b!1121109 () Bool)

(declare-fun res!748534 () Bool)

(declare-fun e!638550 () Bool)

(assert (=> b!1121109 (=> (not res!748534) (not e!638550))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73069 0))(
  ( (array!73070 (arr!35181 (Array (_ BitVec 32) (_ BitVec 64))) (size!35718 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73069)

(assert (=> b!1121109 (= res!748534 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35718 _keys!1208))))))

(declare-fun b!1121110 () Bool)

(declare-fun res!748537 () Bool)

(assert (=> b!1121110 (=> (not res!748537) (not e!638550))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73069 (_ BitVec 32)) Bool)

(assert (=> b!1121110 (= res!748537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121111 () Bool)

(declare-fun res!748531 () Bool)

(declare-fun e!638554 () Bool)

(assert (=> b!1121111 (=> (not res!748531) (not e!638554))))

(declare-fun lt!498364 () array!73069)

(declare-datatypes ((List!24486 0))(
  ( (Nil!24483) (Cons!24482 (h!25700 (_ BitVec 64)) (t!35009 List!24486)) )
))
(declare-fun arrayNoDuplicates!0 (array!73069 (_ BitVec 32) List!24486) Bool)

(assert (=> b!1121111 (= res!748531 (arrayNoDuplicates!0 lt!498364 #b00000000000000000000000000000000 Nil!24483))))

(declare-fun b!1121112 () Bool)

(declare-fun e!638556 () Bool)

(assert (=> b!1121112 (= e!638556 true)))

(declare-datatypes ((V!42553 0))(
  ( (V!42554 (val!14091 Int)) )
))
(declare-fun zeroValue!944 () V!42553)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17692 0))(
  ( (tuple2!17693 (_1!8857 (_ BitVec 64)) (_2!8857 V!42553)) )
))
(declare-datatypes ((List!24487 0))(
  ( (Nil!24484) (Cons!24483 (h!25701 tuple2!17692) (t!35010 List!24487)) )
))
(declare-datatypes ((ListLongMap!15669 0))(
  ( (ListLongMap!15670 (toList!7850 List!24487)) )
))
(declare-fun lt!498361 () ListLongMap!15669)

(declare-datatypes ((ValueCell!13325 0))(
  ( (ValueCellFull!13325 (v!16720 V!42553)) (EmptyCell!13325) )
))
(declare-datatypes ((array!73071 0))(
  ( (array!73072 (arr!35182 (Array (_ BitVec 32) ValueCell!13325)) (size!35719 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73071)

(declare-fun minValue!944 () V!42553)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4380 (array!73069 array!73071 (_ BitVec 32) (_ BitVec 32) V!42553 V!42553 (_ BitVec 32) Int) ListLongMap!15669)

(declare-fun dynLambda!2469 (Int (_ BitVec 64)) V!42553)

(assert (=> b!1121112 (= lt!498361 (getCurrentListMapNoExtraKeys!4380 lt!498364 (array!73072 (store (arr!35182 _values!996) i!673 (ValueCellFull!13325 (dynLambda!2469 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35719 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498363 () ListLongMap!15669)

(assert (=> b!1121112 (= lt!498363 (getCurrentListMapNoExtraKeys!4380 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121113 () Bool)

(declare-fun res!748532 () Bool)

(assert (=> b!1121113 (=> (not res!748532) (not e!638550))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121113 (= res!748532 (validKeyInArray!0 k0!934))))

(declare-fun b!1121114 () Bool)

(assert (=> b!1121114 (= e!638554 (not e!638556))))

(declare-fun res!748538 () Bool)

(assert (=> b!1121114 (=> res!748538 e!638556)))

(assert (=> b!1121114 (= res!748538 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121114 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36731 0))(
  ( (Unit!36732) )
))
(declare-fun lt!498362 () Unit!36731)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73069 (_ BitVec 64) (_ BitVec 32)) Unit!36731)

(assert (=> b!1121114 (= lt!498362 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1121116 () Bool)

(declare-fun res!748540 () Bool)

(assert (=> b!1121116 (=> (not res!748540) (not e!638550))))

(assert (=> b!1121116 (= res!748540 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24483))))

(declare-fun b!1121117 () Bool)

(declare-fun e!638551 () Bool)

(declare-fun tp_is_empty!28069 () Bool)

(assert (=> b!1121117 (= e!638551 tp_is_empty!28069)))

(declare-fun mapNonEmpty!43921 () Bool)

(declare-fun mapRes!43921 () Bool)

(declare-fun tp!83320 () Bool)

(declare-fun e!638553 () Bool)

(assert (=> mapNonEmpty!43921 (= mapRes!43921 (and tp!83320 e!638553))))

(declare-fun mapRest!43921 () (Array (_ BitVec 32) ValueCell!13325))

(declare-fun mapKey!43921 () (_ BitVec 32))

(declare-fun mapValue!43921 () ValueCell!13325)

(assert (=> mapNonEmpty!43921 (= (arr!35182 _values!996) (store mapRest!43921 mapKey!43921 mapValue!43921))))

(declare-fun b!1121118 () Bool)

(declare-fun res!748533 () Bool)

(assert (=> b!1121118 (=> (not res!748533) (not e!638550))))

(assert (=> b!1121118 (= res!748533 (= (select (arr!35181 _keys!1208) i!673) k0!934))))

(declare-fun b!1121119 () Bool)

(declare-fun e!638555 () Bool)

(assert (=> b!1121119 (= e!638555 (and e!638551 mapRes!43921))))

(declare-fun condMapEmpty!43921 () Bool)

(declare-fun mapDefault!43921 () ValueCell!13325)

(assert (=> b!1121119 (= condMapEmpty!43921 (= (arr!35182 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13325)) mapDefault!43921)))))

(declare-fun b!1121120 () Bool)

(assert (=> b!1121120 (= e!638553 tp_is_empty!28069)))

(declare-fun b!1121121 () Bool)

(declare-fun res!748535 () Bool)

(assert (=> b!1121121 (=> (not res!748535) (not e!638550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121121 (= res!748535 (validMask!0 mask!1564))))

(declare-fun res!748539 () Bool)

(assert (=> start!98074 (=> (not res!748539) (not e!638550))))

(assert (=> start!98074 (= res!748539 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35718 _keys!1208))))))

(assert (=> start!98074 e!638550))

(assert (=> start!98074 tp_is_empty!28069))

(declare-fun array_inv!27084 (array!73069) Bool)

(assert (=> start!98074 (array_inv!27084 _keys!1208)))

(assert (=> start!98074 true))

(assert (=> start!98074 tp!83321))

(declare-fun array_inv!27085 (array!73071) Bool)

(assert (=> start!98074 (and (array_inv!27085 _values!996) e!638555)))

(declare-fun b!1121115 () Bool)

(declare-fun res!748530 () Bool)

(assert (=> b!1121115 (=> (not res!748530) (not e!638550))))

(assert (=> b!1121115 (= res!748530 (and (= (size!35719 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35718 _keys!1208) (size!35719 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43921 () Bool)

(assert (=> mapIsEmpty!43921 mapRes!43921))

(declare-fun b!1121122 () Bool)

(assert (=> b!1121122 (= e!638550 e!638554)))

(declare-fun res!748536 () Bool)

(assert (=> b!1121122 (=> (not res!748536) (not e!638554))))

(assert (=> b!1121122 (= res!748536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498364 mask!1564))))

(assert (=> b!1121122 (= lt!498364 (array!73070 (store (arr!35181 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35718 _keys!1208)))))

(assert (= (and start!98074 res!748539) b!1121121))

(assert (= (and b!1121121 res!748535) b!1121115))

(assert (= (and b!1121115 res!748530) b!1121110))

(assert (= (and b!1121110 res!748537) b!1121116))

(assert (= (and b!1121116 res!748540) b!1121109))

(assert (= (and b!1121109 res!748534) b!1121113))

(assert (= (and b!1121113 res!748532) b!1121118))

(assert (= (and b!1121118 res!748533) b!1121122))

(assert (= (and b!1121122 res!748536) b!1121111))

(assert (= (and b!1121111 res!748531) b!1121114))

(assert (= (and b!1121114 (not res!748538)) b!1121112))

(assert (= (and b!1121119 condMapEmpty!43921) mapIsEmpty!43921))

(assert (= (and b!1121119 (not condMapEmpty!43921)) mapNonEmpty!43921))

(get-info :version)

(assert (= (and mapNonEmpty!43921 ((_ is ValueCellFull!13325) mapValue!43921)) b!1121120))

(assert (= (and b!1121119 ((_ is ValueCellFull!13325) mapDefault!43921)) b!1121117))

(assert (= start!98074 b!1121119))

(declare-fun b_lambda!18519 () Bool)

(assert (=> (not b_lambda!18519) (not b!1121112)))

(declare-fun t!35008 () Bool)

(declare-fun tb!8343 () Bool)

(assert (=> (and start!98074 (= defaultEntry!1004 defaultEntry!1004) t!35008) tb!8343))

(declare-fun result!17255 () Bool)

(assert (=> tb!8343 (= result!17255 tp_is_empty!28069)))

(assert (=> b!1121112 t!35008))

(declare-fun b_and!37873 () Bool)

(assert (= b_and!37871 (and (=> t!35008 result!17255) b_and!37873)))

(declare-fun m!1036659 () Bool)

(assert (=> b!1121122 m!1036659))

(declare-fun m!1036661 () Bool)

(assert (=> b!1121122 m!1036661))

(declare-fun m!1036663 () Bool)

(assert (=> b!1121118 m!1036663))

(declare-fun m!1036665 () Bool)

(assert (=> b!1121110 m!1036665))

(declare-fun m!1036667 () Bool)

(assert (=> b!1121111 m!1036667))

(declare-fun m!1036669 () Bool)

(assert (=> start!98074 m!1036669))

(declare-fun m!1036671 () Bool)

(assert (=> start!98074 m!1036671))

(declare-fun m!1036673 () Bool)

(assert (=> b!1121113 m!1036673))

(declare-fun m!1036675 () Bool)

(assert (=> mapNonEmpty!43921 m!1036675))

(declare-fun m!1036677 () Bool)

(assert (=> b!1121114 m!1036677))

(declare-fun m!1036679 () Bool)

(assert (=> b!1121114 m!1036679))

(declare-fun m!1036681 () Bool)

(assert (=> b!1121116 m!1036681))

(declare-fun m!1036683 () Bool)

(assert (=> b!1121121 m!1036683))

(declare-fun m!1036685 () Bool)

(assert (=> b!1121112 m!1036685))

(declare-fun m!1036687 () Bool)

(assert (=> b!1121112 m!1036687))

(declare-fun m!1036689 () Bool)

(assert (=> b!1121112 m!1036689))

(declare-fun m!1036691 () Bool)

(assert (=> b!1121112 m!1036691))

(check-sat b_and!37873 (not b!1121111) (not b!1121116) (not b!1121112) tp_is_empty!28069 (not b!1121114) (not b!1121121) (not b!1121113) (not b_next!23539) (not mapNonEmpty!43921) (not b!1121110) (not start!98074) (not b!1121122) (not b_lambda!18519))
(check-sat b_and!37873 (not b_next!23539))
