; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99346 () Bool)

(assert start!99346)

(declare-fun b_free!24931 () Bool)

(declare-fun b_next!24931 () Bool)

(assert (=> start!99346 (= b_free!24931 (not b_next!24931))))

(declare-fun tp!87507 () Bool)

(declare-fun b_and!40707 () Bool)

(assert (=> start!99346 (= tp!87507 b_and!40707)))

(declare-fun b!1171595 () Bool)

(declare-fun res!777781 () Bool)

(declare-fun e!665926 () Bool)

(assert (=> b!1171595 (=> (not res!777781) (not e!665926))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75666 0))(
  ( (array!75667 (arr!36483 (Array (_ BitVec 32) (_ BitVec 64))) (size!37021 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75666)

(assert (=> b!1171595 (= res!777781 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37021 _keys!1208))))))

(declare-fun b!1171596 () Bool)

(declare-fun e!665925 () Bool)

(declare-fun e!665923 () Bool)

(assert (=> b!1171596 (= e!665925 e!665923)))

(declare-fun res!777774 () Bool)

(assert (=> b!1171596 (=> res!777774 e!665923)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171596 (= res!777774 (not (validKeyInArray!0 (select (arr!36483 _keys!1208) from!1455))))))

(declare-datatypes ((V!44409 0))(
  ( (V!44410 (val!14787 Int)) )
))
(declare-datatypes ((tuple2!18982 0))(
  ( (tuple2!18983 (_1!9502 (_ BitVec 64)) (_2!9502 V!44409)) )
))
(declare-datatypes ((List!25695 0))(
  ( (Nil!25692) (Cons!25691 (h!26900 tuple2!18982) (t!37609 List!25695)) )
))
(declare-datatypes ((ListLongMap!16951 0))(
  ( (ListLongMap!16952 (toList!8491 List!25695)) )
))
(declare-fun lt!527672 () ListLongMap!16951)

(declare-fun lt!527671 () ListLongMap!16951)

(assert (=> b!1171596 (= lt!527672 lt!527671)))

(declare-fun lt!527670 () ListLongMap!16951)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1485 (ListLongMap!16951 (_ BitVec 64)) ListLongMap!16951)

