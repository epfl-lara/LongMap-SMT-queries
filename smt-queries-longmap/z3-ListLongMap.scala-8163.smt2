; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100080 () Bool)

(assert start!100080)

(declare-fun b_free!25423 () Bool)

(declare-fun b_next!25423 () Bool)

(assert (=> start!100080 (= b_free!25423 (not b_next!25423))))

(declare-fun tp!88983 () Bool)

(declare-fun b_and!41715 () Bool)

(assert (=> start!100080 (= tp!88983 b_and!41715)))

(declare-fun res!789932 () Bool)

(declare-fun e!675982 () Bool)

(assert (=> start!100080 (=> (not res!789932) (not e!675982))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76747 0))(
  ( (array!76748 (arr!37017 (Array (_ BitVec 32) (_ BitVec 64))) (size!37554 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76747)

(assert (=> start!100080 (= res!789932 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37554 _keys!1208))))))

(assert (=> start!100080 e!675982))

(declare-fun tp_is_empty!29953 () Bool)

(assert (=> start!100080 tp_is_empty!29953))

(declare-fun array_inv!28314 (array!76747) Bool)

(assert (=> start!100080 (array_inv!28314 _keys!1208)))

(assert (=> start!100080 true))

(assert (=> start!100080 tp!88983))

(declare-datatypes ((V!45065 0))(
  ( (V!45066 (val!15033 Int)) )
))
(declare-datatypes ((ValueCell!14267 0))(
  ( (ValueCellFull!14267 (v!17667 V!45065)) (EmptyCell!14267) )
))
(declare-datatypes ((array!76749 0))(
  ( (array!76750 (arr!37018 (Array (_ BitVec 32) ValueCell!14267)) (size!37555 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76749)

(declare-fun e!675986 () Bool)

(declare-fun array_inv!28315 (array!76749) Bool)

(assert (=> start!100080 (and (array_inv!28315 _values!996) e!675986)))

(declare-fun b!1188688 () Bool)

(declare-datatypes ((Unit!39363 0))(
  ( (Unit!39364) )
))
(declare-fun e!675980 () Unit!39363)

(declare-fun Unit!39365 () Unit!39363)

(assert (=> b!1188688 (= e!675980 Unit!39365)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!540310 () Unit!39363)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76747 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39363)

(assert (=> b!1188688 (= lt!540310 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188688 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540301 () Unit!39363)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76747 (_ BitVec 32) (_ BitVec 32)) Unit!39363)

(assert (=> b!1188688 (= lt!540301 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26074 0))(
  ( (Nil!26071) (Cons!26070 (h!27288 (_ BitVec 64)) (t!38481 List!26074)) )
))
(declare-fun arrayNoDuplicates!0 (array!76747 (_ BitVec 32) List!26074) Bool)

(assert (=> b!1188688 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26071)))

(declare-fun lt!540306 () Unit!39363)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76747 (_ BitVec 64) (_ BitVec 32) List!26074) Unit!39363)

(assert (=> b!1188688 (= lt!540306 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26071))))

(assert (=> b!1188688 false))

(declare-fun b!1188689 () Bool)

(declare-fun e!675978 () Bool)

(assert (=> b!1188689 (= e!675982 e!675978)))

(declare-fun res!789927 () Bool)

(assert (=> b!1188689 (=> (not res!789927) (not e!675978))))

(declare-fun lt!540303 () array!76747)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76747 (_ BitVec 32)) Bool)

(assert (=> b!1188689 (= res!789927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540303 mask!1564))))

(assert (=> b!1188689 (= lt!540303 (array!76748 (store (arr!37017 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37554 _keys!1208)))))

(declare-fun b!1188690 () Bool)

(declare-fun e!675977 () Bool)

(declare-fun mapRes!46757 () Bool)

(assert (=> b!1188690 (= e!675986 (and e!675977 mapRes!46757))))

(declare-fun condMapEmpty!46757 () Bool)

(declare-fun mapDefault!46757 () ValueCell!14267)

(assert (=> b!1188690 (= condMapEmpty!46757 (= (arr!37018 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14267)) mapDefault!46757)))))

