; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97360 () Bool)

(assert start!97360)

(declare-fun b_free!23331 () Bool)

(declare-fun b_next!23331 () Bool)

(assert (=> start!97360 (= b_free!23331 (not b_next!23331))))

(declare-fun tp!82291 () Bool)

(declare-fun b_and!37497 () Bool)

(assert (=> start!97360 (= tp!82291 b_and!37497)))

(declare-fun mapIsEmpty!43204 () Bool)

(declare-fun mapRes!43204 () Bool)

(assert (=> mapIsEmpty!43204 mapRes!43204))

(declare-fun b!1109669 () Bool)

(declare-fun res!740535 () Bool)

(declare-fun e!632921 () Bool)

(assert (=> b!1109669 (=> (not res!740535) (not e!632921))))

(declare-datatypes ((array!72099 0))(
  ( (array!72100 (arr!34702 (Array (_ BitVec 32) (_ BitVec 64))) (size!35238 (_ BitVec 32))) )
))
(declare-fun lt!496026 () array!72099)

(declare-datatypes ((List!24195 0))(
  ( (Nil!24192) (Cons!24191 (h!25400 (_ BitVec 64)) (t!34572 List!24195)) )
))
(declare-fun arrayNoDuplicates!0 (array!72099 (_ BitVec 32) List!24195) Bool)

