; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97624 () Bool)

(assert start!97624)

(declare-fun b_free!23359 () Bool)

(declare-fun b_next!23359 () Bool)

(assert (=> start!97624 (= b_free!23359 (not b_next!23359))))

(declare-fun tp!82375 () Bool)

(declare-fun b_and!37561 () Bool)

(assert (=> start!97624 (= tp!82375 b_and!37561)))

(declare-fun b!1111684 () Bool)

(declare-fun res!741519 () Bool)

(declare-fun e!634103 () Bool)

(assert (=> b!1111684 (=> (not res!741519) (not e!634103))))

(declare-datatypes ((array!72189 0))(
  ( (array!72190 (arr!34741 (Array (_ BitVec 32) (_ BitVec 64))) (size!35278 (_ BitVec 32))) )
))
(declare-fun lt!496669 () array!72189)

(declare-datatypes ((List!24235 0))(
  ( (Nil!24232) (Cons!24231 (h!25449 (_ BitVec 64)) (t!34632 List!24235)) )
))
(declare-fun arrayNoDuplicates!0 (array!72189 (_ BitVec 32) List!24235) Bool)

(assert (=> b!1111684 (= res!741519 (arrayNoDuplicates!0 lt!496669 #b00000000000000000000000000000000 Nil!24232))))

(declare-fun mapNonEmpty!43246 () Bool)

(declare-fun mapRes!43246 () Bool)

(declare-fun tp!82376 () Bool)

(declare-fun e!634104 () Bool)

(assert (=> mapNonEmpty!43246 (= mapRes!43246 (and tp!82376 e!634104))))

(declare-datatypes ((V!41953 0))(
  ( (V!41954 (val!13866 Int)) )
))
(declare-datatypes ((ValueCell!13100 0))(
  ( (ValueCellFull!13100 (v!16495 V!41953)) (EmptyCell!13100) )
))
(declare-fun mapValue!43246 () ValueCell!13100)

(declare-fun mapRest!43246 () (Array (_ BitVec 32) ValueCell!13100))

(declare-datatypes ((array!72191 0))(
  ( (array!72192 (arr!34742 (Array (_ BitVec 32) ValueCell!13100)) (size!35279 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72191)

(declare-fun mapKey!43246 () (_ BitVec 32))

(assert (=> mapNonEmpty!43246 (= (arr!34742 _values!996) (store mapRest!43246 mapKey!43246 mapValue!43246))))

(declare-fun b!1111685 () Bool)

(declare-fun res!741515 () Bool)

(declare-fun e!634109 () Bool)

(assert (=> b!1111685 (=> (not res!741515) (not e!634109))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!72189)

(assert (=> b!1111685 (= res!741515 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35278 _keys!1208))))))

(declare-fun res!741518 () Bool)

(assert (=> start!97624 (=> (not res!741518) (not e!634109))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97624 (= res!741518 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35278 _keys!1208))))))

(assert (=> start!97624 e!634109))

(declare-fun tp_is_empty!27619 () Bool)

(assert (=> start!97624 tp_is_empty!27619))

(declare-fun array_inv!26770 (array!72189) Bool)

(assert (=> start!97624 (array_inv!26770 _keys!1208)))

(assert (=> start!97624 true))

(assert (=> start!97624 tp!82375))

(declare-fun e!634108 () Bool)

(declare-fun array_inv!26771 (array!72191) Bool)

(assert (=> start!97624 (and (array_inv!26771 _values!996) e!634108)))

(declare-fun b!1111686 () Bool)

(declare-fun res!741513 () Bool)

(assert (=> b!1111686 (=> (not res!741513) (not e!634109))))

(assert (=> b!1111686 (= res!741513 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24232))))

(declare-fun b!1111687 () Bool)

(declare-fun e!634106 () Bool)

(assert (=> b!1111687 (= e!634103 (not e!634106))))

(declare-fun res!741516 () Bool)

(assert (=> b!1111687 (=> res!741516 e!634106)))

(assert (=> b!1111687 (= res!741516 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35278 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111687 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36415 0))(
  ( (Unit!36416) )
))
(declare-fun lt!496668 () Unit!36415)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72189 (_ BitVec 64) (_ BitVec 32)) Unit!36415)

