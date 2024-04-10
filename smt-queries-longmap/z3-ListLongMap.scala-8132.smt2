; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99660 () Bool)

(assert start!99660)

(declare-fun b_free!25239 () Bool)

(declare-fun b_next!25239 () Bool)

(assert (=> start!99660 (= b_free!25239 (not b_next!25239))))

(declare-fun tp!88431 () Bool)

(declare-fun b_and!41345 () Bool)

(assert (=> start!99660 (= tp!88431 b_and!41345)))

(declare-fun mapNonEmpty!46481 () Bool)

(declare-fun mapRes!46481 () Bool)

(declare-fun tp!88430 () Bool)

(declare-fun e!671835 () Bool)

(assert (=> mapNonEmpty!46481 (= mapRes!46481 (and tp!88430 e!671835))))

(declare-fun mapKey!46481 () (_ BitVec 32))

(declare-datatypes ((V!44819 0))(
  ( (V!44820 (val!14941 Int)) )
))
(declare-datatypes ((ValueCell!14175 0))(
  ( (ValueCellFull!14175 (v!17579 V!44819)) (EmptyCell!14175) )
))
(declare-fun mapRest!46481 () (Array (_ BitVec 32) ValueCell!14175))

(declare-fun mapValue!46481 () ValueCell!14175)

