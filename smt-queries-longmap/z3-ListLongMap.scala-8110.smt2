; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99762 () Bool)

(assert start!99762)

(declare-fun b_free!25105 () Bool)

(declare-fun b_next!25105 () Bool)

(assert (=> start!99762 (= b_free!25105 (not b_next!25105))))

(declare-fun tp!88029 () Bool)

(declare-fun b_and!41079 () Bool)

(assert (=> start!99762 (= tp!88029 b_and!41079)))

(declare-fun b!1178544 () Bool)

(declare-fun e!670056 () Bool)

(declare-fun e!670060 () Bool)

(assert (=> b!1178544 (= e!670056 (not e!670060))))

(declare-fun res!782490 () Bool)

(assert (=> b!1178544 (=> res!782490 e!670060)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1178544 (= res!782490 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76125 0))(
  ( (array!76126 (arr!36706 (Array (_ BitVec 32) (_ BitVec 64))) (size!37243 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76125)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178544 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38871 0))(
  ( (Unit!38872) )
))
(declare-fun lt!532026 () Unit!38871)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76125 (_ BitVec 64) (_ BitVec 32)) Unit!38871)

(assert (=> b!1178544 (= lt!532026 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178545 () Bool)

(declare-fun res!782497 () Bool)

(declare-fun e!670057 () Bool)

(assert (=> b!1178545 (=> (not res!782497) (not e!670057))))

(assert (=> b!1178545 (= res!782497 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37243 _keys!1208))))))

(declare-fun b!1178546 () Bool)

(declare-fun e!670064 () Bool)

(declare-fun e!670065 () Bool)

(declare-fun mapRes!46280 () Bool)

(assert (=> b!1178546 (= e!670064 (and e!670065 mapRes!46280))))

(declare-fun condMapEmpty!46280 () Bool)

