; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99828 () Bool)

(assert start!99828)

(declare-fun b_free!25171 () Bool)

(declare-fun b_next!25171 () Bool)

(assert (=> start!99828 (= b_free!25171 (not b_next!25171))))

(declare-fun tp!88226 () Bool)

(declare-fun b_and!41211 () Bool)

(assert (=> start!99828 (= tp!88226 b_and!41211)))

(declare-fun res!784082 () Bool)

(declare-fun e!671349 () Bool)

(assert (=> start!99828 (=> (not res!784082) (not e!671349))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76255 0))(
  ( (array!76256 (arr!36771 (Array (_ BitVec 32) (_ BitVec 64))) (size!37308 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76255)

(assert (=> start!99828 (= res!784082 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37308 _keys!1208))))))

(assert (=> start!99828 e!671349))

(declare-fun tp_is_empty!29701 () Bool)

(assert (=> start!99828 tp_is_empty!29701))

(declare-fun array_inv!28154 (array!76255) Bool)

(assert (=> start!99828 (array_inv!28154 _keys!1208)))

(assert (=> start!99828 true))

(assert (=> start!99828 tp!88226))

(declare-datatypes ((V!44729 0))(
  ( (V!44730 (val!14907 Int)) )
))
(declare-datatypes ((ValueCell!14141 0))(
  ( (ValueCellFull!14141 (v!17541 V!44729)) (EmptyCell!14141) )
))
(declare-datatypes ((array!76257 0))(
  ( (array!76258 (arr!36772 (Array (_ BitVec 32) ValueCell!14141)) (size!37309 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76257)

(declare-fun e!671353 () Bool)

(declare-fun array_inv!28155 (array!76257) Bool)

(assert (=> start!99828 (and (array_inv!28155 _values!996) e!671353)))

(declare-fun b!1180689 () Bool)

(declare-fun e!671354 () Bool)

(assert (=> b!1180689 (= e!671354 tp_is_empty!29701)))

(declare-fun b!1180690 () Bool)

(declare-datatypes ((tuple2!19130 0))(
  ( (tuple2!19131 (_1!9576 (_ BitVec 64)) (_2!9576 V!44729)) )
))
(declare-datatypes ((List!25860 0))(
  ( (Nil!25857) (Cons!25856 (h!27074 tuple2!19130) (t!38015 List!25860)) )
))
(declare-datatypes ((ListLongMap!17107 0))(
  ( (ListLongMap!17108 (toList!8569 List!25860)) )
))
(declare-fun lt!533500 () ListLongMap!17107)

(declare-fun lt!533499 () tuple2!19130)

(declare-fun e!671344 () Bool)

(declare-fun lt!533498 () ListLongMap!17107)

(declare-fun +!3894 (ListLongMap!17107 tuple2!19130) ListLongMap!17107)

(assert (=> b!1180690 (= e!671344 (= lt!533500 (+!3894 lt!533498 lt!533499)))))

(declare-fun mapNonEmpty!46379 () Bool)

(declare-fun mapRes!46379 () Bool)

(declare-fun tp!88227 () Bool)

(assert (=> mapNonEmpty!46379 (= mapRes!46379 (and tp!88227 e!671354))))

(declare-fun mapRest!46379 () (Array (_ BitVec 32) ValueCell!14141))

(declare-fun mapValue!46379 () ValueCell!14141)

(declare-fun mapKey!46379 () (_ BitVec 32))

(assert (=> mapNonEmpty!46379 (= (arr!36772 _values!996) (store mapRest!46379 mapKey!46379 mapValue!46379))))

(declare-fun b!1180691 () Bool)

(declare-fun res!784074 () Bool)

(assert (=> b!1180691 (=> (not res!784074) (not e!671349))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1180691 (= res!784074 (= (select (arr!36771 _keys!1208) i!673) k0!934))))

(declare-fun b!1180692 () Bool)

(declare-datatypes ((Unit!38974 0))(
  ( (Unit!38975) )
))
(declare-fun e!671347 () Unit!38974)

(declare-fun Unit!38976 () Unit!38974)

(assert (=> b!1180692 (= e!671347 Unit!38976)))

(declare-fun b!1180693 () Bool)

(declare-fun res!784081 () Bool)

(assert (=> b!1180693 (=> (not res!784081) (not e!671349))))

(declare-datatypes ((List!25861 0))(
  ( (Nil!25858) (Cons!25857 (h!27075 (_ BitVec 64)) (t!38016 List!25861)) )
))
(declare-fun arrayNoDuplicates!0 (array!76255 (_ BitVec 32) List!25861) Bool)

(assert (=> b!1180693 (= res!784081 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25858))))

(declare-fun b!1180694 () Bool)

(declare-fun Unit!38977 () Unit!38974)

(assert (=> b!1180694 (= e!671347 Unit!38977)))

(declare-fun lt!533512 () Unit!38974)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76255 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38974)

(assert (=> b!1180694 (= lt!533512 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180694 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533503 () Unit!38974)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76255 (_ BitVec 32) (_ BitVec 32)) Unit!38974)

(assert (=> b!1180694 (= lt!533503 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1180694 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25858)))

(declare-fun lt!533510 () Unit!38974)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76255 (_ BitVec 64) (_ BitVec 32) List!25861) Unit!38974)

