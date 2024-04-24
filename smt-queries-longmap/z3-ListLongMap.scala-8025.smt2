; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99226 () Bool)

(assert start!99226)

(declare-fun b_free!24595 () Bool)

(declare-fun b_next!24595 () Bool)

(assert (=> start!99226 (= b_free!24595 (not b_next!24595))))

(declare-fun tp!86496 () Bool)

(declare-fun b_and!40041 () Bool)

(assert (=> start!99226 (= tp!86496 b_and!40041)))

(declare-datatypes ((V!43961 0))(
  ( (V!43962 (val!14619 Int)) )
))
(declare-datatypes ((tuple2!18662 0))(
  ( (tuple2!18663 (_1!9342 (_ BitVec 64)) (_2!9342 V!43961)) )
))
(declare-datatypes ((List!25397 0))(
  ( (Nil!25394) (Cons!25393 (h!26611 tuple2!18662) (t!36976 List!25397)) )
))
(declare-datatypes ((ListLongMap!16639 0))(
  ( (ListLongMap!16640 (toList!8335 List!25397)) )
))
(declare-fun lt!523863 () ListLongMap!16639)

(declare-fun c!116614 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!116613 () Bool)

(declare-fun lt!523859 () ListLongMap!16639)

(declare-fun bm!56744 () Bool)

(declare-fun minValue!944 () V!43961)

(declare-datatypes ((Unit!38333 0))(
  ( (Unit!38334) )
))
(declare-fun call!56754 () Unit!38333)

(declare-fun zeroValue!944 () V!43961)

(declare-fun addStillContains!969 (ListLongMap!16639 (_ BitVec 64) V!43961 (_ BitVec 64)) Unit!38333)