(declare-datatypes ((V!44641 0))(
  ( (V!44642 (val!14874 Int)) )
))
(declare-datatypes ((ValueCell!14108 0))(
  ( (ValueCellFull!14108 (v!17508 V!44641)) (EmptyCell!14108) )
))
(declare-datatypes ((array!76127 0))(
  ( (array!76128 (arr!36707 (Array (_ BitVec 32) ValueCell!14108)) (size!37244 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76127)

(declare-fun mapDefault!46280 () ValueCell!14108)

(assert (=> b!1178546 (= condMapEmpty!46280 (= (arr!36707 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14108)) mapDefault!46280)))))

(declare-fun b!1178547 () Bool)

(declare-fun res!782489 () Bool)

(assert (=> b!1178547 (=> (not res!782489) (not e!670057))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1178547 (= res!782489 (and (= (size!37244 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37243 _keys!1208) (size!37244 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178548 () Bool)

(declare-fun tp_is_empty!29635 () Bool)

(assert (=> b!1178548 (= e!670065 tp_is_empty!29635)))

(declare-fun b!1178549 () Bool)

(declare-fun res!782500 () Bool)

(assert (=> b!1178549 (=> (not res!782500) (not e!670057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178549 (= res!782500 (validMask!0 mask!1564))))

(declare-fun b!1178550 () Bool)

(declare-fun e!670059 () Bool)

(assert (=> b!1178550 (= e!670059 tp_is_empty!29635)))

(declare-fun b!1178551 () Bool)

(declare-fun res!782487 () Bool)

(assert (=> b!1178551 (=> (not res!782487) (not e!670057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178551 (= res!782487 (validKeyInArray!0 k0!934))))

(declare-fun b!1178552 () Bool)

(declare-fun e!670066 () Unit!38871)

(declare-fun Unit!38873 () Unit!38871)

(assert (=> b!1178552 (= e!670066 Unit!38873)))

(declare-fun b!1178553 () Bool)

(declare-fun Unit!38874 () Unit!38871)

(assert (=> b!1178553 (= e!670066 Unit!38874)))

(declare-fun lt!532023 () Unit!38871)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76125 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38871)

(assert (=> b!1178553 (= lt!532023 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1178553 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532021 () Unit!38871)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76125 (_ BitVec 32) (_ BitVec 32)) Unit!38871)

(assert (=> b!1178553 (= lt!532021 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25806 0))(
  ( (Nil!25803) (Cons!25802 (h!27020 (_ BitVec 64)) (t!37895 List!25806)) )
))
(declare-fun arrayNoDuplicates!0 (array!76125 (_ BitVec 32) List!25806) Bool)

(assert (=> b!1178553 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25803)))

(declare-fun lt!532024 () Unit!38871)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76125 (_ BitVec 64) (_ BitVec 32) List!25806) Unit!38871)

(assert (=> b!1178553 (= lt!532024 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25803))))

(assert (=> b!1178553 false))

(declare-fun b!1178554 () Bool)

(declare-fun e!670055 () Bool)

(assert (=> b!1178554 (= e!670055 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178555 () Bool)

(assert (=> b!1178555 (= e!670057 e!670056)))

(declare-fun res!782501 () Bool)

(assert (=> b!1178555 (=> (not res!782501) (not e!670056))))

(declare-fun lt!532018 () array!76125)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76125 (_ BitVec 32)) Bool)

(assert (=> b!1178555 (= res!782501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532018 mask!1564))))

(assert (=> b!1178555 (= lt!532018 (array!76126 (store (arr!36706 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37243 _keys!1208)))))

(declare-fun mapNonEmpty!46280 () Bool)

(declare-fun tp!88028 () Bool)

(assert (=> mapNonEmpty!46280 (= mapRes!46280 (and tp!88028 e!670059))))

(declare-fun mapRest!46280 () (Array (_ BitVec 32) ValueCell!14108))

(declare-fun mapValue!46280 () ValueCell!14108)

(declare-fun mapKey!46280 () (_ BitVec 32))

(assert (=> mapNonEmpty!46280 (= (arr!36707 _values!996) (store mapRest!46280 mapKey!46280 mapValue!46280))))

(declare-fun res!782494 () Bool)

(assert (=> start!99762 (=> (not res!782494) (not e!670057))))

(assert (=> start!99762 (= res!782494 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37243 _keys!1208))))))

(assert (=> start!99762 e!670057))

(assert (=> start!99762 tp_is_empty!29635))

(declare-fun array_inv!28106 (array!76125) Bool)

(assert (=> start!99762 (array_inv!28106 _keys!1208)))

(assert (=> start!99762 true))

(assert (=> start!99762 tp!88029))

(declare-fun array_inv!28107 (array!76127) Bool)

(assert (=> start!99762 (and (array_inv!28107 _values!996) e!670064)))

(declare-fun b!1178556 () Bool)

(declare-fun res!782486 () Bool)

(assert (=> b!1178556 (=> (not res!782486) (not e!670057))))

(assert (=> b!1178556 (= res!782486 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25803))))

(declare-fun b!1178557 () Bool)

(declare-fun res!782495 () Bool)

(assert (=> b!1178557 (=> (not res!782495) (not e!670057))))

(assert (=> b!1178557 (= res!782495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178558 () Bool)

(declare-fun e!670058 () Bool)

(assert (=> b!1178558 (= e!670060 e!670058)))

(declare-fun res!782499 () Bool)

(assert (=> b!1178558 (=> res!782499 e!670058)))

(assert (=> b!1178558 (= res!782499 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44641)

(declare-datatypes ((tuple2!19074 0))(
  ( (tuple2!19075 (_1!9548 (_ BitVec 64)) (_2!9548 V!44641)) )
))
(declare-datatypes ((List!25807 0))(
  ( (Nil!25804) (Cons!25803 (h!27021 tuple2!19074) (t!37896 List!25807)) )
))
(declare-datatypes ((ListLongMap!17051 0))(
  ( (ListLongMap!17052 (toList!8541 List!25807)) )
))
(declare-fun lt!532019 () ListLongMap!17051)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532022 () array!76127)

(declare-fun minValue!944 () V!44641)

(declare-fun getCurrentListMapNoExtraKeys!5021 (array!76125 array!76127 (_ BitVec 32) (_ BitVec 32) V!44641 V!44641 (_ BitVec 32) Int) ListLongMap!17051)

(assert (=> b!1178558 (= lt!532019 (getCurrentListMapNoExtraKeys!5021 lt!532018 lt!532022 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532027 () V!44641)

(assert (=> b!1178558 (= lt!532022 (array!76128 (store (arr!36707 _values!996) i!673 (ValueCellFull!14108 lt!532027)) (size!37244 _values!996)))))

(declare-fun dynLambda!2995 (Int (_ BitVec 64)) V!44641)

(assert (=> b!1178558 (= lt!532027 (dynLambda!2995 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532013 () ListLongMap!17051)

(assert (=> b!1178558 (= lt!532013 (getCurrentListMapNoExtraKeys!5021 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1178559 () Bool)

(declare-fun res!782496 () Bool)

(assert (=> b!1178559 (=> (not res!782496) (not e!670056))))

(assert (=> b!1178559 (= res!782496 (arrayNoDuplicates!0 lt!532018 #b00000000000000000000000000000000 Nil!25803))))

(declare-fun b!1178560 () Bool)

(declare-fun e!670062 () Bool)

(assert (=> b!1178560 (= e!670062 e!670055)))

(declare-fun res!782493 () Bool)

(assert (=> b!1178560 (=> res!782493 e!670055)))

(assert (=> b!1178560 (= res!782493 (not (= (select (arr!36706 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1178561 () Bool)

(declare-fun e!670061 () Bool)

(assert (=> b!1178561 (= e!670061 true)))

(declare-fun e!670063 () Bool)

(assert (=> b!1178561 e!670063))

(declare-fun res!782492 () Bool)

(assert (=> b!1178561 (=> (not res!782492) (not e!670063))))

(assert (=> b!1178561 (= res!782492 (not (= (select (arr!36706 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532016 () Unit!38871)

(assert (=> b!1178561 (= lt!532016 e!670066)))

(declare-fun c!117179 () Bool)

(assert (=> b!1178561 (= c!117179 (= (select (arr!36706 _keys!1208) from!1455) k0!934))))

(assert (=> b!1178561 e!670062))

(declare-fun res!782498 () Bool)

(assert (=> b!1178561 (=> (not res!782498) (not e!670062))))

(declare-fun lt!532020 () tuple2!19074)

(declare-fun lt!532014 () ListLongMap!17051)

(declare-fun +!3868 (ListLongMap!17051 tuple2!19074) ListLongMap!17051)

(assert (=> b!1178561 (= res!782498 (= lt!532019 (+!3868 lt!532014 lt!532020)))))

(declare-fun get!18787 (ValueCell!14108 V!44641) V!44641)

(assert (=> b!1178561 (= lt!532020 (tuple2!19075 (select (arr!36706 _keys!1208) from!1455) (get!18787 (select (arr!36707 _values!996) from!1455) lt!532027)))))

(declare-fun b!1178562 () Bool)

(declare-fun lt!532025 () ListLongMap!17051)

(assert (=> b!1178562 (= e!670063 (= lt!532013 (+!3868 lt!532025 lt!532020)))))

(declare-fun b!1178563 () Bool)

(assert (=> b!1178563 (= e!670058 e!670061)))

(declare-fun res!782488 () Bool)

(assert (=> b!1178563 (=> res!782488 e!670061)))

(assert (=> b!1178563 (= res!782488 (not (validKeyInArray!0 (select (arr!36706 _keys!1208) from!1455))))))

(declare-fun lt!532017 () ListLongMap!17051)

(assert (=> b!1178563 (= lt!532017 lt!532014)))

(declare-fun -!1575 (ListLongMap!17051 (_ BitVec 64)) ListLongMap!17051)

(assert (=> b!1178563 (= lt!532014 (-!1575 lt!532025 k0!934))))

(assert (=> b!1178563 (= lt!532017 (getCurrentListMapNoExtraKeys!5021 lt!532018 lt!532022 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178563 (= lt!532025 (getCurrentListMapNoExtraKeys!5021 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532015 () Unit!38871)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!800 (array!76125 array!76127 (_ BitVec 32) (_ BitVec 32) V!44641 V!44641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38871)

(assert (=> b!1178563 (= lt!532015 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!800 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178564 () Bool)

(declare-fun res!782491 () Bool)

(assert (=> b!1178564 (=> (not res!782491) (not e!670057))))

(assert (=> b!1178564 (= res!782491 (= (select (arr!36706 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46280 () Bool)

(assert (=> mapIsEmpty!46280 mapRes!46280))

(assert (= (and start!99762 res!782494) b!1178549))

(assert (= (and b!1178549 res!782500) b!1178547))

(assert (= (and b!1178547 res!782489) b!1178557))

(assert (= (and b!1178557 res!782495) b!1178556))

(assert (= (and b!1178556 res!782486) b!1178545))

(assert (= (and b!1178545 res!782497) b!1178551))

(assert (= (and b!1178551 res!782487) b!1178564))

(assert (= (and b!1178564 res!782491) b!1178555))

(assert (= (and b!1178555 res!782501) b!1178559))

(assert (= (and b!1178559 res!782496) b!1178544))

(assert (= (and b!1178544 (not res!782490)) b!1178558))

(assert (= (and b!1178558 (not res!782499)) b!1178563))

(assert (= (and b!1178563 (not res!782488)) b!1178561))

(assert (= (and b!1178561 res!782498) b!1178560))

(assert (= (and b!1178560 (not res!782493)) b!1178554))

(assert (= (and b!1178561 c!117179) b!1178553))

(assert (= (and b!1178561 (not c!117179)) b!1178552))

(assert (= (and b!1178561 res!782492) b!1178562))

(assert (= (and b!1178546 condMapEmpty!46280) mapIsEmpty!46280))

(assert (= (and b!1178546 (not condMapEmpty!46280)) mapNonEmpty!46280))

(get-info :version)

(assert (= (and mapNonEmpty!46280 ((_ is ValueCellFull!14108) mapValue!46280)) b!1178550))

(assert (= (and b!1178546 ((_ is ValueCellFull!14108) mapDefault!46280)) b!1178548))

(assert (= start!99762 b!1178546))

(declare-fun b_lambda!20243 () Bool)

(assert (=> (not b_lambda!20243) (not b!1178558)))

(declare-fun t!37894 () Bool)

(declare-fun tb!9909 () Bool)

(assert (=> (and start!99762 (= defaultEntry!1004 defaultEntry!1004) t!37894) tb!9909))

(declare-fun result!20393 () Bool)

(assert (=> tb!9909 (= result!20393 tp_is_empty!29635)))

(assert (=> b!1178558 t!37894))

(declare-fun b_and!41081 () Bool)

(assert (= b_and!41079 (and (=> t!37894 result!20393) b_and!41081)))

(declare-fun m!1086771 () Bool)

(assert (=> b!1178556 m!1086771))

(declare-fun m!1086773 () Bool)

(assert (=> b!1178555 m!1086773))

(declare-fun m!1086775 () Bool)

(assert (=> b!1178555 m!1086775))

(declare-fun m!1086777 () Bool)

(assert (=> b!1178564 m!1086777))

(declare-fun m!1086779 () Bool)

(assert (=> b!1178554 m!1086779))

(declare-fun m!1086781 () Bool)

(assert (=> b!1178549 m!1086781))

(declare-fun m!1086783 () Bool)

(assert (=> b!1178562 m!1086783))

(declare-fun m!1086785 () Bool)

(assert (=> b!1178551 m!1086785))

(declare-fun m!1086787 () Bool)

(assert (=> b!1178561 m!1086787))

(declare-fun m!1086789 () Bool)

(assert (=> b!1178561 m!1086789))

(declare-fun m!1086791 () Bool)

(assert (=> b!1178561 m!1086791))

(assert (=> b!1178561 m!1086791))

(declare-fun m!1086793 () Bool)

(assert (=> b!1178561 m!1086793))

(declare-fun m!1086795 () Bool)

(assert (=> mapNonEmpty!46280 m!1086795))

(declare-fun m!1086797 () Bool)

(assert (=> b!1178558 m!1086797))

(declare-fun m!1086799 () Bool)

(assert (=> b!1178558 m!1086799))

(declare-fun m!1086801 () Bool)

(assert (=> b!1178558 m!1086801))

(declare-fun m!1086803 () Bool)

(assert (=> b!1178558 m!1086803))

(declare-fun m!1086805 () Bool)

(assert (=> b!1178557 m!1086805))

(declare-fun m!1086807 () Bool)

(assert (=> b!1178544 m!1086807))

(declare-fun m!1086809 () Bool)

(assert (=> b!1178544 m!1086809))

(declare-fun m!1086811 () Bool)

(assert (=> b!1178553 m!1086811))

(declare-fun m!1086813 () Bool)

(assert (=> b!1178553 m!1086813))

(declare-fun m!1086815 () Bool)

(assert (=> b!1178553 m!1086815))

(declare-fun m!1086817 () Bool)

(assert (=> b!1178553 m!1086817))

(declare-fun m!1086819 () Bool)

(assert (=> b!1178553 m!1086819))

(declare-fun m!1086821 () Bool)

(assert (=> start!99762 m!1086821))

(declare-fun m!1086823 () Bool)

(assert (=> start!99762 m!1086823))

(declare-fun m!1086825 () Bool)

(assert (=> b!1178563 m!1086825))

(declare-fun m!1086827 () Bool)

(assert (=> b!1178563 m!1086827))

(declare-fun m!1086829 () Bool)

(assert (=> b!1178563 m!1086829))

(declare-fun m!1086831 () Bool)

(assert (=> b!1178563 m!1086831))

(assert (=> b!1178563 m!1086787))

(declare-fun m!1086833 () Bool)

(assert (=> b!1178563 m!1086833))

(assert (=> b!1178563 m!1086787))

(assert (=> b!1178560 m!1086787))

(declare-fun m!1086835 () Bool)

(assert (=> b!1178559 m!1086835))

(check-sat tp_is_empty!29635 (not b!1178549) (not b!1178563) (not b_next!25105) (not b!1178555) (not b!1178554) (not b!1178559) (not b!1178553) (not b!1178551) (not b!1178544) (not start!99762) (not b!1178556) (not mapNonEmpty!46280) (not b!1178562) (not b!1178557) (not b_lambda!20243) (not b!1178558) (not b!1178561) b_and!41081)
(check-sat b_and!41081 (not b_next!25105))
