; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99324 () Bool)

(assert start!99324)

(declare-fun b_free!24903 () Bool)

(declare-fun b_next!24903 () Bool)

(assert (=> start!99324 (= b_free!24903 (not b_next!24903))))

(declare-fun tp!87422 () Bool)

(declare-fun b_and!40673 () Bool)

(assert (=> start!99324 (= tp!87422 b_and!40673)))

(declare-fun b!1170779 () Bool)

(declare-fun res!777051 () Bool)

(declare-fun e!665458 () Bool)

(assert (=> b!1170779 (=> (not res!777051) (not e!665458))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75685 0))(
  ( (array!75686 (arr!36492 (Array (_ BitVec 32) (_ BitVec 64))) (size!37028 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75685)

(assert (=> b!1170779 (= res!777051 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37028 _keys!1208))))))

(declare-fun b!1170780 () Bool)

(declare-fun e!665450 () Bool)

(declare-fun e!665456 () Bool)

(assert (=> b!1170780 (= e!665450 (not e!665456))))

(declare-fun res!777062 () Bool)

(assert (=> b!1170780 (=> res!777062 e!665456)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1170780 (= res!777062 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170780 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38622 0))(
  ( (Unit!38623) )
))
(declare-fun lt!527332 () Unit!38622)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75685 (_ BitVec 64) (_ BitVec 32)) Unit!38622)

