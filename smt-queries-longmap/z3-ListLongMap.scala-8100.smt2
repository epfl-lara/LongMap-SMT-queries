; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99702 () Bool)

(assert start!99702)

(declare-fun b_free!25045 () Bool)

(declare-fun b_next!25045 () Bool)

(assert (=> start!99702 (= b_free!25045 (not b_next!25045))))

(declare-fun tp!87848 () Bool)

(declare-fun b_and!40959 () Bool)

(assert (=> start!99702 (= tp!87848 b_and!40959)))

(declare-fun b!1176628 () Bool)

(declare-fun e!668922 () Bool)

(declare-fun e!668930 () Bool)

(assert (=> b!1176628 (= e!668922 e!668930)))

(declare-fun res!781090 () Bool)

(assert (=> b!1176628 (=> res!781090 e!668930)))

(declare-datatypes ((array!76011 0))(
  ( (array!76012 (arr!36649 (Array (_ BitVec 32) (_ BitVec 64))) (size!37186 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76011)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1176628 (= res!781090 (not (= (select (arr!36649 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176629 () Bool)

(declare-fun res!781083 () Bool)

(declare-fun e!668923 () Bool)

(assert (=> b!1176629 (=> (not res!781083) (not e!668923))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1176629 (= res!781083 (= (select (arr!36649 _keys!1208) i!673) k0!934))))

(declare-fun b!1176630 () Bool)

(declare-fun res!781085 () Bool)

(assert (=> b!1176630 (=> (not res!781085) (not e!668923))))

(assert (=> b!1176630 (= res!781085 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37186 _keys!1208))))))

(declare-fun b!1176631 () Bool)

(declare-fun e!668924 () Bool)

(declare-fun e!668926 () Bool)

(assert (=> b!1176631 (= e!668924 e!668926)))

(declare-fun res!781088 () Bool)

(assert (=> b!1176631 (=> res!781088 e!668926)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176631 (= res!781088 (not (validKeyInArray!0 (select (arr!36649 _keys!1208) from!1455))))))

(declare-datatypes ((V!44561 0))(
  ( (V!44562 (val!14844 Int)) )
))
(declare-datatypes ((tuple2!19022 0))(
  ( (tuple2!19023 (_1!9522 (_ BitVec 64)) (_2!9522 V!44561)) )
))
(declare-datatypes ((List!25756 0))(
  ( (Nil!25753) (Cons!25752 (h!26970 tuple2!19022) (t!37785 List!25756)) )
))
(declare-datatypes ((ListLongMap!16999 0))(
  ( (ListLongMap!17000 (toList!8515 List!25756)) )
))
(declare-fun lt!530706 () ListLongMap!16999)

(declare-fun lt!530708 () ListLongMap!16999)

(assert (=> b!1176631 (= lt!530706 lt!530708)))

(declare-fun lt!530700 () ListLongMap!16999)

(declare-fun -!1556 (ListLongMap!16999 (_ BitVec 64)) ListLongMap!16999)

(assert (=> b!1176631 (= lt!530708 (-!1556 lt!530700 k0!934))))

(declare-fun zeroValue!944 () V!44561)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!530701 () array!76011)

(declare-fun minValue!944 () V!44561)

(declare-datatypes ((ValueCell!14078 0))(
  ( (ValueCellFull!14078 (v!17478 V!44561)) (EmptyCell!14078) )
))
(declare-datatypes ((array!76013 0))(
  ( (array!76014 (arr!36650 (Array (_ BitVec 32) ValueCell!14078)) (size!37187 (_ BitVec 32))) )
))
(declare-fun lt!530702 () array!76013)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4997 (array!76011 array!76013 (_ BitVec 32) (_ BitVec 32) V!44561 V!44561 (_ BitVec 32) Int) ListLongMap!16999)

(assert (=> b!1176631 (= lt!530706 (getCurrentListMapNoExtraKeys!4997 lt!530701 lt!530702 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76013)

(assert (=> b!1176631 (= lt!530700 (getCurrentListMapNoExtraKeys!4997 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38781 0))(
  ( (Unit!38782) )
))
(declare-fun lt!530703 () Unit!38781)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!781 (array!76011 array!76013 (_ BitVec 32) (_ BitVec 32) V!44561 V!44561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38781)

(assert (=> b!1176631 (= lt!530703 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!781 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176632 () Bool)

(declare-fun arrayContainsKey!0 (array!76011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176632 (= e!668930 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176633 () Bool)

(assert (=> b!1176633 (= e!668926 true)))

(assert (=> b!1176633 (not (= (select (arr!36649 _keys!1208) from!1455) k0!934))))

(declare-fun lt!530698 () Unit!38781)

(declare-fun e!668919 () Unit!38781)

(assert (=> b!1176633 (= lt!530698 e!668919)))

(declare-fun c!117089 () Bool)

(assert (=> b!1176633 (= c!117089 (= (select (arr!36649 _keys!1208) from!1455) k0!934))))

(assert (=> b!1176633 e!668922))

(declare-fun res!781093 () Bool)

(assert (=> b!1176633 (=> (not res!781093) (not e!668922))))

(declare-fun lt!530697 () ListLongMap!16999)

(declare-fun lt!530709 () V!44561)

(declare-fun +!3847 (ListLongMap!16999 tuple2!19022) ListLongMap!16999)

(declare-fun get!18747 (ValueCell!14078 V!44561) V!44561)

(assert (=> b!1176633 (= res!781093 (= lt!530697 (+!3847 lt!530708 (tuple2!19023 (select (arr!36649 _keys!1208) from!1455) (get!18747 (select (arr!36650 _values!996) from!1455) lt!530709)))))))

(declare-fun b!1176634 () Bool)

(declare-fun res!781087 () Bool)

(declare-fun e!668920 () Bool)

(assert (=> b!1176634 (=> (not res!781087) (not e!668920))))

(declare-datatypes ((List!25757 0))(
  ( (Nil!25754) (Cons!25753 (h!26971 (_ BitVec 64)) (t!37786 List!25757)) )
))
(declare-fun arrayNoDuplicates!0 (array!76011 (_ BitVec 32) List!25757) Bool)

(assert (=> b!1176634 (= res!781087 (arrayNoDuplicates!0 lt!530701 #b00000000000000000000000000000000 Nil!25754))))

(declare-fun mapIsEmpty!46190 () Bool)

(declare-fun mapRes!46190 () Bool)

(assert (=> mapIsEmpty!46190 mapRes!46190))

(declare-fun b!1176635 () Bool)

(declare-fun res!781080 () Bool)

(assert (=> b!1176635 (=> (not res!781080) (not e!668923))))

(assert (=> b!1176635 (= res!781080 (and (= (size!37187 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37186 _keys!1208) (size!37187 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176637 () Bool)

(declare-fun Unit!38783 () Unit!38781)

(assert (=> b!1176637 (= e!668919 Unit!38783)))

(declare-fun b!1176638 () Bool)

(declare-fun e!668929 () Bool)

(declare-fun tp_is_empty!29575 () Bool)

(assert (=> b!1176638 (= e!668929 tp_is_empty!29575)))

(declare-fun b!1176639 () Bool)

(declare-fun e!668928 () Bool)

(assert (=> b!1176639 (= e!668920 (not e!668928))))

(declare-fun res!781086 () Bool)

(assert (=> b!1176639 (=> res!781086 e!668928)))

(assert (=> b!1176639 (= res!781086 (bvsgt from!1455 i!673))))

(assert (=> b!1176639 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530710 () Unit!38781)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76011 (_ BitVec 64) (_ BitVec 32)) Unit!38781)

(assert (=> b!1176639 (= lt!530710 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176640 () Bool)

(assert (=> b!1176640 (= e!668923 e!668920)))

(declare-fun res!781094 () Bool)

(assert (=> b!1176640 (=> (not res!781094) (not e!668920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76011 (_ BitVec 32)) Bool)

(assert (=> b!1176640 (= res!781094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530701 mask!1564))))

(assert (=> b!1176640 (= lt!530701 (array!76012 (store (arr!36649 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37186 _keys!1208)))))

(declare-fun mapNonEmpty!46190 () Bool)

(declare-fun tp!87849 () Bool)

(assert (=> mapNonEmpty!46190 (= mapRes!46190 (and tp!87849 e!668929))))

(declare-fun mapRest!46190 () (Array (_ BitVec 32) ValueCell!14078))

(declare-fun mapKey!46190 () (_ BitVec 32))

(declare-fun mapValue!46190 () ValueCell!14078)

(assert (=> mapNonEmpty!46190 (= (arr!36650 _values!996) (store mapRest!46190 mapKey!46190 mapValue!46190))))

(declare-fun b!1176641 () Bool)

(declare-fun res!781082 () Bool)

(assert (=> b!1176641 (=> (not res!781082) (not e!668923))))

(assert (=> b!1176641 (= res!781082 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25754))))

(declare-fun b!1176642 () Bool)

(declare-fun e!668921 () Bool)

(declare-fun e!668925 () Bool)

(assert (=> b!1176642 (= e!668921 (and e!668925 mapRes!46190))))

(declare-fun condMapEmpty!46190 () Bool)

(declare-fun mapDefault!46190 () ValueCell!14078)

(assert (=> b!1176642 (= condMapEmpty!46190 (= (arr!36650 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14078)) mapDefault!46190)))))

(declare-fun b!1176643 () Bool)

(assert (=> b!1176643 (= e!668925 tp_is_empty!29575)))

(declare-fun b!1176644 () Bool)

(declare-fun res!781084 () Bool)

(assert (=> b!1176644 (=> (not res!781084) (not e!668923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176644 (= res!781084 (validMask!0 mask!1564))))

(declare-fun b!1176645 () Bool)

(assert (=> b!1176645 (= e!668928 e!668924)))

(declare-fun res!781092 () Bool)

(assert (=> b!1176645 (=> res!781092 e!668924)))

(assert (=> b!1176645 (= res!781092 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1176645 (= lt!530697 (getCurrentListMapNoExtraKeys!4997 lt!530701 lt!530702 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1176645 (= lt!530702 (array!76014 (store (arr!36650 _values!996) i!673 (ValueCellFull!14078 lt!530709)) (size!37187 _values!996)))))

(declare-fun dynLambda!2975 (Int (_ BitVec 64)) V!44561)

(assert (=> b!1176645 (= lt!530709 (dynLambda!2975 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530707 () ListLongMap!16999)

(assert (=> b!1176645 (= lt!530707 (getCurrentListMapNoExtraKeys!4997 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176646 () Bool)

(declare-fun res!781081 () Bool)

(assert (=> b!1176646 (=> (not res!781081) (not e!668923))))

(assert (=> b!1176646 (= res!781081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176647 () Bool)

(declare-fun Unit!38784 () Unit!38781)

(assert (=> b!1176647 (= e!668919 Unit!38784)))

(declare-fun lt!530699 () Unit!38781)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76011 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38781)

(assert (=> b!1176647 (= lt!530699 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1176647 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530704 () Unit!38781)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76011 (_ BitVec 32) (_ BitVec 32)) Unit!38781)

(assert (=> b!1176647 (= lt!530704 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1176647 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25754)))

(declare-fun lt!530705 () Unit!38781)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76011 (_ BitVec 64) (_ BitVec 32) List!25757) Unit!38781)

(assert (=> b!1176647 (= lt!530705 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25754))))

(assert (=> b!1176647 false))

(declare-fun res!781091 () Bool)

(assert (=> start!99702 (=> (not res!781091) (not e!668923))))

(assert (=> start!99702 (= res!781091 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37186 _keys!1208))))))

(assert (=> start!99702 e!668923))

(assert (=> start!99702 tp_is_empty!29575))

(declare-fun array_inv!28072 (array!76011) Bool)

(assert (=> start!99702 (array_inv!28072 _keys!1208)))

(assert (=> start!99702 true))

(assert (=> start!99702 tp!87848))

(declare-fun array_inv!28073 (array!76013) Bool)

(assert (=> start!99702 (and (array_inv!28073 _values!996) e!668921)))

(declare-fun b!1176636 () Bool)

(declare-fun res!781089 () Bool)

(assert (=> b!1176636 (=> (not res!781089) (not e!668923))))

(assert (=> b!1176636 (= res!781089 (validKeyInArray!0 k0!934))))

(assert (= (and start!99702 res!781091) b!1176644))

(assert (= (and b!1176644 res!781084) b!1176635))

(assert (= (and b!1176635 res!781080) b!1176646))

(assert (= (and b!1176646 res!781081) b!1176641))

(assert (= (and b!1176641 res!781082) b!1176630))

(assert (= (and b!1176630 res!781085) b!1176636))

(assert (= (and b!1176636 res!781089) b!1176629))

(assert (= (and b!1176629 res!781083) b!1176640))

(assert (= (and b!1176640 res!781094) b!1176634))

(assert (= (and b!1176634 res!781087) b!1176639))

(assert (= (and b!1176639 (not res!781086)) b!1176645))

(assert (= (and b!1176645 (not res!781092)) b!1176631))

(assert (= (and b!1176631 (not res!781088)) b!1176633))

(assert (= (and b!1176633 res!781093) b!1176628))

(assert (= (and b!1176628 (not res!781090)) b!1176632))

(assert (= (and b!1176633 c!117089) b!1176647))

(assert (= (and b!1176633 (not c!117089)) b!1176637))

(assert (= (and b!1176642 condMapEmpty!46190) mapIsEmpty!46190))

(assert (= (and b!1176642 (not condMapEmpty!46190)) mapNonEmpty!46190))

(get-info :version)

(assert (= (and mapNonEmpty!46190 ((_ is ValueCellFull!14078) mapValue!46190)) b!1176638))

(assert (= (and b!1176642 ((_ is ValueCellFull!14078) mapDefault!46190)) b!1176643))

(assert (= start!99702 b!1176642))

(declare-fun b_lambda!20183 () Bool)

(assert (=> (not b_lambda!20183) (not b!1176645)))

(declare-fun t!37784 () Bool)

(declare-fun tb!9849 () Bool)

(assert (=> (and start!99702 (= defaultEntry!1004 defaultEntry!1004) t!37784) tb!9849))

(declare-fun result!20273 () Bool)

(assert (=> tb!9849 (= result!20273 tp_is_empty!29575)))

(assert (=> b!1176645 t!37784))

(declare-fun b_and!40961 () Bool)

(assert (= b_and!40959 (and (=> t!37784 result!20273) b_and!40961)))

(declare-fun m!1084815 () Bool)

(assert (=> b!1176631 m!1084815))

(declare-fun m!1084817 () Bool)

(assert (=> b!1176631 m!1084817))

(declare-fun m!1084819 () Bool)

(assert (=> b!1176631 m!1084819))

(declare-fun m!1084821 () Bool)

(assert (=> b!1176631 m!1084821))

(declare-fun m!1084823 () Bool)

(assert (=> b!1176631 m!1084823))

(declare-fun m!1084825 () Bool)

(assert (=> b!1176631 m!1084825))

(assert (=> b!1176631 m!1084823))

(declare-fun m!1084827 () Bool)

(assert (=> b!1176640 m!1084827))

(declare-fun m!1084829 () Bool)

(assert (=> b!1176640 m!1084829))

(declare-fun m!1084831 () Bool)

(assert (=> b!1176632 m!1084831))

(declare-fun m!1084833 () Bool)

(assert (=> b!1176641 m!1084833))

(declare-fun m!1084835 () Bool)

(assert (=> b!1176636 m!1084835))

(assert (=> b!1176633 m!1084823))

(declare-fun m!1084837 () Bool)

(assert (=> b!1176633 m!1084837))

(assert (=> b!1176633 m!1084837))

(declare-fun m!1084839 () Bool)

(assert (=> b!1176633 m!1084839))

(declare-fun m!1084841 () Bool)

(assert (=> b!1176633 m!1084841))

(declare-fun m!1084843 () Bool)

(assert (=> b!1176639 m!1084843))

(declare-fun m!1084845 () Bool)

(assert (=> b!1176639 m!1084845))

(declare-fun m!1084847 () Bool)

(assert (=> b!1176644 m!1084847))

(declare-fun m!1084849 () Bool)

(assert (=> b!1176646 m!1084849))

(declare-fun m!1084851 () Bool)

(assert (=> b!1176634 m!1084851))

(declare-fun m!1084853 () Bool)

(assert (=> b!1176647 m!1084853))

(declare-fun m!1084855 () Bool)

(assert (=> b!1176647 m!1084855))

(declare-fun m!1084857 () Bool)

(assert (=> b!1176647 m!1084857))

(declare-fun m!1084859 () Bool)

(assert (=> b!1176647 m!1084859))

(declare-fun m!1084861 () Bool)

(assert (=> b!1176647 m!1084861))

(declare-fun m!1084863 () Bool)

(assert (=> b!1176629 m!1084863))

(declare-fun m!1084865 () Bool)

(assert (=> start!99702 m!1084865))

(declare-fun m!1084867 () Bool)

(assert (=> start!99702 m!1084867))

(assert (=> b!1176628 m!1084823))

(declare-fun m!1084869 () Bool)

(assert (=> b!1176645 m!1084869))

(declare-fun m!1084871 () Bool)

(assert (=> b!1176645 m!1084871))

(declare-fun m!1084873 () Bool)

(assert (=> b!1176645 m!1084873))

(declare-fun m!1084875 () Bool)

(assert (=> b!1176645 m!1084875))

(declare-fun m!1084877 () Bool)

(assert (=> mapNonEmpty!46190 m!1084877))

(check-sat (not b!1176639) (not start!99702) (not b!1176633) (not b!1176636) (not b!1176641) b_and!40961 (not b!1176647) (not b_next!25045) (not b!1176632) (not b!1176644) (not b!1176646) (not b!1176634) (not b!1176640) (not b_lambda!20183) tp_is_empty!29575 (not mapNonEmpty!46190) (not b!1176631) (not b!1176645))
(check-sat b_and!40961 (not b_next!25045))
