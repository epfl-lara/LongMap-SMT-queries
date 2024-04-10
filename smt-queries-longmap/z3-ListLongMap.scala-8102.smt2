; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99480 () Bool)

(assert start!99480)

(declare-fun b_free!25059 () Bool)

(declare-fun b_next!25059 () Bool)

(assert (=> start!99480 (= b_free!25059 (not b_next!25059))))

(declare-fun tp!87891 () Bool)

(declare-fun b_and!40985 () Bool)

(assert (=> start!99480 (= tp!87891 b_and!40985)))

(declare-fun b!1175773 () Bool)

(declare-fun e!668342 () Bool)

(declare-fun tp_is_empty!29589 () Bool)

(assert (=> b!1175773 (= e!668342 tp_is_empty!29589)))

(declare-fun b!1175774 () Bool)

(declare-fun e!668340 () Bool)

(assert (=> b!1175774 (= e!668340 true)))

(declare-datatypes ((array!75985 0))(
  ( (array!75986 (arr!36642 (Array (_ BitVec 32) (_ BitVec 64))) (size!37178 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75985)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1175774 (not (= (select (arr!36642 _keys!1208) from!1455) k0!934))))

(declare-datatypes ((Unit!38801 0))(
  ( (Unit!38802) )
))
(declare-fun lt!530513 () Unit!38801)

(declare-fun e!668344 () Unit!38801)

(assert (=> b!1175774 (= lt!530513 e!668344)))

(declare-fun c!116712 () Bool)

(assert (=> b!1175774 (= c!116712 (= (select (arr!36642 _keys!1208) from!1455) k0!934))))

(declare-fun e!668339 () Bool)

(assert (=> b!1175774 e!668339))

(declare-fun res!780896 () Bool)

(assert (=> b!1175774 (=> (not res!780896) (not e!668339))))

(declare-datatypes ((V!44579 0))(
  ( (V!44580 (val!14851 Int)) )
))
(declare-datatypes ((tuple2!18988 0))(
  ( (tuple2!18989 (_1!9505 (_ BitVec 64)) (_2!9505 V!44579)) )
))
(declare-datatypes ((List!25727 0))(
  ( (Nil!25724) (Cons!25723 (h!26932 tuple2!18988) (t!37778 List!25727)) )
))
(declare-datatypes ((ListLongMap!16957 0))(
  ( (ListLongMap!16958 (toList!8494 List!25727)) )
))
(declare-fun lt!530510 () ListLongMap!16957)

(declare-fun lt!530514 () ListLongMap!16957)

(declare-fun lt!530517 () V!44579)

(declare-datatypes ((ValueCell!14085 0))(
  ( (ValueCellFull!14085 (v!17489 V!44579)) (EmptyCell!14085) )
))
(declare-datatypes ((array!75987 0))(
  ( (array!75988 (arr!36643 (Array (_ BitVec 32) ValueCell!14085)) (size!37179 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75987)

(declare-fun +!3810 (ListLongMap!16957 tuple2!18988) ListLongMap!16957)

(declare-fun get!18710 (ValueCell!14085 V!44579) V!44579)

(assert (=> b!1175774 (= res!780896 (= lt!530514 (+!3810 lt!530510 (tuple2!18989 (select (arr!36642 _keys!1208) from!1455) (get!18710 (select (arr!36643 _values!996) from!1455) lt!530517)))))))

(declare-fun b!1175775 () Bool)

(declare-fun res!780895 () Bool)

(declare-fun e!668345 () Bool)

(assert (=> b!1175775 (=> (not res!780895) (not e!668345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175775 (= res!780895 (validKeyInArray!0 k0!934))))

(declare-fun b!1175776 () Bool)

(declare-fun e!668343 () Bool)

(assert (=> b!1175776 (= e!668345 e!668343)))

(declare-fun res!780887 () Bool)

(assert (=> b!1175776 (=> (not res!780887) (not e!668343))))

(declare-fun lt!530507 () array!75985)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75985 (_ BitVec 32)) Bool)

(assert (=> b!1175776 (= res!780887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530507 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1175776 (= lt!530507 (array!75986 (store (arr!36642 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37178 _keys!1208)))))

(declare-fun res!780893 () Bool)

(assert (=> start!99480 (=> (not res!780893) (not e!668345))))

(assert (=> start!99480 (= res!780893 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37178 _keys!1208))))))

(assert (=> start!99480 e!668345))

(assert (=> start!99480 tp_is_empty!29589))

(declare-fun array_inv!27988 (array!75985) Bool)

(assert (=> start!99480 (array_inv!27988 _keys!1208)))

(assert (=> start!99480 true))

(assert (=> start!99480 tp!87891))

(declare-fun e!668341 () Bool)

(declare-fun array_inv!27989 (array!75987) Bool)

(assert (=> start!99480 (and (array_inv!27989 _values!996) e!668341)))

(declare-fun b!1175777 () Bool)

(declare-fun res!780894 () Bool)

(assert (=> b!1175777 (=> (not res!780894) (not e!668345))))

(assert (=> b!1175777 (= res!780894 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37178 _keys!1208))))))

(declare-fun b!1175778 () Bool)

(declare-fun mapRes!46211 () Bool)

(assert (=> b!1175778 (= e!668341 (and e!668342 mapRes!46211))))

(declare-fun condMapEmpty!46211 () Bool)

(declare-fun mapDefault!46211 () ValueCell!14085)

(assert (=> b!1175778 (= condMapEmpty!46211 (= (arr!36643 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14085)) mapDefault!46211)))))

