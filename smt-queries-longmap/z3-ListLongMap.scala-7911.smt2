; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98212 () Bool)

(assert start!98212)

(declare-fun b_free!23913 () Bool)

(declare-fun b_next!23913 () Bool)

(assert (=> start!98212 (= b_free!23913 (not b_next!23913))))

(declare-fun tp!84442 () Bool)

(declare-fun b_and!38609 () Bool)

(assert (=> start!98212 (= tp!84442 b_and!38609)))

(declare-fun b!1130716 () Bool)

(declare-fun res!755465 () Bool)

(declare-fun e!643512 () Bool)

(assert (=> b!1130716 (=> (not res!755465) (not e!643512))))

(declare-datatypes ((array!73743 0))(
  ( (array!73744 (arr!35524 (Array (_ BitVec 32) (_ BitVec 64))) (size!36060 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73743)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43051 0))(
  ( (V!43052 (val!14278 Int)) )
))
(declare-datatypes ((ValueCell!13512 0))(
  ( (ValueCellFull!13512 (v!16911 V!43051)) (EmptyCell!13512) )
))
(declare-datatypes ((array!73745 0))(
  ( (array!73746 (arr!35525 (Array (_ BitVec 32) ValueCell!13512)) (size!36061 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73745)

(assert (=> b!1130716 (= res!755465 (and (= (size!36061 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36060 _keys!1208) (size!36061 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130717 () Bool)

(declare-fun res!755467 () Bool)

(assert (=> b!1130717 (=> (not res!755467) (not e!643512))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130717 (= res!755467 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36060 _keys!1208))))))

(declare-fun mapIsEmpty!44482 () Bool)

(declare-fun mapRes!44482 () Bool)

(assert (=> mapIsEmpty!44482 mapRes!44482))

(declare-fun b!1130719 () Bool)

(declare-datatypes ((Unit!37043 0))(
  ( (Unit!37044) )
))
(declare-fun e!643511 () Unit!37043)

(declare-fun lt!502152 () Unit!37043)

(assert (=> b!1130719 (= e!643511 lt!502152)))

(declare-fun call!48435 () Unit!37043)

(assert (=> b!1130719 (= lt!502152 call!48435)))

(declare-fun call!48432 () Bool)

(assert (=> b!1130719 call!48432))

(declare-fun b!1130720 () Bool)

(declare-fun e!643505 () Bool)

(declare-fun e!643504 () Bool)

(assert (=> b!1130720 (= e!643505 e!643504)))

(declare-fun res!755459 () Bool)

(assert (=> b!1130720 (=> res!755459 e!643504)))

(declare-datatypes ((tuple2!17990 0))(
  ( (tuple2!17991 (_1!9006 (_ BitVec 64)) (_2!9006 V!43051)) )
))
(declare-datatypes ((List!24754 0))(
  ( (Nil!24751) (Cons!24750 (h!25959 tuple2!17990) (t!35659 List!24754)) )
))
(declare-datatypes ((ListLongMap!15959 0))(
  ( (ListLongMap!15960 (toList!7995 List!24754)) )
))
(declare-fun lt!502147 () ListLongMap!15959)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6518 (ListLongMap!15959 (_ BitVec 64)) Bool)

(assert (=> b!1130720 (= res!755459 (not (contains!6518 lt!502147 k0!934)))))

(declare-fun zeroValue!944 () V!43051)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43051)

(declare-fun getCurrentListMapNoExtraKeys!4482 (array!73743 array!73745 (_ BitVec 32) (_ BitVec 32) V!43051 V!43051 (_ BitVec 32) Int) ListLongMap!15959)

(assert (=> b!1130720 (= lt!502147 (getCurrentListMapNoExtraKeys!4482 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130721 () Bool)

(declare-fun e!643502 () Unit!37043)

(declare-fun lt!502151 () Unit!37043)

(assert (=> b!1130721 (= e!643502 lt!502151)))

(declare-fun lt!502145 () Unit!37043)

(declare-fun call!48431 () Unit!37043)

(assert (=> b!1130721 (= lt!502145 call!48431)))

(declare-fun lt!502150 () ListLongMap!15959)

(declare-fun call!48429 () ListLongMap!15959)

(assert (=> b!1130721 (= lt!502150 call!48429)))

(declare-fun call!48436 () Bool)

(assert (=> b!1130721 call!48436))

(declare-fun addStillContains!706 (ListLongMap!15959 (_ BitVec 64) V!43051 (_ BitVec 64)) Unit!37043)

(assert (=> b!1130721 (= lt!502151 (addStillContains!706 lt!502150 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun +!3444 (ListLongMap!15959 tuple2!17990) ListLongMap!15959)

(assert (=> b!1130721 (contains!6518 (+!3444 lt!502150 (tuple2!17991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1130722 () Bool)

(declare-fun res!755464 () Bool)

(assert (=> b!1130722 (=> (not res!755464) (not e!643512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130722 (= res!755464 (validKeyInArray!0 k0!934))))

(declare-fun b!1130723 () Bool)

(declare-fun e!643506 () Unit!37043)

(assert (=> b!1130723 (= e!643502 e!643506)))

(declare-fun c!110067 () Bool)

(declare-fun lt!502149 () Bool)

(assert (=> b!1130723 (= c!110067 (and (not lt!502149) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!48426 () Bool)

(declare-fun c!110065 () Bool)

(assert (=> bm!48426 (= call!48429 (+!3444 lt!502147 (ite (or c!110065 c!110067) (tuple2!17991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1130724 () Bool)

(declare-fun e!643510 () Bool)

(assert (=> b!1130724 (= e!643512 e!643510)))

(declare-fun res!755473 () Bool)

(assert (=> b!1130724 (=> (not res!755473) (not e!643510))))

(declare-fun lt!502157 () array!73743)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73743 (_ BitVec 32)) Bool)

(assert (=> b!1130724 (= res!755473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502157 mask!1564))))

(assert (=> b!1130724 (= lt!502157 (array!73744 (store (arr!35524 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36060 _keys!1208)))))

(declare-fun b!1130725 () Bool)

(declare-fun res!755470 () Bool)

(assert (=> b!1130725 (=> (not res!755470) (not e!643510))))

(declare-datatypes ((List!24755 0))(
  ( (Nil!24752) (Cons!24751 (h!25960 (_ BitVec 64)) (t!35660 List!24755)) )
))
(declare-fun arrayNoDuplicates!0 (array!73743 (_ BitVec 32) List!24755) Bool)

(assert (=> b!1130725 (= res!755470 (arrayNoDuplicates!0 lt!502157 #b00000000000000000000000000000000 Nil!24752))))

(declare-fun b!1130726 () Bool)

(declare-fun e!643508 () Bool)

(declare-fun call!48433 () ListLongMap!15959)

(declare-fun call!48430 () ListLongMap!15959)

(assert (=> b!1130726 (= e!643508 (= call!48433 call!48430))))

(declare-fun bm!48427 () Bool)

(declare-fun call!48434 () ListLongMap!15959)

(assert (=> bm!48427 (= call!48434 call!48429)))

(declare-fun b!1130727 () Bool)

(declare-fun res!755461 () Bool)

(assert (=> b!1130727 (=> (not res!755461) (not e!643512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130727 (= res!755461 (validMask!0 mask!1564))))

(declare-fun bm!48428 () Bool)

(assert (=> bm!48428 (= call!48432 call!48436)))

(declare-fun b!1130728 () Bool)

(declare-fun e!643503 () Bool)

(assert (=> b!1130728 (= e!643503 e!643505)))

(declare-fun res!755460 () Bool)

(assert (=> b!1130728 (=> res!755460 e!643505)))

(assert (=> b!1130728 (= res!755460 (not (= (select (arr!35524 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1130728 e!643508))

(declare-fun c!110066 () Bool)

(assert (=> b!1130728 (= c!110066 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502146 () Unit!37043)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!425 (array!73743 array!73745 (_ BitVec 32) (_ BitVec 32) V!43051 V!43051 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37043)

(assert (=> b!1130728 (= lt!502146 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130718 () Bool)

(declare-fun c!110064 () Bool)

(assert (=> b!1130718 (= c!110064 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502149))))

(assert (=> b!1130718 (= e!643506 e!643511)))

(declare-fun res!755463 () Bool)

(assert (=> start!98212 (=> (not res!755463) (not e!643512))))

(assert (=> start!98212 (= res!755463 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36060 _keys!1208))))))

(assert (=> start!98212 e!643512))

(declare-fun tp_is_empty!28443 () Bool)

(assert (=> start!98212 tp_is_empty!28443))

(declare-fun array_inv!27252 (array!73743) Bool)

(assert (=> start!98212 (array_inv!27252 _keys!1208)))

(assert (=> start!98212 true))

(assert (=> start!98212 tp!84442))

(declare-fun e!643509 () Bool)

(declare-fun array_inv!27253 (array!73745) Bool)

(assert (=> start!98212 (and (array_inv!27253 _values!996) e!643509)))

(declare-fun b!1130729 () Bool)

(declare-fun e!643501 () Bool)

(assert (=> b!1130729 (= e!643501 tp_is_empty!28443)))

(declare-fun bm!48429 () Bool)

(assert (=> bm!48429 (= call!48431 (addStillContains!706 lt!502147 (ite (or c!110065 c!110067) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110065 c!110067) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1130730 () Bool)

(declare-fun e!643507 () Bool)

(assert (=> b!1130730 (= e!643504 e!643507)))

(declare-fun res!755468 () Bool)

(assert (=> b!1130730 (=> res!755468 e!643507)))

(assert (=> b!1130730 (= res!755468 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36060 _keys!1208))))))

(declare-fun lt!502155 () Unit!37043)

(assert (=> b!1130730 (= lt!502155 e!643502)))

(assert (=> b!1130730 (= c!110065 (and (not lt!502149) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130730 (= lt!502149 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!48430 () Bool)

(assert (=> bm!48430 (= call!48436 (contains!6518 (ite c!110065 lt!502150 call!48434) k0!934))))

(declare-fun b!1130731 () Bool)

(declare-fun e!643498 () Bool)

(assert (=> b!1130731 (= e!643498 e!643503)))

(declare-fun res!755469 () Bool)

(assert (=> b!1130731 (=> res!755469 e!643503)))

(assert (=> b!1130731 (= res!755469 (not (= from!1455 i!673)))))

(declare-fun lt!502154 () ListLongMap!15959)

(declare-fun lt!502143 () array!73745)

(assert (=> b!1130731 (= lt!502154 (getCurrentListMapNoExtraKeys!4482 lt!502157 lt!502143 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2557 (Int (_ BitVec 64)) V!43051)

(assert (=> b!1130731 (= lt!502143 (array!73746 (store (arr!35525 _values!996) i!673 (ValueCellFull!13512 (dynLambda!2557 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36061 _values!996)))))

(declare-fun lt!502156 () ListLongMap!15959)

(assert (=> b!1130731 (= lt!502156 (getCurrentListMapNoExtraKeys!4482 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1130732 () Bool)

(declare-fun e!643499 () Bool)

(assert (=> b!1130732 (= e!643499 tp_is_empty!28443)))

(declare-fun bm!48431 () Bool)

(assert (=> bm!48431 (= call!48430 (getCurrentListMapNoExtraKeys!4482 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130733 () Bool)

(declare-fun Unit!37045 () Unit!37043)

(assert (=> b!1130733 (= e!643511 Unit!37045)))

(declare-fun mapNonEmpty!44482 () Bool)

(declare-fun tp!84443 () Bool)

(assert (=> mapNonEmpty!44482 (= mapRes!44482 (and tp!84443 e!643499))))

(declare-fun mapValue!44482 () ValueCell!13512)

(declare-fun mapRest!44482 () (Array (_ BitVec 32) ValueCell!13512))

(declare-fun mapKey!44482 () (_ BitVec 32))

(assert (=> mapNonEmpty!44482 (= (arr!35525 _values!996) (store mapRest!44482 mapKey!44482 mapValue!44482))))

(declare-fun b!1130734 () Bool)

(assert (=> b!1130734 call!48432))

(declare-fun lt!502153 () Unit!37043)

(assert (=> b!1130734 (= lt!502153 call!48435)))

(assert (=> b!1130734 (= e!643506 lt!502153)))

(declare-fun b!1130735 () Bool)

(assert (=> b!1130735 (= e!643509 (and e!643501 mapRes!44482))))

(declare-fun condMapEmpty!44482 () Bool)

(declare-fun mapDefault!44482 () ValueCell!13512)

(assert (=> b!1130735 (= condMapEmpty!44482 (= (arr!35525 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13512)) mapDefault!44482)))))

(declare-fun bm!48432 () Bool)

(assert (=> bm!48432 (= call!48435 call!48431)))

(declare-fun b!1130736 () Bool)

(declare-fun -!1174 (ListLongMap!15959 (_ BitVec 64)) ListLongMap!15959)

(assert (=> b!1130736 (= e!643508 (= call!48433 (-!1174 call!48430 k0!934)))))

(declare-fun b!1130737 () Bool)

(declare-fun res!755472 () Bool)

(assert (=> b!1130737 (=> (not res!755472) (not e!643512))))

(assert (=> b!1130737 (= res!755472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!48433 () Bool)

(assert (=> bm!48433 (= call!48433 (getCurrentListMapNoExtraKeys!4482 lt!502157 lt!502143 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130738 () Bool)

(declare-fun res!755462 () Bool)

(assert (=> b!1130738 (=> (not res!755462) (not e!643512))))

(assert (=> b!1130738 (= res!755462 (= (select (arr!35524 _keys!1208) i!673) k0!934))))

(declare-fun b!1130739 () Bool)

(assert (=> b!1130739 (= e!643510 (not e!643498))))

(declare-fun res!755466 () Bool)

(assert (=> b!1130739 (=> res!755466 e!643498)))

(assert (=> b!1130739 (= res!755466 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130739 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502144 () Unit!37043)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73743 (_ BitVec 64) (_ BitVec 32)) Unit!37043)

(assert (=> b!1130739 (= lt!502144 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1130740 () Bool)

(assert (=> b!1130740 (= e!643507 true)))

(declare-fun lt!502148 () Bool)

(declare-fun getCurrentListMap!4427 (array!73743 array!73745 (_ BitVec 32) (_ BitVec 32) V!43051 V!43051 (_ BitVec 32) Int) ListLongMap!15959)

(assert (=> b!1130740 (= lt!502148 (contains!6518 (getCurrentListMap!4427 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1130741 () Bool)

(declare-fun res!755471 () Bool)

(assert (=> b!1130741 (=> (not res!755471) (not e!643512))))

(assert (=> b!1130741 (= res!755471 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24752))))

(assert (= (and start!98212 res!755463) b!1130727))

(assert (= (and b!1130727 res!755461) b!1130716))

(assert (= (and b!1130716 res!755465) b!1130737))

(assert (= (and b!1130737 res!755472) b!1130741))

(assert (= (and b!1130741 res!755471) b!1130717))

(assert (= (and b!1130717 res!755467) b!1130722))

(assert (= (and b!1130722 res!755464) b!1130738))

(assert (= (and b!1130738 res!755462) b!1130724))

(assert (= (and b!1130724 res!755473) b!1130725))

(assert (= (and b!1130725 res!755470) b!1130739))

(assert (= (and b!1130739 (not res!755466)) b!1130731))

(assert (= (and b!1130731 (not res!755469)) b!1130728))

(assert (= (and b!1130728 c!110066) b!1130736))

(assert (= (and b!1130728 (not c!110066)) b!1130726))

(assert (= (or b!1130736 b!1130726) bm!48433))

(assert (= (or b!1130736 b!1130726) bm!48431))

(assert (= (and b!1130728 (not res!755460)) b!1130720))

(assert (= (and b!1130720 (not res!755459)) b!1130730))

(assert (= (and b!1130730 c!110065) b!1130721))

(assert (= (and b!1130730 (not c!110065)) b!1130723))

(assert (= (and b!1130723 c!110067) b!1130734))

(assert (= (and b!1130723 (not c!110067)) b!1130718))

(assert (= (and b!1130718 c!110064) b!1130719))

(assert (= (and b!1130718 (not c!110064)) b!1130733))

(assert (= (or b!1130734 b!1130719) bm!48432))

(assert (= (or b!1130734 b!1130719) bm!48427))

(assert (= (or b!1130734 b!1130719) bm!48428))

(assert (= (or b!1130721 bm!48428) bm!48430))

(assert (= (or b!1130721 bm!48432) bm!48429))

(assert (= (or b!1130721 bm!48427) bm!48426))

(assert (= (and b!1130730 (not res!755468)) b!1130740))

(assert (= (and b!1130735 condMapEmpty!44482) mapIsEmpty!44482))

(assert (= (and b!1130735 (not condMapEmpty!44482)) mapNonEmpty!44482))

(get-info :version)

(assert (= (and mapNonEmpty!44482 ((_ is ValueCellFull!13512) mapValue!44482)) b!1130732))

(assert (= (and b!1130735 ((_ is ValueCellFull!13512) mapDefault!44482)) b!1130729))

(assert (= start!98212 b!1130735))

(declare-fun b_lambda!18883 () Bool)

(assert (=> (not b_lambda!18883) (not b!1130731)))

(declare-fun t!35658 () Bool)

(declare-fun tb!8725 () Bool)

(assert (=> (and start!98212 (= defaultEntry!1004 defaultEntry!1004) t!35658) tb!8725))

(declare-fun result!18011 () Bool)

(assert (=> tb!8725 (= result!18011 tp_is_empty!28443)))

(assert (=> b!1130731 t!35658))

(declare-fun b_and!38611 () Bool)

(assert (= b_and!38609 (and (=> t!35658 result!18011) b_and!38611)))

(declare-fun m!1043809 () Bool)

(assert (=> b!1130724 m!1043809))

(declare-fun m!1043811 () Bool)

(assert (=> b!1130724 m!1043811))

(declare-fun m!1043813 () Bool)

(assert (=> bm!48429 m!1043813))

(declare-fun m!1043815 () Bool)

(assert (=> b!1130738 m!1043815))

(declare-fun m!1043817 () Bool)

(assert (=> b!1130741 m!1043817))

(declare-fun m!1043819 () Bool)

(assert (=> mapNonEmpty!44482 m!1043819))

(declare-fun m!1043821 () Bool)

(assert (=> b!1130720 m!1043821))

(declare-fun m!1043823 () Bool)

(assert (=> b!1130720 m!1043823))

(declare-fun m!1043825 () Bool)

(assert (=> bm!48430 m!1043825))

(declare-fun m!1043827 () Bool)

(assert (=> bm!48433 m!1043827))

(declare-fun m!1043829 () Bool)

(assert (=> b!1130728 m!1043829))

(declare-fun m!1043831 () Bool)

(assert (=> b!1130728 m!1043831))

(declare-fun m!1043833 () Bool)

(assert (=> b!1130736 m!1043833))

(declare-fun m!1043835 () Bool)

(assert (=> b!1130739 m!1043835))

(declare-fun m!1043837 () Bool)

(assert (=> b!1130739 m!1043837))

(declare-fun m!1043839 () Bool)

(assert (=> b!1130740 m!1043839))

(assert (=> b!1130740 m!1043839))

(declare-fun m!1043841 () Bool)

(assert (=> b!1130740 m!1043841))

(declare-fun m!1043843 () Bool)

(assert (=> b!1130727 m!1043843))

(declare-fun m!1043845 () Bool)

(assert (=> b!1130737 m!1043845))

(declare-fun m!1043847 () Bool)

(assert (=> b!1130725 m!1043847))

(assert (=> bm!48431 m!1043823))

(declare-fun m!1043849 () Bool)

(assert (=> b!1130721 m!1043849))

(declare-fun m!1043851 () Bool)

(assert (=> b!1130721 m!1043851))

(assert (=> b!1130721 m!1043851))

(declare-fun m!1043853 () Bool)

(assert (=> b!1130721 m!1043853))

(declare-fun m!1043855 () Bool)

(assert (=> start!98212 m!1043855))

(declare-fun m!1043857 () Bool)

(assert (=> start!98212 m!1043857))

(declare-fun m!1043859 () Bool)

(assert (=> b!1130731 m!1043859))

(declare-fun m!1043861 () Bool)

(assert (=> b!1130731 m!1043861))

(declare-fun m!1043863 () Bool)

(assert (=> b!1130731 m!1043863))

(declare-fun m!1043865 () Bool)

(assert (=> b!1130731 m!1043865))

(declare-fun m!1043867 () Bool)

(assert (=> b!1130722 m!1043867))

(declare-fun m!1043869 () Bool)

(assert (=> bm!48426 m!1043869))

(check-sat (not b!1130725) (not bm!48430) (not b!1130731) (not b_lambda!18883) (not b!1130720) (not b!1130728) (not bm!48433) (not b!1130737) (not b!1130739) (not bm!48426) (not b!1130722) (not bm!48431) (not b!1130740) b_and!38611 (not b!1130721) tp_is_empty!28443 (not mapNonEmpty!44482) (not b!1130736) (not b!1130741) (not b!1130727) (not start!98212) (not b!1130724) (not b_next!23913) (not bm!48429))
(check-sat b_and!38611 (not b_next!23913))