(declare-datatypes ((array!76341 0))(
  ( (array!76342 (arr!36820 (Array (_ BitVec 32) ValueCell!14175)) (size!37356 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76341)

(assert (=> mapNonEmpty!46481 (= (arr!36820 _values!996) (store mapRest!46481 mapKey!46481 mapValue!46481))))

(declare-fun b!1181695 () Bool)

(declare-datatypes ((Unit!39082 0))(
  ( (Unit!39083) )
))
(declare-fun e!671840 () Unit!39082)

(declare-fun Unit!39084 () Unit!39082)

(assert (=> b!1181695 (= e!671840 Unit!39084)))

(declare-fun b!1181696 () Bool)

(declare-fun e!671842 () Bool)

(declare-fun e!671833 () Bool)

(assert (=> b!1181696 (= e!671842 e!671833)))

(declare-fun res!785280 () Bool)

(assert (=> b!1181696 (=> res!785280 e!671833)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1181696 (= res!785280 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44819)

(declare-datatypes ((tuple2!19142 0))(
  ( (tuple2!19143 (_1!9582 (_ BitVec 64)) (_2!9582 V!44819)) )
))
(declare-datatypes ((List!25882 0))(
  ( (Nil!25879) (Cons!25878 (h!27087 tuple2!19142) (t!38113 List!25882)) )
))
(declare-datatypes ((ListLongMap!17111 0))(
  ( (ListLongMap!17112 (toList!8571 List!25882)) )
))
(declare-fun lt!534565 () ListLongMap!17111)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!534579 () array!76341)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!76343 0))(
  ( (array!76344 (arr!36821 (Array (_ BitVec 32) (_ BitVec 64))) (size!37357 (_ BitVec 32))) )
))
(declare-fun lt!534575 () array!76343)

(declare-fun minValue!944 () V!44819)

(declare-fun getCurrentListMapNoExtraKeys!5024 (array!76343 array!76341 (_ BitVec 32) (_ BitVec 32) V!44819 V!44819 (_ BitVec 32) Int) ListLongMap!17111)

(assert (=> b!1181696 (= lt!534565 (getCurrentListMapNoExtraKeys!5024 lt!534575 lt!534579 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534573 () V!44819)

(assert (=> b!1181696 (= lt!534579 (array!76342 (store (arr!36820 _values!996) i!673 (ValueCellFull!14175 lt!534573)) (size!37356 _values!996)))))

(declare-fun dynLambda!2979 (Int (_ BitVec 64)) V!44819)

(assert (=> b!1181696 (= lt!534573 (dynLambda!2979 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76343)

(declare-fun lt!534566 () ListLongMap!17111)

(assert (=> b!1181696 (= lt!534566 (getCurrentListMapNoExtraKeys!5024 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181697 () Bool)

(declare-fun Unit!39085 () Unit!39082)

(assert (=> b!1181697 (= e!671840 Unit!39085)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!534570 () Unit!39082)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76343 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39082)

(assert (=> b!1181697 (= lt!534570 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181697 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534581 () Unit!39082)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76343 (_ BitVec 32) (_ BitVec 32)) Unit!39082)

(assert (=> b!1181697 (= lt!534581 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25883 0))(
  ( (Nil!25880) (Cons!25879 (h!27088 (_ BitVec 64)) (t!38114 List!25883)) )
))
(declare-fun arrayNoDuplicates!0 (array!76343 (_ BitVec 32) List!25883) Bool)

(assert (=> b!1181697 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25880)))

(declare-fun lt!534572 () Unit!39082)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76343 (_ BitVec 64) (_ BitVec 32) List!25883) Unit!39082)

(assert (=> b!1181697 (= lt!534572 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25880))))

(assert (=> b!1181697 false))

(declare-fun b!1181698 () Bool)

(declare-fun res!785289 () Bool)

(declare-fun e!671836 () Bool)

(assert (=> b!1181698 (=> (not res!785289) (not e!671836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181698 (= res!785289 (validKeyInArray!0 k0!934))))

(declare-fun b!1181699 () Bool)

(declare-fun res!785293 () Bool)

(declare-fun e!671834 () Bool)

(assert (=> b!1181699 (=> (not res!785293) (not e!671834))))

(assert (=> b!1181699 (= res!785293 (arrayNoDuplicates!0 lt!534575 #b00000000000000000000000000000000 Nil!25880))))

(declare-fun b!1181700 () Bool)

(declare-fun e!671841 () Bool)

(declare-fun e!671832 () Bool)

(assert (=> b!1181700 (= e!671841 e!671832)))

(declare-fun res!785291 () Bool)

(assert (=> b!1181700 (=> res!785291 e!671832)))

(assert (=> b!1181700 (= res!785291 (not (= (select (arr!36821 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1181701 () Bool)

(declare-fun res!785285 () Bool)

(assert (=> b!1181701 (=> (not res!785285) (not e!671836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76343 (_ BitVec 32)) Bool)

(assert (=> b!1181701 (= res!785285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181702 () Bool)

(declare-fun e!671839 () Bool)

(declare-fun tp_is_empty!29769 () Bool)

(assert (=> b!1181702 (= e!671839 tp_is_empty!29769)))

(declare-fun b!1181703 () Bool)

(declare-fun e!671837 () Bool)

(assert (=> b!1181703 (= e!671837 true)))

(declare-fun lt!534564 () ListLongMap!17111)

(declare-fun lt!534576 () ListLongMap!17111)

(declare-fun -!1610 (ListLongMap!17111 (_ BitVec 64)) ListLongMap!17111)

(assert (=> b!1181703 (= (-!1610 lt!534564 k0!934) lt!534576)))

(declare-fun lt!534569 () V!44819)

(declare-fun lt!534574 () Unit!39082)

(declare-fun lt!534571 () ListLongMap!17111)

(declare-fun addRemoveCommutativeForDiffKeys!141 (ListLongMap!17111 (_ BitVec 64) V!44819 (_ BitVec 64)) Unit!39082)

(assert (=> b!1181703 (= lt!534574 (addRemoveCommutativeForDiffKeys!141 lt!534571 (select (arr!36821 _keys!1208) from!1455) lt!534569 k0!934))))

(declare-fun lt!534582 () ListLongMap!17111)

(declare-fun lt!534577 () ListLongMap!17111)

(assert (=> b!1181703 (and (= lt!534566 lt!534564) (= lt!534577 lt!534582))))

(declare-fun lt!534578 () tuple2!19142)

(declare-fun +!3878 (ListLongMap!17111 tuple2!19142) ListLongMap!17111)

(assert (=> b!1181703 (= lt!534564 (+!3878 lt!534571 lt!534578))))

(assert (=> b!1181703 (not (= (select (arr!36821 _keys!1208) from!1455) k0!934))))

(declare-fun lt!534580 () Unit!39082)

(assert (=> b!1181703 (= lt!534580 e!671840)))

(declare-fun c!116982 () Bool)

(assert (=> b!1181703 (= c!116982 (= (select (arr!36821 _keys!1208) from!1455) k0!934))))

(assert (=> b!1181703 e!671841))

(declare-fun res!785286 () Bool)

(assert (=> b!1181703 (=> (not res!785286) (not e!671841))))

(assert (=> b!1181703 (= res!785286 (= lt!534565 lt!534576))))

(assert (=> b!1181703 (= lt!534576 (+!3878 lt!534577 lt!534578))))

(assert (=> b!1181703 (= lt!534578 (tuple2!19143 (select (arr!36821 _keys!1208) from!1455) lt!534569))))

(declare-fun get!18831 (ValueCell!14175 V!44819) V!44819)

(assert (=> b!1181703 (= lt!534569 (get!18831 (select (arr!36820 _values!996) from!1455) lt!534573))))

(declare-fun b!1181704 () Bool)

(declare-fun res!785284 () Bool)

(assert (=> b!1181704 (=> (not res!785284) (not e!671836))))

(assert (=> b!1181704 (= res!785284 (and (= (size!37356 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37357 _keys!1208) (size!37356 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181705 () Bool)

(declare-fun res!785292 () Bool)

(assert (=> b!1181705 (=> (not res!785292) (not e!671836))))

(assert (=> b!1181705 (= res!785292 (= (select (arr!36821 _keys!1208) i!673) k0!934))))

(declare-fun b!1181706 () Bool)

(assert (=> b!1181706 (= e!671832 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun res!785282 () Bool)

(assert (=> start!99660 (=> (not res!785282) (not e!671836))))

(assert (=> start!99660 (= res!785282 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37357 _keys!1208))))))

(assert (=> start!99660 e!671836))

(assert (=> start!99660 tp_is_empty!29769))

(declare-fun array_inv!28112 (array!76343) Bool)

(assert (=> start!99660 (array_inv!28112 _keys!1208)))

(assert (=> start!99660 true))

(assert (=> start!99660 tp!88431))

(declare-fun e!671838 () Bool)

(declare-fun array_inv!28113 (array!76341) Bool)

(assert (=> start!99660 (and (array_inv!28113 _values!996) e!671838)))

(declare-fun b!1181707 () Bool)

(assert (=> b!1181707 (= e!671833 e!671837)))

(declare-fun res!785288 () Bool)

(assert (=> b!1181707 (=> res!785288 e!671837)))

(assert (=> b!1181707 (= res!785288 (not (validKeyInArray!0 (select (arr!36821 _keys!1208) from!1455))))))

(assert (=> b!1181707 (= lt!534582 lt!534577)))

(assert (=> b!1181707 (= lt!534577 (-!1610 lt!534571 k0!934))))

(assert (=> b!1181707 (= lt!534582 (getCurrentListMapNoExtraKeys!5024 lt!534575 lt!534579 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181707 (= lt!534571 (getCurrentListMapNoExtraKeys!5024 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534567 () Unit!39082)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!837 (array!76343 array!76341 (_ BitVec 32) (_ BitVec 32) V!44819 V!44819 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39082)

(assert (=> b!1181707 (= lt!534567 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!837 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1181708 () Bool)

(assert (=> b!1181708 (= e!671836 e!671834)))

(declare-fun res!785290 () Bool)

(assert (=> b!1181708 (=> (not res!785290) (not e!671834))))

(assert (=> b!1181708 (= res!785290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534575 mask!1564))))

(assert (=> b!1181708 (= lt!534575 (array!76344 (store (arr!36821 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37357 _keys!1208)))))

(declare-fun b!1181709 () Bool)

(assert (=> b!1181709 (= e!671838 (and e!671839 mapRes!46481))))

(declare-fun condMapEmpty!46481 () Bool)

(declare-fun mapDefault!46481 () ValueCell!14175)

(assert (=> b!1181709 (= condMapEmpty!46481 (= (arr!36820 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14175)) mapDefault!46481)))))

(declare-fun mapIsEmpty!46481 () Bool)

(assert (=> mapIsEmpty!46481 mapRes!46481))

(declare-fun b!1181710 () Bool)

(declare-fun res!785279 () Bool)

(assert (=> b!1181710 (=> (not res!785279) (not e!671836))))

(assert (=> b!1181710 (= res!785279 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25880))))

(declare-fun b!1181711 () Bool)

(assert (=> b!1181711 (= e!671834 (not e!671842))))

(declare-fun res!785287 () Bool)

(assert (=> b!1181711 (=> res!785287 e!671842)))

(assert (=> b!1181711 (= res!785287 (bvsgt from!1455 i!673))))

(assert (=> b!1181711 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534568 () Unit!39082)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76343 (_ BitVec 64) (_ BitVec 32)) Unit!39082)

(assert (=> b!1181711 (= lt!534568 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181712 () Bool)

(declare-fun res!785281 () Bool)

(assert (=> b!1181712 (=> (not res!785281) (not e!671836))))

(assert (=> b!1181712 (= res!785281 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37357 _keys!1208))))))

(declare-fun b!1181713 () Bool)

(declare-fun res!785283 () Bool)

(assert (=> b!1181713 (=> (not res!785283) (not e!671836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181713 (= res!785283 (validMask!0 mask!1564))))

(declare-fun b!1181714 () Bool)

(assert (=> b!1181714 (= e!671835 tp_is_empty!29769)))

(assert (= (and start!99660 res!785282) b!1181713))

(assert (= (and b!1181713 res!785283) b!1181704))

(assert (= (and b!1181704 res!785284) b!1181701))

(assert (= (and b!1181701 res!785285) b!1181710))

(assert (= (and b!1181710 res!785279) b!1181712))

(assert (= (and b!1181712 res!785281) b!1181698))

(assert (= (and b!1181698 res!785289) b!1181705))

(assert (= (and b!1181705 res!785292) b!1181708))

(assert (= (and b!1181708 res!785290) b!1181699))

(assert (= (and b!1181699 res!785293) b!1181711))

(assert (= (and b!1181711 (not res!785287)) b!1181696))

(assert (= (and b!1181696 (not res!785280)) b!1181707))

(assert (= (and b!1181707 (not res!785288)) b!1181703))

(assert (= (and b!1181703 res!785286) b!1181700))

(assert (= (and b!1181700 (not res!785291)) b!1181706))

(assert (= (and b!1181703 c!116982) b!1181697))

(assert (= (and b!1181703 (not c!116982)) b!1181695))

(assert (= (and b!1181709 condMapEmpty!46481) mapIsEmpty!46481))

(assert (= (and b!1181709 (not condMapEmpty!46481)) mapNonEmpty!46481))

(get-info :version)

(assert (= (and mapNonEmpty!46481 ((_ is ValueCellFull!14175) mapValue!46481)) b!1181714))

(assert (= (and b!1181709 ((_ is ValueCellFull!14175) mapDefault!46481)) b!1181702))

(assert (= start!99660 b!1181709))

(declare-fun b_lambda!20383 () Bool)

(assert (=> (not b_lambda!20383) (not b!1181696)))

(declare-fun t!38112 () Bool)

(declare-fun tb!10051 () Bool)

(assert (=> (and start!99660 (= defaultEntry!1004 defaultEntry!1004) t!38112) tb!10051))

(declare-fun result!20669 () Bool)

(assert (=> tb!10051 (= result!20669 tp_is_empty!29769)))

(assert (=> b!1181696 t!38112))

(declare-fun b_and!41347 () Bool)

(assert (= b_and!41345 (and (=> t!38112 result!20669) b_and!41347)))

(declare-fun m!1089625 () Bool)

(assert (=> b!1181711 m!1089625))

(declare-fun m!1089627 () Bool)

(assert (=> b!1181711 m!1089627))

(declare-fun m!1089629 () Bool)

(assert (=> start!99660 m!1089629))

(declare-fun m!1089631 () Bool)

(assert (=> start!99660 m!1089631))

(declare-fun m!1089633 () Bool)

(assert (=> mapNonEmpty!46481 m!1089633))

(declare-fun m!1089635 () Bool)

(assert (=> b!1181703 m!1089635))

(declare-fun m!1089637 () Bool)

(assert (=> b!1181703 m!1089637))

(declare-fun m!1089639 () Bool)

(assert (=> b!1181703 m!1089639))

(declare-fun m!1089641 () Bool)

(assert (=> b!1181703 m!1089641))

(declare-fun m!1089643 () Bool)

(assert (=> b!1181703 m!1089643))

(declare-fun m!1089645 () Bool)

(assert (=> b!1181703 m!1089645))

(assert (=> b!1181703 m!1089639))

(assert (=> b!1181703 m!1089635))

(declare-fun m!1089647 () Bool)

(assert (=> b!1181703 m!1089647))

(declare-fun m!1089649 () Bool)

(assert (=> b!1181707 m!1089649))

(declare-fun m!1089651 () Bool)

(assert (=> b!1181707 m!1089651))

(declare-fun m!1089653 () Bool)

(assert (=> b!1181707 m!1089653))

(assert (=> b!1181707 m!1089639))

(declare-fun m!1089655 () Bool)

(assert (=> b!1181707 m!1089655))

(assert (=> b!1181707 m!1089639))

(declare-fun m!1089657 () Bool)

(assert (=> b!1181707 m!1089657))

(declare-fun m!1089659 () Bool)

(assert (=> b!1181698 m!1089659))

(declare-fun m!1089661 () Bool)

(assert (=> b!1181701 m!1089661))

(declare-fun m!1089663 () Bool)

(assert (=> b!1181710 m!1089663))

(assert (=> b!1181700 m!1089639))

(declare-fun m!1089665 () Bool)

(assert (=> b!1181699 m!1089665))

(declare-fun m!1089667 () Bool)

(assert (=> b!1181706 m!1089667))

(declare-fun m!1089669 () Bool)

(assert (=> b!1181705 m!1089669))

(declare-fun m!1089671 () Bool)

(assert (=> b!1181713 m!1089671))

(declare-fun m!1089673 () Bool)

(assert (=> b!1181708 m!1089673))

(declare-fun m!1089675 () Bool)

(assert (=> b!1181708 m!1089675))

(declare-fun m!1089677 () Bool)

(assert (=> b!1181696 m!1089677))

(declare-fun m!1089679 () Bool)

(assert (=> b!1181696 m!1089679))

(declare-fun m!1089681 () Bool)

(assert (=> b!1181696 m!1089681))

(declare-fun m!1089683 () Bool)

(assert (=> b!1181696 m!1089683))

(declare-fun m!1089685 () Bool)

(assert (=> b!1181697 m!1089685))

(declare-fun m!1089687 () Bool)

(assert (=> b!1181697 m!1089687))

(declare-fun m!1089689 () Bool)

(assert (=> b!1181697 m!1089689))

(declare-fun m!1089691 () Bool)

(assert (=> b!1181697 m!1089691))

(declare-fun m!1089693 () Bool)

(assert (=> b!1181697 m!1089693))

(check-sat (not b_next!25239) (not b!1181699) (not b!1181696) (not mapNonEmpty!46481) (not b!1181706) (not b!1181708) (not b!1181711) (not b!1181703) (not start!99660) tp_is_empty!29769 (not b!1181697) (not b!1181710) (not b!1181698) (not b!1181713) (not b!1181701) (not b!1181707) b_and!41347 (not b_lambda!20383))
(check-sat b_and!41347 (not b_next!25239))
