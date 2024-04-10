; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99444 () Bool)

(assert start!99444)

(declare-fun b_free!25023 () Bool)

(declare-fun b_next!25023 () Bool)

(assert (=> start!99444 (= b_free!25023 (not b_next!25023))))

(declare-fun tp!87782 () Bool)

(declare-fun b_and!40913 () Bool)

(assert (=> start!99444 (= tp!87782 b_and!40913)))

(declare-datatypes ((array!75917 0))(
  ( (array!75918 (arr!36608 (Array (_ BitVec 32) (_ BitVec 64))) (size!37144 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75917)

(declare-fun b!1174657 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!667697 () Bool)

(declare-fun arrayContainsKey!0 (array!75917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174657 (= e!667697 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174658 () Bool)

(declare-fun res!780083 () Bool)

(declare-fun e!667696 () Bool)

(assert (=> b!1174658 (=> (not res!780083) (not e!667696))))

(assert (=> b!1174658 (= res!780083 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37144 _keys!1208))))))

(declare-fun b!1174659 () Bool)

(declare-fun e!667691 () Bool)

(assert (=> b!1174659 (= e!667696 e!667691)))

(declare-fun res!780084 () Bool)

(assert (=> b!1174659 (=> (not res!780084) (not e!667691))))

(declare-fun lt!529762 () array!75917)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75917 (_ BitVec 32)) Bool)

(assert (=> b!1174659 (= res!780084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529762 mask!1564))))

(assert (=> b!1174659 (= lt!529762 (array!75918 (store (arr!36608 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37144 _keys!1208)))))

(declare-fun b!1174660 () Bool)

(declare-fun e!667694 () Bool)

(declare-fun tp_is_empty!29553 () Bool)

(assert (=> b!1174660 (= e!667694 tp_is_empty!29553)))

(declare-fun res!780090 () Bool)

(assert (=> start!99444 (=> (not res!780090) (not e!667696))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99444 (= res!780090 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37144 _keys!1208))))))

(assert (=> start!99444 e!667696))

(assert (=> start!99444 tp_is_empty!29553))

(declare-fun array_inv!27966 (array!75917) Bool)

(assert (=> start!99444 (array_inv!27966 _keys!1208)))

(assert (=> start!99444 true))

(assert (=> start!99444 tp!87782))

