; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98134 () Bool)

(assert start!98134)

(declare-fun b_free!23835 () Bool)

(declare-fun b_next!23835 () Bool)

(assert (=> start!98134 (= b_free!23835 (not b_next!23835))))

(declare-fun tp!84208 () Bool)

(declare-fun b_and!38453 () Bool)

(assert (=> start!98134 (= tp!84208 b_and!38453)))

(declare-datatypes ((V!42947 0))(
  ( (V!42948 (val!14239 Int)) )
))
(declare-fun zeroValue!944 () V!42947)

(declare-datatypes ((array!73589 0))(
  ( (array!73590 (arr!35447 (Array (_ BitVec 32) (_ BitVec 64))) (size!35983 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73589)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17914 0))(
  ( (tuple2!17915 (_1!8968 (_ BitVec 64)) (_2!8968 V!42947)) )
))
(declare-datatypes ((List!24685 0))(
  ( (Nil!24682) (Cons!24681 (h!25890 tuple2!17914) (t!35512 List!24685)) )
))
(declare-datatypes ((ListLongMap!15883 0))(
  ( (ListLongMap!15884 (toList!7957 List!24685)) )
))
(declare-fun call!47787 () ListLongMap!15883)

(declare-datatypes ((ValueCell!13473 0))(
  ( (ValueCellFull!13473 (v!16872 V!42947)) (EmptyCell!13473) )
))
(declare-datatypes ((array!73591 0))(
  ( (array!73592 (arr!35448 (Array (_ BitVec 32) ValueCell!13473)) (size!35984 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73591)

(declare-fun minValue!944 () V!42947)

(declare-fun bm!47784 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4444 (array!73589 array!73591 (_ BitVec 32) (_ BitVec 32) V!42947 V!42947 (_ BitVec 32) Int) ListLongMap!15883)

(assert (=> bm!47784 (= call!47787 (getCurrentListMapNoExtraKeys!4444 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!47788 () ListLongMap!15883)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!641994 () Bool)

(declare-fun b!1127979 () Bool)

(declare-fun -!1145 (ListLongMap!15883 (_ BitVec 64)) ListLongMap!15883)

(assert (=> b!1127979 (= e!641994 (= call!47788 (-!1145 call!47787 k0!934)))))

(declare-fun b!1127980 () Bool)

(declare-fun res!753803 () Bool)

(declare-fun e!641995 () Bool)

(assert (=> b!1127980 (=> (not res!753803) (not e!641995))))

(declare-datatypes ((List!24686 0))(
  ( (Nil!24683) (Cons!24682 (h!25891 (_ BitVec 64)) (t!35513 List!24686)) )
))
(declare-fun arrayNoDuplicates!0 (array!73589 (_ BitVec 32) List!24686) Bool)

(assert (=> b!1127980 (= res!753803 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24683))))

(declare-fun b!1127981 () Bool)

(declare-fun res!753801 () Bool)

(declare-fun e!641989 () Bool)

(assert (=> b!1127981 (=> (not res!753801) (not e!641989))))

(declare-fun lt!500792 () array!73589)

(assert (=> b!1127981 (= res!753801 (arrayNoDuplicates!0 lt!500792 #b00000000000000000000000000000000 Nil!24683))))

(declare-fun b!1127982 () Bool)

(declare-fun res!753795 () Bool)

(assert (=> b!1127982 (=> (not res!753795) (not e!641995))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127982 (= res!753795 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35983 _keys!1208))))))

(declare-fun b!1127983 () Bool)

(declare-fun e!641988 () Bool)

(declare-fun e!641996 () Bool)

(assert (=> b!1127983 (= e!641988 e!641996)))

(declare-fun res!753804 () Bool)

(assert (=> b!1127983 (=> res!753804 e!641996)))

(assert (=> b!1127983 (= res!753804 (not (= from!1455 i!673)))))

(declare-fun lt!500789 () array!73591)

(declare-fun lt!500794 () ListLongMap!15883)

(assert (=> b!1127983 (= lt!500794 (getCurrentListMapNoExtraKeys!4444 lt!500792 lt!500789 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2529 (Int (_ BitVec 64)) V!42947)

(assert (=> b!1127983 (= lt!500789 (array!73592 (store (arr!35448 _values!996) i!673 (ValueCellFull!13473 (dynLambda!2529 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35984 _values!996)))))

(declare-fun lt!500790 () ListLongMap!15883)

(assert (=> b!1127983 (= lt!500790 (getCurrentListMapNoExtraKeys!4444 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127984 () Bool)

(declare-fun res!753796 () Bool)

(assert (=> b!1127984 (=> (not res!753796) (not e!641995))))

(assert (=> b!1127984 (= res!753796 (= (select (arr!35447 _keys!1208) i!673) k0!934))))

(declare-fun bm!47785 () Bool)

(assert (=> bm!47785 (= call!47788 (getCurrentListMapNoExtraKeys!4444 lt!500792 lt!500789 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44365 () Bool)

(declare-fun mapRes!44365 () Bool)

(assert (=> mapIsEmpty!44365 mapRes!44365))

(declare-fun b!1127986 () Bool)

(assert (=> b!1127986 (= e!641995 e!641989)))

(declare-fun res!753793 () Bool)

(assert (=> b!1127986 (=> (not res!753793) (not e!641989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73589 (_ BitVec 32)) Bool)

(assert (=> b!1127986 (= res!753793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500792 mask!1564))))

(assert (=> b!1127986 (= lt!500792 (array!73590 (store (arr!35447 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35983 _keys!1208)))))

(declare-fun b!1127987 () Bool)

(declare-fun e!641992 () Bool)

(assert (=> b!1127987 (= e!641996 e!641992)))

(declare-fun res!753805 () Bool)

(assert (=> b!1127987 (=> res!753805 e!641992)))

(assert (=> b!1127987 (= res!753805 (not (= (select (arr!35447 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127987 e!641994))

(declare-fun c!109743 () Bool)

(assert (=> b!1127987 (= c!109743 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36956 0))(
  ( (Unit!36957) )
))
(declare-fun lt!500795 () Unit!36956)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!397 (array!73589 array!73591 (_ BitVec 32) (_ BitVec 32) V!42947 V!42947 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36956)

(assert (=> b!1127987 (= lt!500795 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!397 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127988 () Bool)

(declare-fun res!753794 () Bool)

(assert (=> b!1127988 (=> (not res!753794) (not e!641995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127988 (= res!753794 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44365 () Bool)

(declare-fun tp!84209 () Bool)

(declare-fun e!641990 () Bool)

(assert (=> mapNonEmpty!44365 (= mapRes!44365 (and tp!84209 e!641990))))

(declare-fun mapRest!44365 () (Array (_ BitVec 32) ValueCell!13473))

(declare-fun mapValue!44365 () ValueCell!13473)

(declare-fun mapKey!44365 () (_ BitVec 32))

(assert (=> mapNonEmpty!44365 (= (arr!35448 _values!996) (store mapRest!44365 mapKey!44365 mapValue!44365))))

(declare-fun b!1127989 () Bool)

(declare-fun e!641993 () Bool)

(declare-fun tp_is_empty!28365 () Bool)

(assert (=> b!1127989 (= e!641993 tp_is_empty!28365)))

(declare-fun b!1127990 () Bool)

(declare-fun e!641991 () Bool)

(assert (=> b!1127990 (= e!641991 (and e!641993 mapRes!44365))))

(declare-fun condMapEmpty!44365 () Bool)

(declare-fun mapDefault!44365 () ValueCell!13473)

(assert (=> b!1127990 (= condMapEmpty!44365 (= (arr!35448 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13473)) mapDefault!44365)))))

(declare-fun b!1127991 () Bool)

(declare-fun res!753802 () Bool)

(assert (=> b!1127991 (=> (not res!753802) (not e!641995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127991 (= res!753802 (validMask!0 mask!1564))))

(declare-fun b!1127992 () Bool)

(declare-fun res!753798 () Bool)

(assert (=> b!1127992 (=> (not res!753798) (not e!641995))))

(assert (=> b!1127992 (= res!753798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127993 () Bool)

(declare-fun res!753797 () Bool)

(assert (=> b!1127993 (=> (not res!753797) (not e!641995))))

(assert (=> b!1127993 (= res!753797 (and (= (size!35984 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35983 _keys!1208) (size!35984 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127994 () Bool)

(assert (=> b!1127994 (= e!641989 (not e!641988))))

(declare-fun res!753800 () Bool)

(assert (=> b!1127994 (=> res!753800 e!641988)))

(assert (=> b!1127994 (= res!753800 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127994 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500791 () Unit!36956)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73589 (_ BitVec 64) (_ BitVec 32)) Unit!36956)

(assert (=> b!1127994 (= lt!500791 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1127985 () Bool)

(assert (=> b!1127985 (= e!641990 tp_is_empty!28365)))

(declare-fun res!753799 () Bool)

(assert (=> start!98134 (=> (not res!753799) (not e!641995))))

(assert (=> start!98134 (= res!753799 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35983 _keys!1208))))))

(assert (=> start!98134 e!641995))

(assert (=> start!98134 tp_is_empty!28365))

(declare-fun array_inv!27200 (array!73589) Bool)

(assert (=> start!98134 (array_inv!27200 _keys!1208)))

(assert (=> start!98134 true))

(assert (=> start!98134 tp!84208))

(declare-fun array_inv!27201 (array!73591) Bool)

(assert (=> start!98134 (and (array_inv!27201 _values!996) e!641991)))

(declare-fun b!1127995 () Bool)

(assert (=> b!1127995 (= e!641992 true)))

(declare-fun lt!500793 () Bool)

(declare-fun contains!6485 (ListLongMap!15883 (_ BitVec 64)) Bool)

(assert (=> b!1127995 (= lt!500793 (contains!6485 (getCurrentListMapNoExtraKeys!4444 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127996 () Bool)

(assert (=> b!1127996 (= e!641994 (= call!47788 call!47787))))

(assert (= (and start!98134 res!753799) b!1127991))

(assert (= (and b!1127991 res!753802) b!1127993))

(assert (= (and b!1127993 res!753797) b!1127992))

(assert (= (and b!1127992 res!753798) b!1127980))

(assert (= (and b!1127980 res!753803) b!1127982))

(assert (= (and b!1127982 res!753795) b!1127988))

(assert (= (and b!1127988 res!753794) b!1127984))

(assert (= (and b!1127984 res!753796) b!1127986))

(assert (= (and b!1127986 res!753793) b!1127981))

(assert (= (and b!1127981 res!753801) b!1127994))

(assert (= (and b!1127994 (not res!753800)) b!1127983))

(assert (= (and b!1127983 (not res!753804)) b!1127987))

(assert (= (and b!1127987 c!109743) b!1127979))

(assert (= (and b!1127987 (not c!109743)) b!1127996))

(assert (= (or b!1127979 b!1127996) bm!47785))

(assert (= (or b!1127979 b!1127996) bm!47784))

(assert (= (and b!1127987 (not res!753805)) b!1127995))

(assert (= (and b!1127990 condMapEmpty!44365) mapIsEmpty!44365))

(assert (= (and b!1127990 (not condMapEmpty!44365)) mapNonEmpty!44365))

(get-info :version)

(assert (= (and mapNonEmpty!44365 ((_ is ValueCellFull!13473) mapValue!44365)) b!1127985))

(assert (= (and b!1127990 ((_ is ValueCellFull!13473) mapDefault!44365)) b!1127989))

(assert (= start!98134 b!1127990))

(declare-fun b_lambda!18805 () Bool)

(assert (=> (not b_lambda!18805) (not b!1127983)))

(declare-fun t!35511 () Bool)

(declare-fun tb!8647 () Bool)

(assert (=> (and start!98134 (= defaultEntry!1004 defaultEntry!1004) t!35511) tb!8647))

(declare-fun result!17855 () Bool)

(assert (=> tb!8647 (= result!17855 tp_is_empty!28365)))

(assert (=> b!1127983 t!35511))

(declare-fun b_and!38455 () Bool)

(assert (= b_and!38453 (and (=> t!35511 result!17855) b_and!38455)))

(declare-fun m!1041661 () Bool)

(assert (=> b!1127979 m!1041661))

(declare-fun m!1041663 () Bool)

(assert (=> bm!47784 m!1041663))

(declare-fun m!1041665 () Bool)

(assert (=> b!1127980 m!1041665))

(declare-fun m!1041667 () Bool)

(assert (=> b!1127987 m!1041667))

(declare-fun m!1041669 () Bool)

(assert (=> b!1127987 m!1041669))

(declare-fun m!1041671 () Bool)

(assert (=> b!1127986 m!1041671))

(declare-fun m!1041673 () Bool)

(assert (=> b!1127986 m!1041673))

(declare-fun m!1041675 () Bool)

(assert (=> b!1127983 m!1041675))

(declare-fun m!1041677 () Bool)

(assert (=> b!1127983 m!1041677))

(declare-fun m!1041679 () Bool)

(assert (=> b!1127983 m!1041679))

(declare-fun m!1041681 () Bool)

(assert (=> b!1127983 m!1041681))

(declare-fun m!1041683 () Bool)

(assert (=> b!1127992 m!1041683))

(declare-fun m!1041685 () Bool)

(assert (=> bm!47785 m!1041685))

(declare-fun m!1041687 () Bool)

(assert (=> b!1127981 m!1041687))

(declare-fun m!1041689 () Bool)

(assert (=> b!1127984 m!1041689))

(declare-fun m!1041691 () Bool)

(assert (=> b!1127991 m!1041691))

(declare-fun m!1041693 () Bool)

(assert (=> b!1127988 m!1041693))

(declare-fun m!1041695 () Bool)

(assert (=> start!98134 m!1041695))

(declare-fun m!1041697 () Bool)

(assert (=> start!98134 m!1041697))

(declare-fun m!1041699 () Bool)

(assert (=> mapNonEmpty!44365 m!1041699))

(declare-fun m!1041701 () Bool)

(assert (=> b!1127994 m!1041701))

(declare-fun m!1041703 () Bool)

(assert (=> b!1127994 m!1041703))

(assert (=> b!1127995 m!1041663))

(assert (=> b!1127995 m!1041663))

(declare-fun m!1041705 () Bool)

(assert (=> b!1127995 m!1041705))

(check-sat (not start!98134) (not b!1127994) (not b!1127980) (not b_lambda!18805) (not b!1127995) (not b!1127992) b_and!38455 (not b!1127991) (not b!1127987) (not b!1127981) (not b!1127986) (not mapNonEmpty!44365) (not bm!47785) (not b!1127979) (not b_next!23835) (not b!1127988) (not b!1127983) (not bm!47784) tp_is_empty!28365)
(check-sat b_and!38455 (not b_next!23835))
