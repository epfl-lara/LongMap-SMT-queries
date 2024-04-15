; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97322 () Bool)

(assert start!97322)

(declare-fun b_free!23299 () Bool)

(declare-fun b_next!23299 () Bool)

(assert (=> start!97322 (= b_free!23299 (not b_next!23299))))

(declare-fun tp!82196 () Bool)

(declare-fun b_and!37409 () Bool)

(assert (=> start!97322 (= tp!82196 b_and!37409)))

(declare-fun b!1108728 () Bool)

(declare-fun e!632448 () Bool)

(declare-fun e!632450 () Bool)

(declare-fun mapRes!43156 () Bool)

(assert (=> b!1108728 (= e!632448 (and e!632450 mapRes!43156))))

(declare-fun condMapEmpty!43156 () Bool)

(declare-datatypes ((V!41873 0))(
  ( (V!41874 (val!13836 Int)) )
))
(declare-datatypes ((ValueCell!13070 0))(
  ( (ValueCellFull!13070 (v!16468 V!41873)) (EmptyCell!13070) )
))
(declare-datatypes ((array!71930 0))(
  ( (array!71931 (arr!34618 (Array (_ BitVec 32) ValueCell!13070)) (size!35156 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71930)

(declare-fun mapDefault!43156 () ValueCell!13070)

(assert (=> b!1108728 (= condMapEmpty!43156 (= (arr!34618 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13070)) mapDefault!43156)))))

(declare-fun b!1108729 () Bool)

(declare-fun res!739936 () Bool)

(declare-fun e!632453 () Bool)

(assert (=> b!1108729 (=> (not res!739936) (not e!632453))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108729 (= res!739936 (validKeyInArray!0 k0!934))))

(declare-fun b!1108730 () Bool)

(declare-fun res!739930 () Bool)

(assert (=> b!1108730 (=> (not res!739930) (not e!632453))))

(declare-datatypes ((array!71932 0))(
  ( (array!71933 (arr!34619 (Array (_ BitVec 32) (_ BitVec 64))) (size!35157 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71932)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1108730 (= res!739930 (and (= (size!35156 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35157 _keys!1208) (size!35156 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108731 () Bool)

(declare-fun e!632454 () Bool)

(declare-fun e!632451 () Bool)

(assert (=> b!1108731 (= e!632454 (not e!632451))))

(declare-fun res!739933 () Bool)

(assert (=> b!1108731 (=> res!739933 e!632451)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1108731 (= res!739933 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35157 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108731 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36199 0))(
  ( (Unit!36200) )
))
(declare-fun lt!495684 () Unit!36199)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71932 (_ BitVec 64) (_ BitVec 32)) Unit!36199)

(assert (=> b!1108731 (= lt!495684 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108732 () Bool)

(declare-fun res!739931 () Bool)

(assert (=> b!1108732 (=> (not res!739931) (not e!632454))))

(declare-fun lt!495682 () array!71932)

(declare-datatypes ((List!24196 0))(
  ( (Nil!24193) (Cons!24192 (h!25401 (_ BitVec 64)) (t!34532 List!24196)) )
))
(declare-fun arrayNoDuplicates!0 (array!71932 (_ BitVec 32) List!24196) Bool)

(assert (=> b!1108732 (= res!739931 (arrayNoDuplicates!0 lt!495682 #b00000000000000000000000000000000 Nil!24193))))

(declare-fun mapNonEmpty!43156 () Bool)

(declare-fun tp!82195 () Bool)

(declare-fun e!632447 () Bool)

(assert (=> mapNonEmpty!43156 (= mapRes!43156 (and tp!82195 e!632447))))

(declare-fun mapRest!43156 () (Array (_ BitVec 32) ValueCell!13070))

(declare-fun mapValue!43156 () ValueCell!13070)

(declare-fun mapKey!43156 () (_ BitVec 32))

(assert (=> mapNonEmpty!43156 (= (arr!34618 _values!996) (store mapRest!43156 mapKey!43156 mapValue!43156))))

(declare-fun b!1108733 () Bool)

(assert (=> b!1108733 (= e!632453 e!632454)))

(declare-fun res!739935 () Bool)

(assert (=> b!1108733 (=> (not res!739935) (not e!632454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71932 (_ BitVec 32)) Bool)

(assert (=> b!1108733 (= res!739935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495682 mask!1564))))

(assert (=> b!1108733 (= lt!495682 (array!71933 (store (arr!34619 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35157 _keys!1208)))))

(declare-fun zeroValue!944 () V!41873)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46567 () Bool)

(declare-datatypes ((tuple2!17538 0))(
  ( (tuple2!17539 (_1!8780 (_ BitVec 64)) (_2!8780 V!41873)) )
))
(declare-datatypes ((List!24197 0))(
  ( (Nil!24194) (Cons!24193 (h!25402 tuple2!17538) (t!34533 List!24197)) )
))
(declare-datatypes ((ListLongMap!15507 0))(
  ( (ListLongMap!15508 (toList!7769 List!24197)) )
))
(declare-fun call!46570 () ListLongMap!15507)

(declare-fun minValue!944 () V!41873)

(declare-fun getCurrentListMapNoExtraKeys!4285 (array!71932 array!71930 (_ BitVec 32) (_ BitVec 32) V!41873 V!41873 (_ BitVec 32) Int) ListLongMap!15507)

(assert (=> bm!46567 (= call!46570 (getCurrentListMapNoExtraKeys!4285 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!739932 () Bool)

(assert (=> start!97322 (=> (not res!739932) (not e!632453))))

(assert (=> start!97322 (= res!739932 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35157 _keys!1208))))))

(assert (=> start!97322 e!632453))

(declare-fun tp_is_empty!27559 () Bool)

(assert (=> start!97322 tp_is_empty!27559))

(declare-fun array_inv!26692 (array!71932) Bool)

(assert (=> start!97322 (array_inv!26692 _keys!1208)))

(assert (=> start!97322 true))

(assert (=> start!97322 tp!82196))

(declare-fun array_inv!26693 (array!71930) Bool)

(assert (=> start!97322 (and (array_inv!26693 _values!996) e!632448)))

(declare-fun b!1108734 () Bool)

(declare-fun res!739934 () Bool)

(assert (=> b!1108734 (=> (not res!739934) (not e!632453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108734 (= res!739934 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43156 () Bool)

(assert (=> mapIsEmpty!43156 mapRes!43156))

(declare-fun b!1108735 () Bool)

(declare-fun res!739938 () Bool)

(assert (=> b!1108735 (=> (not res!739938) (not e!632453))))

(assert (=> b!1108735 (= res!739938 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24193))))

(declare-fun b!1108736 () Bool)

(assert (=> b!1108736 (= e!632451 true)))

(declare-fun e!632449 () Bool)

(assert (=> b!1108736 e!632449))

(declare-fun c!109107 () Bool)

(assert (=> b!1108736 (= c!109107 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495683 () Unit!36199)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!262 (array!71932 array!71930 (_ BitVec 32) (_ BitVec 32) V!41873 V!41873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36199)

(assert (=> b!1108736 (= lt!495683 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!262 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108737 () Bool)

(assert (=> b!1108737 (= e!632450 tp_is_empty!27559)))

(declare-fun b!1108738 () Bool)

(declare-fun res!739929 () Bool)

(assert (=> b!1108738 (=> (not res!739929) (not e!632453))))

(assert (=> b!1108738 (= res!739929 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35157 _keys!1208))))))

(declare-fun b!1108739 () Bool)

(declare-fun call!46571 () ListLongMap!15507)

(assert (=> b!1108739 (= e!632449 (= call!46571 call!46570))))

(declare-fun b!1108740 () Bool)

(declare-fun res!739939 () Bool)

(assert (=> b!1108740 (=> (not res!739939) (not e!632453))))

(assert (=> b!1108740 (= res!739939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108741 () Bool)

(declare-fun -!991 (ListLongMap!15507 (_ BitVec 64)) ListLongMap!15507)

(assert (=> b!1108741 (= e!632449 (= call!46571 (-!991 call!46570 k0!934)))))

(declare-fun b!1108742 () Bool)

(declare-fun res!739937 () Bool)

(assert (=> b!1108742 (=> (not res!739937) (not e!632453))))

(assert (=> b!1108742 (= res!739937 (= (select (arr!34619 _keys!1208) i!673) k0!934))))

(declare-fun b!1108743 () Bool)

(assert (=> b!1108743 (= e!632447 tp_is_empty!27559)))

(declare-fun bm!46568 () Bool)

(declare-fun dynLambda!2351 (Int (_ BitVec 64)) V!41873)

(assert (=> bm!46568 (= call!46571 (getCurrentListMapNoExtraKeys!4285 lt!495682 (array!71931 (store (arr!34618 _values!996) i!673 (ValueCellFull!13070 (dynLambda!2351 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35156 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97322 res!739932) b!1108734))

(assert (= (and b!1108734 res!739934) b!1108730))

(assert (= (and b!1108730 res!739930) b!1108740))

(assert (= (and b!1108740 res!739939) b!1108735))

(assert (= (and b!1108735 res!739938) b!1108738))

(assert (= (and b!1108738 res!739929) b!1108729))

(assert (= (and b!1108729 res!739936) b!1108742))

(assert (= (and b!1108742 res!739937) b!1108733))

(assert (= (and b!1108733 res!739935) b!1108732))

(assert (= (and b!1108732 res!739931) b!1108731))

(assert (= (and b!1108731 (not res!739933)) b!1108736))

(assert (= (and b!1108736 c!109107) b!1108741))

(assert (= (and b!1108736 (not c!109107)) b!1108739))

(assert (= (or b!1108741 b!1108739) bm!46568))

(assert (= (or b!1108741 b!1108739) bm!46567))

(assert (= (and b!1108728 condMapEmpty!43156) mapIsEmpty!43156))

(assert (= (and b!1108728 (not condMapEmpty!43156)) mapNonEmpty!43156))

(get-info :version)

(assert (= (and mapNonEmpty!43156 ((_ is ValueCellFull!13070) mapValue!43156)) b!1108743))

(assert (= (and b!1108728 ((_ is ValueCellFull!13070) mapDefault!43156)) b!1108737))

(assert (= start!97322 b!1108728))

(declare-fun b_lambda!18301 () Bool)

(assert (=> (not b_lambda!18301) (not bm!46568)))

(declare-fun t!34531 () Bool)

(declare-fun tb!8157 () Bool)

(assert (=> (and start!97322 (= defaultEntry!1004 defaultEntry!1004) t!34531) tb!8157))

(declare-fun result!16883 () Bool)

(assert (=> tb!8157 (= result!16883 tp_is_empty!27559)))

(assert (=> bm!46568 t!34531))

(declare-fun b_and!37411 () Bool)

(assert (= b_and!37409 (and (=> t!34531 result!16883) b_and!37411)))

(declare-fun m!1026657 () Bool)

(assert (=> b!1108742 m!1026657))

(declare-fun m!1026659 () Bool)

(assert (=> b!1108735 m!1026659))

(declare-fun m!1026661 () Bool)

(assert (=> b!1108734 m!1026661))

(declare-fun m!1026663 () Bool)

(assert (=> mapNonEmpty!43156 m!1026663))

(declare-fun m!1026665 () Bool)

(assert (=> b!1108731 m!1026665))

(declare-fun m!1026667 () Bool)

(assert (=> b!1108731 m!1026667))

(declare-fun m!1026669 () Bool)

(assert (=> b!1108740 m!1026669))

(declare-fun m!1026671 () Bool)

(assert (=> b!1108733 m!1026671))

(declare-fun m!1026673 () Bool)

(assert (=> b!1108733 m!1026673))

(declare-fun m!1026675 () Bool)

(assert (=> start!97322 m!1026675))

(declare-fun m!1026677 () Bool)

(assert (=> start!97322 m!1026677))

(declare-fun m!1026679 () Bool)

(assert (=> b!1108741 m!1026679))

(declare-fun m!1026681 () Bool)

(assert (=> bm!46568 m!1026681))

(declare-fun m!1026683 () Bool)

(assert (=> bm!46568 m!1026683))

(declare-fun m!1026685 () Bool)

(assert (=> bm!46568 m!1026685))

(declare-fun m!1026687 () Bool)

(assert (=> b!1108729 m!1026687))

(declare-fun m!1026689 () Bool)

(assert (=> b!1108732 m!1026689))

(declare-fun m!1026691 () Bool)

(assert (=> b!1108736 m!1026691))

(declare-fun m!1026693 () Bool)

(assert (=> bm!46567 m!1026693))

(check-sat (not b!1108740) (not b!1108732) (not b_next!23299) (not bm!46567) (not b!1108736) tp_is_empty!27559 (not b!1108734) b_and!37411 (not b!1108733) (not b!1108741) (not start!97322) (not b_lambda!18301) (not b!1108729) (not bm!46568) (not b!1108731) (not b!1108735) (not mapNonEmpty!43156))
(check-sat b_and!37411 (not b_next!23299))