(declare-datatypes ((V!44531 0))(
  ( (V!44532 (val!14833 Int)) )
))
(declare-datatypes ((ValueCell!14067 0))(
  ( (ValueCellFull!14067 (v!17471 V!44531)) (EmptyCell!14067) )
))
(declare-datatypes ((array!75919 0))(
  ( (array!75920 (arr!36609 (Array (_ BitVec 32) ValueCell!14067)) (size!37145 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75919)

(declare-fun e!667698 () Bool)

(declare-fun array_inv!27967 (array!75919) Bool)

(assert (=> start!99444 (and (array_inv!27967 _values!996) e!667698)))

(declare-fun b!1174661 () Bool)

(declare-fun res!780086 () Bool)

(assert (=> b!1174661 (=> (not res!780086) (not e!667691))))

(declare-datatypes ((List!25701 0))(
  ( (Nil!25698) (Cons!25697 (h!26906 (_ BitVec 64)) (t!37716 List!25701)) )
))
(declare-fun arrayNoDuplicates!0 (array!75917 (_ BitVec 32) List!25701) Bool)

(assert (=> b!1174661 (= res!780086 (arrayNoDuplicates!0 lt!529762 #b00000000000000000000000000000000 Nil!25698))))

(declare-fun b!1174662 () Bool)

(declare-fun e!667699 () Bool)

(assert (=> b!1174662 (= e!667699 tp_is_empty!29553)))

(declare-fun b!1174663 () Bool)

(declare-fun res!780091 () Bool)

(assert (=> b!1174663 (=> (not res!780091) (not e!667696))))

(assert (=> b!1174663 (= res!780091 (= (select (arr!36608 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46157 () Bool)

(declare-fun mapRes!46157 () Bool)

(assert (=> mapIsEmpty!46157 mapRes!46157))

(declare-fun mapNonEmpty!46157 () Bool)

(declare-fun tp!87783 () Bool)

(assert (=> mapNonEmpty!46157 (= mapRes!46157 (and tp!87783 e!667694))))

(declare-fun mapKey!46157 () (_ BitVec 32))

(declare-fun mapValue!46157 () ValueCell!14067)

(declare-fun mapRest!46157 () (Array (_ BitVec 32) ValueCell!14067))

(assert (=> mapNonEmpty!46157 (= (arr!36609 _values!996) (store mapRest!46157 mapKey!46157 mapValue!46157))))

(declare-fun b!1174664 () Bool)

(declare-fun res!780079 () Bool)

(assert (=> b!1174664 (=> (not res!780079) (not e!667696))))

(assert (=> b!1174664 (= res!780079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174665 () Bool)

(declare-datatypes ((Unit!38758 0))(
  ( (Unit!38759) )
))
(declare-fun e!667692 () Unit!38758)

(declare-fun Unit!38760 () Unit!38758)

(assert (=> b!1174665 (= e!667692 Unit!38760)))

(declare-fun b!1174666 () Bool)

(declare-fun e!667700 () Bool)

(assert (=> b!1174666 (= e!667691 (not e!667700))))

(declare-fun res!780089 () Bool)

(assert (=> b!1174666 (=> res!780089 e!667700)))

(assert (=> b!1174666 (= res!780089 (bvsgt from!1455 i!673))))

(assert (=> b!1174666 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529757 () Unit!38758)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75917 (_ BitVec 64) (_ BitVec 32)) Unit!38758)

(assert (=> b!1174666 (= lt!529757 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174667 () Bool)

(assert (=> b!1174667 (= e!667698 (and e!667699 mapRes!46157))))

(declare-fun condMapEmpty!46157 () Bool)

(declare-fun mapDefault!46157 () ValueCell!14067)

(assert (=> b!1174667 (= condMapEmpty!46157 (= (arr!36609 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14067)) mapDefault!46157)))))

(declare-fun b!1174668 () Bool)

(declare-fun res!780085 () Bool)

(assert (=> b!1174668 (=> (not res!780085) (not e!667696))))

(assert (=> b!1174668 (= res!780085 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25698))))

(declare-fun b!1174669 () Bool)

(declare-fun e!667702 () Bool)

(assert (=> b!1174669 (= e!667700 e!667702)))

(declare-fun res!780081 () Bool)

(assert (=> b!1174669 (=> res!780081 e!667702)))

(assert (=> b!1174669 (= res!780081 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44531)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18964 0))(
  ( (tuple2!18965 (_1!9493 (_ BitVec 64)) (_2!9493 V!44531)) )
))
(declare-datatypes ((List!25702 0))(
  ( (Nil!25699) (Cons!25698 (h!26907 tuple2!18964) (t!37717 List!25702)) )
))
(declare-datatypes ((ListLongMap!16933 0))(
  ( (ListLongMap!16934 (toList!8482 List!25702)) )
))
(declare-fun lt!529753 () ListLongMap!16933)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44531)

(declare-fun lt!529755 () array!75919)

(declare-fun getCurrentListMapNoExtraKeys!4942 (array!75917 array!75919 (_ BitVec 32) (_ BitVec 32) V!44531 V!44531 (_ BitVec 32) Int) ListLongMap!16933)

(assert (=> b!1174669 (= lt!529753 (getCurrentListMapNoExtraKeys!4942 lt!529762 lt!529755 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529759 () V!44531)

(assert (=> b!1174669 (= lt!529755 (array!75920 (store (arr!36609 _values!996) i!673 (ValueCellFull!14067 lt!529759)) (size!37145 _values!996)))))

(declare-fun dynLambda!2910 (Int (_ BitVec 64)) V!44531)

(assert (=> b!1174669 (= lt!529759 (dynLambda!2910 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529761 () ListLongMap!16933)

(assert (=> b!1174669 (= lt!529761 (getCurrentListMapNoExtraKeys!4942 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174670 () Bool)

(declare-fun e!667693 () Bool)

(assert (=> b!1174670 (= e!667693 e!667697)))

(declare-fun res!780077 () Bool)

(assert (=> b!1174670 (=> res!780077 e!667697)))

(assert (=> b!1174670 (= res!780077 (not (= (select (arr!36608 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174671 () Bool)

(declare-fun e!667701 () Bool)

(assert (=> b!1174671 (= e!667702 e!667701)))

(declare-fun res!780078 () Bool)

(assert (=> b!1174671 (=> res!780078 e!667701)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174671 (= res!780078 (not (validKeyInArray!0 (select (arr!36608 _keys!1208) from!1455))))))

(declare-fun lt!529758 () ListLongMap!16933)

(declare-fun lt!529756 () ListLongMap!16933)

(assert (=> b!1174671 (= lt!529758 lt!529756)))

(declare-fun lt!529752 () ListLongMap!16933)

(declare-fun -!1540 (ListLongMap!16933 (_ BitVec 64)) ListLongMap!16933)

(assert (=> b!1174671 (= lt!529756 (-!1540 lt!529752 k0!934))))

(assert (=> b!1174671 (= lt!529758 (getCurrentListMapNoExtraKeys!4942 lt!529762 lt!529755 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174671 (= lt!529752 (getCurrentListMapNoExtraKeys!4942 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529763 () Unit!38758)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!767 (array!75917 array!75919 (_ BitVec 32) (_ BitVec 32) V!44531 V!44531 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38758)

(assert (=> b!1174671 (= lt!529763 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!767 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174672 () Bool)

(declare-fun res!780082 () Bool)

(assert (=> b!1174672 (=> (not res!780082) (not e!667696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174672 (= res!780082 (validMask!0 mask!1564))))

(declare-fun b!1174673 () Bool)

(assert (=> b!1174673 (= e!667701 true)))

(assert (=> b!1174673 (not (= (select (arr!36608 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529754 () Unit!38758)

(assert (=> b!1174673 (= lt!529754 e!667692)))

(declare-fun c!116658 () Bool)

(assert (=> b!1174673 (= c!116658 (= (select (arr!36608 _keys!1208) from!1455) k0!934))))

(assert (=> b!1174673 e!667693))

(declare-fun res!780088 () Bool)

(assert (=> b!1174673 (=> (not res!780088) (not e!667693))))

(declare-fun +!3799 (ListLongMap!16933 tuple2!18964) ListLongMap!16933)

(declare-fun get!18687 (ValueCell!14067 V!44531) V!44531)

(assert (=> b!1174673 (= res!780088 (= lt!529753 (+!3799 lt!529756 (tuple2!18965 (select (arr!36608 _keys!1208) from!1455) (get!18687 (select (arr!36609 _values!996) from!1455) lt!529759)))))))

(declare-fun b!1174674 () Bool)

(declare-fun res!780087 () Bool)

(assert (=> b!1174674 (=> (not res!780087) (not e!667696))))

(assert (=> b!1174674 (= res!780087 (and (= (size!37145 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37144 _keys!1208) (size!37145 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174675 () Bool)

(declare-fun res!780080 () Bool)

(assert (=> b!1174675 (=> (not res!780080) (not e!667696))))

(assert (=> b!1174675 (= res!780080 (validKeyInArray!0 k0!934))))

(declare-fun b!1174676 () Bool)

(declare-fun Unit!38761 () Unit!38758)

(assert (=> b!1174676 (= e!667692 Unit!38761)))

(declare-fun lt!529760 () Unit!38758)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75917 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38758)

(assert (=> b!1174676 (= lt!529760 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1174676 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529764 () Unit!38758)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75917 (_ BitVec 32) (_ BitVec 32)) Unit!38758)

(assert (=> b!1174676 (= lt!529764 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1174676 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25698)))

(declare-fun lt!529751 () Unit!38758)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75917 (_ BitVec 64) (_ BitVec 32) List!25701) Unit!38758)

(assert (=> b!1174676 (= lt!529751 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25698))))

(assert (=> b!1174676 false))

(assert (= (and start!99444 res!780090) b!1174672))

(assert (= (and b!1174672 res!780082) b!1174674))

(assert (= (and b!1174674 res!780087) b!1174664))

(assert (= (and b!1174664 res!780079) b!1174668))

(assert (= (and b!1174668 res!780085) b!1174658))

(assert (= (and b!1174658 res!780083) b!1174675))

(assert (= (and b!1174675 res!780080) b!1174663))

(assert (= (and b!1174663 res!780091) b!1174659))

(assert (= (and b!1174659 res!780084) b!1174661))

(assert (= (and b!1174661 res!780086) b!1174666))

(assert (= (and b!1174666 (not res!780089)) b!1174669))

(assert (= (and b!1174669 (not res!780081)) b!1174671))

(assert (= (and b!1174671 (not res!780078)) b!1174673))

(assert (= (and b!1174673 res!780088) b!1174670))

(assert (= (and b!1174670 (not res!780077)) b!1174657))

(assert (= (and b!1174673 c!116658) b!1174676))

(assert (= (and b!1174673 (not c!116658)) b!1174665))

(assert (= (and b!1174667 condMapEmpty!46157) mapIsEmpty!46157))

(assert (= (and b!1174667 (not condMapEmpty!46157)) mapNonEmpty!46157))

(get-info :version)

(assert (= (and mapNonEmpty!46157 ((_ is ValueCellFull!14067) mapValue!46157)) b!1174660))

(assert (= (and b!1174667 ((_ is ValueCellFull!14067) mapDefault!46157)) b!1174662))

(assert (= start!99444 b!1174667))

(declare-fun b_lambda!20167 () Bool)

(assert (=> (not b_lambda!20167) (not b!1174669)))

(declare-fun t!37715 () Bool)

(declare-fun tb!9835 () Bool)

(assert (=> (and start!99444 (= defaultEntry!1004 defaultEntry!1004) t!37715) tb!9835))

(declare-fun result!20237 () Bool)

(assert (=> tb!9835 (= result!20237 tp_is_empty!29553)))

(assert (=> b!1174669 t!37715))

(declare-fun b_and!40915 () Bool)

(assert (= b_and!40913 (and (=> t!37715 result!20237) b_and!40915)))

(declare-fun m!1082539 () Bool)

(assert (=> b!1174668 m!1082539))

(declare-fun m!1082541 () Bool)

(assert (=> b!1174671 m!1082541))

(declare-fun m!1082543 () Bool)

(assert (=> b!1174671 m!1082543))

(declare-fun m!1082545 () Bool)

(assert (=> b!1174671 m!1082545))

(declare-fun m!1082547 () Bool)

(assert (=> b!1174671 m!1082547))

(declare-fun m!1082549 () Bool)

(assert (=> b!1174671 m!1082549))

(declare-fun m!1082551 () Bool)

(assert (=> b!1174671 m!1082551))

(assert (=> b!1174671 m!1082549))

(declare-fun m!1082553 () Bool)

(assert (=> b!1174672 m!1082553))

(assert (=> b!1174670 m!1082549))

(declare-fun m!1082555 () Bool)

(assert (=> b!1174675 m!1082555))

(declare-fun m!1082557 () Bool)

(assert (=> b!1174663 m!1082557))

(declare-fun m!1082559 () Bool)

(assert (=> b!1174669 m!1082559))

(declare-fun m!1082561 () Bool)

(assert (=> b!1174669 m!1082561))

(declare-fun m!1082563 () Bool)

(assert (=> b!1174669 m!1082563))

(declare-fun m!1082565 () Bool)

(assert (=> b!1174669 m!1082565))

(declare-fun m!1082567 () Bool)

(assert (=> mapNonEmpty!46157 m!1082567))

(declare-fun m!1082569 () Bool)

(assert (=> b!1174657 m!1082569))

(declare-fun m!1082571 () Bool)

(assert (=> b!1174659 m!1082571))

(declare-fun m!1082573 () Bool)

(assert (=> b!1174659 m!1082573))

(declare-fun m!1082575 () Bool)

(assert (=> start!99444 m!1082575))

(declare-fun m!1082577 () Bool)

(assert (=> start!99444 m!1082577))

(declare-fun m!1082579 () Bool)

(assert (=> b!1174676 m!1082579))

(declare-fun m!1082581 () Bool)

(assert (=> b!1174676 m!1082581))

(declare-fun m!1082583 () Bool)

(assert (=> b!1174676 m!1082583))

(declare-fun m!1082585 () Bool)

(assert (=> b!1174676 m!1082585))

(declare-fun m!1082587 () Bool)

(assert (=> b!1174676 m!1082587))

(declare-fun m!1082589 () Bool)

(assert (=> b!1174664 m!1082589))

(assert (=> b!1174673 m!1082549))

(declare-fun m!1082591 () Bool)

(assert (=> b!1174673 m!1082591))

(assert (=> b!1174673 m!1082591))

(declare-fun m!1082593 () Bool)

(assert (=> b!1174673 m!1082593))

(declare-fun m!1082595 () Bool)

(assert (=> b!1174673 m!1082595))

(declare-fun m!1082597 () Bool)

(assert (=> b!1174661 m!1082597))

(declare-fun m!1082599 () Bool)

(assert (=> b!1174666 m!1082599))

(declare-fun m!1082601 () Bool)

(assert (=> b!1174666 m!1082601))

(check-sat (not b!1174669) tp_is_empty!29553 (not b!1174676) (not b!1174668) (not b!1174666) (not b!1174664) (not b!1174675) (not mapNonEmpty!46157) (not b_next!25023) b_and!40915 (not b!1174673) (not b!1174659) (not b_lambda!20167) (not b!1174657) (not start!99444) (not b!1174661) (not b!1174672) (not b!1174671))
(check-sat b_and!40915 (not b_next!25023))