(declare-fun b!1175779 () Bool)

(declare-fun Unit!38803 () Unit!38801)

(assert (=> b!1175779 (= e!668344 Unit!38803)))

(declare-fun b!1175780 () Bool)

(declare-fun e!668347 () Bool)

(assert (=> b!1175780 (= e!668339 e!668347)))

(declare-fun res!780897 () Bool)

(assert (=> b!1175780 (=> res!780897 e!668347)))

(assert (=> b!1175780 (= res!780897 (not (= (select (arr!36642 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1175781 () Bool)

(declare-fun res!780892 () Bool)

(assert (=> b!1175781 (=> (not res!780892) (not e!668345))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1175781 (= res!780892 (and (= (size!37179 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37178 _keys!1208) (size!37179 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175782 () Bool)

(declare-fun e!668346 () Bool)

(declare-fun e!668350 () Bool)

(assert (=> b!1175782 (= e!668346 e!668350)))

(declare-fun res!780890 () Bool)

(assert (=> b!1175782 (=> res!780890 e!668350)))

(assert (=> b!1175782 (= res!780890 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44579)

(declare-fun lt!530519 () array!75987)

(declare-fun minValue!944 () V!44579)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4954 (array!75985 array!75987 (_ BitVec 32) (_ BitVec 32) V!44579 V!44579 (_ BitVec 32) Int) ListLongMap!16957)

(assert (=> b!1175782 (= lt!530514 (getCurrentListMapNoExtraKeys!4954 lt!530507 lt!530519 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1175782 (= lt!530519 (array!75988 (store (arr!36643 _values!996) i!673 (ValueCellFull!14085 lt!530517)) (size!37179 _values!996)))))

(declare-fun dynLambda!2920 (Int (_ BitVec 64)) V!44579)

(assert (=> b!1175782 (= lt!530517 (dynLambda!2920 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530512 () ListLongMap!16957)

(assert (=> b!1175782 (= lt!530512 (getCurrentListMapNoExtraKeys!4954 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175783 () Bool)

(declare-fun res!780889 () Bool)

(assert (=> b!1175783 (=> (not res!780889) (not e!668345))))

(assert (=> b!1175783 (= res!780889 (= (select (arr!36642 _keys!1208) i!673) k0!934))))

(declare-fun b!1175784 () Bool)

(assert (=> b!1175784 (= e!668350 e!668340)))

(declare-fun res!780900 () Bool)

(assert (=> b!1175784 (=> res!780900 e!668340)))

(assert (=> b!1175784 (= res!780900 (not (validKeyInArray!0 (select (arr!36642 _keys!1208) from!1455))))))

(declare-fun lt!530508 () ListLongMap!16957)

(assert (=> b!1175784 (= lt!530508 lt!530510)))

(declare-fun lt!530509 () ListLongMap!16957)

(declare-fun -!1549 (ListLongMap!16957 (_ BitVec 64)) ListLongMap!16957)

(assert (=> b!1175784 (= lt!530510 (-!1549 lt!530509 k0!934))))

(assert (=> b!1175784 (= lt!530508 (getCurrentListMapNoExtraKeys!4954 lt!530507 lt!530519 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175784 (= lt!530509 (getCurrentListMapNoExtraKeys!4954 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530520 () Unit!38801)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!776 (array!75985 array!75987 (_ BitVec 32) (_ BitVec 32) V!44579 V!44579 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38801)

(assert (=> b!1175784 (= lt!530520 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!776 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1175785 () Bool)

(declare-fun Unit!38804 () Unit!38801)

(assert (=> b!1175785 (= e!668344 Unit!38804)))

(declare-fun lt!530516 () Unit!38801)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75985 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38801)

(assert (=> b!1175785 (= lt!530516 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175785 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530518 () Unit!38801)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75985 (_ BitVec 32) (_ BitVec 32)) Unit!38801)

(assert (=> b!1175785 (= lt!530518 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25728 0))(
  ( (Nil!25725) (Cons!25724 (h!26933 (_ BitVec 64)) (t!37779 List!25728)) )
))
(declare-fun arrayNoDuplicates!0 (array!75985 (_ BitVec 32) List!25728) Bool)

(assert (=> b!1175785 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25725)))

(declare-fun lt!530511 () Unit!38801)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75985 (_ BitVec 64) (_ BitVec 32) List!25728) Unit!38801)

(assert (=> b!1175785 (= lt!530511 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25725))))

(assert (=> b!1175785 false))

(declare-fun mapIsEmpty!46211 () Bool)

(assert (=> mapIsEmpty!46211 mapRes!46211))

(declare-fun b!1175786 () Bool)

(assert (=> b!1175786 (= e!668347 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46211 () Bool)

(declare-fun tp!87890 () Bool)

(declare-fun e!668349 () Bool)

(assert (=> mapNonEmpty!46211 (= mapRes!46211 (and tp!87890 e!668349))))

(declare-fun mapKey!46211 () (_ BitVec 32))

(declare-fun mapRest!46211 () (Array (_ BitVec 32) ValueCell!14085))

(declare-fun mapValue!46211 () ValueCell!14085)

(assert (=> mapNonEmpty!46211 (= (arr!36643 _values!996) (store mapRest!46211 mapKey!46211 mapValue!46211))))

(declare-fun b!1175787 () Bool)

(declare-fun res!780901 () Bool)

(assert (=> b!1175787 (=> (not res!780901) (not e!668345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175787 (= res!780901 (validMask!0 mask!1564))))

(declare-fun b!1175788 () Bool)

(assert (=> b!1175788 (= e!668343 (not e!668346))))

(declare-fun res!780888 () Bool)

(assert (=> b!1175788 (=> res!780888 e!668346)))

(assert (=> b!1175788 (= res!780888 (bvsgt from!1455 i!673))))

(assert (=> b!1175788 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530515 () Unit!38801)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75985 (_ BitVec 64) (_ BitVec 32)) Unit!38801)

(assert (=> b!1175788 (= lt!530515 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175789 () Bool)

(declare-fun res!780899 () Bool)

(assert (=> b!1175789 (=> (not res!780899) (not e!668343))))

(assert (=> b!1175789 (= res!780899 (arrayNoDuplicates!0 lt!530507 #b00000000000000000000000000000000 Nil!25725))))

(declare-fun b!1175790 () Bool)

(declare-fun res!780891 () Bool)

(assert (=> b!1175790 (=> (not res!780891) (not e!668345))))

(assert (=> b!1175790 (= res!780891 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25725))))

(declare-fun b!1175791 () Bool)

(assert (=> b!1175791 (= e!668349 tp_is_empty!29589)))

(declare-fun b!1175792 () Bool)

(declare-fun res!780898 () Bool)

(assert (=> b!1175792 (=> (not res!780898) (not e!668345))))

(assert (=> b!1175792 (= res!780898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99480 res!780893) b!1175787))

(assert (= (and b!1175787 res!780901) b!1175781))

(assert (= (and b!1175781 res!780892) b!1175792))

(assert (= (and b!1175792 res!780898) b!1175790))

(assert (= (and b!1175790 res!780891) b!1175777))

(assert (= (and b!1175777 res!780894) b!1175775))

(assert (= (and b!1175775 res!780895) b!1175783))

(assert (= (and b!1175783 res!780889) b!1175776))

(assert (= (and b!1175776 res!780887) b!1175789))

(assert (= (and b!1175789 res!780899) b!1175788))

(assert (= (and b!1175788 (not res!780888)) b!1175782))

(assert (= (and b!1175782 (not res!780890)) b!1175784))

(assert (= (and b!1175784 (not res!780900)) b!1175774))

(assert (= (and b!1175774 res!780896) b!1175780))

(assert (= (and b!1175780 (not res!780897)) b!1175786))

(assert (= (and b!1175774 c!116712) b!1175785))

(assert (= (and b!1175774 (not c!116712)) b!1175779))

(assert (= (and b!1175778 condMapEmpty!46211) mapIsEmpty!46211))

(assert (= (and b!1175778 (not condMapEmpty!46211)) mapNonEmpty!46211))

(get-info :version)

(assert (= (and mapNonEmpty!46211 ((_ is ValueCellFull!14085) mapValue!46211)) b!1175791))

(assert (= (and b!1175778 ((_ is ValueCellFull!14085) mapDefault!46211)) b!1175773))

(assert (= start!99480 b!1175778))

(declare-fun b_lambda!20203 () Bool)

(assert (=> (not b_lambda!20203) (not b!1175782)))

(declare-fun t!37777 () Bool)

(declare-fun tb!9871 () Bool)

(assert (=> (and start!99480 (= defaultEntry!1004 defaultEntry!1004) t!37777) tb!9871))

(declare-fun result!20309 () Bool)

(assert (=> tb!9871 (= result!20309 tp_is_empty!29589)))

(assert (=> b!1175782 t!37777))

(declare-fun b_and!40987 () Bool)

(assert (= b_and!40985 (and (=> t!37777 result!20309) b_and!40987)))

(declare-fun m!1083691 () Bool)

(assert (=> b!1175780 m!1083691))

(declare-fun m!1083693 () Bool)

(assert (=> b!1175782 m!1083693))

(declare-fun m!1083695 () Bool)

(assert (=> b!1175782 m!1083695))

(declare-fun m!1083697 () Bool)

(assert (=> b!1175782 m!1083697))

(declare-fun m!1083699 () Bool)

(assert (=> b!1175782 m!1083699))

(declare-fun m!1083701 () Bool)

(assert (=> b!1175788 m!1083701))

(declare-fun m!1083703 () Bool)

(assert (=> b!1175788 m!1083703))

(declare-fun m!1083705 () Bool)

(assert (=> b!1175792 m!1083705))

(declare-fun m!1083707 () Bool)

(assert (=> b!1175786 m!1083707))

(declare-fun m!1083709 () Bool)

(assert (=> b!1175787 m!1083709))

(declare-fun m!1083711 () Bool)

(assert (=> mapNonEmpty!46211 m!1083711))

(declare-fun m!1083713 () Bool)

(assert (=> b!1175783 m!1083713))

(declare-fun m!1083715 () Bool)

(assert (=> b!1175790 m!1083715))

(declare-fun m!1083717 () Bool)

(assert (=> b!1175785 m!1083717))

(declare-fun m!1083719 () Bool)

(assert (=> b!1175785 m!1083719))

(declare-fun m!1083721 () Bool)

(assert (=> b!1175785 m!1083721))

(declare-fun m!1083723 () Bool)

(assert (=> b!1175785 m!1083723))

(declare-fun m!1083725 () Bool)

(assert (=> b!1175785 m!1083725))

(declare-fun m!1083727 () Bool)

(assert (=> b!1175775 m!1083727))

(declare-fun m!1083729 () Bool)

(assert (=> start!99480 m!1083729))

(declare-fun m!1083731 () Bool)

(assert (=> start!99480 m!1083731))

(assert (=> b!1175774 m!1083691))

(declare-fun m!1083733 () Bool)

(assert (=> b!1175774 m!1083733))

(assert (=> b!1175774 m!1083733))

(declare-fun m!1083735 () Bool)

(assert (=> b!1175774 m!1083735))

(declare-fun m!1083737 () Bool)

(assert (=> b!1175774 m!1083737))

(declare-fun m!1083739 () Bool)

(assert (=> b!1175776 m!1083739))

(declare-fun m!1083741 () Bool)

(assert (=> b!1175776 m!1083741))

(declare-fun m!1083743 () Bool)

(assert (=> b!1175784 m!1083743))

(declare-fun m!1083745 () Bool)

(assert (=> b!1175784 m!1083745))

(declare-fun m!1083747 () Bool)

(assert (=> b!1175784 m!1083747))

(assert (=> b!1175784 m!1083691))

(declare-fun m!1083749 () Bool)

(assert (=> b!1175784 m!1083749))

(declare-fun m!1083751 () Bool)

(assert (=> b!1175784 m!1083751))

(assert (=> b!1175784 m!1083691))

(declare-fun m!1083753 () Bool)

(assert (=> b!1175789 m!1083753))

(check-sat (not b!1175789) b_and!40987 (not b_lambda!20203) (not b!1175792) (not b!1175787) (not b!1175775) (not b!1175788) (not b!1175774) (not b!1175785) (not b!1175790) tp_is_empty!29589 (not b!1175784) (not b!1175782) (not b!1175776) (not b!1175786) (not b_next!25059) (not start!99480) (not mapNonEmpty!46211))
(check-sat b_and!40987 (not b_next!25059))
