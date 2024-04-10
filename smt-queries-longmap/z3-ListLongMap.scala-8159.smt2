; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99822 () Bool)

(assert start!99822)

(declare-fun b_free!25401 () Bool)

(declare-fun b_next!25401 () Bool)

(assert (=> start!99822 (= b_free!25401 (not b_next!25401))))

(declare-fun tp!88917 () Bool)

(declare-fun b_and!41669 () Bool)

(assert (=> start!99822 (= tp!88917 b_and!41669)))

(declare-fun b!1186717 () Bool)

(declare-fun e!674749 () Bool)

(declare-fun e!674751 () Bool)

(assert (=> b!1186717 (= e!674749 e!674751)))

(declare-fun res!788936 () Bool)

(assert (=> b!1186717 (=> (not res!788936) (not e!674751))))

(declare-datatypes ((array!76657 0))(
  ( (array!76658 (arr!36978 (Array (_ BitVec 32) (_ BitVec 64))) (size!37514 (_ BitVec 32))) )
))
(declare-fun lt!539197 () array!76657)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76657 (_ BitVec 32)) Bool)

(assert (=> b!1186717 (= res!788936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539197 mask!1564))))

(declare-fun _keys!1208 () array!76657)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1186717 (= lt!539197 (array!76658 (store (arr!36978 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37514 _keys!1208)))))

(declare-fun b!1186718 () Bool)

(declare-fun res!788931 () Bool)