(assert (=> b!1171596 (= lt!527671 (-!1485 lt!527670 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527677 () array!75666)

(declare-fun minValue!944 () V!44409)

(declare-fun zeroValue!944 () V!44409)

(declare-datatypes ((ValueCell!14021 0))(
  ( (ValueCellFull!14021 (v!17424 V!44409)) (EmptyCell!14021) )
))
(declare-datatypes ((array!75668 0))(
  ( (array!75669 (arr!36484 (Array (_ BitVec 32) ValueCell!14021)) (size!37022 (_ BitVec 32))) )
))
(declare-fun lt!527674 () array!75668)

(declare-fun getCurrentListMapNoExtraKeys!4965 (array!75666 array!75668 (_ BitVec 32) (_ BitVec 32) V!44409 V!44409 (_ BitVec 32) Int) ListLongMap!16951)

(assert (=> b!1171596 (= lt!527672 (getCurrentListMapNoExtraKeys!4965 lt!527677 lt!527674 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75668)

(assert (=> b!1171596 (= lt!527670 (getCurrentListMapNoExtraKeys!4965 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38463 0))(
  ( (Unit!38464) )
))
(declare-fun lt!527679 () Unit!38463)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!749 (array!75666 array!75668 (_ BitVec 32) (_ BitVec 32) V!44409 V!44409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38463)

(assert (=> b!1171596 (= lt!527679 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!749 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171598 () Bool)

(declare-fun res!777779 () Bool)

(assert (=> b!1171598 (=> (not res!777779) (not e!665926))))

(assert (=> b!1171598 (= res!777779 (= (select (arr!36483 _keys!1208) i!673) k0!934))))

(declare-fun b!1171599 () Bool)

(declare-fun res!777770 () Bool)

(assert (=> b!1171599 (=> (not res!777770) (not e!665926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171599 (= res!777770 (validMask!0 mask!1564))))

(declare-fun b!1171600 () Bool)

(declare-fun e!665914 () Bool)

(declare-fun tp_is_empty!29461 () Bool)

(assert (=> b!1171600 (= e!665914 tp_is_empty!29461)))

(declare-fun e!665917 () Bool)

(declare-fun b!1171601 () Bool)

(declare-fun arrayContainsKey!0 (array!75666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171601 (= e!665917 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171602 () Bool)

(declare-fun e!665924 () Bool)

(declare-fun e!665920 () Bool)

(declare-fun mapRes!46019 () Bool)

(assert (=> b!1171602 (= e!665924 (and e!665920 mapRes!46019))))

(declare-fun condMapEmpty!46019 () Bool)

(declare-fun mapDefault!46019 () ValueCell!14021)

(assert (=> b!1171602 (= condMapEmpty!46019 (= (arr!36484 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14021)) mapDefault!46019)))))

(declare-fun b!1171603 () Bool)

(declare-fun res!777783 () Bool)

(assert (=> b!1171603 (=> (not res!777783) (not e!665926))))

(assert (=> b!1171603 (= res!777783 (validKeyInArray!0 k0!934))))

(declare-fun b!1171604 () Bool)

(declare-fun res!777777 () Bool)

(assert (=> b!1171604 (=> (not res!777777) (not e!665926))))

(assert (=> b!1171604 (= res!777777 (and (= (size!37022 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37021 _keys!1208) (size!37022 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46019 () Bool)

(declare-fun tp!87506 () Bool)

(assert (=> mapNonEmpty!46019 (= mapRes!46019 (and tp!87506 e!665914))))

(declare-fun mapValue!46019 () ValueCell!14021)

(declare-fun mapRest!46019 () (Array (_ BitVec 32) ValueCell!14021))

(declare-fun mapKey!46019 () (_ BitVec 32))

(assert (=> mapNonEmpty!46019 (= (arr!36484 _values!996) (store mapRest!46019 mapKey!46019 mapValue!46019))))

(declare-fun b!1171605 () Bool)

(declare-fun res!777780 () Bool)

(declare-fun e!665918 () Bool)

(assert (=> b!1171605 (=> (not res!777780) (not e!665918))))

(declare-datatypes ((List!25696 0))(
  ( (Nil!25693) (Cons!25692 (h!26901 (_ BitVec 64)) (t!37610 List!25696)) )
))
(declare-fun arrayNoDuplicates!0 (array!75666 (_ BitVec 32) List!25696) Bool)

(assert (=> b!1171605 (= res!777780 (arrayNoDuplicates!0 lt!527677 #b00000000000000000000000000000000 Nil!25693))))

(declare-fun b!1171606 () Bool)

(declare-fun e!665922 () Bool)

(assert (=> b!1171606 (= e!665922 e!665925)))

(declare-fun res!777778 () Bool)

(assert (=> b!1171606 (=> res!777778 e!665925)))

(assert (=> b!1171606 (= res!777778 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!527680 () ListLongMap!16951)

(assert (=> b!1171606 (= lt!527680 (getCurrentListMapNoExtraKeys!4965 lt!527677 lt!527674 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527673 () V!44409)

(assert (=> b!1171606 (= lt!527674 (array!75669 (store (arr!36484 _values!996) i!673 (ValueCellFull!14021 lt!527673)) (size!37022 _values!996)))))

(declare-fun dynLambda!2890 (Int (_ BitVec 64)) V!44409)

(assert (=> b!1171606 (= lt!527673 (dynLambda!2890 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527676 () ListLongMap!16951)

(assert (=> b!1171606 (= lt!527676 (getCurrentListMapNoExtraKeys!4965 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171607 () Bool)

(declare-fun res!777786 () Bool)

(declare-fun e!665919 () Bool)

(assert (=> b!1171607 (=> res!777786 e!665919)))

(declare-fun noDuplicate!1628 (List!25696) Bool)

(assert (=> b!1171607 (= res!777786 (not (noDuplicate!1628 Nil!25693)))))

(declare-fun mapIsEmpty!46019 () Bool)

(assert (=> mapIsEmpty!46019 mapRes!46019))

(declare-fun b!1171608 () Bool)

(declare-fun res!777776 () Bool)

(assert (=> b!1171608 (=> (not res!777776) (not e!665926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75666 (_ BitVec 32)) Bool)

(assert (=> b!1171608 (= res!777776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171597 () Bool)

(assert (=> b!1171597 (= e!665926 e!665918)))

(declare-fun res!777784 () Bool)

(assert (=> b!1171597 (=> (not res!777784) (not e!665918))))

(assert (=> b!1171597 (= res!777784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527677 mask!1564))))

(assert (=> b!1171597 (= lt!527677 (array!75667 (store (arr!36483 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37021 _keys!1208)))))

(declare-fun res!777772 () Bool)

(assert (=> start!99346 (=> (not res!777772) (not e!665926))))

(assert (=> start!99346 (= res!777772 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37021 _keys!1208))))))

(assert (=> start!99346 e!665926))

(assert (=> start!99346 tp_is_empty!29461))

(declare-fun array_inv!27982 (array!75666) Bool)

(assert (=> start!99346 (array_inv!27982 _keys!1208)))

(assert (=> start!99346 true))

(assert (=> start!99346 tp!87507))

(declare-fun array_inv!27983 (array!75668) Bool)

(assert (=> start!99346 (and (array_inv!27983 _values!996) e!665924)))

(declare-fun b!1171609 () Bool)

(declare-fun res!777787 () Bool)

(assert (=> b!1171609 (=> res!777787 e!665919)))

(declare-fun contains!6830 (List!25696 (_ BitVec 64)) Bool)

(assert (=> b!1171609 (= res!777787 (contains!6830 Nil!25693 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171610 () Bool)

(assert (=> b!1171610 (= e!665919 true)))

(declare-fun lt!527682 () Bool)

(assert (=> b!1171610 (= lt!527682 (contains!6830 Nil!25693 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171611 () Bool)

(declare-fun e!665921 () Bool)

(assert (=> b!1171611 (= e!665921 e!665919)))

(declare-fun res!777771 () Bool)

(assert (=> b!1171611 (=> res!777771 e!665919)))

(assert (=> b!1171611 (= res!777771 (or (bvsge (size!37021 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37021 _keys!1208)) (bvsge from!1455 (size!37021 _keys!1208))))))

(assert (=> b!1171611 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25693)))

(declare-fun lt!527681 () Unit!38463)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75666 (_ BitVec 32) (_ BitVec 32)) Unit!38463)

(assert (=> b!1171611 (= lt!527681 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1171611 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527678 () Unit!38463)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75666 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38463)

(assert (=> b!1171611 (= lt!527678 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1171612 () Bool)

(assert (=> b!1171612 (= e!665920 tp_is_empty!29461)))

(declare-fun b!1171613 () Bool)

(declare-fun res!777769 () Bool)

(assert (=> b!1171613 (=> (not res!777769) (not e!665926))))

(assert (=> b!1171613 (= res!777769 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25693))))

(declare-fun b!1171614 () Bool)

(assert (=> b!1171614 (= e!665918 (not e!665922))))

(declare-fun res!777773 () Bool)

(assert (=> b!1171614 (=> res!777773 e!665922)))

(assert (=> b!1171614 (= res!777773 (bvsgt from!1455 i!673))))

(assert (=> b!1171614 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527675 () Unit!38463)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75666 (_ BitVec 64) (_ BitVec 32)) Unit!38463)

(assert (=> b!1171614 (= lt!527675 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171615 () Bool)

(declare-fun e!665916 () Bool)

(assert (=> b!1171615 (= e!665916 e!665917)))

(declare-fun res!777775 () Bool)

(assert (=> b!1171615 (=> res!777775 e!665917)))

(assert (=> b!1171615 (= res!777775 (not (= (select (arr!36483 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1171616 () Bool)

(assert (=> b!1171616 (= e!665923 e!665921)))

(declare-fun res!777782 () Bool)

(assert (=> b!1171616 (=> res!777782 e!665921)))

(assert (=> b!1171616 (= res!777782 (not (= (select (arr!36483 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1171616 e!665916))

(declare-fun res!777785 () Bool)

(assert (=> b!1171616 (=> (not res!777785) (not e!665916))))

(declare-fun +!3809 (ListLongMap!16951 tuple2!18982) ListLongMap!16951)

(declare-fun get!18619 (ValueCell!14021 V!44409) V!44409)

(assert (=> b!1171616 (= res!777785 (= lt!527680 (+!3809 lt!527671 (tuple2!18983 (select (arr!36483 _keys!1208) from!1455) (get!18619 (select (arr!36484 _values!996) from!1455) lt!527673)))))))

(assert (= (and start!99346 res!777772) b!1171599))

(assert (= (and b!1171599 res!777770) b!1171604))

(assert (= (and b!1171604 res!777777) b!1171608))

(assert (= (and b!1171608 res!777776) b!1171613))

(assert (= (and b!1171613 res!777769) b!1171595))

(assert (= (and b!1171595 res!777781) b!1171603))

(assert (= (and b!1171603 res!777783) b!1171598))

(assert (= (and b!1171598 res!777779) b!1171597))

(assert (= (and b!1171597 res!777784) b!1171605))

(assert (= (and b!1171605 res!777780) b!1171614))

(assert (= (and b!1171614 (not res!777773)) b!1171606))

(assert (= (and b!1171606 (not res!777778)) b!1171596))

(assert (= (and b!1171596 (not res!777774)) b!1171616))

(assert (= (and b!1171616 res!777785) b!1171615))

(assert (= (and b!1171615 (not res!777775)) b!1171601))

(assert (= (and b!1171616 (not res!777782)) b!1171611))

(assert (= (and b!1171611 (not res!777771)) b!1171607))

(assert (= (and b!1171607 (not res!777786)) b!1171609))

(assert (= (and b!1171609 (not res!777787)) b!1171610))

(assert (= (and b!1171602 condMapEmpty!46019) mapIsEmpty!46019))

(assert (= (and b!1171602 (not condMapEmpty!46019)) mapNonEmpty!46019))

(get-info :version)

(assert (= (and mapNonEmpty!46019 ((_ is ValueCellFull!14021) mapValue!46019)) b!1171600))

(assert (= (and b!1171602 ((_ is ValueCellFull!14021) mapDefault!46019)) b!1171612))

(assert (= start!99346 b!1171602))

(declare-fun b_lambda!20057 () Bool)

(assert (=> (not b_lambda!20057) (not b!1171606)))

(declare-fun t!37608 () Bool)

(declare-fun tb!9735 () Bool)

(assert (=> (and start!99346 (= defaultEntry!1004 defaultEntry!1004) t!37608) tb!9735))

(declare-fun result!20045 () Bool)

(assert (=> tb!9735 (= result!20045 tp_is_empty!29461)))

(assert (=> b!1171606 t!37608))

(declare-fun b_and!40709 () Bool)

(assert (= b_and!40707 (and (=> t!37608 result!20045) b_and!40709)))

(declare-fun m!1078925 () Bool)

(assert (=> b!1171596 m!1078925))

(declare-fun m!1078927 () Bool)

(assert (=> b!1171596 m!1078927))

(declare-fun m!1078929 () Bool)

(assert (=> b!1171596 m!1078929))

(declare-fun m!1078931 () Bool)

(assert (=> b!1171596 m!1078931))

(declare-fun m!1078933 () Bool)

(assert (=> b!1171596 m!1078933))

(declare-fun m!1078935 () Bool)

(assert (=> b!1171596 m!1078935))

(assert (=> b!1171596 m!1078931))

(declare-fun m!1078937 () Bool)

(assert (=> b!1171611 m!1078937))

(declare-fun m!1078939 () Bool)

(assert (=> b!1171611 m!1078939))

(declare-fun m!1078941 () Bool)

(assert (=> b!1171611 m!1078941))

(declare-fun m!1078943 () Bool)

(assert (=> b!1171611 m!1078943))

(declare-fun m!1078945 () Bool)

(assert (=> b!1171601 m!1078945))

(declare-fun m!1078947 () Bool)

(assert (=> b!1171607 m!1078947))

(declare-fun m!1078949 () Bool)

(assert (=> b!1171603 m!1078949))

(declare-fun m!1078951 () Bool)

(assert (=> start!99346 m!1078951))

(declare-fun m!1078953 () Bool)

(assert (=> start!99346 m!1078953))

(declare-fun m!1078955 () Bool)

(assert (=> b!1171599 m!1078955))

(assert (=> b!1171616 m!1078931))

(declare-fun m!1078957 () Bool)

(assert (=> b!1171616 m!1078957))

(assert (=> b!1171616 m!1078957))

(declare-fun m!1078959 () Bool)

(assert (=> b!1171616 m!1078959))

(declare-fun m!1078961 () Bool)

(assert (=> b!1171616 m!1078961))

(declare-fun m!1078963 () Bool)

(assert (=> b!1171613 m!1078963))

(declare-fun m!1078965 () Bool)

(assert (=> b!1171609 m!1078965))

(declare-fun m!1078967 () Bool)

(assert (=> b!1171608 m!1078967))

(declare-fun m!1078969 () Bool)

(assert (=> b!1171606 m!1078969))

(declare-fun m!1078971 () Bool)

(assert (=> b!1171606 m!1078971))

(declare-fun m!1078973 () Bool)

(assert (=> b!1171606 m!1078973))

(declare-fun m!1078975 () Bool)

(assert (=> b!1171606 m!1078975))

(declare-fun m!1078977 () Bool)

(assert (=> b!1171614 m!1078977))

(declare-fun m!1078979 () Bool)

(assert (=> b!1171614 m!1078979))

(declare-fun m!1078981 () Bool)

(assert (=> b!1171605 m!1078981))

(declare-fun m!1078983 () Bool)

(assert (=> b!1171597 m!1078983))

(declare-fun m!1078985 () Bool)

(assert (=> b!1171597 m!1078985))

(declare-fun m!1078987 () Bool)

(assert (=> b!1171598 m!1078987))

(assert (=> b!1171615 m!1078931))

(declare-fun m!1078989 () Bool)

(assert (=> mapNonEmpty!46019 m!1078989))

(declare-fun m!1078991 () Bool)

(assert (=> b!1171610 m!1078991))

(check-sat b_and!40709 (not b!1171614) (not b!1171616) (not b!1171608) (not b!1171603) tp_is_empty!29461 (not b!1171607) (not b!1171609) (not b_lambda!20057) (not b!1171610) (not b!1171605) (not b_next!24931) (not b!1171601) (not b!1171606) (not b!1171596) (not b!1171599) (not b!1171597) (not mapNonEmpty!46019) (not b!1171613) (not start!99346) (not b!1171611))
(check-sat b_and!40709 (not b_next!24931))
