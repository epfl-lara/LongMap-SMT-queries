; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99286 () Bool)

(assert start!99286)

(declare-fun b_free!24871 () Bool)

(declare-fun b_next!24871 () Bool)

(assert (=> start!99286 (= b_free!24871 (not b_next!24871))))

(declare-fun tp!87327 () Bool)

(declare-fun b_and!40587 () Bool)

(assert (=> start!99286 (= tp!87327 b_and!40587)))

(declare-fun b!1169718 () Bool)

(declare-fun res!776227 () Bool)

(declare-fun e!664806 () Bool)

(assert (=> b!1169718 (=> (not res!776227) (not e!664806))))

(declare-datatypes ((array!75550 0))(
  ( (array!75551 (arr!36425 (Array (_ BitVec 32) (_ BitVec 64))) (size!36963 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75550)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1169718 (= res!776227 (= (select (arr!36425 _keys!1208) i!673) k0!934))))

(declare-fun b!1169719 () Bool)

(declare-fun res!776222 () Bool)

(assert (=> b!1169719 (=> (not res!776222) (not e!664806))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169719 (= res!776222 (validMask!0 mask!1564))))

(declare-fun b!1169720 () Bool)

(declare-fun e!664804 () Bool)

(assert (=> b!1169720 (= e!664806 e!664804)))

(declare-fun res!776225 () Bool)

(assert (=> b!1169720 (=> (not res!776225) (not e!664804))))

(declare-fun lt!526616 () array!75550)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75550 (_ BitVec 32)) Bool)

(assert (=> b!1169720 (= res!776225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526616 mask!1564))))

