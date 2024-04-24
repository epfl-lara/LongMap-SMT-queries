; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99888 () Bool)

(assert start!99888)

(declare-fun b_free!25231 () Bool)

(declare-fun b_next!25231 () Bool)

(assert (=> start!99888 (= b_free!25231 (not b_next!25231))))

(declare-fun tp!88407 () Bool)

(declare-fun b_and!41331 () Bool)

(assert (=> start!99888 (= tp!88407 b_and!41331)))

(declare-fun mapNonEmpty!46469 () Bool)

(declare-fun mapRes!46469 () Bool)

(declare-fun tp!88406 () Bool)

(declare-fun e!672519 () Bool)

(assert (=> mapNonEmpty!46469 (= mapRes!46469 (and tp!88406 e!672519))))

(declare-fun mapKey!46469 () (_ BitVec 32))

(declare-datatypes ((V!44809 0))(
  ( (V!44810 (val!14937 Int)) )
))
(declare-datatypes ((ValueCell!14171 0))(
  ( (ValueCellFull!14171 (v!17571 V!44809)) (EmptyCell!14171) )
))
(declare-datatypes ((array!76373 0))(
  ( (array!76374 (arr!36830 (Array (_ BitVec 32) ValueCell!14171)) (size!37367 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76373)

(declare-fun mapRest!46469 () (Array (_ BitVec 32) ValueCell!14171))

(declare-fun mapValue!46469 () ValueCell!14171)

(assert (=> mapNonEmpty!46469 (= (arr!36830 _values!996) (store mapRest!46469 mapKey!46469 mapValue!46469))))

(declare-fun mapIsEmpty!46469 () Bool)

(assert (=> mapIsEmpty!46469 mapRes!46469))

(declare-fun b!1182722 () Bool)

(declare-fun e!672513 () Bool)

(declare-fun e!672521 () Bool)

(assert (=> b!1182722 (= e!672513 e!672521)))

(declare-fun res!785593 () Bool)

(assert (=> b!1182722 (=> res!785593 e!672521)))

(declare-datatypes ((array!76375 0))(
  ( (array!76376 (arr!36831 (Array (_ BitVec 32) (_ BitVec 64))) (size!37368 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76375)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1182722 (= res!785593 (not (= (select (arr!36831 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1182723 () Bool)

(declare-fun res!785600 () Bool)

(declare-fun e!672514 () Bool)

(assert (=> b!1182723 (=> (not res!785600) (not e!672514))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76375 (_ BitVec 32)) Bool)

(assert (=> b!1182723 (= res!785600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182724 () Bool)

(declare-fun res!785602 () Bool)

(assert (=> b!1182724 (=> (not res!785602) (not e!672514))))

(declare-datatypes ((List!25909 0))(
  ( (Nil!25906) (Cons!25905 (h!27123 (_ BitVec 64)) (t!38124 List!25909)) )
))
(declare-fun arrayNoDuplicates!0 (array!76375 (_ BitVec 32) List!25909) Bool)

(assert (=> b!1182724 (= res!785602 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25906))))

(declare-fun b!1182725 () Bool)

(declare-fun e!672523 () Bool)

(assert (=> b!1182725 (= e!672523 true)))

(declare-fun e!672512 () Bool)

(assert (=> b!1182725 e!672512))

(declare-fun res!785599 () Bool)

(assert (=> b!1182725 (=> (not res!785599) (not e!672512))))

(assert (=> b!1182725 (= res!785599 (not (= (select (arr!36831 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!39062 0))(
  ( (Unit!39063) )
))
(declare-fun lt!534862 () Unit!39062)

(declare-fun e!672516 () Unit!39062)

(assert (=> b!1182725 (= lt!534862 e!672516)))

(declare-fun c!117368 () Bool)

(assert (=> b!1182725 (= c!117368 (= (select (arr!36831 _keys!1208) from!1455) k0!934))))

(assert (=> b!1182725 e!672513))

(declare-fun res!785598 () Bool)

(assert (=> b!1182725 (=> (not res!785598) (not e!672513))))

(declare-datatypes ((tuple2!19180 0))(
  ( (tuple2!19181 (_1!9601 (_ BitVec 64)) (_2!9601 V!44809)) )
))
(declare-fun lt!534855 () tuple2!19180)

(declare-datatypes ((List!25910 0))(
  ( (Nil!25907) (Cons!25906 (h!27124 tuple2!19180) (t!38125 List!25910)) )
))
(declare-datatypes ((ListLongMap!17157 0))(
  ( (ListLongMap!17158 (toList!8594 List!25910)) )
))
(declare-fun lt!534860 () ListLongMap!17157)

(declare-fun lt!534848 () ListLongMap!17157)

(declare-fun +!3917 (ListLongMap!17157 tuple2!19180) ListLongMap!17157)

(assert (=> b!1182725 (= res!785598 (= lt!534848 (+!3917 lt!534860 lt!534855)))))

(declare-fun lt!534853 () V!44809)

(declare-fun get!18872 (ValueCell!14171 V!44809) V!44809)

(assert (=> b!1182725 (= lt!534855 (tuple2!19181 (select (arr!36831 _keys!1208) from!1455) (get!18872 (select (arr!36830 _values!996) from!1455) lt!534853)))))

(declare-fun b!1182726 () Bool)

(declare-fun e!672517 () Bool)

(declare-fun e!672522 () Bool)

(assert (=> b!1182726 (= e!672517 e!672522)))

(declare-fun res!785603 () Bool)

(assert (=> b!1182726 (=> res!785603 e!672522)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182726 (= res!785603 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44809)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!534849 () array!76375)

(declare-fun minValue!944 () V!44809)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!534859 () array!76373)

(declare-fun getCurrentListMapNoExtraKeys!5068 (array!76375 array!76373 (_ BitVec 32) (_ BitVec 32) V!44809 V!44809 (_ BitVec 32) Int) ListLongMap!17157)

(assert (=> b!1182726 (= lt!534848 (getCurrentListMapNoExtraKeys!5068 lt!534849 lt!534859 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1182726 (= lt!534859 (array!76374 (store (arr!36830 _values!996) i!673 (ValueCellFull!14171 lt!534853)) (size!37367 _values!996)))))

(declare-fun dynLambda!3034 (Int (_ BitVec 64)) V!44809)

(assert (=> b!1182726 (= lt!534853 (dynLambda!3034 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534857 () ListLongMap!17157)

(assert (=> b!1182726 (= lt!534857 (getCurrentListMapNoExtraKeys!5068 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182727 () Bool)

(declare-fun res!785601 () Bool)

(assert (=> b!1182727 (=> (not res!785601) (not e!672514))))

(assert (=> b!1182727 (= res!785601 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37368 _keys!1208))))))

(declare-fun b!1182728 () Bool)

(declare-fun e!672515 () Bool)

(assert (=> b!1182728 (= e!672514 e!672515)))

(declare-fun res!785605 () Bool)

(assert (=> b!1182728 (=> (not res!785605) (not e!672515))))

(assert (=> b!1182728 (= res!785605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534849 mask!1564))))

(assert (=> b!1182728 (= lt!534849 (array!76376 (store (arr!36831 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37368 _keys!1208)))))

(declare-fun b!1182729 () Bool)

(declare-fun res!785595 () Bool)

(assert (=> b!1182729 (=> (not res!785595) (not e!672514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182729 (= res!785595 (validKeyInArray!0 k0!934))))

(declare-fun b!1182731 () Bool)

(declare-fun Unit!39064 () Unit!39062)

(assert (=> b!1182731 (= e!672516 Unit!39064)))

(declare-fun lt!534854 () Unit!39062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76375 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39062)

(assert (=> b!1182731 (= lt!534854 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182731 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534856 () Unit!39062)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76375 (_ BitVec 32) (_ BitVec 32)) Unit!39062)

(assert (=> b!1182731 (= lt!534856 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1182731 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25906)))

(declare-fun lt!534858 () Unit!39062)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76375 (_ BitVec 64) (_ BitVec 32) List!25909) Unit!39062)

(assert (=> b!1182731 (= lt!534858 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25906))))

(assert (=> b!1182731 false))

(declare-fun b!1182732 () Bool)

(assert (=> b!1182732 (= e!672522 e!672523)))

(declare-fun res!785606 () Bool)

(assert (=> b!1182732 (=> res!785606 e!672523)))

(assert (=> b!1182732 (= res!785606 (not (validKeyInArray!0 (select (arr!36831 _keys!1208) from!1455))))))

(declare-fun lt!534852 () ListLongMap!17157)

(assert (=> b!1182732 (= lt!534852 lt!534860)))

(declare-fun lt!534861 () ListLongMap!17157)

(declare-fun -!1618 (ListLongMap!17157 (_ BitVec 64)) ListLongMap!17157)

(assert (=> b!1182732 (= lt!534860 (-!1618 lt!534861 k0!934))))

(assert (=> b!1182732 (= lt!534852 (getCurrentListMapNoExtraKeys!5068 lt!534849 lt!534859 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182732 (= lt!534861 (getCurrentListMapNoExtraKeys!5068 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534850 () Unit!39062)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!843 (array!76375 array!76373 (_ BitVec 32) (_ BitVec 32) V!44809 V!44809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39062)

(assert (=> b!1182732 (= lt!534850 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!843 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182733 () Bool)

(assert (=> b!1182733 (= e!672512 (= lt!534860 lt!534852))))

(declare-fun b!1182734 () Bool)

(declare-fun res!785607 () Bool)

(assert (=> b!1182734 (=> (not res!785607) (not e!672514))))

(assert (=> b!1182734 (= res!785607 (= (select (arr!36831 _keys!1208) i!673) k0!934))))

(declare-fun b!1182735 () Bool)

(declare-fun tp_is_empty!29761 () Bool)

(assert (=> b!1182735 (= e!672519 tp_is_empty!29761)))

(declare-fun b!1182736 () Bool)

(declare-fun res!785604 () Bool)

(assert (=> b!1182736 (=> (not res!785604) (not e!672512))))

(assert (=> b!1182736 (= res!785604 (= lt!534857 (+!3917 lt!534861 lt!534855)))))

(declare-fun b!1182737 () Bool)

(declare-fun res!785596 () Bool)

(assert (=> b!1182737 (=> (not res!785596) (not e!672514))))

(assert (=> b!1182737 (= res!785596 (and (= (size!37367 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37368 _keys!1208) (size!37367 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182738 () Bool)

(assert (=> b!1182738 (= e!672515 (not e!672517))))

(declare-fun res!785608 () Bool)

(assert (=> b!1182738 (=> res!785608 e!672517)))

(assert (=> b!1182738 (= res!785608 (bvsgt from!1455 i!673))))

(assert (=> b!1182738 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534851 () Unit!39062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76375 (_ BitVec 64) (_ BitVec 32)) Unit!39062)

(assert (=> b!1182738 (= lt!534851 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182739 () Bool)

(declare-fun e!672520 () Bool)

(assert (=> b!1182739 (= e!672520 tp_is_empty!29761)))

(declare-fun b!1182740 () Bool)

(declare-fun res!785594 () Bool)

(assert (=> b!1182740 (=> (not res!785594) (not e!672514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182740 (= res!785594 (validMask!0 mask!1564))))

(declare-fun b!1182741 () Bool)

(assert (=> b!1182741 (= e!672521 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182742 () Bool)

(declare-fun res!785609 () Bool)

(assert (=> b!1182742 (=> (not res!785609) (not e!672515))))

(assert (=> b!1182742 (= res!785609 (arrayNoDuplicates!0 lt!534849 #b00000000000000000000000000000000 Nil!25906))))

(declare-fun b!1182743 () Bool)

(declare-fun e!672518 () Bool)

(assert (=> b!1182743 (= e!672518 (and e!672520 mapRes!46469))))

(declare-fun condMapEmpty!46469 () Bool)

(declare-fun mapDefault!46469 () ValueCell!14171)

(assert (=> b!1182743 (= condMapEmpty!46469 (= (arr!36830 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14171)) mapDefault!46469)))))

(declare-fun b!1182730 () Bool)

(declare-fun Unit!39065 () Unit!39062)

(assert (=> b!1182730 (= e!672516 Unit!39065)))

(declare-fun res!785597 () Bool)

(assert (=> start!99888 (=> (not res!785597) (not e!672514))))

(assert (=> start!99888 (= res!785597 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37368 _keys!1208))))))

(assert (=> start!99888 e!672514))

(assert (=> start!99888 tp_is_empty!29761))

(declare-fun array_inv!28194 (array!76375) Bool)

(assert (=> start!99888 (array_inv!28194 _keys!1208)))

(assert (=> start!99888 true))

(assert (=> start!99888 tp!88407))

(declare-fun array_inv!28195 (array!76373) Bool)

(assert (=> start!99888 (and (array_inv!28195 _values!996) e!672518)))

(assert (= (and start!99888 res!785597) b!1182740))

(assert (= (and b!1182740 res!785594) b!1182737))

(assert (= (and b!1182737 res!785596) b!1182723))

(assert (= (and b!1182723 res!785600) b!1182724))

(assert (= (and b!1182724 res!785602) b!1182727))

(assert (= (and b!1182727 res!785601) b!1182729))

(assert (= (and b!1182729 res!785595) b!1182734))

(assert (= (and b!1182734 res!785607) b!1182728))

(assert (= (and b!1182728 res!785605) b!1182742))

(assert (= (and b!1182742 res!785609) b!1182738))

(assert (= (and b!1182738 (not res!785608)) b!1182726))

(assert (= (and b!1182726 (not res!785603)) b!1182732))

(assert (= (and b!1182732 (not res!785606)) b!1182725))

(assert (= (and b!1182725 res!785598) b!1182722))

(assert (= (and b!1182722 (not res!785593)) b!1182741))

(assert (= (and b!1182725 c!117368) b!1182731))

(assert (= (and b!1182725 (not c!117368)) b!1182730))

(assert (= (and b!1182725 res!785599) b!1182736))

(assert (= (and b!1182736 res!785604) b!1182733))

(assert (= (and b!1182743 condMapEmpty!46469) mapIsEmpty!46469))

(assert (= (and b!1182743 (not condMapEmpty!46469)) mapNonEmpty!46469))

(get-info :version)

(assert (= (and mapNonEmpty!46469 ((_ is ValueCellFull!14171) mapValue!46469)) b!1182735))

(assert (= (and b!1182743 ((_ is ValueCellFull!14171) mapDefault!46469)) b!1182739))

(assert (= start!99888 b!1182743))

(declare-fun b_lambda!20369 () Bool)

(assert (=> (not b_lambda!20369) (not b!1182726)))

(declare-fun t!38123 () Bool)

(declare-fun tb!10035 () Bool)

(assert (=> (and start!99888 (= defaultEntry!1004 defaultEntry!1004) t!38123) tb!10035))

(declare-fun result!20645 () Bool)

(assert (=> tb!10035 (= result!20645 tp_is_empty!29761)))

(assert (=> b!1182726 t!38123))

(declare-fun b_and!41333 () Bool)

(assert (= b_and!41331 (and (=> t!38123 result!20645) b_and!41333)))

(declare-fun m!1090929 () Bool)

(assert (=> mapNonEmpty!46469 m!1090929))

(declare-fun m!1090931 () Bool)

(assert (=> b!1182729 m!1090931))

(declare-fun m!1090933 () Bool)

(assert (=> b!1182728 m!1090933))

(declare-fun m!1090935 () Bool)

(assert (=> b!1182728 m!1090935))

(declare-fun m!1090937 () Bool)

(assert (=> b!1182723 m!1090937))

(declare-fun m!1090939 () Bool)

(assert (=> start!99888 m!1090939))

(declare-fun m!1090941 () Bool)

(assert (=> start!99888 m!1090941))

(declare-fun m!1090943 () Bool)

(assert (=> b!1182740 m!1090943))

(declare-fun m!1090945 () Bool)

(assert (=> b!1182734 m!1090945))

(declare-fun m!1090947 () Bool)

(assert (=> b!1182736 m!1090947))

(declare-fun m!1090949 () Bool)

(assert (=> b!1182742 m!1090949))

(declare-fun m!1090951 () Bool)

(assert (=> b!1182741 m!1090951))

(declare-fun m!1090953 () Bool)

(assert (=> b!1182731 m!1090953))

(declare-fun m!1090955 () Bool)

(assert (=> b!1182731 m!1090955))

(declare-fun m!1090957 () Bool)

(assert (=> b!1182731 m!1090957))

(declare-fun m!1090959 () Bool)

(assert (=> b!1182731 m!1090959))

(declare-fun m!1090961 () Bool)

(assert (=> b!1182731 m!1090961))

(declare-fun m!1090963 () Bool)

(assert (=> b!1182726 m!1090963))

(declare-fun m!1090965 () Bool)

(assert (=> b!1182726 m!1090965))

(declare-fun m!1090967 () Bool)

(assert (=> b!1182726 m!1090967))

(declare-fun m!1090969 () Bool)

(assert (=> b!1182726 m!1090969))

(declare-fun m!1090971 () Bool)

(assert (=> b!1182738 m!1090971))

(declare-fun m!1090973 () Bool)

(assert (=> b!1182738 m!1090973))

(declare-fun m!1090975 () Bool)

(assert (=> b!1182722 m!1090975))

(declare-fun m!1090977 () Bool)

(assert (=> b!1182724 m!1090977))

(assert (=> b!1182725 m!1090975))

(declare-fun m!1090979 () Bool)

(assert (=> b!1182725 m!1090979))

(declare-fun m!1090981 () Bool)

(assert (=> b!1182725 m!1090981))

(assert (=> b!1182725 m!1090981))

(declare-fun m!1090983 () Bool)

(assert (=> b!1182725 m!1090983))

(declare-fun m!1090985 () Bool)

(assert (=> b!1182732 m!1090985))

(declare-fun m!1090987 () Bool)

(assert (=> b!1182732 m!1090987))

(assert (=> b!1182732 m!1090975))

(declare-fun m!1090989 () Bool)

(assert (=> b!1182732 m!1090989))

(assert (=> b!1182732 m!1090975))

(declare-fun m!1090991 () Bool)

(assert (=> b!1182732 m!1090991))

(declare-fun m!1090993 () Bool)

(assert (=> b!1182732 m!1090993))

(check-sat (not b!1182740) (not b_next!25231) (not b!1182736) (not b_lambda!20369) (not b!1182738) (not b!1182726) (not b!1182731) (not b!1182723) (not b!1182742) (not b!1182724) (not b!1182728) (not start!99888) (not b!1182729) tp_is_empty!29761 (not b!1182732) (not mapNonEmpty!46469) (not b!1182725) b_and!41333 (not b!1182741))
(check-sat b_and!41333 (not b_next!25231))