(assert (=> b!1109669 (= res!740535 (arrayNoDuplicates!0 lt!496026 #b00000000000000000000000000000000 Nil!24192))))

(declare-fun b!1109670 () Bool)

(declare-fun res!740536 () Bool)

(declare-fun e!632918 () Bool)

(assert (=> b!1109670 (=> (not res!740536) (not e!632918))))

(declare-fun _keys!1208 () array!72099)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1109670 (= res!740536 (= (select (arr!34702 _keys!1208) i!673) k0!934))))

(declare-fun b!1109671 () Bool)

(declare-fun e!632924 () Bool)

(assert (=> b!1109671 (= e!632924 true)))

(declare-fun e!632922 () Bool)

(assert (=> b!1109671 e!632922))

(declare-fun c!109188 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1109671 (= c!109188 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41915 0))(
  ( (V!41916 (val!13852 Int)) )
))
(declare-fun zeroValue!944 () V!41915)

(declare-datatypes ((Unit!36418 0))(
  ( (Unit!36419) )
))
(declare-fun lt!496028 () Unit!36418)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13086 0))(
  ( (ValueCellFull!13086 (v!16485 V!41915)) (EmptyCell!13086) )
))
(declare-datatypes ((array!72101 0))(
  ( (array!72102 (arr!34703 (Array (_ BitVec 32) ValueCell!13086)) (size!35239 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72101)

(declare-fun minValue!944 () V!41915)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!278 (array!72099 array!72101 (_ BitVec 32) (_ BitVec 32) V!41915 V!41915 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36418)

(assert (=> b!1109671 (= lt!496028 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!278 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109672 () Bool)

(declare-datatypes ((tuple2!17512 0))(
  ( (tuple2!17513 (_1!8767 (_ BitVec 64)) (_2!8767 V!41915)) )
))
(declare-datatypes ((List!24196 0))(
  ( (Nil!24193) (Cons!24192 (h!25401 tuple2!17512) (t!34573 List!24196)) )
))
(declare-datatypes ((ListLongMap!15481 0))(
  ( (ListLongMap!15482 (toList!7756 List!24196)) )
))
(declare-fun call!46689 () ListLongMap!15481)

(declare-fun call!46690 () ListLongMap!15481)

(assert (=> b!1109672 (= e!632922 (= call!46689 call!46690))))

(declare-fun b!1109673 () Bool)

(declare-fun -!1031 (ListLongMap!15481 (_ BitVec 64)) ListLongMap!15481)

(assert (=> b!1109673 (= e!632922 (= call!46689 (-!1031 call!46690 k0!934)))))

(declare-fun bm!46686 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4250 (array!72099 array!72101 (_ BitVec 32) (_ BitVec 32) V!41915 V!41915 (_ BitVec 32) Int) ListLongMap!15481)

(declare-fun dynLambda!2379 (Int (_ BitVec 64)) V!41915)

(assert (=> bm!46686 (= call!46689 (getCurrentListMapNoExtraKeys!4250 lt!496026 (array!72102 (store (arr!34703 _values!996) i!673 (ValueCellFull!13086 (dynLambda!2379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35239 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109674 () Bool)

(declare-fun e!632925 () Bool)

(declare-fun tp_is_empty!27591 () Bool)

(assert (=> b!1109674 (= e!632925 tp_is_empty!27591)))

(declare-fun b!1109675 () Bool)

(assert (=> b!1109675 (= e!632921 (not e!632924))))

(declare-fun res!740528 () Bool)

(assert (=> b!1109675 (=> res!740528 e!632924)))

(assert (=> b!1109675 (= res!740528 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35238 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109675 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496027 () Unit!36418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72099 (_ BitVec 64) (_ BitVec 32)) Unit!36418)

(assert (=> b!1109675 (= lt!496027 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1109676 () Bool)

(declare-fun res!740531 () Bool)

(assert (=> b!1109676 (=> (not res!740531) (not e!632918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72099 (_ BitVec 32)) Bool)

(assert (=> b!1109676 (= res!740531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109677 () Bool)

(declare-fun res!740527 () Bool)

(assert (=> b!1109677 (=> (not res!740527) (not e!632918))))

(assert (=> b!1109677 (= res!740527 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35238 _keys!1208))))))

(declare-fun b!1109678 () Bool)

(declare-fun res!740533 () Bool)

(assert (=> b!1109678 (=> (not res!740533) (not e!632918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109678 (= res!740533 (validKeyInArray!0 k0!934))))

(declare-fun b!1109679 () Bool)

(declare-fun e!632920 () Bool)

(assert (=> b!1109679 (= e!632920 tp_is_empty!27591)))

(declare-fun b!1109680 () Bool)

(declare-fun res!740534 () Bool)

(assert (=> b!1109680 (=> (not res!740534) (not e!632918))))

(assert (=> b!1109680 (= res!740534 (and (= (size!35239 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35238 _keys!1208) (size!35239 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!740532 () Bool)

(assert (=> start!97360 (=> (not res!740532) (not e!632918))))

(assert (=> start!97360 (= res!740532 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35238 _keys!1208))))))

(assert (=> start!97360 e!632918))

(assert (=> start!97360 tp_is_empty!27591))

(declare-fun array_inv!26704 (array!72099) Bool)

(assert (=> start!97360 (array_inv!26704 _keys!1208)))

(assert (=> start!97360 true))

(assert (=> start!97360 tp!82291))

(declare-fun e!632919 () Bool)

(declare-fun array_inv!26705 (array!72101) Bool)

(assert (=> start!97360 (and (array_inv!26705 _values!996) e!632919)))

(declare-fun bm!46687 () Bool)

(assert (=> bm!46687 (= call!46690 (getCurrentListMapNoExtraKeys!4250 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109681 () Bool)

(declare-fun res!740526 () Bool)

(assert (=> b!1109681 (=> (not res!740526) (not e!632918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109681 (= res!740526 (validMask!0 mask!1564))))

(declare-fun b!1109682 () Bool)

(declare-fun res!740530 () Bool)

(assert (=> b!1109682 (=> (not res!740530) (not e!632918))))

(assert (=> b!1109682 (= res!740530 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24192))))

(declare-fun b!1109683 () Bool)

(assert (=> b!1109683 (= e!632918 e!632921)))

(declare-fun res!740529 () Bool)

(assert (=> b!1109683 (=> (not res!740529) (not e!632921))))

(assert (=> b!1109683 (= res!740529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496026 mask!1564))))

(assert (=> b!1109683 (= lt!496026 (array!72100 (store (arr!34702 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35238 _keys!1208)))))

(declare-fun mapNonEmpty!43204 () Bool)

(declare-fun tp!82292 () Bool)

(assert (=> mapNonEmpty!43204 (= mapRes!43204 (and tp!82292 e!632920))))

(declare-fun mapRest!43204 () (Array (_ BitVec 32) ValueCell!13086))

(declare-fun mapKey!43204 () (_ BitVec 32))

(declare-fun mapValue!43204 () ValueCell!13086)

(assert (=> mapNonEmpty!43204 (= (arr!34703 _values!996) (store mapRest!43204 mapKey!43204 mapValue!43204))))

(declare-fun b!1109684 () Bool)

(assert (=> b!1109684 (= e!632919 (and e!632925 mapRes!43204))))

(declare-fun condMapEmpty!43204 () Bool)

(declare-fun mapDefault!43204 () ValueCell!13086)

(assert (=> b!1109684 (= condMapEmpty!43204 (= (arr!34703 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13086)) mapDefault!43204)))))

(assert (= (and start!97360 res!740532) b!1109681))

(assert (= (and b!1109681 res!740526) b!1109680))

(assert (= (and b!1109680 res!740534) b!1109676))

(assert (= (and b!1109676 res!740531) b!1109682))

(assert (= (and b!1109682 res!740530) b!1109677))

(assert (= (and b!1109677 res!740527) b!1109678))

(assert (= (and b!1109678 res!740533) b!1109670))

(assert (= (and b!1109670 res!740536) b!1109683))

(assert (= (and b!1109683 res!740529) b!1109669))

(assert (= (and b!1109669 res!740535) b!1109675))

(assert (= (and b!1109675 (not res!740528)) b!1109671))

(assert (= (and b!1109671 c!109188) b!1109673))

(assert (= (and b!1109671 (not c!109188)) b!1109672))

(assert (= (or b!1109673 b!1109672) bm!46686))

(assert (= (or b!1109673 b!1109672) bm!46687))

(assert (= (and b!1109684 condMapEmpty!43204) mapIsEmpty!43204))

(assert (= (and b!1109684 (not condMapEmpty!43204)) mapNonEmpty!43204))

(get-info :version)

(assert (= (and mapNonEmpty!43204 ((_ is ValueCellFull!13086) mapValue!43204)) b!1109679))

(assert (= (and b!1109684 ((_ is ValueCellFull!13086) mapDefault!43204)) b!1109674))

(assert (= start!97360 b!1109684))

(declare-fun b_lambda!18353 () Bool)

(assert (=> (not b_lambda!18353) (not bm!46686)))

(declare-fun t!34571 () Bool)

(declare-fun tb!8197 () Bool)

(assert (=> (and start!97360 (= defaultEntry!1004 defaultEntry!1004) t!34571) tb!8197))

(declare-fun result!16955 () Bool)

(assert (=> tb!8197 (= result!16955 tp_is_empty!27591)))

(assert (=> bm!46686 t!34571))

(declare-fun b_and!37499 () Bool)

(assert (= b_and!37497 (and (=> t!34571 result!16955) b_and!37499)))

(declare-fun m!1027891 () Bool)

(assert (=> b!1109678 m!1027891))

(declare-fun m!1027893 () Bool)

(assert (=> bm!46686 m!1027893))

(declare-fun m!1027895 () Bool)

(assert (=> bm!46686 m!1027895))

(declare-fun m!1027897 () Bool)

(assert (=> bm!46686 m!1027897))

(declare-fun m!1027899 () Bool)

(assert (=> bm!46687 m!1027899))

(declare-fun m!1027901 () Bool)

(assert (=> b!1109673 m!1027901))

(declare-fun m!1027903 () Bool)

(assert (=> start!97360 m!1027903))

(declare-fun m!1027905 () Bool)

(assert (=> start!97360 m!1027905))

(declare-fun m!1027907 () Bool)

(assert (=> b!1109670 m!1027907))

(declare-fun m!1027909 () Bool)

(assert (=> mapNonEmpty!43204 m!1027909))

(declare-fun m!1027911 () Bool)

(assert (=> b!1109675 m!1027911))

(declare-fun m!1027913 () Bool)

(assert (=> b!1109675 m!1027913))

(declare-fun m!1027915 () Bool)

(assert (=> b!1109681 m!1027915))

(declare-fun m!1027917 () Bool)

(assert (=> b!1109671 m!1027917))

(declare-fun m!1027919 () Bool)

(assert (=> b!1109669 m!1027919))

(declare-fun m!1027921 () Bool)

(assert (=> b!1109676 m!1027921))

(declare-fun m!1027923 () Bool)

(assert (=> b!1109682 m!1027923))

(declare-fun m!1027925 () Bool)

(assert (=> b!1109683 m!1027925))

(declare-fun m!1027927 () Bool)

(assert (=> b!1109683 m!1027927))

(check-sat (not b!1109681) (not b!1109683) (not start!97360) b_and!37499 (not b!1109673) (not b!1109671) tp_is_empty!27591 (not b_lambda!18353) (not b_next!23331) (not bm!46687) (not bm!46686) (not mapNonEmpty!43204) (not b!1109675) (not b!1109682) (not b!1109669) (not b!1109678) (not b!1109676))
(check-sat b_and!37499 (not b_next!23331))