(declare-fun b!1188691 () Bool)

(declare-fun e!675984 () Bool)

(assert (=> b!1188691 (= e!675984 tp_is_empty!29953)))

(declare-fun mapIsEmpty!46757 () Bool)

(assert (=> mapIsEmpty!46757 mapRes!46757))

(declare-fun b!1188692 () Bool)

(declare-fun res!789931 () Bool)

(assert (=> b!1188692 (=> (not res!789931) (not e!675982))))

(assert (=> b!1188692 (= res!789931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188693 () Bool)

(declare-fun res!789934 () Bool)

(assert (=> b!1188693 (=> (not res!789934) (not e!675982))))

(assert (=> b!1188693 (= res!789934 (= (select (arr!37017 _keys!1208) i!673) k0!934))))

(declare-fun b!1188694 () Bool)

(declare-fun e!675979 () Bool)

(assert (=> b!1188694 (= e!675979 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188695 () Bool)

(declare-fun Unit!39366 () Unit!39363)

(assert (=> b!1188695 (= e!675980 Unit!39366)))

(declare-fun mapNonEmpty!46757 () Bool)

(declare-fun tp!88982 () Bool)

(assert (=> mapNonEmpty!46757 (= mapRes!46757 (and tp!88982 e!675984))))

(declare-fun mapValue!46757 () ValueCell!14267)

(declare-fun mapKey!46757 () (_ BitVec 32))

(declare-fun mapRest!46757 () (Array (_ BitVec 32) ValueCell!14267))

(assert (=> mapNonEmpty!46757 (= (arr!37018 _values!996) (store mapRest!46757 mapKey!46757 mapValue!46757))))

(declare-fun b!1188696 () Bool)

(declare-fun res!789940 () Bool)

(assert (=> b!1188696 (=> (not res!789940) (not e!675982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188696 (= res!789940 (validKeyInArray!0 k0!934))))

(declare-fun b!1188697 () Bool)

(declare-fun e!675976 () Bool)

(assert (=> b!1188697 (= e!675976 true)))

(declare-datatypes ((tuple2!19336 0))(
  ( (tuple2!19337 (_1!9679 (_ BitVec 64)) (_2!9679 V!45065)) )
))
(declare-datatypes ((List!26075 0))(
  ( (Nil!26072) (Cons!26071 (h!27289 tuple2!19336) (t!38482 List!26075)) )
))
(declare-datatypes ((ListLongMap!17313 0))(
  ( (ListLongMap!17314 (toList!8672 List!26075)) )
))
(declare-fun lt!540299 () ListLongMap!17313)

(declare-fun lt!540294 () ListLongMap!17313)

(declare-fun -!1692 (ListLongMap!17313 (_ BitVec 64)) ListLongMap!17313)

(assert (=> b!1188697 (= (-!1692 lt!540299 k0!934) lt!540294)))

(declare-fun lt!540302 () Unit!39363)

(declare-fun lt!540304 () ListLongMap!17313)

(declare-fun lt!540292 () V!45065)

(declare-fun addRemoveCommutativeForDiffKeys!204 (ListLongMap!17313 (_ BitVec 64) V!45065 (_ BitVec 64)) Unit!39363)

(assert (=> b!1188697 (= lt!540302 (addRemoveCommutativeForDiffKeys!204 lt!540304 (select (arr!37017 _keys!1208) from!1455) lt!540292 k0!934))))

(declare-fun lt!540300 () ListLongMap!17313)

(declare-fun lt!540295 () ListLongMap!17313)

(declare-fun lt!540298 () ListLongMap!17313)

(assert (=> b!1188697 (and (= lt!540295 lt!540299) (= lt!540298 lt!540300))))

(declare-fun lt!540296 () tuple2!19336)

(declare-fun +!3988 (ListLongMap!17313 tuple2!19336) ListLongMap!17313)

(assert (=> b!1188697 (= lt!540299 (+!3988 lt!540304 lt!540296))))

(assert (=> b!1188697 (not (= (select (arr!37017 _keys!1208) from!1455) k0!934))))

(declare-fun lt!540307 () Unit!39363)

(assert (=> b!1188697 (= lt!540307 e!675980)))

(declare-fun c!117656 () Bool)

(assert (=> b!1188697 (= c!117656 (= (select (arr!37017 _keys!1208) from!1455) k0!934))))

(declare-fun e!675985 () Bool)

(assert (=> b!1188697 e!675985))

(declare-fun res!789935 () Bool)

(assert (=> b!1188697 (=> (not res!789935) (not e!675985))))

(declare-fun lt!540305 () ListLongMap!17313)

(assert (=> b!1188697 (= res!789935 (= lt!540305 lt!540294))))

(assert (=> b!1188697 (= lt!540294 (+!3988 lt!540298 lt!540296))))

(assert (=> b!1188697 (= lt!540296 (tuple2!19337 (select (arr!37017 _keys!1208) from!1455) lt!540292))))

(declare-fun lt!540309 () V!45065)

(declare-fun get!19007 (ValueCell!14267 V!45065) V!45065)

(assert (=> b!1188697 (= lt!540292 (get!19007 (select (arr!37018 _values!996) from!1455) lt!540309))))

(declare-fun b!1188698 () Bool)

(declare-fun res!789939 () Bool)

(assert (=> b!1188698 (=> (not res!789939) (not e!675982))))

(assert (=> b!1188698 (= res!789939 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26071))))

(declare-fun b!1188699 () Bool)

(declare-fun e!675983 () Bool)

(assert (=> b!1188699 (= e!675978 (not e!675983))))

(declare-fun res!789941 () Bool)

(assert (=> b!1188699 (=> res!789941 e!675983)))

(assert (=> b!1188699 (= res!789941 (bvsgt from!1455 i!673))))

(assert (=> b!1188699 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540308 () Unit!39363)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76747 (_ BitVec 64) (_ BitVec 32)) Unit!39363)

(assert (=> b!1188699 (= lt!540308 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188700 () Bool)

(declare-fun e!675981 () Bool)

(assert (=> b!1188700 (= e!675981 e!675976)))

(declare-fun res!789933 () Bool)

(assert (=> b!1188700 (=> res!789933 e!675976)))

(assert (=> b!1188700 (= res!789933 (not (validKeyInArray!0 (select (arr!37017 _keys!1208) from!1455))))))

(assert (=> b!1188700 (= lt!540300 lt!540298)))

(assert (=> b!1188700 (= lt!540298 (-!1692 lt!540304 k0!934))))

(declare-fun zeroValue!944 () V!45065)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45065)

(declare-fun lt!540293 () array!76749)

(declare-fun getCurrentListMapNoExtraKeys!5141 (array!76747 array!76749 (_ BitVec 32) (_ BitVec 32) V!45065 V!45065 (_ BitVec 32) Int) ListLongMap!17313)

(assert (=> b!1188700 (= lt!540300 (getCurrentListMapNoExtraKeys!5141 lt!540303 lt!540293 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1188700 (= lt!540304 (getCurrentListMapNoExtraKeys!5141 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!540297 () Unit!39363)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!908 (array!76747 array!76749 (_ BitVec 32) (_ BitVec 32) V!45065 V!45065 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39363)

(assert (=> b!1188700 (= lt!540297 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!908 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188701 () Bool)

(declare-fun res!789938 () Bool)

(assert (=> b!1188701 (=> (not res!789938) (not e!675978))))

(assert (=> b!1188701 (= res!789938 (arrayNoDuplicates!0 lt!540303 #b00000000000000000000000000000000 Nil!26071))))

(declare-fun b!1188702 () Bool)

(assert (=> b!1188702 (= e!675983 e!675981)))

(declare-fun res!789936 () Bool)

(assert (=> b!1188702 (=> res!789936 e!675981)))

(assert (=> b!1188702 (= res!789936 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1188702 (= lt!540305 (getCurrentListMapNoExtraKeys!5141 lt!540303 lt!540293 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1188702 (= lt!540293 (array!76750 (store (arr!37018 _values!996) i!673 (ValueCellFull!14267 lt!540309)) (size!37555 _values!996)))))

(declare-fun dynLambda!3100 (Int (_ BitVec 64)) V!45065)

(assert (=> b!1188702 (= lt!540309 (dynLambda!3100 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1188702 (= lt!540295 (getCurrentListMapNoExtraKeys!5141 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188703 () Bool)

(assert (=> b!1188703 (= e!675977 tp_is_empty!29953)))

(declare-fun b!1188704 () Bool)

(declare-fun res!789930 () Bool)

(assert (=> b!1188704 (=> (not res!789930) (not e!675982))))

(assert (=> b!1188704 (= res!789930 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37554 _keys!1208))))))

(declare-fun b!1188705 () Bool)

(declare-fun res!789928 () Bool)

(assert (=> b!1188705 (=> (not res!789928) (not e!675982))))

(assert (=> b!1188705 (= res!789928 (and (= (size!37555 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37554 _keys!1208) (size!37555 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188706 () Bool)

(assert (=> b!1188706 (= e!675985 e!675979)))

(declare-fun res!789929 () Bool)

(assert (=> b!1188706 (=> res!789929 e!675979)))

(assert (=> b!1188706 (= res!789929 (not (= (select (arr!37017 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1188707 () Bool)

(declare-fun res!789937 () Bool)

(assert (=> b!1188707 (=> (not res!789937) (not e!675982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188707 (= res!789937 (validMask!0 mask!1564))))

(assert (= (and start!100080 res!789932) b!1188707))

(assert (= (and b!1188707 res!789937) b!1188705))

(assert (= (and b!1188705 res!789928) b!1188692))

(assert (= (and b!1188692 res!789931) b!1188698))

(assert (= (and b!1188698 res!789939) b!1188704))

(assert (= (and b!1188704 res!789930) b!1188696))

(assert (= (and b!1188696 res!789940) b!1188693))

(assert (= (and b!1188693 res!789934) b!1188689))

(assert (= (and b!1188689 res!789927) b!1188701))

(assert (= (and b!1188701 res!789938) b!1188699))

(assert (= (and b!1188699 (not res!789941)) b!1188702))

(assert (= (and b!1188702 (not res!789936)) b!1188700))

(assert (= (and b!1188700 (not res!789933)) b!1188697))

(assert (= (and b!1188697 res!789935) b!1188706))

(assert (= (and b!1188706 (not res!789929)) b!1188694))

(assert (= (and b!1188697 c!117656) b!1188688))

(assert (= (and b!1188697 (not c!117656)) b!1188695))

(assert (= (and b!1188690 condMapEmpty!46757) mapIsEmpty!46757))

(assert (= (and b!1188690 (not condMapEmpty!46757)) mapNonEmpty!46757))

(get-info :version)

(assert (= (and mapNonEmpty!46757 ((_ is ValueCellFull!14267) mapValue!46757)) b!1188691))

(assert (= (and b!1188690 ((_ is ValueCellFull!14267) mapDefault!46757)) b!1188703))

(assert (= start!100080 b!1188690))

(declare-fun b_lambda!20561 () Bool)

(assert (=> (not b_lambda!20561) (not b!1188702)))

(declare-fun t!38480 () Bool)

(declare-fun tb!10227 () Bool)

(assert (=> (and start!100080 (= defaultEntry!1004 defaultEntry!1004) t!38480) tb!10227))

(declare-fun result!21029 () Bool)

(assert (=> tb!10227 (= result!21029 tp_is_empty!29953)))

(assert (=> b!1188702 t!38480))

(declare-fun b_and!41717 () Bool)

(assert (= b_and!41715 (and (=> t!38480 result!21029) b_and!41717)))

(declare-fun m!1097637 () Bool)

(assert (=> b!1188701 m!1097637))

(declare-fun m!1097639 () Bool)

(assert (=> b!1188697 m!1097639))

(declare-fun m!1097641 () Bool)

(assert (=> b!1188697 m!1097641))

(assert (=> b!1188697 m!1097641))

(declare-fun m!1097643 () Bool)

(assert (=> b!1188697 m!1097643))

(declare-fun m!1097645 () Bool)

(assert (=> b!1188697 m!1097645))

(declare-fun m!1097647 () Bool)

(assert (=> b!1188697 m!1097647))

(assert (=> b!1188697 m!1097647))

(declare-fun m!1097649 () Bool)

(assert (=> b!1188697 m!1097649))

(declare-fun m!1097651 () Bool)

(assert (=> b!1188697 m!1097651))

(declare-fun m!1097653 () Bool)

(assert (=> b!1188698 m!1097653))

(assert (=> b!1188706 m!1097647))

(declare-fun m!1097655 () Bool)

(assert (=> b!1188688 m!1097655))

(declare-fun m!1097657 () Bool)

(assert (=> b!1188688 m!1097657))

(declare-fun m!1097659 () Bool)

(assert (=> b!1188688 m!1097659))

(declare-fun m!1097661 () Bool)

(assert (=> b!1188688 m!1097661))

(declare-fun m!1097663 () Bool)

(assert (=> b!1188688 m!1097663))

(declare-fun m!1097665 () Bool)

(assert (=> b!1188693 m!1097665))

(declare-fun m!1097667 () Bool)

(assert (=> b!1188702 m!1097667))

(declare-fun m!1097669 () Bool)

(assert (=> b!1188702 m!1097669))

(declare-fun m!1097671 () Bool)

(assert (=> b!1188702 m!1097671))

(declare-fun m!1097673 () Bool)

(assert (=> b!1188702 m!1097673))

(declare-fun m!1097675 () Bool)

(assert (=> mapNonEmpty!46757 m!1097675))

(declare-fun m!1097677 () Bool)

(assert (=> b!1188694 m!1097677))

(declare-fun m!1097679 () Bool)

(assert (=> b!1188696 m!1097679))

(declare-fun m!1097681 () Bool)

(assert (=> b!1188700 m!1097681))

(declare-fun m!1097683 () Bool)

(assert (=> b!1188700 m!1097683))

(declare-fun m!1097685 () Bool)

(assert (=> b!1188700 m!1097685))

(assert (=> b!1188700 m!1097647))

(declare-fun m!1097687 () Bool)

(assert (=> b!1188700 m!1097687))

(declare-fun m!1097689 () Bool)

(assert (=> b!1188700 m!1097689))

(assert (=> b!1188700 m!1097647))

(declare-fun m!1097691 () Bool)

(assert (=> b!1188707 m!1097691))

(declare-fun m!1097693 () Bool)

(assert (=> b!1188689 m!1097693))

(declare-fun m!1097695 () Bool)

(assert (=> b!1188689 m!1097695))

(declare-fun m!1097697 () Bool)

(assert (=> b!1188692 m!1097697))

(declare-fun m!1097699 () Bool)

(assert (=> b!1188699 m!1097699))

(declare-fun m!1097701 () Bool)

(assert (=> b!1188699 m!1097701))

(declare-fun m!1097703 () Bool)

(assert (=> start!100080 m!1097703))

(declare-fun m!1097705 () Bool)

(assert (=> start!100080 m!1097705))

(check-sat (not b!1188689) (not b_next!25423) (not b!1188696) b_and!41717 (not b_lambda!20561) tp_is_empty!29953 (not b!1188701) (not start!100080) (not b!1188688) (not b!1188707) (not b!1188694) (not mapNonEmpty!46757) (not b!1188697) (not b!1188702) (not b!1188698) (not b!1188692) (not b!1188700) (not b!1188699))
(check-sat b_and!41717 (not b_next!25423))
