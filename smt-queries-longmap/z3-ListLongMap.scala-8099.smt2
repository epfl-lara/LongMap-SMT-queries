; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99696 () Bool)

(assert start!99696)

(declare-fun b_free!25039 () Bool)

(declare-fun b_next!25039 () Bool)

(assert (=> start!99696 (= b_free!25039 (not b_next!25039))))

(declare-fun tp!87830 () Bool)

(declare-fun b_and!40947 () Bool)

(assert (=> start!99696 (= tp!87830 b_and!40947)))

(declare-fun b!1176442 () Bool)

(declare-fun e!668812 () Bool)

(declare-fun e!668813 () Bool)

(assert (=> b!1176442 (= e!668812 e!668813)))

(declare-fun res!780959 () Bool)

(assert (=> b!1176442 (=> res!780959 e!668813)))

(declare-datatypes ((array!76001 0))(
  ( (array!76002 (arr!36644 (Array (_ BitVec 32) (_ BitVec 64))) (size!37181 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76001)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1176442 (= res!780959 (not (= (select (arr!36644 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176443 () Bool)

(declare-fun e!668822 () Bool)

(declare-fun e!668816 () Bool)

(assert (=> b!1176443 (= e!668822 e!668816)))

(declare-fun res!780958 () Bool)

(assert (=> b!1176443 (=> res!780958 e!668816)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1176443 (= res!780958 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!44553 0))(
  ( (V!44554 (val!14841 Int)) )
))
(declare-datatypes ((ValueCell!14075 0))(
  ( (ValueCellFull!14075 (v!17475 V!44553)) (EmptyCell!14075) )
))
(declare-datatypes ((array!76003 0))(
  ( (array!76004 (arr!36645 (Array (_ BitVec 32) ValueCell!14075)) (size!37182 (_ BitVec 32))) )
))
(declare-fun lt!530584 () array!76003)

(declare-fun lt!530572 () array!76001)

(declare-fun minValue!944 () V!44553)

(declare-fun zeroValue!944 () V!44553)

(declare-datatypes ((tuple2!19018 0))(
  ( (tuple2!19019 (_1!9520 (_ BitVec 64)) (_2!9520 V!44553)) )
))
(declare-datatypes ((List!25752 0))(
  ( (Nil!25749) (Cons!25748 (h!26966 tuple2!19018) (t!37775 List!25752)) )
))
(declare-datatypes ((ListLongMap!16995 0))(
  ( (ListLongMap!16996 (toList!8513 List!25752)) )
))
(declare-fun lt!530579 () ListLongMap!16995)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4995 (array!76001 array!76003 (_ BitVec 32) (_ BitVec 32) V!44553 V!44553 (_ BitVec 32) Int) ListLongMap!16995)

(assert (=> b!1176443 (= lt!530579 (getCurrentListMapNoExtraKeys!4995 lt!530572 lt!530584 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!530583 () V!44553)

(declare-fun _values!996 () array!76003)

(assert (=> b!1176443 (= lt!530584 (array!76004 (store (arr!36645 _values!996) i!673 (ValueCellFull!14075 lt!530583)) (size!37182 _values!996)))))

(declare-fun dynLambda!2973 (Int (_ BitVec 64)) V!44553)

(assert (=> b!1176443 (= lt!530583 (dynLambda!2973 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530576 () ListLongMap!16995)

(assert (=> b!1176443 (= lt!530576 (getCurrentListMapNoExtraKeys!4995 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176444 () Bool)

(declare-fun e!668819 () Bool)

(assert (=> b!1176444 (= e!668816 e!668819)))

(declare-fun res!780947 () Bool)

(assert (=> b!1176444 (=> res!780947 e!668819)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176444 (= res!780947 (not (validKeyInArray!0 (select (arr!36644 _keys!1208) from!1455))))))

(declare-fun lt!530581 () ListLongMap!16995)

(declare-fun lt!530582 () ListLongMap!16995)

(assert (=> b!1176444 (= lt!530581 lt!530582)))

(declare-fun lt!530580 () ListLongMap!16995)

(declare-fun -!1555 (ListLongMap!16995 (_ BitVec 64)) ListLongMap!16995)

(assert (=> b!1176444 (= lt!530582 (-!1555 lt!530580 k0!934))))

(assert (=> b!1176444 (= lt!530581 (getCurrentListMapNoExtraKeys!4995 lt!530572 lt!530584 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176444 (= lt!530580 (getCurrentListMapNoExtraKeys!4995 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38773 0))(
  ( (Unit!38774) )
))
(declare-fun lt!530578 () Unit!38773)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!780 (array!76001 array!76003 (_ BitVec 32) (_ BitVec 32) V!44553 V!44553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38773)

(assert (=> b!1176444 (= lt!530578 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!780 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176445 () Bool)

(declare-fun e!668817 () Unit!38773)

(declare-fun Unit!38775 () Unit!38773)

(assert (=> b!1176445 (= e!668817 Unit!38775)))

(declare-fun lt!530575 () Unit!38773)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76001 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38773)

(assert (=> b!1176445 (= lt!530575 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176445 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530573 () Unit!38773)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76001 (_ BitVec 32) (_ BitVec 32)) Unit!38773)

(assert (=> b!1176445 (= lt!530573 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25753 0))(
  ( (Nil!25750) (Cons!25749 (h!26967 (_ BitVec 64)) (t!37776 List!25753)) )
))
(declare-fun arrayNoDuplicates!0 (array!76001 (_ BitVec 32) List!25753) Bool)

(assert (=> b!1176445 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25750)))

(declare-fun lt!530574 () Unit!38773)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76001 (_ BitVec 64) (_ BitVec 32) List!25753) Unit!38773)

(assert (=> b!1176445 (= lt!530574 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25750))))

(assert (=> b!1176445 false))

(declare-fun b!1176447 () Bool)

(declare-fun res!780948 () Bool)

(declare-fun e!668820 () Bool)

(assert (=> b!1176447 (=> (not res!780948) (not e!668820))))

(assert (=> b!1176447 (= res!780948 (= (select (arr!36644 _keys!1208) i!673) k0!934))))

(declare-fun b!1176448 () Bool)

(declare-fun res!780957 () Bool)

(assert (=> b!1176448 (=> (not res!780957) (not e!668820))))

(assert (=> b!1176448 (= res!780957 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25750))))

(declare-fun mapIsEmpty!46181 () Bool)

(declare-fun mapRes!46181 () Bool)

(assert (=> mapIsEmpty!46181 mapRes!46181))

(declare-fun b!1176449 () Bool)

(declare-fun e!668821 () Bool)

(declare-fun tp_is_empty!29569 () Bool)

(assert (=> b!1176449 (= e!668821 tp_is_empty!29569)))

(declare-fun b!1176450 () Bool)

(declare-fun res!780946 () Bool)

(assert (=> b!1176450 (=> (not res!780946) (not e!668820))))

(assert (=> b!1176450 (= res!780946 (and (= (size!37182 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37181 _keys!1208) (size!37182 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176451 () Bool)

(declare-fun res!780945 () Bool)

(assert (=> b!1176451 (=> (not res!780945) (not e!668820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176451 (= res!780945 (validMask!0 mask!1564))))

(declare-fun b!1176452 () Bool)

(declare-fun e!668814 () Bool)

(assert (=> b!1176452 (= e!668814 tp_is_empty!29569)))

(declare-fun b!1176453 () Bool)

(assert (=> b!1176453 (= e!668813 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46181 () Bool)

(declare-fun tp!87831 () Bool)

(assert (=> mapNonEmpty!46181 (= mapRes!46181 (and tp!87831 e!668814))))

(declare-fun mapKey!46181 () (_ BitVec 32))

(declare-fun mapValue!46181 () ValueCell!14075)

(declare-fun mapRest!46181 () (Array (_ BitVec 32) ValueCell!14075))

(assert (=> mapNonEmpty!46181 (= (arr!36645 _values!996) (store mapRest!46181 mapKey!46181 mapValue!46181))))

(declare-fun res!780955 () Bool)

(assert (=> start!99696 (=> (not res!780955) (not e!668820))))

(assert (=> start!99696 (= res!780955 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37181 _keys!1208))))))

(assert (=> start!99696 e!668820))

(assert (=> start!99696 tp_is_empty!29569))

(declare-fun array_inv!28068 (array!76001) Bool)

(assert (=> start!99696 (array_inv!28068 _keys!1208)))

(assert (=> start!99696 true))

(assert (=> start!99696 tp!87830))

(declare-fun e!668818 () Bool)

(declare-fun array_inv!28069 (array!76003) Bool)

(assert (=> start!99696 (and (array_inv!28069 _values!996) e!668818)))

(declare-fun b!1176446 () Bool)

(declare-fun res!780956 () Bool)

(assert (=> b!1176446 (=> (not res!780956) (not e!668820))))

(assert (=> b!1176446 (= res!780956 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37181 _keys!1208))))))

(declare-fun b!1176454 () Bool)

(declare-fun Unit!38776 () Unit!38773)

(assert (=> b!1176454 (= e!668817 Unit!38776)))

(declare-fun b!1176455 () Bool)

(declare-fun e!668811 () Bool)

(assert (=> b!1176455 (= e!668811 (not e!668822))))

(declare-fun res!780954 () Bool)

(assert (=> b!1176455 (=> res!780954 e!668822)))

(assert (=> b!1176455 (= res!780954 (bvsgt from!1455 i!673))))

(assert (=> b!1176455 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530571 () Unit!38773)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76001 (_ BitVec 64) (_ BitVec 32)) Unit!38773)

(assert (=> b!1176455 (= lt!530571 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176456 () Bool)

(declare-fun res!780951 () Bool)

(assert (=> b!1176456 (=> (not res!780951) (not e!668820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76001 (_ BitVec 32)) Bool)

(assert (=> b!1176456 (= res!780951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176457 () Bool)

(declare-fun res!780953 () Bool)

(assert (=> b!1176457 (=> (not res!780953) (not e!668811))))

(assert (=> b!1176457 (= res!780953 (arrayNoDuplicates!0 lt!530572 #b00000000000000000000000000000000 Nil!25750))))

(declare-fun b!1176458 () Bool)

(assert (=> b!1176458 (= e!668820 e!668811)))

(declare-fun res!780952 () Bool)

(assert (=> b!1176458 (=> (not res!780952) (not e!668811))))

(assert (=> b!1176458 (= res!780952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530572 mask!1564))))

(assert (=> b!1176458 (= lt!530572 (array!76002 (store (arr!36644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37181 _keys!1208)))))

(declare-fun b!1176459 () Bool)

(assert (=> b!1176459 (= e!668819 true)))

(assert (=> b!1176459 (not (= (select (arr!36644 _keys!1208) from!1455) k0!934))))

(declare-fun lt!530577 () Unit!38773)

(assert (=> b!1176459 (= lt!530577 e!668817)))

(declare-fun c!117080 () Bool)

(assert (=> b!1176459 (= c!117080 (= (select (arr!36644 _keys!1208) from!1455) k0!934))))

(assert (=> b!1176459 e!668812))

(declare-fun res!780949 () Bool)

(assert (=> b!1176459 (=> (not res!780949) (not e!668812))))

(declare-fun +!3845 (ListLongMap!16995 tuple2!19018) ListLongMap!16995)

(declare-fun get!18743 (ValueCell!14075 V!44553) V!44553)

(assert (=> b!1176459 (= res!780949 (= lt!530579 (+!3845 lt!530582 (tuple2!19019 (select (arr!36644 _keys!1208) from!1455) (get!18743 (select (arr!36645 _values!996) from!1455) lt!530583)))))))

(declare-fun b!1176460 () Bool)

(declare-fun res!780950 () Bool)

(assert (=> b!1176460 (=> (not res!780950) (not e!668820))))

(assert (=> b!1176460 (= res!780950 (validKeyInArray!0 k0!934))))

(declare-fun b!1176461 () Bool)

(assert (=> b!1176461 (= e!668818 (and e!668821 mapRes!46181))))

(declare-fun condMapEmpty!46181 () Bool)

(declare-fun mapDefault!46181 () ValueCell!14075)

(assert (=> b!1176461 (= condMapEmpty!46181 (= (arr!36645 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14075)) mapDefault!46181)))))

(assert (= (and start!99696 res!780955) b!1176451))

(assert (= (and b!1176451 res!780945) b!1176450))

(assert (= (and b!1176450 res!780946) b!1176456))

(assert (= (and b!1176456 res!780951) b!1176448))

(assert (= (and b!1176448 res!780957) b!1176446))

(assert (= (and b!1176446 res!780956) b!1176460))

(assert (= (and b!1176460 res!780950) b!1176447))

(assert (= (and b!1176447 res!780948) b!1176458))

(assert (= (and b!1176458 res!780952) b!1176457))

(assert (= (and b!1176457 res!780953) b!1176455))

(assert (= (and b!1176455 (not res!780954)) b!1176443))

(assert (= (and b!1176443 (not res!780958)) b!1176444))

(assert (= (and b!1176444 (not res!780947)) b!1176459))

(assert (= (and b!1176459 res!780949) b!1176442))

(assert (= (and b!1176442 (not res!780959)) b!1176453))

(assert (= (and b!1176459 c!117080) b!1176445))

(assert (= (and b!1176459 (not c!117080)) b!1176454))

(assert (= (and b!1176461 condMapEmpty!46181) mapIsEmpty!46181))

(assert (= (and b!1176461 (not condMapEmpty!46181)) mapNonEmpty!46181))

(get-info :version)

(assert (= (and mapNonEmpty!46181 ((_ is ValueCellFull!14075) mapValue!46181)) b!1176452))

(assert (= (and b!1176461 ((_ is ValueCellFull!14075) mapDefault!46181)) b!1176449))

(assert (= start!99696 b!1176461))

(declare-fun b_lambda!20177 () Bool)

(assert (=> (not b_lambda!20177) (not b!1176443)))

(declare-fun t!37774 () Bool)

(declare-fun tb!9843 () Bool)

(assert (=> (and start!99696 (= defaultEntry!1004 defaultEntry!1004) t!37774) tb!9843))

(declare-fun result!20261 () Bool)

(assert (=> tb!9843 (= result!20261 tp_is_empty!29569)))

(assert (=> b!1176443 t!37774))

(declare-fun b_and!40949 () Bool)

(assert (= b_and!40947 (and (=> t!37774 result!20261) b_and!40949)))

(declare-fun m!1084623 () Bool)

(assert (=> b!1176448 m!1084623))

(declare-fun m!1084625 () Bool)

(assert (=> b!1176455 m!1084625))

(declare-fun m!1084627 () Bool)

(assert (=> b!1176455 m!1084627))

(declare-fun m!1084629 () Bool)

(assert (=> b!1176458 m!1084629))

(declare-fun m!1084631 () Bool)

(assert (=> b!1176458 m!1084631))

(declare-fun m!1084633 () Bool)

(assert (=> b!1176451 m!1084633))

(declare-fun m!1084635 () Bool)

(assert (=> b!1176447 m!1084635))

(declare-fun m!1084637 () Bool)

(assert (=> start!99696 m!1084637))

(declare-fun m!1084639 () Bool)

(assert (=> start!99696 m!1084639))

(declare-fun m!1084641 () Bool)

(assert (=> b!1176453 m!1084641))

(declare-fun m!1084643 () Bool)

(assert (=> b!1176457 m!1084643))

(declare-fun m!1084645 () Bool)

(assert (=> b!1176460 m!1084645))

(declare-fun m!1084647 () Bool)

(assert (=> b!1176445 m!1084647))

(declare-fun m!1084649 () Bool)

(assert (=> b!1176445 m!1084649))

(declare-fun m!1084651 () Bool)

(assert (=> b!1176445 m!1084651))

(declare-fun m!1084653 () Bool)

(assert (=> b!1176445 m!1084653))

(declare-fun m!1084655 () Bool)

(assert (=> b!1176445 m!1084655))

(declare-fun m!1084657 () Bool)

(assert (=> b!1176444 m!1084657))

(declare-fun m!1084659 () Bool)

(assert (=> b!1176444 m!1084659))

(declare-fun m!1084661 () Bool)

(assert (=> b!1176444 m!1084661))

(declare-fun m!1084663 () Bool)

(assert (=> b!1176444 m!1084663))

(declare-fun m!1084665 () Bool)

(assert (=> b!1176444 m!1084665))

(declare-fun m!1084667 () Bool)

(assert (=> b!1176444 m!1084667))

(assert (=> b!1176444 m!1084665))

(assert (=> b!1176442 m!1084665))

(declare-fun m!1084669 () Bool)

(assert (=> mapNonEmpty!46181 m!1084669))

(assert (=> b!1176459 m!1084665))

(declare-fun m!1084671 () Bool)

(assert (=> b!1176459 m!1084671))

(assert (=> b!1176459 m!1084671))

(declare-fun m!1084673 () Bool)

(assert (=> b!1176459 m!1084673))

(declare-fun m!1084675 () Bool)

(assert (=> b!1176459 m!1084675))

(declare-fun m!1084677 () Bool)

(assert (=> b!1176443 m!1084677))

(declare-fun m!1084679 () Bool)

(assert (=> b!1176443 m!1084679))

(declare-fun m!1084681 () Bool)

(assert (=> b!1176443 m!1084681))

(declare-fun m!1084683 () Bool)

(assert (=> b!1176443 m!1084683))

(declare-fun m!1084685 () Bool)

(assert (=> b!1176456 m!1084685))

(check-sat (not b!1176451) (not b!1176445) (not b!1176457) (not start!99696) (not b!1176460) (not mapNonEmpty!46181) (not b_lambda!20177) (not b!1176443) tp_is_empty!29569 (not b!1176456) (not b!1176458) (not b_next!25039) (not b!1176455) (not b!1176444) (not b!1176453) (not b!1176448) (not b!1176459) b_and!40949)
(check-sat b_and!40949 (not b_next!25039))