(assert (=> bm!56744 (= call!56754 (addStillContains!969 (ite c!116613 lt!523863 lt!523859) (ite c!116613 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116614 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116613 minValue!944 (ite c!116614 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1163671 () Bool)

(declare-fun e!661788 () Bool)

(declare-fun e!661803 () Bool)

(assert (=> b!1163671 (= e!661788 e!661803)))

(declare-fun res!771574 () Bool)

(assert (=> b!1163671 (=> res!771574 e!661803)))

(declare-datatypes ((array!75139 0))(
  ( (array!75140 (arr!36214 (Array (_ BitVec 32) (_ BitVec 64))) (size!36751 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75139)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1163671 (= res!771574 (not (= (select (arr!36214 _keys!1208) from!1455) k0!934)))))

(declare-fun e!661800 () Bool)

(assert (=> b!1163671 e!661800))

(declare-fun c!116615 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1163671 (= c!116615 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!523855 () Unit!38333)

(declare-datatypes ((ValueCell!13853 0))(
  ( (ValueCellFull!13853 (v!17252 V!43961)) (EmptyCell!13853) )
))
(declare-datatypes ((array!75141 0))(
  ( (array!75142 (arr!36215 (Array (_ BitVec 32) ValueCell!13853)) (size!36752 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75141)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!657 (array!75139 array!75141 (_ BitVec 32) (_ BitVec 32) V!43961 V!43961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38333)

(assert (=> b!1163671 (= lt!523855 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!657 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163672 () Bool)

(declare-fun e!661801 () Bool)

(declare-fun lt!523872 () array!75141)

(declare-fun lt!523853 () ListLongMap!16639)

(declare-fun lt!523866 () array!75139)

(declare-fun getCurrentListMapNoExtraKeys!4827 (array!75139 array!75141 (_ BitVec 32) (_ BitVec 32) V!43961 V!43961 (_ BitVec 32) Int) ListLongMap!16639)

(assert (=> b!1163672 (= e!661801 (= lt!523853 (getCurrentListMapNoExtraKeys!4827 lt!523866 lt!523872 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1163673 () Bool)

(declare-fun res!771571 () Bool)

(declare-fun e!661799 () Bool)

(assert (=> b!1163673 (=> (not res!771571) (not e!661799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163673 (= res!771571 (validMask!0 mask!1564))))

(declare-fun b!1163674 () Bool)

(declare-fun e!661797 () Bool)

(declare-fun tp_is_empty!29125 () Bool)

(assert (=> b!1163674 (= e!661797 tp_is_empty!29125)))

(declare-fun bm!56745 () Bool)

(declare-fun call!56749 () Bool)

(declare-fun call!56747 () Bool)

(assert (=> bm!56745 (= call!56749 call!56747)))

(declare-fun b!1163675 () Bool)

(declare-fun res!771567 () Bool)

(assert (=> b!1163675 (=> (not res!771567) (not e!661799))))

(declare-datatypes ((List!25398 0))(
  ( (Nil!25395) (Cons!25394 (h!26612 (_ BitVec 64)) (t!36977 List!25398)) )
))
(declare-fun arrayNoDuplicates!0 (array!75139 (_ BitVec 32) List!25398) Bool)

(assert (=> b!1163675 (= res!771567 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25395))))

(declare-fun mapNonEmpty!45512 () Bool)

(declare-fun mapRes!45512 () Bool)

(declare-fun tp!86495 () Bool)

(declare-fun e!661796 () Bool)

(assert (=> mapNonEmpty!45512 (= mapRes!45512 (and tp!86495 e!661796))))

(declare-fun mapValue!45512 () ValueCell!13853)

(declare-fun mapRest!45512 () (Array (_ BitVec 32) ValueCell!13853))

(declare-fun mapKey!45512 () (_ BitVec 32))

(assert (=> mapNonEmpty!45512 (= (arr!36215 _values!996) (store mapRest!45512 mapKey!45512 mapValue!45512))))

(declare-fun e!661804 () Bool)

(declare-fun b!1163676 () Bool)

(declare-fun arrayContainsKey!0 (array!75139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163676 (= e!661804 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163677 () Bool)

(assert (=> b!1163677 call!56749))

(declare-fun lt!523852 () Unit!38333)

(declare-fun call!56748 () Unit!38333)

(assert (=> b!1163677 (= lt!523852 call!56748)))

(declare-fun e!661790 () Unit!38333)

(assert (=> b!1163677 (= e!661790 lt!523852)))

(declare-fun call!56751 () ListLongMap!16639)

(declare-fun bm!56746 () Bool)

(declare-fun +!3751 (ListLongMap!16639 tuple2!18662) ListLongMap!16639)

(assert (=> bm!56746 (= call!56751 (+!3751 lt!523859 (ite (or c!116613 c!116614) (tuple2!18663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1163678 () Bool)

(declare-fun e!661795 () Unit!38333)

(assert (=> b!1163678 (= e!661795 e!661790)))

(declare-fun c!116616 () Bool)

(declare-fun lt!523861 () Bool)

(assert (=> b!1163678 (= c!116616 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523861))))

(declare-fun b!1163679 () Bool)

(declare-fun e!661789 () Bool)

(assert (=> b!1163679 (= e!661799 e!661789)))

(declare-fun res!771576 () Bool)

(assert (=> b!1163679 (=> (not res!771576) (not e!661789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75139 (_ BitVec 32)) Bool)

(assert (=> b!1163679 (= res!771576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523866 mask!1564))))

(assert (=> b!1163679 (= lt!523866 (array!75140 (store (arr!36214 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36751 _keys!1208)))))

(declare-fun b!1163680 () Bool)

(declare-fun call!56752 () ListLongMap!16639)

(declare-fun call!56753 () ListLongMap!16639)

(assert (=> b!1163680 (= e!661800 (= call!56752 call!56753))))

(declare-fun b!1163681 () Bool)

(declare-fun res!771572 () Bool)

(assert (=> b!1163681 (=> (not res!771572) (not e!661799))))

(assert (=> b!1163681 (= res!771572 (and (= (size!36752 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36751 _keys!1208) (size!36752 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1163682 () Bool)

(declare-fun e!661798 () Bool)

(assert (=> b!1163682 (= e!661789 (not e!661798))))

(declare-fun res!771568 () Bool)

(assert (=> b!1163682 (=> res!771568 e!661798)))

(assert (=> b!1163682 (= res!771568 (bvsgt from!1455 i!673))))

(assert (=> b!1163682 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523862 () Unit!38333)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75139 (_ BitVec 64) (_ BitVec 32)) Unit!38333)

(assert (=> b!1163682 (= lt!523862 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1163683 () Bool)

(assert (=> b!1163683 (= e!661803 true)))

(assert (=> b!1163683 e!661801))

(declare-fun res!771570 () Bool)

(assert (=> b!1163683 (=> (not res!771570) (not e!661801))))

(assert (=> b!1163683 (= res!771570 (= lt!523853 lt!523859))))

(declare-fun lt!523858 () ListLongMap!16639)

(declare-fun -!1430 (ListLongMap!16639 (_ BitVec 64)) ListLongMap!16639)

(assert (=> b!1163683 (= lt!523853 (-!1430 lt!523858 k0!934))))

(declare-fun lt!523871 () V!43961)

(assert (=> b!1163683 (= (-!1430 (+!3751 lt!523859 (tuple2!18663 (select (arr!36214 _keys!1208) from!1455) lt!523871)) (select (arr!36214 _keys!1208) from!1455)) lt!523859)))

(declare-fun lt!523870 () Unit!38333)

(declare-fun addThenRemoveForNewKeyIsSame!258 (ListLongMap!16639 (_ BitVec 64) V!43961) Unit!38333)

(assert (=> b!1163683 (= lt!523870 (addThenRemoveForNewKeyIsSame!258 lt!523859 (select (arr!36214 _keys!1208) from!1455) lt!523871))))

(declare-fun lt!523867 () V!43961)

(declare-fun get!18501 (ValueCell!13853 V!43961) V!43961)

(assert (=> b!1163683 (= lt!523871 (get!18501 (select (arr!36215 _values!996) from!1455) lt!523867))))

(declare-fun lt!523854 () Unit!38333)

(declare-fun e!661802 () Unit!38333)

(assert (=> b!1163683 (= lt!523854 e!661802)))

(declare-fun c!116612 () Bool)

(declare-fun contains!6852 (ListLongMap!16639 (_ BitVec 64)) Bool)

(assert (=> b!1163683 (= c!116612 (contains!6852 lt!523859 k0!934))))

(assert (=> b!1163683 (= lt!523859 (getCurrentListMapNoExtraKeys!4827 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163684 () Bool)

(assert (=> b!1163684 (= c!116614 (and (not lt!523861) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!661792 () Unit!38333)

(assert (=> b!1163684 (= e!661792 e!661795)))

(declare-fun b!1163685 () Bool)

(declare-fun Unit!38335 () Unit!38333)

(assert (=> b!1163685 (= e!661802 Unit!38335)))

(assert (=> b!1163685 (= lt!523861 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1163685 (= c!116613 (and (not lt!523861) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523868 () Unit!38333)

(assert (=> b!1163685 (= lt!523868 e!661792)))

(declare-fun lt!523864 () Unit!38333)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!553 (array!75139 array!75141 (_ BitVec 32) (_ BitVec 32) V!43961 V!43961 (_ BitVec 64) (_ BitVec 32) Int) Unit!38333)

(assert (=> b!1163685 (= lt!523864 (lemmaListMapContainsThenArrayContainsFrom!553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116611 () Bool)

(assert (=> b!1163685 (= c!116611 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771573 () Bool)

(declare-fun e!661793 () Bool)

(assert (=> b!1163685 (= res!771573 e!661793)))

(assert (=> b!1163685 (=> (not res!771573) (not e!661804))))

(assert (=> b!1163685 e!661804))

(declare-fun lt!523865 () Unit!38333)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75139 (_ BitVec 32) (_ BitVec 32)) Unit!38333)

(assert (=> b!1163685 (= lt!523865 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1163685 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25395)))

(declare-fun lt!523856 () Unit!38333)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75139 (_ BitVec 64) (_ BitVec 32) List!25398) Unit!38333)

(assert (=> b!1163685 (= lt!523856 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25395))))

(assert (=> b!1163685 false))

(declare-fun b!1163686 () Bool)

(declare-fun e!661791 () Bool)

(assert (=> b!1163686 (= e!661791 (and e!661797 mapRes!45512))))

(declare-fun condMapEmpty!45512 () Bool)

(declare-fun mapDefault!45512 () ValueCell!13853)

(assert (=> b!1163686 (= condMapEmpty!45512 (= (arr!36215 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13853)) mapDefault!45512)))))

(declare-fun b!1163687 () Bool)

(declare-fun res!771569 () Bool)

(assert (=> b!1163687 (=> (not res!771569) (not e!661799))))

(assert (=> b!1163687 (= res!771569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!56747 () Bool)

(assert (=> bm!56747 (= call!56753 (getCurrentListMapNoExtraKeys!4827 (ite c!116615 lt!523866 _keys!1208) (ite c!116615 lt!523872 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163688 () Bool)

(declare-fun Unit!38336 () Unit!38333)

(assert (=> b!1163688 (= e!661802 Unit!38336)))

(declare-fun b!1163689 () Bool)

(assert (=> b!1163689 (= e!661798 e!661788)))

(declare-fun res!771563 () Bool)

(assert (=> b!1163689 (=> res!771563 e!661788)))

(assert (=> b!1163689 (= res!771563 (not (= from!1455 i!673)))))

(declare-fun lt!523869 () ListLongMap!16639)

(assert (=> b!1163689 (= lt!523869 (getCurrentListMapNoExtraKeys!4827 lt!523866 lt!523872 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1163689 (= lt!523872 (array!75142 (store (arr!36215 _values!996) i!673 (ValueCellFull!13853 lt!523867)) (size!36752 _values!996)))))

(declare-fun dynLambda!2818 (Int (_ BitVec 64)) V!43961)

(assert (=> b!1163689 (= lt!523867 (dynLambda!2818 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1163689 (= lt!523858 (getCurrentListMapNoExtraKeys!4827 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1163690 () Bool)

(declare-fun Unit!38337 () Unit!38333)

(assert (=> b!1163690 (= e!661790 Unit!38337)))

(declare-fun b!1163691 () Bool)

(declare-fun res!771575 () Bool)

(assert (=> b!1163691 (=> (not res!771575) (not e!661789))))

(assert (=> b!1163691 (= res!771575 (arrayNoDuplicates!0 lt!523866 #b00000000000000000000000000000000 Nil!25395))))

(declare-fun bm!56748 () Bool)

(declare-fun call!56750 () ListLongMap!16639)

(assert (=> bm!56748 (= call!56747 (contains!6852 (ite c!116613 lt!523863 call!56750) k0!934))))

(declare-fun b!1163692 () Bool)

(declare-fun res!771562 () Bool)

(assert (=> b!1163692 (=> (not res!771562) (not e!661799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163692 (= res!771562 (validKeyInArray!0 k0!934))))

(declare-fun res!771565 () Bool)

(assert (=> start!99226 (=> (not res!771565) (not e!661799))))

(assert (=> start!99226 (= res!771565 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36751 _keys!1208))))))

(assert (=> start!99226 e!661799))

(assert (=> start!99226 tp_is_empty!29125))

(declare-fun array_inv!27774 (array!75139) Bool)

(assert (=> start!99226 (array_inv!27774 _keys!1208)))

(assert (=> start!99226 true))

(assert (=> start!99226 tp!86496))

(declare-fun array_inv!27775 (array!75141) Bool)

(assert (=> start!99226 (and (array_inv!27775 _values!996) e!661791)))

(declare-fun b!1163693 () Bool)

(assert (=> b!1163693 (= e!661793 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523861) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1163694 () Bool)

(declare-fun res!771566 () Bool)

(assert (=> b!1163694 (=> (not res!771566) (not e!661799))))

(assert (=> b!1163694 (= res!771566 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36751 _keys!1208))))))

(declare-fun bm!56749 () Bool)

(assert (=> bm!56749 (= call!56752 (getCurrentListMapNoExtraKeys!4827 (ite c!116615 _keys!1208 lt!523866) (ite c!116615 _values!996 lt!523872) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45512 () Bool)

(assert (=> mapIsEmpty!45512 mapRes!45512))

(declare-fun b!1163695 () Bool)

(declare-fun res!771564 () Bool)

(assert (=> b!1163695 (=> (not res!771564) (not e!661799))))

(assert (=> b!1163695 (= res!771564 (= (select (arr!36214 _keys!1208) i!673) k0!934))))

(declare-fun b!1163696 () Bool)

(assert (=> b!1163696 (= e!661800 (= call!56753 (-!1430 call!56752 k0!934)))))

(declare-fun b!1163697 () Bool)

(declare-fun lt!523860 () Unit!38333)

(assert (=> b!1163697 (= e!661795 lt!523860)))

(assert (=> b!1163697 (= lt!523860 call!56748)))

(assert (=> b!1163697 call!56749))

(declare-fun bm!56750 () Bool)

(assert (=> bm!56750 (= call!56750 call!56751)))

(declare-fun b!1163698 () Bool)

(assert (=> b!1163698 (= e!661796 tp_is_empty!29125)))

(declare-fun b!1163699 () Bool)

(assert (=> b!1163699 (= e!661793 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56751 () Bool)

(assert (=> bm!56751 (= call!56748 call!56754)))

(declare-fun b!1163700 () Bool)

(assert (=> b!1163700 (contains!6852 (+!3751 lt!523863 (tuple2!18663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!523857 () Unit!38333)

(assert (=> b!1163700 (= lt!523857 call!56754)))

(assert (=> b!1163700 call!56747))

(assert (=> b!1163700 (= lt!523863 call!56751)))

(declare-fun lt!523873 () Unit!38333)

(assert (=> b!1163700 (= lt!523873 (addStillContains!969 lt!523859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1163700 (= e!661792 lt!523857)))

(assert (= (and start!99226 res!771565) b!1163673))

(assert (= (and b!1163673 res!771571) b!1163681))

(assert (= (and b!1163681 res!771572) b!1163687))

(assert (= (and b!1163687 res!771569) b!1163675))

(assert (= (and b!1163675 res!771567) b!1163694))

(assert (= (and b!1163694 res!771566) b!1163692))

(assert (= (and b!1163692 res!771562) b!1163695))

(assert (= (and b!1163695 res!771564) b!1163679))

(assert (= (and b!1163679 res!771576) b!1163691))

(assert (= (and b!1163691 res!771575) b!1163682))

(assert (= (and b!1163682 (not res!771568)) b!1163689))

(assert (= (and b!1163689 (not res!771563)) b!1163671))

(assert (= (and b!1163671 c!116615) b!1163696))

(assert (= (and b!1163671 (not c!116615)) b!1163680))

(assert (= (or b!1163696 b!1163680) bm!56749))

(assert (= (or b!1163696 b!1163680) bm!56747))

(assert (= (and b!1163671 (not res!771574)) b!1163683))

(assert (= (and b!1163683 c!116612) b!1163685))

(assert (= (and b!1163683 (not c!116612)) b!1163688))

(assert (= (and b!1163685 c!116613) b!1163700))

(assert (= (and b!1163685 (not c!116613)) b!1163684))

(assert (= (and b!1163684 c!116614) b!1163697))

(assert (= (and b!1163684 (not c!116614)) b!1163678))

(assert (= (and b!1163678 c!116616) b!1163677))

(assert (= (and b!1163678 (not c!116616)) b!1163690))

(assert (= (or b!1163697 b!1163677) bm!56751))

(assert (= (or b!1163697 b!1163677) bm!56750))

(assert (= (or b!1163697 b!1163677) bm!56745))

(assert (= (or b!1163700 bm!56745) bm!56748))

(assert (= (or b!1163700 bm!56751) bm!56744))

(assert (= (or b!1163700 bm!56750) bm!56746))

(assert (= (and b!1163685 c!116611) b!1163699))

(assert (= (and b!1163685 (not c!116611)) b!1163693))

(assert (= (and b!1163685 res!771573) b!1163676))

(assert (= (and b!1163683 res!771570) b!1163672))

(assert (= (and b!1163686 condMapEmpty!45512) mapIsEmpty!45512))

(assert (= (and b!1163686 (not condMapEmpty!45512)) mapNonEmpty!45512))

(get-info :version)

(assert (= (and mapNonEmpty!45512 ((_ is ValueCellFull!13853) mapValue!45512)) b!1163698))

(assert (= (and b!1163686 ((_ is ValueCellFull!13853) mapDefault!45512)) b!1163674))

(assert (= start!99226 b!1163686))

(declare-fun b_lambda!19695 () Bool)

(assert (=> (not b_lambda!19695) (not b!1163689)))

(declare-fun t!36975 () Bool)

(declare-fun tb!9399 () Bool)

(assert (=> (and start!99226 (= defaultEntry!1004 defaultEntry!1004) t!36975) tb!9399))

(declare-fun result!19371 () Bool)

(assert (=> tb!9399 (= result!19371 tp_is_empty!29125)))

(assert (=> b!1163689 t!36975))

(declare-fun b_and!40043 () Bool)

(assert (= b_and!40041 (and (=> t!36975 result!19371) b_and!40043)))

(declare-fun m!1072657 () Bool)

(assert (=> b!1163689 m!1072657))

(declare-fun m!1072659 () Bool)

(assert (=> b!1163689 m!1072659))

(declare-fun m!1072661 () Bool)

(assert (=> b!1163689 m!1072661))

(declare-fun m!1072663 () Bool)

(assert (=> b!1163689 m!1072663))

(declare-fun m!1072665 () Bool)

(assert (=> b!1163699 m!1072665))

(declare-fun m!1072667 () Bool)

(assert (=> b!1163700 m!1072667))

(assert (=> b!1163700 m!1072667))

(declare-fun m!1072669 () Bool)

(assert (=> b!1163700 m!1072669))

(declare-fun m!1072671 () Bool)

(assert (=> b!1163700 m!1072671))

(declare-fun m!1072673 () Bool)

(assert (=> b!1163682 m!1072673))

(declare-fun m!1072675 () Bool)

(assert (=> b!1163682 m!1072675))

(declare-fun m!1072677 () Bool)

(assert (=> bm!56747 m!1072677))

(declare-fun m!1072679 () Bool)

(assert (=> b!1163683 m!1072679))

(declare-fun m!1072681 () Bool)

(assert (=> b!1163683 m!1072681))

(declare-fun m!1072683 () Bool)

(assert (=> b!1163683 m!1072683))

(assert (=> b!1163683 m!1072679))

(declare-fun m!1072685 () Bool)

(assert (=> b!1163683 m!1072685))

(declare-fun m!1072687 () Bool)

(assert (=> b!1163683 m!1072687))

(assert (=> b!1163683 m!1072687))

(declare-fun m!1072689 () Bool)

(assert (=> b!1163683 m!1072689))

(declare-fun m!1072691 () Bool)

(assert (=> b!1163683 m!1072691))

(assert (=> b!1163683 m!1072689))

(declare-fun m!1072693 () Bool)

(assert (=> b!1163683 m!1072693))

(declare-fun m!1072695 () Bool)

(assert (=> b!1163683 m!1072695))

(assert (=> b!1163683 m!1072689))

(declare-fun m!1072697 () Bool)

(assert (=> b!1163673 m!1072697))

(declare-fun m!1072699 () Bool)

(assert (=> b!1163696 m!1072699))

(declare-fun m!1072701 () Bool)

(assert (=> b!1163685 m!1072701))

(declare-fun m!1072703 () Bool)

(assert (=> b!1163685 m!1072703))

(declare-fun m!1072705 () Bool)

(assert (=> b!1163685 m!1072705))

(declare-fun m!1072707 () Bool)

(assert (=> b!1163685 m!1072707))

(declare-fun m!1072709 () Bool)

(assert (=> bm!56746 m!1072709))

(declare-fun m!1072711 () Bool)

(assert (=> b!1163675 m!1072711))

(declare-fun m!1072713 () Bool)

(assert (=> b!1163679 m!1072713))

(declare-fun m!1072715 () Bool)

(assert (=> b!1163679 m!1072715))

(declare-fun m!1072717 () Bool)

(assert (=> b!1163672 m!1072717))

(declare-fun m!1072719 () Bool)

(assert (=> bm!56749 m!1072719))

(declare-fun m!1072721 () Bool)

(assert (=> b!1163691 m!1072721))

(assert (=> b!1163671 m!1072689))

(declare-fun m!1072723 () Bool)

(assert (=> b!1163671 m!1072723))

(declare-fun m!1072725 () Bool)

(assert (=> start!99226 m!1072725))

(declare-fun m!1072727 () Bool)

(assert (=> start!99226 m!1072727))

(declare-fun m!1072729 () Bool)

(assert (=> b!1163687 m!1072729))

(declare-fun m!1072731 () Bool)

(assert (=> bm!56744 m!1072731))

(assert (=> b!1163676 m!1072665))

(declare-fun m!1072733 () Bool)

(assert (=> b!1163695 m!1072733))

(declare-fun m!1072735 () Bool)

(assert (=> b!1163692 m!1072735))

(declare-fun m!1072737 () Bool)

(assert (=> mapNonEmpty!45512 m!1072737))

(declare-fun m!1072739 () Bool)

(assert (=> bm!56748 m!1072739))

(check-sat (not b!1163699) (not b!1163675) (not bm!56747) (not b!1163692) (not b!1163679) (not b!1163676) (not bm!56749) (not b_next!24595) (not b!1163673) (not bm!56746) (not b!1163696) (not b!1163672) (not b!1163685) (not b!1163682) (not b_lambda!19695) (not b!1163700) (not bm!56744) tp_is_empty!29125 (not start!99226) (not b!1163691) (not b!1163683) (not mapNonEmpty!45512) (not b!1163689) b_and!40043 (not bm!56748) (not b!1163671) (not b!1163687))
(check-sat b_and!40043 (not b_next!24595))