(assert (=> b!1180694 (= lt!533510 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25858))))

(assert (=> b!1180694 false))

(declare-fun b!1180695 () Bool)

(declare-fun res!784073 () Bool)

(assert (=> b!1180695 (=> (not res!784073) (not e!671349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180695 (= res!784073 (validKeyInArray!0 k0!934))))

(declare-fun b!1180696 () Bool)

(declare-fun e!671348 () Bool)

(assert (=> b!1180696 (= e!671353 (and e!671348 mapRes!46379))))

(declare-fun condMapEmpty!46379 () Bool)

(declare-fun mapDefault!46379 () ValueCell!14141)

(assert (=> b!1180696 (= condMapEmpty!46379 (= (arr!36772 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14141)) mapDefault!46379)))))

(declare-fun b!1180697 () Bool)

(declare-fun res!784085 () Bool)

(assert (=> b!1180697 (=> (not res!784085) (not e!671349))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1180697 (= res!784085 (and (= (size!37309 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37308 _keys!1208) (size!37309 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180698 () Bool)

(declare-fun e!671346 () Bool)

(assert (=> b!1180698 (= e!671346 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37308 _keys!1208))))))

(assert (=> b!1180698 e!671344))

(declare-fun res!784080 () Bool)

(assert (=> b!1180698 (=> (not res!784080) (not e!671344))))

(assert (=> b!1180698 (= res!784080 (not (= (select (arr!36771 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533506 () Unit!38974)

(assert (=> b!1180698 (= lt!533506 e!671347)))

(declare-fun c!117278 () Bool)

(assert (=> b!1180698 (= c!117278 (= (select (arr!36771 _keys!1208) from!1455) k0!934))))

(declare-fun e!671350 () Bool)

(assert (=> b!1180698 e!671350))

(declare-fun res!784083 () Bool)

(assert (=> b!1180698 (=> (not res!784083) (not e!671350))))

(declare-fun lt!533502 () ListLongMap!17107)

(declare-fun lt!533509 () ListLongMap!17107)

(assert (=> b!1180698 (= res!784083 (= lt!533509 (+!3894 lt!533502 lt!533499)))))

(declare-fun lt!533504 () V!44729)

(declare-fun get!18832 (ValueCell!14141 V!44729) V!44729)

(assert (=> b!1180698 (= lt!533499 (tuple2!19131 (select (arr!36771 _keys!1208) from!1455) (get!18832 (select (arr!36772 _values!996) from!1455) lt!533504)))))

(declare-fun b!1180699 () Bool)

(declare-fun e!671345 () Bool)

(assert (=> b!1180699 (= e!671345 e!671346)))

(declare-fun res!784072 () Bool)

(assert (=> b!1180699 (=> res!784072 e!671346)))

(assert (=> b!1180699 (= res!784072 (not (validKeyInArray!0 (select (arr!36771 _keys!1208) from!1455))))))

(declare-fun lt!533505 () ListLongMap!17107)

(assert (=> b!1180699 (= lt!533505 lt!533502)))

(declare-fun -!1599 (ListLongMap!17107 (_ BitVec 64)) ListLongMap!17107)

(assert (=> b!1180699 (= lt!533502 (-!1599 lt!533498 k0!934))))

(declare-fun zeroValue!944 () V!44729)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!533501 () array!76255)

(declare-fun minValue!944 () V!44729)

(declare-fun lt!533511 () array!76257)

(declare-fun getCurrentListMapNoExtraKeys!5048 (array!76255 array!76257 (_ BitVec 32) (_ BitVec 32) V!44729 V!44729 (_ BitVec 32) Int) ListLongMap!17107)

(assert (=> b!1180699 (= lt!533505 (getCurrentListMapNoExtraKeys!5048 lt!533501 lt!533511 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180699 (= lt!533498 (getCurrentListMapNoExtraKeys!5048 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533507 () Unit!38974)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!824 (array!76255 array!76257 (_ BitVec 32) (_ BitVec 32) V!44729 V!44729 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38974)

(assert (=> b!1180699 (= lt!533507 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!824 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180700 () Bool)

(declare-fun res!784078 () Bool)

(assert (=> b!1180700 (=> (not res!784078) (not e!671349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76255 (_ BitVec 32)) Bool)

(assert (=> b!1180700 (= res!784078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180701 () Bool)

(declare-fun res!784075 () Bool)

(assert (=> b!1180701 (=> (not res!784075) (not e!671349))))

(assert (=> b!1180701 (= res!784075 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37308 _keys!1208))))))

(declare-fun b!1180702 () Bool)

(declare-fun res!784071 () Bool)

(assert (=> b!1180702 (=> (not res!784071) (not e!671349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180702 (= res!784071 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46379 () Bool)

(assert (=> mapIsEmpty!46379 mapRes!46379))

(declare-fun b!1180703 () Bool)

(assert (=> b!1180703 (= e!671348 tp_is_empty!29701)))

(declare-fun b!1180704 () Bool)

(declare-fun e!671352 () Bool)

(assert (=> b!1180704 (= e!671352 e!671345)))

(declare-fun res!784076 () Bool)

(assert (=> b!1180704 (=> res!784076 e!671345)))

(assert (=> b!1180704 (= res!784076 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1180704 (= lt!533509 (getCurrentListMapNoExtraKeys!5048 lt!533501 lt!533511 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1180704 (= lt!533511 (array!76258 (store (arr!36772 _values!996) i!673 (ValueCellFull!14141 lt!533504)) (size!37309 _values!996)))))

(declare-fun dynLambda!3017 (Int (_ BitVec 64)) V!44729)

(assert (=> b!1180704 (= lt!533504 (dynLambda!3017 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1180704 (= lt!533500 (getCurrentListMapNoExtraKeys!5048 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180705 () Bool)

(declare-fun e!671351 () Bool)

(assert (=> b!1180705 (= e!671349 e!671351)))

(declare-fun res!784077 () Bool)

(assert (=> b!1180705 (=> (not res!784077) (not e!671351))))

(assert (=> b!1180705 (= res!784077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533501 mask!1564))))

(assert (=> b!1180705 (= lt!533501 (array!76256 (store (arr!36771 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37308 _keys!1208)))))

(declare-fun b!1180706 () Bool)

(assert (=> b!1180706 (= e!671351 (not e!671352))))

(declare-fun res!784079 () Bool)

(assert (=> b!1180706 (=> res!784079 e!671352)))

(assert (=> b!1180706 (= res!784079 (bvsgt from!1455 i!673))))

(assert (=> b!1180706 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533508 () Unit!38974)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76255 (_ BitVec 64) (_ BitVec 32)) Unit!38974)

(assert (=> b!1180706 (= lt!533508 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180707 () Bool)

(declare-fun res!784084 () Bool)

(assert (=> b!1180707 (=> (not res!784084) (not e!671351))))

(assert (=> b!1180707 (= res!784084 (arrayNoDuplicates!0 lt!533501 #b00000000000000000000000000000000 Nil!25858))))

(declare-fun e!671343 () Bool)

(declare-fun b!1180708 () Bool)

(assert (=> b!1180708 (= e!671343 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180709 () Bool)

(assert (=> b!1180709 (= e!671350 e!671343)))

(declare-fun res!784070 () Bool)

(assert (=> b!1180709 (=> res!784070 e!671343)))

(assert (=> b!1180709 (= res!784070 (not (= (select (arr!36771 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!99828 res!784082) b!1180702))

(assert (= (and b!1180702 res!784071) b!1180697))

(assert (= (and b!1180697 res!784085) b!1180700))

(assert (= (and b!1180700 res!784078) b!1180693))

(assert (= (and b!1180693 res!784081) b!1180701))

(assert (= (and b!1180701 res!784075) b!1180695))

(assert (= (and b!1180695 res!784073) b!1180691))

(assert (= (and b!1180691 res!784074) b!1180705))

(assert (= (and b!1180705 res!784077) b!1180707))

(assert (= (and b!1180707 res!784084) b!1180706))

(assert (= (and b!1180706 (not res!784079)) b!1180704))

(assert (= (and b!1180704 (not res!784076)) b!1180699))

(assert (= (and b!1180699 (not res!784072)) b!1180698))

(assert (= (and b!1180698 res!784083) b!1180709))

(assert (= (and b!1180709 (not res!784070)) b!1180708))

(assert (= (and b!1180698 c!117278) b!1180694))

(assert (= (and b!1180698 (not c!117278)) b!1180692))

(assert (= (and b!1180698 res!784080) b!1180690))

(assert (= (and b!1180696 condMapEmpty!46379) mapIsEmpty!46379))

(assert (= (and b!1180696 (not condMapEmpty!46379)) mapNonEmpty!46379))

(get-info :version)

(assert (= (and mapNonEmpty!46379 ((_ is ValueCellFull!14141) mapValue!46379)) b!1180689))

(assert (= (and b!1180696 ((_ is ValueCellFull!14141) mapDefault!46379)) b!1180703))

(assert (= start!99828 b!1180696))

(declare-fun b_lambda!20309 () Bool)

(assert (=> (not b_lambda!20309) (not b!1180704)))

(declare-fun t!38014 () Bool)

(declare-fun tb!9975 () Bool)

(assert (=> (and start!99828 (= defaultEntry!1004 defaultEntry!1004) t!38014) tb!9975))

(declare-fun result!20525 () Bool)

(assert (=> tb!9975 (= result!20525 tp_is_empty!29701)))

(assert (=> b!1180704 t!38014))

(declare-fun b_and!41213 () Bool)

(assert (= b_and!41211 (and (=> t!38014 result!20525) b_and!41213)))

(declare-fun m!1088949 () Bool)

(assert (=> b!1180694 m!1088949))

(declare-fun m!1088951 () Bool)

(assert (=> b!1180694 m!1088951))

(declare-fun m!1088953 () Bool)

(assert (=> b!1180694 m!1088953))

(declare-fun m!1088955 () Bool)

(assert (=> b!1180694 m!1088955))

(declare-fun m!1088957 () Bool)

(assert (=> b!1180694 m!1088957))

(declare-fun m!1088959 () Bool)

(assert (=> b!1180690 m!1088959))

(declare-fun m!1088961 () Bool)

(assert (=> b!1180700 m!1088961))

(declare-fun m!1088963 () Bool)

(assert (=> b!1180693 m!1088963))

(declare-fun m!1088965 () Bool)

(assert (=> b!1180691 m!1088965))

(declare-fun m!1088967 () Bool)

(assert (=> b!1180709 m!1088967))

(declare-fun m!1088969 () Bool)

(assert (=> b!1180699 m!1088969))

(declare-fun m!1088971 () Bool)

(assert (=> b!1180699 m!1088971))

(declare-fun m!1088973 () Bool)

(assert (=> b!1180699 m!1088973))

(declare-fun m!1088975 () Bool)

(assert (=> b!1180699 m!1088975))

(assert (=> b!1180699 m!1088967))

(declare-fun m!1088977 () Bool)

(assert (=> b!1180699 m!1088977))

(assert (=> b!1180699 m!1088967))

(declare-fun m!1088979 () Bool)

(assert (=> b!1180707 m!1088979))

(declare-fun m!1088981 () Bool)

(assert (=> b!1180706 m!1088981))

(declare-fun m!1088983 () Bool)

(assert (=> b!1180706 m!1088983))

(declare-fun m!1088985 () Bool)

(assert (=> b!1180702 m!1088985))

(declare-fun m!1088987 () Bool)

(assert (=> b!1180708 m!1088987))

(declare-fun m!1088989 () Bool)

(assert (=> b!1180704 m!1088989))

(declare-fun m!1088991 () Bool)

(assert (=> b!1180704 m!1088991))

(declare-fun m!1088993 () Bool)

(assert (=> b!1180704 m!1088993))

(declare-fun m!1088995 () Bool)

(assert (=> b!1180704 m!1088995))

(declare-fun m!1088997 () Bool)

(assert (=> start!99828 m!1088997))

(declare-fun m!1088999 () Bool)

(assert (=> start!99828 m!1088999))

(declare-fun m!1089001 () Bool)

(assert (=> b!1180705 m!1089001))

(declare-fun m!1089003 () Bool)

(assert (=> b!1180705 m!1089003))

(declare-fun m!1089005 () Bool)

(assert (=> b!1180695 m!1089005))

(declare-fun m!1089007 () Bool)

(assert (=> mapNonEmpty!46379 m!1089007))

(assert (=> b!1180698 m!1088967))

(declare-fun m!1089009 () Bool)

(assert (=> b!1180698 m!1089009))

(declare-fun m!1089011 () Bool)

(assert (=> b!1180698 m!1089011))

(assert (=> b!1180698 m!1089011))

(declare-fun m!1089013 () Bool)

(assert (=> b!1180698 m!1089013))

(check-sat (not b!1180690) (not b!1180708) (not b!1180694) (not b!1180706) tp_is_empty!29701 (not b!1180704) (not b!1180702) (not b!1180699) (not start!99828) (not mapNonEmpty!46379) (not b!1180695) (not b!1180698) (not b!1180705) b_and!41213 (not b!1180693) (not b_lambda!20309) (not b_next!25171) (not b!1180700) (not b!1180707))
(check-sat b_and!41213 (not b_next!25171))
