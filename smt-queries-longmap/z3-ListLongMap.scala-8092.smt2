; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99412 () Bool)

(assert start!99412)

(declare-fun b_free!24997 () Bool)

(declare-fun b_next!24997 () Bool)

(assert (=> start!99412 (= b_free!24997 (not b_next!24997))))

(declare-fun tp!87704 () Bool)

(declare-fun b_and!40839 () Bool)

(assert (=> start!99412 (= tp!87704 b_and!40839)))

(declare-fun b!1173727 () Bool)

(declare-fun e!667148 () Bool)

(declare-fun e!667145 () Bool)

(declare-fun mapRes!46118 () Bool)

(assert (=> b!1173727 (= e!667148 (and e!667145 mapRes!46118))))

(declare-fun condMapEmpty!46118 () Bool)

(declare-datatypes ((V!44497 0))(
  ( (V!44498 (val!14820 Int)) )
))
(declare-datatypes ((ValueCell!14054 0))(
  ( (ValueCellFull!14054 (v!17457 V!44497)) (EmptyCell!14054) )
))
(declare-datatypes ((array!75794 0))(
  ( (array!75795 (arr!36547 (Array (_ BitVec 32) ValueCell!14054)) (size!37085 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75794)

(declare-fun mapDefault!46118 () ValueCell!14054)

(assert (=> b!1173727 (= condMapEmpty!46118 (= (arr!36547 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14054)) mapDefault!46118)))))

(declare-fun b!1173728 () Bool)

(declare-fun res!779430 () Bool)

(declare-fun e!667149 () Bool)

(assert (=> b!1173728 (=> (not res!779430) (not e!667149))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173728 (= res!779430 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46118 () Bool)

(assert (=> mapIsEmpty!46118 mapRes!46118))

(declare-fun b!1173729 () Bool)

(declare-fun e!667147 () Bool)

(declare-fun e!667156 () Bool)

(assert (=> b!1173729 (= e!667147 e!667156)))

(declare-fun res!779434 () Bool)

(assert (=> b!1173729 (=> res!779434 e!667156)))

(declare-datatypes ((array!75796 0))(
  ( (array!75797 (arr!36548 (Array (_ BitVec 32) (_ BitVec 64))) (size!37086 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75796)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1173729 (= res!779434 (not (= (select (arr!36548 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1173730 () Bool)

(declare-fun e!667151 () Bool)

(assert (=> b!1173730 (= e!667149 e!667151)))

(declare-fun res!779438 () Bool)

(assert (=> b!1173730 (=> (not res!779438) (not e!667151))))

(declare-fun lt!529018 () array!75796)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75796 (_ BitVec 32)) Bool)

(assert (=> b!1173730 (= res!779438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529018 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1173730 (= lt!529018 (array!75797 (store (arr!36548 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37086 _keys!1208)))))

(declare-fun b!1173731 () Bool)

(declare-fun e!667155 () Bool)

(declare-fun e!667150 () Bool)

(assert (=> b!1173731 (= e!667155 e!667150)))

(declare-fun res!779436 () Bool)

(assert (=> b!1173731 (=> res!779436 e!667150)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173731 (= res!779436 (not (validKeyInArray!0 (select (arr!36548 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19036 0))(
  ( (tuple2!19037 (_1!9529 (_ BitVec 64)) (_2!9529 V!44497)) )
))
(declare-datatypes ((List!25752 0))(
  ( (Nil!25749) (Cons!25748 (h!26957 tuple2!19036) (t!37732 List!25752)) )
))
(declare-datatypes ((ListLongMap!17005 0))(
  ( (ListLongMap!17006 (toList!8518 List!25752)) )
))
(declare-fun lt!529019 () ListLongMap!17005)

(declare-fun lt!529017 () ListLongMap!17005)

(assert (=> b!1173731 (= lt!529019 lt!529017)))

(declare-fun lt!529016 () ListLongMap!17005)

(declare-fun -!1505 (ListLongMap!17005 (_ BitVec 64)) ListLongMap!17005)

(assert (=> b!1173731 (= lt!529017 (-!1505 lt!529016 k0!934))))

(declare-fun zeroValue!944 () V!44497)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!529024 () array!75794)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44497)

(declare-fun getCurrentListMapNoExtraKeys!4991 (array!75796 array!75794 (_ BitVec 32) (_ BitVec 32) V!44497 V!44497 (_ BitVec 32) Int) ListLongMap!17005)

(assert (=> b!1173731 (= lt!529019 (getCurrentListMapNoExtraKeys!4991 lt!529018 lt!529024 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173731 (= lt!529016 (getCurrentListMapNoExtraKeys!4991 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38538 0))(
  ( (Unit!38539) )
))
(declare-fun lt!529022 () Unit!38538)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!769 (array!75796 array!75794 (_ BitVec 32) (_ BitVec 32) V!44497 V!44497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38538)

(assert (=> b!1173731 (= lt!529022 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!769 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173732 () Bool)

(assert (=> b!1173732 (= e!667150 true)))

(assert (=> b!1173732 (not (= (select (arr!36548 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529020 () Unit!38538)

(declare-fun e!667154 () Unit!38538)

(assert (=> b!1173732 (= lt!529020 e!667154)))

(declare-fun c!116593 () Bool)

(assert (=> b!1173732 (= c!116593 (= (select (arr!36548 _keys!1208) from!1455) k0!934))))

(assert (=> b!1173732 e!667147))

(declare-fun res!779429 () Bool)

(assert (=> b!1173732 (=> (not res!779429) (not e!667147))))

(declare-fun lt!529015 () V!44497)

(declare-fun lt!529021 () ListLongMap!17005)

(declare-fun +!3830 (ListLongMap!17005 tuple2!19036) ListLongMap!17005)

(declare-fun get!18662 (ValueCell!14054 V!44497) V!44497)

(assert (=> b!1173732 (= res!779429 (= lt!529021 (+!3830 lt!529017 (tuple2!19037 (select (arr!36548 _keys!1208) from!1455) (get!18662 (select (arr!36547 _values!996) from!1455) lt!529015)))))))

(declare-fun b!1173733 () Bool)

(declare-fun Unit!38540 () Unit!38538)

(assert (=> b!1173733 (= e!667154 Unit!38540)))

(declare-fun b!1173734 () Bool)

(declare-fun e!667152 () Bool)

(declare-fun tp_is_empty!29527 () Bool)

(assert (=> b!1173734 (= e!667152 tp_is_empty!29527)))

(declare-fun b!1173735 () Bool)

(declare-fun res!779433 () Bool)

(assert (=> b!1173735 (=> (not res!779433) (not e!667149))))

(assert (=> b!1173735 (= res!779433 (validKeyInArray!0 k0!934))))

(declare-fun b!1173736 () Bool)

(declare-fun e!667153 () Bool)

(assert (=> b!1173736 (= e!667153 e!667155)))

(declare-fun res!779439 () Bool)

(assert (=> b!1173736 (=> res!779439 e!667155)))

(assert (=> b!1173736 (= res!779439 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1173736 (= lt!529021 (getCurrentListMapNoExtraKeys!4991 lt!529018 lt!529024 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1173736 (= lt!529024 (array!75795 (store (arr!36547 _values!996) i!673 (ValueCellFull!14054 lt!529015)) (size!37085 _values!996)))))

(declare-fun dynLambda!2915 (Int (_ BitVec 64)) V!44497)

(assert (=> b!1173736 (= lt!529015 (dynLambda!2915 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529013 () ListLongMap!17005)

(assert (=> b!1173736 (= lt!529013 (getCurrentListMapNoExtraKeys!4991 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!46118 () Bool)

(declare-fun tp!87705 () Bool)

(assert (=> mapNonEmpty!46118 (= mapRes!46118 (and tp!87705 e!667152))))

(declare-fun mapValue!46118 () ValueCell!14054)

(declare-fun mapRest!46118 () (Array (_ BitVec 32) ValueCell!14054))

(declare-fun mapKey!46118 () (_ BitVec 32))

(assert (=> mapNonEmpty!46118 (= (arr!36547 _values!996) (store mapRest!46118 mapKey!46118 mapValue!46118))))

(declare-fun res!779437 () Bool)

(assert (=> start!99412 (=> (not res!779437) (not e!667149))))

(assert (=> start!99412 (= res!779437 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37086 _keys!1208))))))

(assert (=> start!99412 e!667149))

(assert (=> start!99412 tp_is_empty!29527))

(declare-fun array_inv!28030 (array!75796) Bool)

(assert (=> start!99412 (array_inv!28030 _keys!1208)))

(assert (=> start!99412 true))

(assert (=> start!99412 tp!87704))

(declare-fun array_inv!28031 (array!75794) Bool)

(assert (=> start!99412 (and (array_inv!28031 _values!996) e!667148)))

(declare-fun b!1173737 () Bool)

(declare-fun res!779427 () Bool)

(assert (=> b!1173737 (=> (not res!779427) (not e!667151))))

(declare-datatypes ((List!25753 0))(
  ( (Nil!25750) (Cons!25749 (h!26958 (_ BitVec 64)) (t!37733 List!25753)) )
))
(declare-fun arrayNoDuplicates!0 (array!75796 (_ BitVec 32) List!25753) Bool)

(assert (=> b!1173737 (= res!779427 (arrayNoDuplicates!0 lt!529018 #b00000000000000000000000000000000 Nil!25750))))

(declare-fun b!1173738 () Bool)

(assert (=> b!1173738 (= e!667145 tp_is_empty!29527)))

(declare-fun b!1173739 () Bool)

(declare-fun res!779435 () Bool)

(assert (=> b!1173739 (=> (not res!779435) (not e!667149))))

(assert (=> b!1173739 (= res!779435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173740 () Bool)

(declare-fun arrayContainsKey!0 (array!75796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173740 (= e!667156 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173741 () Bool)

(declare-fun Unit!38541 () Unit!38538)

(assert (=> b!1173741 (= e!667154 Unit!38541)))

(declare-fun lt!529023 () Unit!38538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75796 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38538)

(assert (=> b!1173741 (= lt!529023 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1173741 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529014 () Unit!38538)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75796 (_ BitVec 32) (_ BitVec 32)) Unit!38538)

(assert (=> b!1173741 (= lt!529014 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1173741 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25750)))

(declare-fun lt!529025 () Unit!38538)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75796 (_ BitVec 64) (_ BitVec 32) List!25753) Unit!38538)

(assert (=> b!1173741 (= lt!529025 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25750))))

(assert (=> b!1173741 false))

(declare-fun b!1173742 () Bool)

(declare-fun res!779432 () Bool)

(assert (=> b!1173742 (=> (not res!779432) (not e!667149))))

(assert (=> b!1173742 (= res!779432 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25750))))

(declare-fun b!1173743 () Bool)

(declare-fun res!779440 () Bool)

(assert (=> b!1173743 (=> (not res!779440) (not e!667149))))

(assert (=> b!1173743 (= res!779440 (= (select (arr!36548 _keys!1208) i!673) k0!934))))

(declare-fun b!1173744 () Bool)

(declare-fun res!779426 () Bool)

(assert (=> b!1173744 (=> (not res!779426) (not e!667149))))

(assert (=> b!1173744 (= res!779426 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37086 _keys!1208))))))

(declare-fun b!1173745 () Bool)

(declare-fun res!779431 () Bool)

(assert (=> b!1173745 (=> (not res!779431) (not e!667149))))

(assert (=> b!1173745 (= res!779431 (and (= (size!37085 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37086 _keys!1208) (size!37085 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173746 () Bool)

(assert (=> b!1173746 (= e!667151 (not e!667153))))

(declare-fun res!779428 () Bool)

(assert (=> b!1173746 (=> res!779428 e!667153)))

(assert (=> b!1173746 (= res!779428 (bvsgt from!1455 i!673))))

(assert (=> b!1173746 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529026 () Unit!38538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75796 (_ BitVec 64) (_ BitVec 32)) Unit!38538)

(assert (=> b!1173746 (= lt!529026 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99412 res!779437) b!1173728))

(assert (= (and b!1173728 res!779430) b!1173745))

(assert (= (and b!1173745 res!779431) b!1173739))

(assert (= (and b!1173739 res!779435) b!1173742))

(assert (= (and b!1173742 res!779432) b!1173744))

(assert (= (and b!1173744 res!779426) b!1173735))

(assert (= (and b!1173735 res!779433) b!1173743))

(assert (= (and b!1173743 res!779440) b!1173730))

(assert (= (and b!1173730 res!779438) b!1173737))

(assert (= (and b!1173737 res!779427) b!1173746))

(assert (= (and b!1173746 (not res!779428)) b!1173736))

(assert (= (and b!1173736 (not res!779439)) b!1173731))

(assert (= (and b!1173731 (not res!779436)) b!1173732))

(assert (= (and b!1173732 res!779429) b!1173729))

(assert (= (and b!1173729 (not res!779434)) b!1173740))

(assert (= (and b!1173732 c!116593) b!1173741))

(assert (= (and b!1173732 (not c!116593)) b!1173733))

(assert (= (and b!1173727 condMapEmpty!46118) mapIsEmpty!46118))

(assert (= (and b!1173727 (not condMapEmpty!46118)) mapNonEmpty!46118))

(get-info :version)

(assert (= (and mapNonEmpty!46118 ((_ is ValueCellFull!14054) mapValue!46118)) b!1173734))

(assert (= (and b!1173727 ((_ is ValueCellFull!14054) mapDefault!46118)) b!1173738))

(assert (= start!99412 b!1173727))

(declare-fun b_lambda!20123 () Bool)

(assert (=> (not b_lambda!20123) (not b!1173736)))

(declare-fun t!37731 () Bool)

(declare-fun tb!9801 () Bool)

(assert (=> (and start!99412 (= defaultEntry!1004 defaultEntry!1004) t!37731) tb!9801))

(declare-fun result!20177 () Bool)

(assert (=> tb!9801 (= result!20177 tp_is_empty!29527)))

(assert (=> b!1173736 t!37731))

(declare-fun b_and!40841 () Bool)

(assert (= b_and!40839 (and (=> t!37731 result!20177) b_and!40841)))

(declare-fun m!1081097 () Bool)

(assert (=> b!1173737 m!1081097))

(declare-fun m!1081099 () Bool)

(assert (=> b!1173732 m!1081099))

(declare-fun m!1081101 () Bool)

(assert (=> b!1173732 m!1081101))

(assert (=> b!1173732 m!1081101))

(declare-fun m!1081103 () Bool)

(assert (=> b!1173732 m!1081103))

(declare-fun m!1081105 () Bool)

(assert (=> b!1173732 m!1081105))

(declare-fun m!1081107 () Bool)

(assert (=> b!1173746 m!1081107))

(declare-fun m!1081109 () Bool)

(assert (=> b!1173746 m!1081109))

(declare-fun m!1081111 () Bool)

(assert (=> b!1173742 m!1081111))

(declare-fun m!1081113 () Bool)

(assert (=> mapNonEmpty!46118 m!1081113))

(declare-fun m!1081115 () Bool)

(assert (=> b!1173731 m!1081115))

(declare-fun m!1081117 () Bool)

(assert (=> b!1173731 m!1081117))

(declare-fun m!1081119 () Bool)

(assert (=> b!1173731 m!1081119))

(assert (=> b!1173731 m!1081099))

(declare-fun m!1081121 () Bool)

(assert (=> b!1173731 m!1081121))

(declare-fun m!1081123 () Bool)

(assert (=> b!1173731 m!1081123))

(assert (=> b!1173731 m!1081099))

(declare-fun m!1081125 () Bool)

(assert (=> b!1173739 m!1081125))

(declare-fun m!1081127 () Bool)

(assert (=> b!1173730 m!1081127))

(declare-fun m!1081129 () Bool)

(assert (=> b!1173730 m!1081129))

(declare-fun m!1081131 () Bool)

(assert (=> b!1173741 m!1081131))

(declare-fun m!1081133 () Bool)

(assert (=> b!1173741 m!1081133))

(declare-fun m!1081135 () Bool)

(assert (=> b!1173741 m!1081135))

(declare-fun m!1081137 () Bool)

(assert (=> b!1173741 m!1081137))

(declare-fun m!1081139 () Bool)

(assert (=> b!1173741 m!1081139))

(declare-fun m!1081141 () Bool)

(assert (=> start!99412 m!1081141))

(declare-fun m!1081143 () Bool)

(assert (=> start!99412 m!1081143))

(declare-fun m!1081145 () Bool)

(assert (=> b!1173735 m!1081145))

(assert (=> b!1173729 m!1081099))

(declare-fun m!1081147 () Bool)

(assert (=> b!1173736 m!1081147))

(declare-fun m!1081149 () Bool)

(assert (=> b!1173736 m!1081149))

(declare-fun m!1081151 () Bool)

(assert (=> b!1173736 m!1081151))

(declare-fun m!1081153 () Bool)

(assert (=> b!1173736 m!1081153))

(declare-fun m!1081155 () Bool)

(assert (=> b!1173740 m!1081155))

(declare-fun m!1081157 () Bool)

(assert (=> b!1173743 m!1081157))

(declare-fun m!1081159 () Bool)

(assert (=> b!1173728 m!1081159))

(check-sat (not b!1173732) (not b!1173742) (not b!1173740) (not b!1173735) (not b!1173730) (not b!1173746) (not b!1173739) (not b_lambda!20123) b_and!40841 (not b!1173736) (not b!1173731) (not b!1173728) (not mapNonEmpty!46118) (not b_next!24997) tp_is_empty!29527 (not start!99412) (not b!1173741) (not b!1173737))
(check-sat b_and!40841 (not b_next!24997))
