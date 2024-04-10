; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99600 () Bool)

(assert start!99600)

(declare-fun b_free!25179 () Bool)

(declare-fun b_next!25179 () Bool)

(assert (=> start!99600 (= b_free!25179 (not b_next!25179))))

(declare-fun tp!88250 () Bool)

(declare-fun b_and!41225 () Bool)

(assert (=> start!99600 (= tp!88250 b_and!41225)))

(declare-fun b!1179665 () Bool)

(declare-fun e!670676 () Bool)

(declare-fun tp_is_empty!29709 () Bool)

(assert (=> b!1179665 (= e!670676 tp_is_empty!29709)))

(declare-datatypes ((array!76221 0))(
  ( (array!76222 (arr!36760 (Array (_ BitVec 32) (_ BitVec 64))) (size!37296 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76221)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun e!670675 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1179666 () Bool)

(declare-fun arrayContainsKey!0 (array!76221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179666 (= e!670675 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46391 () Bool)

(declare-fun mapRes!46391 () Bool)

(assert (=> mapIsEmpty!46391 mapRes!46391))

(declare-fun b!1179667 () Bool)

(declare-fun res!783761 () Bool)

(declare-fun e!670671 () Bool)

(assert (=> b!1179667 (=> (not res!783761) (not e!670671))))

(assert (=> b!1179667 (= res!783761 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37296 _keys!1208))))))

(declare-fun b!1179668 () Bool)

(declare-fun e!670674 () Bool)

(declare-fun e!670666 () Bool)

(assert (=> b!1179668 (= e!670674 e!670666)))

(declare-fun res!783767 () Bool)

(assert (=> b!1179668 (=> res!783767 e!670666)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1179668 (= res!783767 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44739 0))(
  ( (V!44740 (val!14911 Int)) )
))
(declare-fun zeroValue!944 () V!44739)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19088 0))(
  ( (tuple2!19089 (_1!9555 (_ BitVec 64)) (_2!9555 V!44739)) )
))
(declare-datatypes ((List!25826 0))(
  ( (Nil!25823) (Cons!25822 (h!27031 tuple2!19088) (t!37997 List!25826)) )
))
(declare-datatypes ((ListLongMap!17057 0))(
  ( (ListLongMap!17058 (toList!8544 List!25826)) )
))
(declare-fun lt!533204 () ListLongMap!17057)

(declare-fun lt!533197 () array!76221)

(declare-datatypes ((ValueCell!14145 0))(
  ( (ValueCellFull!14145 (v!17549 V!44739)) (EmptyCell!14145) )
))
(declare-datatypes ((array!76223 0))(
  ( (array!76224 (arr!36761 (Array (_ BitVec 32) ValueCell!14145)) (size!37297 (_ BitVec 32))) )
))
(declare-fun lt!533201 () array!76223)

(declare-fun minValue!944 () V!44739)

(declare-fun getCurrentListMapNoExtraKeys!4999 (array!76221 array!76223 (_ BitVec 32) (_ BitVec 32) V!44739 V!44739 (_ BitVec 32) Int) ListLongMap!17057)