(assert (=> b!1169720 (= lt!526616 (array!75551 (store (arr!36425 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36963 _keys!1208)))))

(declare-fun b!1169721 () Bool)

(declare-fun res!776233 () Bool)

(assert (=> b!1169721 (=> (not res!776233) (not e!664806))))

(assert (=> b!1169721 (= res!776233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!45929 () Bool)

(declare-fun mapRes!45929 () Bool)

(declare-fun tp!87326 () Bool)

(declare-fun e!664808 () Bool)

(assert (=> mapNonEmpty!45929 (= mapRes!45929 (and tp!87326 e!664808))))

(declare-datatypes ((V!44329 0))(
  ( (V!44330 (val!14757 Int)) )
))
(declare-datatypes ((ValueCell!13991 0))(
  ( (ValueCellFull!13991 (v!17394 V!44329)) (EmptyCell!13991) )
))
(declare-fun mapRest!45929 () (Array (_ BitVec 32) ValueCell!13991))

(declare-fun mapKey!45929 () (_ BitVec 32))

(declare-fun mapValue!45929 () ValueCell!13991)

(declare-datatypes ((array!75552 0))(
  ( (array!75553 (arr!36426 (Array (_ BitVec 32) ValueCell!13991)) (size!36964 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75552)

(assert (=> mapNonEmpty!45929 (= (arr!36426 _values!996) (store mapRest!45929 mapKey!45929 mapValue!45929))))

(declare-fun b!1169722 () Bool)

(declare-fun res!776232 () Bool)

(assert (=> b!1169722 (=> (not res!776232) (not e!664806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169722 (= res!776232 (validKeyInArray!0 k0!934))))

(declare-fun b!1169723 () Bool)

(declare-fun e!664811 () Bool)

(declare-fun e!664809 () Bool)

(assert (=> b!1169723 (= e!664811 e!664809)))

(declare-fun res!776235 () Bool)

(assert (=> b!1169723 (=> res!776235 e!664809)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1169723 (= res!776235 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44329)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!526617 () array!75552)

(declare-datatypes ((tuple2!18932 0))(
  ( (tuple2!18933 (_1!9477 (_ BitVec 64)) (_2!9477 V!44329)) )
))
(declare-datatypes ((List!25646 0))(
  ( (Nil!25643) (Cons!25642 (h!26851 tuple2!18932) (t!37500 List!25646)) )
))
(declare-datatypes ((ListLongMap!16901 0))(
  ( (ListLongMap!16902 (toList!8466 List!25646)) )
))
(declare-fun lt!526619 () ListLongMap!16901)

(declare-fun minValue!944 () V!44329)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4941 (array!75550 array!75552 (_ BitVec 32) (_ BitVec 32) V!44329 V!44329 (_ BitVec 32) Int) ListLongMap!16901)

(assert (=> b!1169723 (= lt!526619 (getCurrentListMapNoExtraKeys!4941 lt!526616 lt!526617 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526620 () V!44329)

(assert (=> b!1169723 (= lt!526617 (array!75553 (store (arr!36426 _values!996) i!673 (ValueCellFull!13991 lt!526620)) (size!36964 _values!996)))))

(declare-fun dynLambda!2867 (Int (_ BitVec 64)) V!44329)

(assert (=> b!1169723 (= lt!526620 (dynLambda!2867 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526618 () ListLongMap!16901)

(assert (=> b!1169723 (= lt!526618 (getCurrentListMapNoExtraKeys!4941 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169724 () Bool)

(declare-fun e!664807 () Bool)

(declare-fun e!664813 () Bool)

(assert (=> b!1169724 (= e!664807 (and e!664813 mapRes!45929))))

(declare-fun condMapEmpty!45929 () Bool)

(declare-fun mapDefault!45929 () ValueCell!13991)

(assert (=> b!1169724 (= condMapEmpty!45929 (= (arr!36426 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13991)) mapDefault!45929)))))

(declare-fun b!1169725 () Bool)

(declare-fun tp_is_empty!29401 () Bool)

(assert (=> b!1169725 (= e!664813 tp_is_empty!29401)))

(declare-fun b!1169726 () Bool)

(declare-fun res!776230 () Bool)

(assert (=> b!1169726 (=> (not res!776230) (not e!664806))))

(assert (=> b!1169726 (= res!776230 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36963 _keys!1208))))))

(declare-fun res!776223 () Bool)

(assert (=> start!99286 (=> (not res!776223) (not e!664806))))

(assert (=> start!99286 (= res!776223 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36963 _keys!1208))))))

(assert (=> start!99286 e!664806))

(assert (=> start!99286 tp_is_empty!29401))

(declare-fun array_inv!27940 (array!75550) Bool)

(assert (=> start!99286 (array_inv!27940 _keys!1208)))

(assert (=> start!99286 true))

(assert (=> start!99286 tp!87327))

(declare-fun array_inv!27941 (array!75552) Bool)

(assert (=> start!99286 (and (array_inv!27941 _values!996) e!664807)))

(declare-fun b!1169727 () Bool)

(declare-fun e!664812 () Bool)

(declare-fun e!664805 () Bool)

(assert (=> b!1169727 (= e!664812 e!664805)))

(declare-fun res!776236 () Bool)

(assert (=> b!1169727 (=> res!776236 e!664805)))

(assert (=> b!1169727 (= res!776236 (not (= (select (arr!36425 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1169728 () Bool)

(declare-fun res!776234 () Bool)

(assert (=> b!1169728 (=> (not res!776234) (not e!664804))))

(declare-datatypes ((List!25647 0))(
  ( (Nil!25644) (Cons!25643 (h!26852 (_ BitVec 64)) (t!37501 List!25647)) )
))
(declare-fun arrayNoDuplicates!0 (array!75550 (_ BitVec 32) List!25647) Bool)

(assert (=> b!1169728 (= res!776234 (arrayNoDuplicates!0 lt!526616 #b00000000000000000000000000000000 Nil!25644))))

(declare-fun b!1169729 () Bool)

(declare-fun e!664803 () Bool)

(assert (=> b!1169729 (= e!664803 true)))

(assert (=> b!1169729 e!664812))

(declare-fun res!776226 () Bool)

(assert (=> b!1169729 (=> (not res!776226) (not e!664812))))

(declare-fun lt!526611 () ListLongMap!16901)

(declare-fun +!3788 (ListLongMap!16901 tuple2!18932) ListLongMap!16901)

(declare-fun get!18578 (ValueCell!13991 V!44329) V!44329)

(assert (=> b!1169729 (= res!776226 (= lt!526619 (+!3788 lt!526611 (tuple2!18933 (select (arr!36425 _keys!1208) from!1455) (get!18578 (select (arr!36426 _values!996) from!1455) lt!526620)))))))

(declare-fun b!1169730 () Bool)

(assert (=> b!1169730 (= e!664804 (not e!664811))))

(declare-fun res!776224 () Bool)

(assert (=> b!1169730 (=> res!776224 e!664811)))

(assert (=> b!1169730 (= res!776224 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169730 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38415 0))(
  ( (Unit!38416) )
))
(declare-fun lt!526613 () Unit!38415)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75550 (_ BitVec 64) (_ BitVec 32)) Unit!38415)

(assert (=> b!1169730 (= lt!526613 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169731 () Bool)

(declare-fun res!776229 () Bool)

(assert (=> b!1169731 (=> (not res!776229) (not e!664806))))

(assert (=> b!1169731 (= res!776229 (and (= (size!36964 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36963 _keys!1208) (size!36964 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169732 () Bool)

(declare-fun res!776231 () Bool)

(assert (=> b!1169732 (=> (not res!776231) (not e!664806))))

(assert (=> b!1169732 (= res!776231 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25644))))

(declare-fun b!1169733 () Bool)

(assert (=> b!1169733 (= e!664805 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!45929 () Bool)

(assert (=> mapIsEmpty!45929 mapRes!45929))

(declare-fun b!1169734 () Bool)

(assert (=> b!1169734 (= e!664808 tp_is_empty!29401)))

(declare-fun b!1169735 () Bool)

(assert (=> b!1169735 (= e!664809 e!664803)))

(declare-fun res!776228 () Bool)

(assert (=> b!1169735 (=> res!776228 e!664803)))

(assert (=> b!1169735 (= res!776228 (not (validKeyInArray!0 (select (arr!36425 _keys!1208) from!1455))))))

(declare-fun lt!526615 () ListLongMap!16901)

(assert (=> b!1169735 (= lt!526615 lt!526611)))

(declare-fun lt!526612 () ListLongMap!16901)

(declare-fun -!1466 (ListLongMap!16901 (_ BitVec 64)) ListLongMap!16901)

(assert (=> b!1169735 (= lt!526611 (-!1466 lt!526612 k0!934))))

(assert (=> b!1169735 (= lt!526615 (getCurrentListMapNoExtraKeys!4941 lt!526616 lt!526617 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1169735 (= lt!526612 (getCurrentListMapNoExtraKeys!4941 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526614 () Unit!38415)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!730 (array!75550 array!75552 (_ BitVec 32) (_ BitVec 32) V!44329 V!44329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38415)

(assert (=> b!1169735 (= lt!526614 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!730 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99286 res!776223) b!1169719))

(assert (= (and b!1169719 res!776222) b!1169731))

(assert (= (and b!1169731 res!776229) b!1169721))

(assert (= (and b!1169721 res!776233) b!1169732))

(assert (= (and b!1169732 res!776231) b!1169726))

(assert (= (and b!1169726 res!776230) b!1169722))

(assert (= (and b!1169722 res!776232) b!1169718))

(assert (= (and b!1169718 res!776227) b!1169720))

(assert (= (and b!1169720 res!776225) b!1169728))

(assert (= (and b!1169728 res!776234) b!1169730))

(assert (= (and b!1169730 (not res!776224)) b!1169723))

(assert (= (and b!1169723 (not res!776235)) b!1169735))

(assert (= (and b!1169735 (not res!776228)) b!1169729))

(assert (= (and b!1169729 res!776226) b!1169727))

(assert (= (and b!1169727 (not res!776236)) b!1169733))

(assert (= (and b!1169724 condMapEmpty!45929) mapIsEmpty!45929))

(assert (= (and b!1169724 (not condMapEmpty!45929)) mapNonEmpty!45929))

(get-info :version)

(assert (= (and mapNonEmpty!45929 ((_ is ValueCellFull!13991) mapValue!45929)) b!1169734))

(assert (= (and b!1169724 ((_ is ValueCellFull!13991) mapDefault!45929)) b!1169725))

(assert (= start!99286 b!1169724))

(declare-fun b_lambda!19997 () Bool)

(assert (=> (not b_lambda!19997) (not b!1169723)))

(declare-fun t!37499 () Bool)

(declare-fun tb!9675 () Bool)

(assert (=> (and start!99286 (= defaultEntry!1004 defaultEntry!1004) t!37499) tb!9675))

(declare-fun result!19925 () Bool)

(assert (=> tb!9675 (= result!19925 tp_is_empty!29401)))

(assert (=> b!1169723 t!37499))

(declare-fun b_and!40589 () Bool)

(assert (= b_and!40587 (and (=> t!37499 result!19925) b_and!40589)))

(declare-fun m!1077077 () Bool)

(assert (=> b!1169727 m!1077077))

(declare-fun m!1077079 () Bool)

(assert (=> b!1169723 m!1077079))

(declare-fun m!1077081 () Bool)

(assert (=> b!1169723 m!1077081))

(declare-fun m!1077083 () Bool)

(assert (=> b!1169723 m!1077083))

(declare-fun m!1077085 () Bool)

(assert (=> b!1169723 m!1077085))

(declare-fun m!1077087 () Bool)

(assert (=> b!1169719 m!1077087))

(assert (=> b!1169729 m!1077077))

(declare-fun m!1077089 () Bool)

(assert (=> b!1169729 m!1077089))

(assert (=> b!1169729 m!1077089))

(declare-fun m!1077091 () Bool)

(assert (=> b!1169729 m!1077091))

(declare-fun m!1077093 () Bool)

(assert (=> b!1169729 m!1077093))

(declare-fun m!1077095 () Bool)

(assert (=> start!99286 m!1077095))

(declare-fun m!1077097 () Bool)

(assert (=> start!99286 m!1077097))

(declare-fun m!1077099 () Bool)

(assert (=> b!1169718 m!1077099))

(declare-fun m!1077101 () Bool)

(assert (=> b!1169732 m!1077101))

(declare-fun m!1077103 () Bool)

(assert (=> b!1169735 m!1077103))

(declare-fun m!1077105 () Bool)

(assert (=> b!1169735 m!1077105))

(declare-fun m!1077107 () Bool)

(assert (=> b!1169735 m!1077107))

(declare-fun m!1077109 () Bool)

(assert (=> b!1169735 m!1077109))

(assert (=> b!1169735 m!1077077))

(declare-fun m!1077111 () Bool)

(assert (=> b!1169735 m!1077111))

(assert (=> b!1169735 m!1077077))

(declare-fun m!1077113 () Bool)

(assert (=> mapNonEmpty!45929 m!1077113))

(declare-fun m!1077115 () Bool)

(assert (=> b!1169720 m!1077115))

(declare-fun m!1077117 () Bool)

(assert (=> b!1169720 m!1077117))

(declare-fun m!1077119 () Bool)

(assert (=> b!1169733 m!1077119))

(declare-fun m!1077121 () Bool)

(assert (=> b!1169721 m!1077121))

(declare-fun m!1077123 () Bool)

(assert (=> b!1169722 m!1077123))

(declare-fun m!1077125 () Bool)

(assert (=> b!1169730 m!1077125))

(declare-fun m!1077127 () Bool)

(assert (=> b!1169730 m!1077127))

(declare-fun m!1077129 () Bool)

(assert (=> b!1169728 m!1077129))

(check-sat (not mapNonEmpty!45929) (not b_next!24871) (not b!1169719) (not b_lambda!19997) (not b!1169720) (not b!1169735) (not b!1169722) tp_is_empty!29401 (not start!99286) (not b!1169729) (not b!1169730) (not b!1169721) (not b!1169728) b_and!40589 (not b!1169723) (not b!1169733) (not b!1169732))
(check-sat b_and!40589 (not b_next!24871))