(assert (=> b!1111687 (= lt!496668 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!46837 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41953)

(declare-datatypes ((tuple2!17552 0))(
  ( (tuple2!17553 (_1!8787 (_ BitVec 64)) (_2!8787 V!41953)) )
))
(declare-datatypes ((List!24236 0))(
  ( (Nil!24233) (Cons!24232 (h!25450 tuple2!17552) (t!34633 List!24236)) )
))
(declare-datatypes ((ListLongMap!15529 0))(
  ( (ListLongMap!15530 (toList!7780 List!24236)) )
))
(declare-fun call!46840 () ListLongMap!15529)

(declare-fun zeroValue!944 () V!41953)

(declare-fun getCurrentListMapNoExtraKeys!4312 (array!72189 array!72191 (_ BitVec 32) (_ BitVec 32) V!41953 V!41953 (_ BitVec 32) Int) ListLongMap!15529)

(assert (=> bm!46837 (= call!46840 (getCurrentListMapNoExtraKeys!4312 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111688 () Bool)

(assert (=> b!1111688 (= e!634104 tp_is_empty!27619)))

(declare-fun b!1111689 () Bool)

(declare-fun e!634105 () Bool)

(assert (=> b!1111689 (= e!634108 (and e!634105 mapRes!43246))))

(declare-fun condMapEmpty!43246 () Bool)

(declare-fun mapDefault!43246 () ValueCell!13100)

(assert (=> b!1111689 (= condMapEmpty!43246 (= (arr!34742 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13100)) mapDefault!43246)))))

(declare-fun b!1111690 () Bool)

(declare-fun res!741514 () Bool)

(assert (=> b!1111690 (=> (not res!741514) (not e!634109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111690 (= res!741514 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43246 () Bool)

(assert (=> mapIsEmpty!43246 mapRes!43246))

(declare-fun b!1111691 () Bool)

(assert (=> b!1111691 (= e!634109 e!634103)))

(declare-fun res!741512 () Bool)

(assert (=> b!1111691 (=> (not res!741512) (not e!634103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72189 (_ BitVec 32)) Bool)

(assert (=> b!1111691 (= res!741512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496669 mask!1564))))

(assert (=> b!1111691 (= lt!496669 (array!72190 (store (arr!34741 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35278 _keys!1208)))))

(declare-fun b!1111692 () Bool)

(declare-fun res!741510 () Bool)

(assert (=> b!1111692 (=> (not res!741510) (not e!634109))))

(assert (=> b!1111692 (= res!741510 (= (select (arr!34741 _keys!1208) i!673) k0!934))))

(declare-fun b!1111693 () Bool)

(declare-fun res!741511 () Bool)

(assert (=> b!1111693 (=> (not res!741511) (not e!634109))))

(assert (=> b!1111693 (= res!741511 (and (= (size!35279 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35278 _keys!1208) (size!35279 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111694 () Bool)

(declare-fun res!741517 () Bool)

(assert (=> b!1111694 (=> (not res!741517) (not e!634109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111694 (= res!741517 (validKeyInArray!0 k0!934))))

(declare-fun b!1111695 () Bool)

(declare-fun e!634110 () Bool)

(declare-fun call!46841 () ListLongMap!15529)

(declare-fun -!1033 (ListLongMap!15529 (_ BitVec 64)) ListLongMap!15529)

(assert (=> b!1111695 (= e!634110 (= call!46841 (-!1033 call!46840 k0!934)))))

(declare-fun bm!46838 () Bool)

(declare-fun dynLambda!2424 (Int (_ BitVec 64)) V!41953)

(assert (=> bm!46838 (= call!46841 (getCurrentListMapNoExtraKeys!4312 lt!496669 (array!72192 (store (arr!34742 _values!996) i!673 (ValueCellFull!13100 (dynLambda!2424 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35279 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111696 () Bool)

(assert (=> b!1111696 (= e!634106 true)))

(assert (=> b!1111696 e!634110))

(declare-fun c!109634 () Bool)

(assert (=> b!1111696 (= c!109634 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496667 () Unit!36415)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!300 (array!72189 array!72191 (_ BitVec 32) (_ BitVec 32) V!41953 V!41953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36415)

(assert (=> b!1111696 (= lt!496667 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!300 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111697 () Bool)

(assert (=> b!1111697 (= e!634105 tp_is_empty!27619)))

(declare-fun b!1111698 () Bool)

(declare-fun res!741520 () Bool)

(assert (=> b!1111698 (=> (not res!741520) (not e!634109))))

(assert (=> b!1111698 (= res!741520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111699 () Bool)

(assert (=> b!1111699 (= e!634110 (= call!46841 call!46840))))

(assert (= (and start!97624 res!741518) b!1111690))

(assert (= (and b!1111690 res!741514) b!1111693))

(assert (= (and b!1111693 res!741511) b!1111698))

(assert (= (and b!1111698 res!741520) b!1111686))

(assert (= (and b!1111686 res!741513) b!1111685))

(assert (= (and b!1111685 res!741515) b!1111694))

(assert (= (and b!1111694 res!741517) b!1111692))

(assert (= (and b!1111692 res!741510) b!1111691))

(assert (= (and b!1111691 res!741512) b!1111684))

(assert (= (and b!1111684 res!741519) b!1111687))

(assert (= (and b!1111687 (not res!741516)) b!1111696))

(assert (= (and b!1111696 c!109634) b!1111695))

(assert (= (and b!1111696 (not c!109634)) b!1111699))

(assert (= (or b!1111695 b!1111699) bm!46838))

(assert (= (or b!1111695 b!1111699) bm!46837))

(assert (= (and b!1111689 condMapEmpty!43246) mapIsEmpty!43246))

(assert (= (and b!1111689 (not condMapEmpty!43246)) mapNonEmpty!43246))

(get-info :version)

(assert (= (and mapNonEmpty!43246 ((_ is ValueCellFull!13100) mapValue!43246)) b!1111688))

(assert (= (and b!1111689 ((_ is ValueCellFull!13100) mapDefault!43246)) b!1111697))

(assert (= start!97624 b!1111689))

(declare-fun b_lambda!18389 () Bool)

(assert (=> (not b_lambda!18389) (not bm!46838)))

(declare-fun t!34631 () Bool)

(declare-fun tb!8217 () Bool)

(assert (=> (and start!97624 (= defaultEntry!1004 defaultEntry!1004) t!34631) tb!8217))

(declare-fun result!17003 () Bool)

(assert (=> tb!8217 (= result!17003 tp_is_empty!27619)))

(assert (=> bm!46838 t!34631))

(declare-fun b_and!37563 () Bool)

(assert (= b_and!37561 (and (=> t!34631 result!17003) b_and!37563)))

(declare-fun m!1030095 () Bool)

(assert (=> b!1111691 m!1030095))

(declare-fun m!1030097 () Bool)

(assert (=> b!1111691 m!1030097))

(declare-fun m!1030099 () Bool)

(assert (=> bm!46837 m!1030099))

(declare-fun m!1030101 () Bool)

(assert (=> start!97624 m!1030101))

(declare-fun m!1030103 () Bool)

(assert (=> start!97624 m!1030103))

(declare-fun m!1030105 () Bool)

(assert (=> b!1111684 m!1030105))

(declare-fun m!1030107 () Bool)

(assert (=> b!1111687 m!1030107))

(declare-fun m!1030109 () Bool)

(assert (=> b!1111687 m!1030109))

(declare-fun m!1030111 () Bool)

(assert (=> mapNonEmpty!43246 m!1030111))

(declare-fun m!1030113 () Bool)

(assert (=> b!1111692 m!1030113))

(declare-fun m!1030115 () Bool)

(assert (=> b!1111696 m!1030115))

(declare-fun m!1030117 () Bool)

(assert (=> bm!46838 m!1030117))

(declare-fun m!1030119 () Bool)

(assert (=> bm!46838 m!1030119))

(declare-fun m!1030121 () Bool)

(assert (=> bm!46838 m!1030121))

(declare-fun m!1030123 () Bool)

(assert (=> b!1111698 m!1030123))

(declare-fun m!1030125 () Bool)

(assert (=> b!1111695 m!1030125))

(declare-fun m!1030127 () Bool)

(assert (=> b!1111686 m!1030127))

(declare-fun m!1030129 () Bool)

(assert (=> b!1111690 m!1030129))

(declare-fun m!1030131 () Bool)

(assert (=> b!1111694 m!1030131))

(check-sat (not b!1111695) (not b!1111687) (not b_next!23359) (not b!1111690) tp_is_empty!27619 (not bm!46838) b_and!37563 (not b_lambda!18389) (not start!97624) (not b!1111686) (not b!1111691) (not b!1111698) (not mapNonEmpty!43246) (not b!1111694) (not b!1111684) (not bm!46837) (not b!1111696))
(check-sat b_and!37563 (not b_next!23359))