(assert (=> b!1186718 (=> (not res!788931) (not e!674749))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45035 0))(
  ( (V!45036 (val!15022 Int)) )
))
(declare-datatypes ((ValueCell!14256 0))(
  ( (ValueCellFull!14256 (v!17660 V!45035)) (EmptyCell!14256) )
))
(declare-datatypes ((array!76659 0))(
  ( (array!76660 (arr!36979 (Array (_ BitVec 32) ValueCell!14256)) (size!37515 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76659)

(assert (=> b!1186718 (= res!788931 (and (= (size!37515 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37514 _keys!1208) (size!37515 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186719 () Bool)

(declare-fun res!788927 () Bool)

(assert (=> b!1186719 (=> (not res!788927) (not e!674751))))

(declare-datatypes ((List!26018 0))(
  ( (Nil!26015) (Cons!26014 (h!27223 (_ BitVec 64)) (t!38411 List!26018)) )
))
(declare-fun arrayNoDuplicates!0 (array!76657 (_ BitVec 32) List!26018) Bool)

(assert (=> b!1186719 (= res!788927 (arrayNoDuplicates!0 lt!539197 #b00000000000000000000000000000000 Nil!26015))))

(declare-fun b!1186720 () Bool)

(declare-fun res!788926 () Bool)

(assert (=> b!1186720 (=> (not res!788926) (not e!674749))))

(assert (=> b!1186720 (= res!788926 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26015))))

(declare-fun b!1186721 () Bool)

(declare-fun res!788937 () Bool)

(assert (=> b!1186721 (=> (not res!788937) (not e!674749))))

(assert (=> b!1186721 (= res!788937 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37514 _keys!1208))))))

(declare-fun b!1186723 () Bool)

(declare-fun e!674753 () Bool)

(declare-fun tp_is_empty!29931 () Bool)

(assert (=> b!1186723 (= e!674753 tp_is_empty!29931)))

(declare-fun b!1186724 () Bool)

(declare-datatypes ((Unit!39339 0))(
  ( (Unit!39340) )
))
(declare-fun e!674748 () Unit!39339)

(declare-fun Unit!39341 () Unit!39339)

(assert (=> b!1186724 (= e!674748 Unit!39341)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!539195 () Unit!39339)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76657 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39339)

(assert (=> b!1186724 (= lt!539195 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186724 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539193 () Unit!39339)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76657 (_ BitVec 32) (_ BitVec 32)) Unit!39339)

(assert (=> b!1186724 (= lt!539193 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186724 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26015)))

(declare-fun lt!539184 () Unit!39339)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76657 (_ BitVec 64) (_ BitVec 32) List!26018) Unit!39339)

(assert (=> b!1186724 (= lt!539184 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26015))))

(assert (=> b!1186724 false))

(declare-fun b!1186725 () Bool)

(declare-fun res!788938 () Bool)

(assert (=> b!1186725 (=> (not res!788938) (not e!674749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186725 (= res!788938 (validKeyInArray!0 k0!934))))

(declare-fun b!1186726 () Bool)

(declare-fun res!788925 () Bool)

(assert (=> b!1186726 (=> (not res!788925) (not e!674749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186726 (= res!788925 (validMask!0 mask!1564))))

(declare-fun b!1186727 () Bool)

(declare-fun e!674756 () Bool)

(declare-fun e!674752 () Bool)

(assert (=> b!1186727 (= e!674756 e!674752)))

(declare-fun res!788924 () Bool)

(assert (=> b!1186727 (=> res!788924 e!674752)))

(assert (=> b!1186727 (= res!788924 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45035)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!539192 () array!76659)

(declare-datatypes ((tuple2!19278 0))(
  ( (tuple2!19279 (_1!9650 (_ BitVec 64)) (_2!9650 V!45035)) )
))
(declare-datatypes ((List!26019 0))(
  ( (Nil!26016) (Cons!26015 (h!27224 tuple2!19278) (t!38412 List!26019)) )
))
(declare-datatypes ((ListLongMap!17247 0))(
  ( (ListLongMap!17248 (toList!8639 List!26019)) )
))
(declare-fun lt!539191 () ListLongMap!17247)

(declare-fun minValue!944 () V!45035)

(declare-fun getCurrentListMapNoExtraKeys!5082 (array!76657 array!76659 (_ BitVec 32) (_ BitVec 32) V!45035 V!45035 (_ BitVec 32) Int) ListLongMap!17247)

(assert (=> b!1186727 (= lt!539191 (getCurrentListMapNoExtraKeys!5082 lt!539197 lt!539192 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!539190 () V!45035)

(assert (=> b!1186727 (= lt!539192 (array!76660 (store (arr!36979 _values!996) i!673 (ValueCellFull!14256 lt!539190)) (size!37515 _values!996)))))

(declare-fun dynLambda!3031 (Int (_ BitVec 64)) V!45035)

(assert (=> b!1186727 (= lt!539190 (dynLambda!3031 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!539189 () ListLongMap!17247)

(assert (=> b!1186727 (= lt!539189 (getCurrentListMapNoExtraKeys!5082 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46724 () Bool)

(declare-fun mapRes!46724 () Bool)

(assert (=> mapIsEmpty!46724 mapRes!46724))

(declare-fun b!1186728 () Bool)

(assert (=> b!1186728 (= e!674751 (not e!674756))))

(declare-fun res!788928 () Bool)

(assert (=> b!1186728 (=> res!788928 e!674756)))

(assert (=> b!1186728 (= res!788928 (bvsgt from!1455 i!673))))

(assert (=> b!1186728 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539183 () Unit!39339)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76657 (_ BitVec 64) (_ BitVec 32)) Unit!39339)

(assert (=> b!1186728 (= lt!539183 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186722 () Bool)

(declare-fun res!788932 () Bool)

(assert (=> b!1186722 (=> (not res!788932) (not e!674749))))

(assert (=> b!1186722 (= res!788932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!788935 () Bool)

(assert (=> start!99822 (=> (not res!788935) (not e!674749))))

(assert (=> start!99822 (= res!788935 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37514 _keys!1208))))))

(assert (=> start!99822 e!674749))

(assert (=> start!99822 tp_is_empty!29931))

(declare-fun array_inv!28218 (array!76657) Bool)

(assert (=> start!99822 (array_inv!28218 _keys!1208)))

(assert (=> start!99822 true))

(assert (=> start!99822 tp!88917))

(declare-fun e!674757 () Bool)

(declare-fun array_inv!28219 (array!76659) Bool)

(assert (=> start!99822 (and (array_inv!28219 _values!996) e!674757)))

(declare-fun b!1186729 () Bool)

(assert (=> b!1186729 (= e!674757 (and e!674753 mapRes!46724))))

(declare-fun condMapEmpty!46724 () Bool)

(declare-fun mapDefault!46724 () ValueCell!14256)

(assert (=> b!1186729 (= condMapEmpty!46724 (= (arr!36979 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14256)) mapDefault!46724)))))

(declare-fun b!1186730 () Bool)

(declare-fun e!674758 () Bool)

(declare-fun e!674754 () Bool)

(assert (=> b!1186730 (= e!674758 e!674754)))

(declare-fun res!788934 () Bool)

(assert (=> b!1186730 (=> res!788934 e!674754)))

(assert (=> b!1186730 (= res!788934 (not (= (select (arr!36978 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1186731 () Bool)

(declare-fun e!674755 () Bool)

(assert (=> b!1186731 (= e!674755 true)))

(declare-fun lt!539199 () ListLongMap!17247)

(declare-fun lt!539181 () ListLongMap!17247)

(declare-fun -!1671 (ListLongMap!17247 (_ BitVec 64)) ListLongMap!17247)

(assert (=> b!1186731 (= (-!1671 lt!539199 k0!934) lt!539181)))

(declare-fun lt!539198 () ListLongMap!17247)

(declare-fun lt!539196 () V!45035)

(declare-fun lt!539188 () Unit!39339)

(declare-fun addRemoveCommutativeForDiffKeys!194 (ListLongMap!17247 (_ BitVec 64) V!45035 (_ BitVec 64)) Unit!39339)

(assert (=> b!1186731 (= lt!539188 (addRemoveCommutativeForDiffKeys!194 lt!539198 (select (arr!36978 _keys!1208) from!1455) lt!539196 k0!934))))

(declare-fun lt!539194 () ListLongMap!17247)

(declare-fun lt!539187 () ListLongMap!17247)

(assert (=> b!1186731 (and (= lt!539189 lt!539199) (= lt!539187 lt!539194))))

(declare-fun lt!539182 () tuple2!19278)

(declare-fun +!3931 (ListLongMap!17247 tuple2!19278) ListLongMap!17247)

(assert (=> b!1186731 (= lt!539199 (+!3931 lt!539198 lt!539182))))

(assert (=> b!1186731 (not (= (select (arr!36978 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539186 () Unit!39339)

(assert (=> b!1186731 (= lt!539186 e!674748)))

(declare-fun c!117225 () Bool)

(assert (=> b!1186731 (= c!117225 (= (select (arr!36978 _keys!1208) from!1455) k0!934))))

(assert (=> b!1186731 e!674758))

(declare-fun res!788929 () Bool)

(assert (=> b!1186731 (=> (not res!788929) (not e!674758))))

(assert (=> b!1186731 (= res!788929 (= lt!539191 lt!539181))))

(assert (=> b!1186731 (= lt!539181 (+!3931 lt!539187 lt!539182))))

(assert (=> b!1186731 (= lt!539182 (tuple2!19279 (select (arr!36978 _keys!1208) from!1455) lt!539196))))

(declare-fun get!18938 (ValueCell!14256 V!45035) V!45035)

(assert (=> b!1186731 (= lt!539196 (get!18938 (select (arr!36979 _values!996) from!1455) lt!539190))))

(declare-fun mapNonEmpty!46724 () Bool)

(declare-fun tp!88916 () Bool)

(declare-fun e!674750 () Bool)

(assert (=> mapNonEmpty!46724 (= mapRes!46724 (and tp!88916 e!674750))))

(declare-fun mapRest!46724 () (Array (_ BitVec 32) ValueCell!14256))

(declare-fun mapKey!46724 () (_ BitVec 32))

(declare-fun mapValue!46724 () ValueCell!14256)

(assert (=> mapNonEmpty!46724 (= (arr!36979 _values!996) (store mapRest!46724 mapKey!46724 mapValue!46724))))

(declare-fun b!1186732 () Bool)

(assert (=> b!1186732 (= e!674750 tp_is_empty!29931)))

(declare-fun b!1186733 () Bool)

(declare-fun res!788930 () Bool)

(assert (=> b!1186733 (=> (not res!788930) (not e!674749))))

(assert (=> b!1186733 (= res!788930 (= (select (arr!36978 _keys!1208) i!673) k0!934))))

(declare-fun b!1186734 () Bool)

(declare-fun Unit!39342 () Unit!39339)

(assert (=> b!1186734 (= e!674748 Unit!39342)))

(declare-fun b!1186735 () Bool)

(assert (=> b!1186735 (= e!674754 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186736 () Bool)

(assert (=> b!1186736 (= e!674752 e!674755)))

(declare-fun res!788933 () Bool)

(assert (=> b!1186736 (=> res!788933 e!674755)))

(assert (=> b!1186736 (= res!788933 (not (validKeyInArray!0 (select (arr!36978 _keys!1208) from!1455))))))

(assert (=> b!1186736 (= lt!539194 lt!539187)))

(assert (=> b!1186736 (= lt!539187 (-!1671 lt!539198 k0!934))))

(assert (=> b!1186736 (= lt!539194 (getCurrentListMapNoExtraKeys!5082 lt!539197 lt!539192 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1186736 (= lt!539198 (getCurrentListMapNoExtraKeys!5082 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539185 () Unit!39339)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!884 (array!76657 array!76659 (_ BitVec 32) (_ BitVec 32) V!45035 V!45035 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39339)

(assert (=> b!1186736 (= lt!539185 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!884 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99822 res!788935) b!1186726))

(assert (= (and b!1186726 res!788925) b!1186718))

(assert (= (and b!1186718 res!788931) b!1186722))

(assert (= (and b!1186722 res!788932) b!1186720))

(assert (= (and b!1186720 res!788926) b!1186721))

(assert (= (and b!1186721 res!788937) b!1186725))

(assert (= (and b!1186725 res!788938) b!1186733))

(assert (= (and b!1186733 res!788930) b!1186717))

(assert (= (and b!1186717 res!788936) b!1186719))

(assert (= (and b!1186719 res!788927) b!1186728))

(assert (= (and b!1186728 (not res!788928)) b!1186727))

(assert (= (and b!1186727 (not res!788924)) b!1186736))

(assert (= (and b!1186736 (not res!788933)) b!1186731))

(assert (= (and b!1186731 res!788929) b!1186730))

(assert (= (and b!1186730 (not res!788934)) b!1186735))

(assert (= (and b!1186731 c!117225) b!1186724))

(assert (= (and b!1186731 (not c!117225)) b!1186734))

(assert (= (and b!1186729 condMapEmpty!46724) mapIsEmpty!46724))

(assert (= (and b!1186729 (not condMapEmpty!46724)) mapNonEmpty!46724))

(get-info :version)

(assert (= (and mapNonEmpty!46724 ((_ is ValueCellFull!14256) mapValue!46724)) b!1186732))

(assert (= (and b!1186729 ((_ is ValueCellFull!14256) mapDefault!46724)) b!1186723))

(assert (= start!99822 b!1186729))

(declare-fun b_lambda!20545 () Bool)

(assert (=> (not b_lambda!20545) (not b!1186727)))

(declare-fun t!38410 () Bool)

(declare-fun tb!10213 () Bool)

(assert (=> (and start!99822 (= defaultEntry!1004 defaultEntry!1004) t!38410) tb!10213))

(declare-fun result!20993 () Bool)

(assert (=> tb!10213 (= result!20993 tp_is_empty!29931)))

(assert (=> b!1186727 t!38410))

(declare-fun b_and!41671 () Bool)

(assert (= b_and!41669 (and (=> t!38410 result!20993) b_and!41671)))

(declare-fun m!1095295 () Bool)

(assert (=> b!1186735 m!1095295))

(declare-fun m!1095297 () Bool)

(assert (=> start!99822 m!1095297))

(declare-fun m!1095299 () Bool)

(assert (=> start!99822 m!1095299))

(declare-fun m!1095301 () Bool)

(assert (=> mapNonEmpty!46724 m!1095301))

(declare-fun m!1095303 () Bool)

(assert (=> b!1186731 m!1095303))

(declare-fun m!1095305 () Bool)

(assert (=> b!1186731 m!1095305))

(declare-fun m!1095307 () Bool)

(assert (=> b!1186731 m!1095307))

(declare-fun m!1095309 () Bool)

(assert (=> b!1186731 m!1095309))

(assert (=> b!1186731 m!1095305))

(declare-fun m!1095311 () Bool)

(assert (=> b!1186731 m!1095311))

(declare-fun m!1095313 () Bool)

(assert (=> b!1186731 m!1095313))

(declare-fun m!1095315 () Bool)

(assert (=> b!1186731 m!1095315))

(assert (=> b!1186731 m!1095307))

(declare-fun m!1095317 () Bool)

(assert (=> b!1186724 m!1095317))

(declare-fun m!1095319 () Bool)

(assert (=> b!1186724 m!1095319))

(declare-fun m!1095321 () Bool)

(assert (=> b!1186724 m!1095321))

(declare-fun m!1095323 () Bool)

(assert (=> b!1186724 m!1095323))

(declare-fun m!1095325 () Bool)

(assert (=> b!1186724 m!1095325))

(declare-fun m!1095327 () Bool)

(assert (=> b!1186720 m!1095327))

(declare-fun m!1095329 () Bool)

(assert (=> b!1186717 m!1095329))

(declare-fun m!1095331 () Bool)

(assert (=> b!1186717 m!1095331))

(assert (=> b!1186730 m!1095307))

(declare-fun m!1095333 () Bool)

(assert (=> b!1186725 m!1095333))

(declare-fun m!1095335 () Bool)

(assert (=> b!1186733 m!1095335))

(declare-fun m!1095337 () Bool)

(assert (=> b!1186736 m!1095337))

(declare-fun m!1095339 () Bool)

(assert (=> b!1186736 m!1095339))

(declare-fun m!1095341 () Bool)

(assert (=> b!1186736 m!1095341))

(declare-fun m!1095343 () Bool)

(assert (=> b!1186736 m!1095343))

(assert (=> b!1186736 m!1095307))

(declare-fun m!1095345 () Bool)

(assert (=> b!1186736 m!1095345))

(assert (=> b!1186736 m!1095307))

(declare-fun m!1095347 () Bool)

(assert (=> b!1186722 m!1095347))

(declare-fun m!1095349 () Bool)

(assert (=> b!1186727 m!1095349))

(declare-fun m!1095351 () Bool)

(assert (=> b!1186727 m!1095351))

(declare-fun m!1095353 () Bool)

(assert (=> b!1186727 m!1095353))

(declare-fun m!1095355 () Bool)

(assert (=> b!1186727 m!1095355))

(declare-fun m!1095357 () Bool)

(assert (=> b!1186726 m!1095357))

(declare-fun m!1095359 () Bool)

(assert (=> b!1186719 m!1095359))

(declare-fun m!1095361 () Bool)

(assert (=> b!1186728 m!1095361))

(declare-fun m!1095363 () Bool)

(assert (=> b!1186728 m!1095363))

(check-sat tp_is_empty!29931 (not mapNonEmpty!46724) (not b!1186735) (not b!1186719) (not b_next!25401) (not b!1186736) (not b!1186725) b_and!41671 (not b!1186726) (not b!1186722) (not b!1186724) (not b!1186717) (not b!1186727) (not b!1186720) (not b!1186731) (not b!1186728) (not start!99822) (not b_lambda!20545))
(check-sat b_and!41671 (not b_next!25401))