(assert (=> b!1179668 (= lt!533204 (getCurrentListMapNoExtraKeys!4999 lt!533197 lt!533201 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76223)

(declare-fun lt!533200 () V!44739)

(assert (=> b!1179668 (= lt!533201 (array!76224 (store (arr!36761 _values!996) i!673 (ValueCellFull!14145 lt!533200)) (size!37297 _values!996)))))

(declare-fun dynLambda!2959 (Int (_ BitVec 64)) V!44739)

(assert (=> b!1179668 (= lt!533200 (dynLambda!2959 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!533196 () ListLongMap!17057)

(assert (=> b!1179668 (= lt!533196 (getCurrentListMapNoExtraKeys!4999 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179669 () Bool)

(declare-fun res!783771 () Bool)

(declare-fun e!670677 () Bool)

(assert (=> b!1179669 (=> (not res!783771) (not e!670677))))

(declare-datatypes ((List!25827 0))(
  ( (Nil!25824) (Cons!25823 (h!27032 (_ BitVec 64)) (t!37998 List!25827)) )
))
(declare-fun arrayNoDuplicates!0 (array!76221 (_ BitVec 32) List!25827) Bool)

(assert (=> b!1179669 (= res!783771 (arrayNoDuplicates!0 lt!533197 #b00000000000000000000000000000000 Nil!25824))))

(declare-fun b!1179670 () Bool)

(declare-fun e!670668 () Bool)

(assert (=> b!1179670 (= e!670666 e!670668)))

(declare-fun res!783773 () Bool)

(assert (=> b!1179670 (=> res!783773 e!670668)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179670 (= res!783773 (not (validKeyInArray!0 (select (arr!36760 _keys!1208) from!1455))))))

(declare-fun lt!533205 () ListLongMap!17057)

(declare-fun lt!533198 () ListLongMap!17057)

(assert (=> b!1179670 (= lt!533205 lt!533198)))

(declare-fun lt!533199 () ListLongMap!17057)

(declare-fun -!1587 (ListLongMap!17057 (_ BitVec 64)) ListLongMap!17057)

(assert (=> b!1179670 (= lt!533198 (-!1587 lt!533199 k0!934))))

(assert (=> b!1179670 (= lt!533205 (getCurrentListMapNoExtraKeys!4999 lt!533197 lt!533201 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179670 (= lt!533199 (getCurrentListMapNoExtraKeys!4999 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38982 0))(
  ( (Unit!38983) )
))
(declare-fun lt!533203 () Unit!38982)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!814 (array!76221 array!76223 (_ BitVec 32) (_ BitVec 32) V!44739 V!44739 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38982)

(assert (=> b!1179670 (= lt!533203 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!814 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179671 () Bool)

(declare-fun e!670667 () Bool)

(assert (=> b!1179671 (= e!670667 e!670675)))

(declare-fun res!783759 () Bool)

(assert (=> b!1179671 (=> res!783759 e!670675)))

(assert (=> b!1179671 (= res!783759 (not (= (select (arr!36760 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1179672 () Bool)

(declare-fun e!670672 () Unit!38982)

(declare-fun Unit!38984 () Unit!38982)

(assert (=> b!1179672 (= e!670672 Unit!38984)))

(declare-fun lt!533195 () Unit!38982)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76221 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38982)

(assert (=> b!1179672 (= lt!533195 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1179672 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533208 () Unit!38982)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76221 (_ BitVec 32) (_ BitVec 32)) Unit!38982)

(assert (=> b!1179672 (= lt!533208 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1179672 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25824)))

(declare-fun lt!533207 () Unit!38982)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76221 (_ BitVec 64) (_ BitVec 32) List!25827) Unit!38982)

(assert (=> b!1179672 (= lt!533207 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25824))))

(assert (=> b!1179672 false))

(declare-fun b!1179673 () Bool)

(assert (=> b!1179673 (= e!670671 e!670677)))

(declare-fun res!783774 () Bool)

(assert (=> b!1179673 (=> (not res!783774) (not e!670677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76221 (_ BitVec 32)) Bool)

(assert (=> b!1179673 (= res!783774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533197 mask!1564))))

(assert (=> b!1179673 (= lt!533197 (array!76222 (store (arr!36760 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37296 _keys!1208)))))

(declare-fun b!1179674 () Bool)

(declare-fun Unit!38985 () Unit!38982)

(assert (=> b!1179674 (= e!670672 Unit!38985)))

(declare-fun b!1179675 () Bool)

(declare-fun res!783768 () Bool)

(declare-fun e!670669 () Bool)

(assert (=> b!1179675 (=> (not res!783768) (not e!670669))))

(declare-fun lt!533202 () tuple2!19088)

(declare-fun +!3856 (ListLongMap!17057 tuple2!19088) ListLongMap!17057)

(assert (=> b!1179675 (= res!783768 (= lt!533196 (+!3856 lt!533199 lt!533202)))))

(declare-fun b!1179676 () Bool)

(assert (=> b!1179676 (= e!670668 true)))

(assert (=> b!1179676 e!670669))

(declare-fun res!783766 () Bool)

(assert (=> b!1179676 (=> (not res!783766) (not e!670669))))

(assert (=> b!1179676 (= res!783766 (not (= (select (arr!36760 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533194 () Unit!38982)

(assert (=> b!1179676 (= lt!533194 e!670672)))

(declare-fun c!116892 () Bool)

(assert (=> b!1179676 (= c!116892 (= (select (arr!36760 _keys!1208) from!1455) k0!934))))

(assert (=> b!1179676 e!670667))

(declare-fun res!783769 () Bool)

(assert (=> b!1179676 (=> (not res!783769) (not e!670667))))

(assert (=> b!1179676 (= res!783769 (= lt!533204 (+!3856 lt!533198 lt!533202)))))

(declare-fun get!18794 (ValueCell!14145 V!44739) V!44739)

(assert (=> b!1179676 (= lt!533202 (tuple2!19089 (select (arr!36760 _keys!1208) from!1455) (get!18794 (select (arr!36761 _values!996) from!1455) lt!533200)))))

(declare-fun b!1179677 () Bool)

(assert (=> b!1179677 (= e!670677 (not e!670674))))

(declare-fun res!783765 () Bool)

(assert (=> b!1179677 (=> res!783765 e!670674)))

(assert (=> b!1179677 (= res!783765 (bvsgt from!1455 i!673))))

(assert (=> b!1179677 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533206 () Unit!38982)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76221 (_ BitVec 64) (_ BitVec 32)) Unit!38982)

(assert (=> b!1179677 (= lt!533206 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179678 () Bool)

(assert (=> b!1179678 (= e!670669 (= lt!533198 lt!533205))))

(declare-fun b!1179679 () Bool)

(declare-fun res!783763 () Bool)

(assert (=> b!1179679 (=> (not res!783763) (not e!670671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179679 (= res!783763 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46391 () Bool)

(declare-fun tp!88251 () Bool)

(declare-fun e!670673 () Bool)

(assert (=> mapNonEmpty!46391 (= mapRes!46391 (and tp!88251 e!670673))))

(declare-fun mapKey!46391 () (_ BitVec 32))

(declare-fun mapValue!46391 () ValueCell!14145)

(declare-fun mapRest!46391 () (Array (_ BitVec 32) ValueCell!14145))

(assert (=> mapNonEmpty!46391 (= (arr!36761 _values!996) (store mapRest!46391 mapKey!46391 mapValue!46391))))

(declare-fun b!1179680 () Bool)

(declare-fun res!783762 () Bool)

(assert (=> b!1179680 (=> (not res!783762) (not e!670671))))

(assert (=> b!1179680 (= res!783762 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25824))))

(declare-fun res!783770 () Bool)

(assert (=> start!99600 (=> (not res!783770) (not e!670671))))

(assert (=> start!99600 (= res!783770 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37296 _keys!1208))))))

(assert (=> start!99600 e!670671))

(assert (=> start!99600 tp_is_empty!29709))

(declare-fun array_inv!28068 (array!76221) Bool)

(assert (=> start!99600 (array_inv!28068 _keys!1208)))

(assert (=> start!99600 true))

(assert (=> start!99600 tp!88250))

(declare-fun e!670670 () Bool)

(declare-fun array_inv!28069 (array!76223) Bool)

(assert (=> start!99600 (and (array_inv!28069 _values!996) e!670670)))

(declare-fun b!1179681 () Bool)

(declare-fun res!783764 () Bool)

(assert (=> b!1179681 (=> (not res!783764) (not e!670671))))

(assert (=> b!1179681 (= res!783764 (validKeyInArray!0 k0!934))))

(declare-fun b!1179682 () Bool)

(assert (=> b!1179682 (= e!670670 (and e!670676 mapRes!46391))))

(declare-fun condMapEmpty!46391 () Bool)

(declare-fun mapDefault!46391 () ValueCell!14145)

(assert (=> b!1179682 (= condMapEmpty!46391 (= (arr!36761 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14145)) mapDefault!46391)))))

(declare-fun b!1179683 () Bool)

(declare-fun res!783775 () Bool)

(assert (=> b!1179683 (=> (not res!783775) (not e!670671))))

(assert (=> b!1179683 (= res!783775 (= (select (arr!36760 _keys!1208) i!673) k0!934))))

(declare-fun b!1179684 () Bool)

(assert (=> b!1179684 (= e!670673 tp_is_empty!29709)))

(declare-fun b!1179685 () Bool)

(declare-fun res!783772 () Bool)

(assert (=> b!1179685 (=> (not res!783772) (not e!670671))))

(assert (=> b!1179685 (= res!783772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179686 () Bool)

(declare-fun res!783760 () Bool)

(assert (=> b!1179686 (=> (not res!783760) (not e!670671))))

(assert (=> b!1179686 (= res!783760 (and (= (size!37297 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37296 _keys!1208) (size!37297 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!99600 res!783770) b!1179679))

(assert (= (and b!1179679 res!783763) b!1179686))

(assert (= (and b!1179686 res!783760) b!1179685))

(assert (= (and b!1179685 res!783772) b!1179680))

(assert (= (and b!1179680 res!783762) b!1179667))

(assert (= (and b!1179667 res!783761) b!1179681))

(assert (= (and b!1179681 res!783764) b!1179683))

(assert (= (and b!1179683 res!783775) b!1179673))

(assert (= (and b!1179673 res!783774) b!1179669))

(assert (= (and b!1179669 res!783771) b!1179677))

(assert (= (and b!1179677 (not res!783765)) b!1179668))

(assert (= (and b!1179668 (not res!783767)) b!1179670))

(assert (= (and b!1179670 (not res!783773)) b!1179676))

(assert (= (and b!1179676 res!783769) b!1179671))

(assert (= (and b!1179671 (not res!783759)) b!1179666))

(assert (= (and b!1179676 c!116892) b!1179672))

(assert (= (and b!1179676 (not c!116892)) b!1179674))

(assert (= (and b!1179676 res!783766) b!1179675))

(assert (= (and b!1179675 res!783768) b!1179678))

(assert (= (and b!1179682 condMapEmpty!46391) mapIsEmpty!46391))

(assert (= (and b!1179682 (not condMapEmpty!46391)) mapNonEmpty!46391))

(get-info :version)

(assert (= (and mapNonEmpty!46391 ((_ is ValueCellFull!14145) mapValue!46391)) b!1179684))

(assert (= (and b!1179682 ((_ is ValueCellFull!14145) mapDefault!46391)) b!1179665))

(assert (= start!99600 b!1179682))

(declare-fun b_lambda!20323 () Bool)

(assert (=> (not b_lambda!20323) (not b!1179668)))

(declare-fun t!37996 () Bool)

(declare-fun tb!9991 () Bool)

(assert (=> (and start!99600 (= defaultEntry!1004 defaultEntry!1004) t!37996) tb!9991))

(declare-fun result!20549 () Bool)

(assert (=> tb!9991 (= result!20549 tp_is_empty!29709)))

(assert (=> b!1179668 t!37996))

(declare-fun b_and!41227 () Bool)

(assert (= b_and!41225 (and (=> t!37996 result!20549) b_and!41227)))

(declare-fun m!1087641 () Bool)

(assert (=> b!1179675 m!1087641))

(declare-fun m!1087643 () Bool)

(assert (=> b!1179679 m!1087643))

(declare-fun m!1087645 () Bool)

(assert (=> b!1179670 m!1087645))

(declare-fun m!1087647 () Bool)

(assert (=> b!1179670 m!1087647))

(declare-fun m!1087649 () Bool)

(assert (=> b!1179670 m!1087649))

(declare-fun m!1087651 () Bool)

(assert (=> b!1179670 m!1087651))

(declare-fun m!1087653 () Bool)

(assert (=> b!1179670 m!1087653))

(declare-fun m!1087655 () Bool)

(assert (=> b!1179670 m!1087655))

(assert (=> b!1179670 m!1087653))

(declare-fun m!1087657 () Bool)

(assert (=> b!1179669 m!1087657))

(declare-fun m!1087659 () Bool)

(assert (=> mapNonEmpty!46391 m!1087659))

(declare-fun m!1087661 () Bool)

(assert (=> b!1179680 m!1087661))

(declare-fun m!1087663 () Bool)

(assert (=> b!1179672 m!1087663))

(declare-fun m!1087665 () Bool)

(assert (=> b!1179672 m!1087665))

(declare-fun m!1087667 () Bool)

(assert (=> b!1179672 m!1087667))

(declare-fun m!1087669 () Bool)

(assert (=> b!1179672 m!1087669))

(declare-fun m!1087671 () Bool)

(assert (=> b!1179672 m!1087671))

(declare-fun m!1087673 () Bool)

(assert (=> b!1179673 m!1087673))

(declare-fun m!1087675 () Bool)

(assert (=> b!1179673 m!1087675))

(assert (=> b!1179676 m!1087653))

(declare-fun m!1087677 () Bool)

(assert (=> b!1179676 m!1087677))

(declare-fun m!1087679 () Bool)

(assert (=> b!1179676 m!1087679))

(assert (=> b!1179676 m!1087679))

(declare-fun m!1087681 () Bool)

(assert (=> b!1179676 m!1087681))

(assert (=> b!1179671 m!1087653))

(declare-fun m!1087683 () Bool)

(assert (=> b!1179683 m!1087683))

(declare-fun m!1087685 () Bool)

(assert (=> b!1179666 m!1087685))

(declare-fun m!1087687 () Bool)

(assert (=> b!1179668 m!1087687))

(declare-fun m!1087689 () Bool)

(assert (=> b!1179668 m!1087689))

(declare-fun m!1087691 () Bool)

(assert (=> b!1179668 m!1087691))

(declare-fun m!1087693 () Bool)

(assert (=> b!1179668 m!1087693))

(declare-fun m!1087695 () Bool)

(assert (=> b!1179677 m!1087695))

(declare-fun m!1087697 () Bool)

(assert (=> b!1179677 m!1087697))

(declare-fun m!1087699 () Bool)

(assert (=> b!1179681 m!1087699))

(declare-fun m!1087701 () Bool)

(assert (=> start!99600 m!1087701))

(declare-fun m!1087703 () Bool)

(assert (=> start!99600 m!1087703))

(declare-fun m!1087705 () Bool)

(assert (=> b!1179685 m!1087705))

(check-sat (not b_lambda!20323) (not b!1179666) (not b!1179681) (not b!1179677) (not b!1179670) tp_is_empty!29709 (not start!99600) b_and!41227 (not b!1179679) (not b!1179669) (not b_next!25179) (not b!1179685) (not mapNonEmpty!46391) (not b!1179680) (not b!1179673) (not b!1179672) (not b!1179675) (not b!1179676) (not b!1179668))
(check-sat b_and!41227 (not b_next!25179))