(assert (=> b!1170780 (= lt!527332 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170781 () Bool)

(declare-fun res!777058 () Bool)

(assert (=> b!1170781 (=> (not res!777058) (not e!665458))))

(assert (=> b!1170781 (= res!777058 (= (select (arr!36492 _keys!1208) i!673) k0!934))))

(declare-fun b!1170782 () Bool)

(declare-fun res!777063 () Bool)

(assert (=> b!1170782 (=> (not res!777063) (not e!665450))))

(declare-fun lt!527324 () array!75685)

(declare-datatypes ((List!25603 0))(
  ( (Nil!25600) (Cons!25599 (h!26808 (_ BitVec 64)) (t!37498 List!25603)) )
))
(declare-fun arrayNoDuplicates!0 (array!75685 (_ BitVec 32) List!25603) Bool)

(assert (=> b!1170782 (= res!777063 (arrayNoDuplicates!0 lt!527324 #b00000000000000000000000000000000 Nil!25600))))

(declare-fun b!1170783 () Bool)

(declare-fun e!665453 () Bool)

(declare-fun e!665455 () Bool)

(declare-fun mapRes!45977 () Bool)

(assert (=> b!1170783 (= e!665453 (and e!665455 mapRes!45977))))

(declare-fun condMapEmpty!45977 () Bool)

(declare-datatypes ((V!44371 0))(
  ( (V!44372 (val!14773 Int)) )
))
(declare-datatypes ((ValueCell!14007 0))(
  ( (ValueCellFull!14007 (v!17411 V!44371)) (EmptyCell!14007) )
))
(declare-datatypes ((array!75687 0))(
  ( (array!75688 (arr!36493 (Array (_ BitVec 32) ValueCell!14007)) (size!37029 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75687)

(declare-fun mapDefault!45977 () ValueCell!14007)

(assert (=> b!1170783 (= condMapEmpty!45977 (= (arr!36493 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14007)) mapDefault!45977)))))

(declare-fun b!1170785 () Bool)

(declare-fun e!665452 () Bool)

(declare-fun e!665454 () Bool)

(assert (=> b!1170785 (= e!665452 e!665454)))

(declare-fun res!777060 () Bool)

(assert (=> b!1170785 (=> res!777060 e!665454)))

(assert (=> b!1170785 (= res!777060 (not (= (select (arr!36492 _keys!1208) from!1455) k0!934)))))

(declare-fun e!665459 () Bool)

(assert (=> b!1170785 e!665459))

(declare-fun res!777055 () Bool)

(assert (=> b!1170785 (=> (not res!777055) (not e!665459))))

(declare-datatypes ((tuple2!18868 0))(
  ( (tuple2!18869 (_1!9445 (_ BitVec 64)) (_2!9445 V!44371)) )
))
(declare-datatypes ((List!25604 0))(
  ( (Nil!25601) (Cons!25600 (h!26809 tuple2!18868) (t!37499 List!25604)) )
))
(declare-datatypes ((ListLongMap!16837 0))(
  ( (ListLongMap!16838 (toList!8434 List!25604)) )
))
(declare-fun lt!527331 () ListLongMap!16837)

(declare-fun lt!527327 () ListLongMap!16837)

(declare-fun lt!527325 () V!44371)

(declare-fun +!3762 (ListLongMap!16837 tuple2!18868) ListLongMap!16837)

(declare-fun get!18610 (ValueCell!14007 V!44371) V!44371)

(assert (=> b!1170785 (= res!777055 (= lt!527331 (+!3762 lt!527327 (tuple2!18869 (select (arr!36492 _keys!1208) from!1455) (get!18610 (select (arr!36493 _values!996) from!1455) lt!527325)))))))

(declare-fun b!1170786 () Bool)

(declare-fun e!665460 () Bool)

(assert (=> b!1170786 (= e!665460 e!665452)))

(declare-fun res!777059 () Bool)

(assert (=> b!1170786 (=> res!777059 e!665452)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170786 (= res!777059 (not (validKeyInArray!0 (select (arr!36492 _keys!1208) from!1455))))))

(declare-fun lt!527333 () ListLongMap!16837)

(assert (=> b!1170786 (= lt!527333 lt!527327)))

(declare-fun lt!527334 () ListLongMap!16837)

(declare-fun -!1504 (ListLongMap!16837 (_ BitVec 64)) ListLongMap!16837)

(assert (=> b!1170786 (= lt!527327 (-!1504 lt!527334 k0!934))))

(declare-fun zeroValue!944 () V!44371)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527330 () array!75687)

(declare-fun minValue!944 () V!44371)

(declare-fun getCurrentListMapNoExtraKeys!4898 (array!75685 array!75687 (_ BitVec 32) (_ BitVec 32) V!44371 V!44371 (_ BitVec 32) Int) ListLongMap!16837)

(assert (=> b!1170786 (= lt!527333 (getCurrentListMapNoExtraKeys!4898 lt!527324 lt!527330 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170786 (= lt!527334 (getCurrentListMapNoExtraKeys!4898 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527328 () Unit!38622)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!731 (array!75685 array!75687 (_ BitVec 32) (_ BitVec 32) V!44371 V!44371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38622)

(assert (=> b!1170786 (= lt!527328 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!731 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170787 () Bool)

(assert (=> b!1170787 (= e!665458 e!665450)))

(declare-fun res!777054 () Bool)

(assert (=> b!1170787 (=> (not res!777054) (not e!665450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75685 (_ BitVec 32)) Bool)

(assert (=> b!1170787 (= res!777054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527324 mask!1564))))

(assert (=> b!1170787 (= lt!527324 (array!75686 (store (arr!36492 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37028 _keys!1208)))))

(declare-fun b!1170788 () Bool)

(declare-fun tp_is_empty!29433 () Bool)

(assert (=> b!1170788 (= e!665455 tp_is_empty!29433)))

(declare-fun b!1170789 () Bool)

(declare-fun res!777050 () Bool)

(assert (=> b!1170789 (=> (not res!777050) (not e!665458))))

(assert (=> b!1170789 (= res!777050 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25600))))

(declare-fun b!1170790 () Bool)

(declare-fun res!777056 () Bool)

(assert (=> b!1170790 (=> (not res!777056) (not e!665458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170790 (= res!777056 (validMask!0 mask!1564))))

(declare-fun b!1170791 () Bool)

(declare-fun res!777064 () Bool)

(assert (=> b!1170791 (=> (not res!777064) (not e!665458))))

(assert (=> b!1170791 (= res!777064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170792 () Bool)

(declare-fun e!665451 () Bool)

(assert (=> b!1170792 (= e!665451 tp_is_empty!29433)))

(declare-fun e!665461 () Bool)

(declare-fun b!1170793 () Bool)

(assert (=> b!1170793 (= e!665461 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!45977 () Bool)

(declare-fun tp!87423 () Bool)

(assert (=> mapNonEmpty!45977 (= mapRes!45977 (and tp!87423 e!665451))))

(declare-fun mapValue!45977 () ValueCell!14007)

(declare-fun mapRest!45977 () (Array (_ BitVec 32) ValueCell!14007))

(declare-fun mapKey!45977 () (_ BitVec 32))

(assert (=> mapNonEmpty!45977 (= (arr!36493 _values!996) (store mapRest!45977 mapKey!45977 mapValue!45977))))

(declare-fun b!1170794 () Bool)

(assert (=> b!1170794 (= e!665456 e!665460)))

(declare-fun res!777052 () Bool)

(assert (=> b!1170794 (=> res!777052 e!665460)))

(assert (=> b!1170794 (= res!777052 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1170794 (= lt!527331 (getCurrentListMapNoExtraKeys!4898 lt!527324 lt!527330 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1170794 (= lt!527330 (array!75688 (store (arr!36493 _values!996) i!673 (ValueCellFull!14007 lt!527325)) (size!37029 _values!996)))))

(declare-fun dynLambda!2874 (Int (_ BitVec 64)) V!44371)

(assert (=> b!1170794 (= lt!527325 (dynLambda!2874 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527326 () ListLongMap!16837)

(assert (=> b!1170794 (= lt!527326 (getCurrentListMapNoExtraKeys!4898 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170795 () Bool)

(declare-fun res!777057 () Bool)

(assert (=> b!1170795 (=> (not res!777057) (not e!665458))))

(assert (=> b!1170795 (= res!777057 (and (= (size!37029 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37028 _keys!1208) (size!37029 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45977 () Bool)

(assert (=> mapIsEmpty!45977 mapRes!45977))

(declare-fun b!1170796 () Bool)

(assert (=> b!1170796 (= e!665459 e!665461)))

(declare-fun res!777061 () Bool)

(assert (=> b!1170796 (=> res!777061 e!665461)))

(assert (=> b!1170796 (= res!777061 (not (= (select (arr!36492 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1170797 () Bool)

(assert (=> b!1170797 (= e!665454 true)))

(assert (=> b!1170797 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527329 () Unit!38622)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75685 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38622)

(assert (=> b!1170797 (= lt!527329 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!777053 () Bool)

(assert (=> start!99324 (=> (not res!777053) (not e!665458))))

(assert (=> start!99324 (= res!777053 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37028 _keys!1208))))))

(assert (=> start!99324 e!665458))

(assert (=> start!99324 tp_is_empty!29433))

(declare-fun array_inv!27890 (array!75685) Bool)

(assert (=> start!99324 (array_inv!27890 _keys!1208)))

(assert (=> start!99324 true))

(assert (=> start!99324 tp!87422))

(declare-fun array_inv!27891 (array!75687) Bool)

(assert (=> start!99324 (and (array_inv!27891 _values!996) e!665453)))

(declare-fun b!1170784 () Bool)

(declare-fun res!777049 () Bool)

(assert (=> b!1170784 (=> (not res!777049) (not e!665458))))

(assert (=> b!1170784 (= res!777049 (validKeyInArray!0 k0!934))))

(assert (= (and start!99324 res!777053) b!1170790))

(assert (= (and b!1170790 res!777056) b!1170795))

(assert (= (and b!1170795 res!777057) b!1170791))

(assert (= (and b!1170791 res!777064) b!1170789))

(assert (= (and b!1170789 res!777050) b!1170779))

(assert (= (and b!1170779 res!777051) b!1170784))

(assert (= (and b!1170784 res!777049) b!1170781))

(assert (= (and b!1170781 res!777058) b!1170787))

(assert (= (and b!1170787 res!777054) b!1170782))

(assert (= (and b!1170782 res!777063) b!1170780))

(assert (= (and b!1170780 (not res!777062)) b!1170794))

(assert (= (and b!1170794 (not res!777052)) b!1170786))

(assert (= (and b!1170786 (not res!777059)) b!1170785))

(assert (= (and b!1170785 res!777055) b!1170796))

(assert (= (and b!1170796 (not res!777061)) b!1170793))

(assert (= (and b!1170785 (not res!777060)) b!1170797))

(assert (= (and b!1170783 condMapEmpty!45977) mapIsEmpty!45977))

(assert (= (and b!1170783 (not condMapEmpty!45977)) mapNonEmpty!45977))

(get-info :version)

(assert (= (and mapNonEmpty!45977 ((_ is ValueCellFull!14007) mapValue!45977)) b!1170792))

(assert (= (and b!1170783 ((_ is ValueCellFull!14007) mapDefault!45977)) b!1170788))

(assert (= start!99324 b!1170783))

(declare-fun b_lambda!20047 () Bool)

(assert (=> (not b_lambda!20047) (not b!1170794)))

(declare-fun t!37497 () Bool)

(declare-fun tb!9715 () Bool)

(assert (=> (and start!99324 (= defaultEntry!1004 defaultEntry!1004) t!37497) tb!9715))

(declare-fun result!19997 () Bool)

(assert (=> tb!9715 (= result!19997 tp_is_empty!29433)))

(assert (=> b!1170794 t!37497))

(declare-fun b_and!40675 () Bool)

(assert (= b_and!40673 (and (=> t!37497 result!19997) b_and!40675)))

(declare-fun m!1078603 () Bool)

(assert (=> b!1170787 m!1078603))

(declare-fun m!1078605 () Bool)

(assert (=> b!1170787 m!1078605))

(declare-fun m!1078607 () Bool)

(assert (=> b!1170781 m!1078607))

(declare-fun m!1078609 () Bool)

(assert (=> b!1170785 m!1078609))

(declare-fun m!1078611 () Bool)

(assert (=> b!1170785 m!1078611))

(assert (=> b!1170785 m!1078611))

(declare-fun m!1078613 () Bool)

(assert (=> b!1170785 m!1078613))

(declare-fun m!1078615 () Bool)

(assert (=> b!1170785 m!1078615))

(declare-fun m!1078617 () Bool)

(assert (=> b!1170782 m!1078617))

(declare-fun m!1078619 () Bool)

(assert (=> b!1170784 m!1078619))

(declare-fun m!1078621 () Bool)

(assert (=> b!1170790 m!1078621))

(assert (=> b!1170796 m!1078609))

(declare-fun m!1078623 () Bool)

(assert (=> b!1170791 m!1078623))

(declare-fun m!1078625 () Bool)

(assert (=> mapNonEmpty!45977 m!1078625))

(declare-fun m!1078627 () Bool)

(assert (=> b!1170786 m!1078627))

(declare-fun m!1078629 () Bool)

(assert (=> b!1170786 m!1078629))

(declare-fun m!1078631 () Bool)

(assert (=> b!1170786 m!1078631))

(assert (=> b!1170786 m!1078609))

(declare-fun m!1078633 () Bool)

(assert (=> b!1170786 m!1078633))

(declare-fun m!1078635 () Bool)

(assert (=> b!1170786 m!1078635))

(assert (=> b!1170786 m!1078609))

(declare-fun m!1078637 () Bool)

(assert (=> b!1170789 m!1078637))

(declare-fun m!1078639 () Bool)

(assert (=> b!1170794 m!1078639))

(declare-fun m!1078641 () Bool)

(assert (=> b!1170794 m!1078641))

(declare-fun m!1078643 () Bool)

(assert (=> b!1170794 m!1078643))

(declare-fun m!1078645 () Bool)

(assert (=> b!1170794 m!1078645))

(declare-fun m!1078647 () Bool)

(assert (=> start!99324 m!1078647))

(declare-fun m!1078649 () Bool)

(assert (=> start!99324 m!1078649))

(declare-fun m!1078651 () Bool)

(assert (=> b!1170793 m!1078651))

(declare-fun m!1078653 () Bool)

(assert (=> b!1170780 m!1078653))

(declare-fun m!1078655 () Bool)

(assert (=> b!1170780 m!1078655))

(declare-fun m!1078657 () Bool)

(assert (=> b!1170797 m!1078657))

(declare-fun m!1078659 () Bool)

(assert (=> b!1170797 m!1078659))

(check-sat (not mapNonEmpty!45977) (not b!1170797) (not b_next!24903) (not b!1170784) (not b!1170782) (not b!1170793) (not start!99324) b_and!40675 tp_is_empty!29433 (not b!1170785) (not b!1170790) (not b!1170789) (not b!1170786) (not b!1170780) (not b!1170791) (not b!1170794) (not b!1170787) (not b_lambda!20047))
(check-sat b_and!40675 (not b_next!24903))
