; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99828 () Bool)

(assert start!99828)

(declare-fun b_free!25407 () Bool)

(declare-fun b_next!25407 () Bool)

(assert (=> start!99828 (= b_free!25407 (not b_next!25407))))

(declare-fun tp!88935 () Bool)

(declare-fun b_and!41681 () Bool)

(assert (=> start!99828 (= tp!88935 b_and!41681)))

(declare-fun mapIsEmpty!46733 () Bool)

(declare-fun mapRes!46733 () Bool)

(assert (=> mapIsEmpty!46733 mapRes!46733))

(declare-fun b!1186903 () Bool)

(declare-fun res!789067 () Bool)

(declare-fun e!674860 () Bool)

(assert (=> b!1186903 (=> (not res!789067) (not e!674860))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76669 0))(
  ( (array!76670 (arr!36984 (Array (_ BitVec 32) (_ BitVec 64))) (size!37520 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76669)

(assert (=> b!1186903 (= res!789067 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37520 _keys!1208))))))

(declare-fun b!1186904 () Bool)

(declare-datatypes ((Unit!39348 0))(
  ( (Unit!39349) )
))
(declare-fun e!674855 () Unit!39348)

(declare-fun Unit!39350 () Unit!39348)

(assert (=> b!1186904 (= e!674855 Unit!39350)))

(declare-fun b!1186905 () Bool)

(declare-fun e!674859 () Bool)

(declare-fun e!674865 () Bool)

(assert (=> b!1186905 (= e!674859 e!674865)))

(declare-fun res!789061 () Bool)

(assert (=> b!1186905 (=> res!789061 e!674865)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186905 (= res!789061 (not (validKeyInArray!0 (select (arr!36984 _keys!1208) from!1455))))))

(declare-datatypes ((V!45043 0))(
  ( (V!45044 (val!15025 Int)) )
))
(declare-datatypes ((tuple2!19284 0))(
  ( (tuple2!19285 (_1!9653 (_ BitVec 64)) (_2!9653 V!45043)) )
))
(declare-datatypes ((List!26024 0))(
  ( (Nil!26021) (Cons!26020 (h!27229 tuple2!19284) (t!38423 List!26024)) )
))
(declare-datatypes ((ListLongMap!17253 0))(
  ( (ListLongMap!17254 (toList!8642 List!26024)) )
))
(declare-fun lt!539354 () ListLongMap!17253)

(declare-fun lt!539360 () ListLongMap!17253)

(assert (=> b!1186905 (= lt!539354 lt!539360)))

(declare-fun lt!539368 () ListLongMap!17253)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1674 (ListLongMap!17253 (_ BitVec 64)) ListLongMap!17253)

(assert (=> b!1186905 (= lt!539360 (-!1674 lt!539368 k0!934))))

(declare-fun zeroValue!944 () V!45043)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14259 0))(
  ( (ValueCellFull!14259 (v!17663 V!45043)) (EmptyCell!14259) )
))
(declare-datatypes ((array!76671 0))(
  ( (array!76672 (arr!36985 (Array (_ BitVec 32) ValueCell!14259)) (size!37521 (_ BitVec 32))) )
))
(declare-fun lt!539364 () array!76671)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45043)

(declare-fun lt!539367 () array!76669)

(declare-fun getCurrentListMapNoExtraKeys!5085 (array!76669 array!76671 (_ BitVec 32) (_ BitVec 32) V!45043 V!45043 (_ BitVec 32) Int) ListLongMap!17253)

(assert (=> b!1186905 (= lt!539354 (getCurrentListMapNoExtraKeys!5085 lt!539367 lt!539364 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76671)

(assert (=> b!1186905 (= lt!539368 (getCurrentListMapNoExtraKeys!5085 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539370 () Unit!39348)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!886 (array!76669 array!76671 (_ BitVec 32) (_ BitVec 32) V!45043 V!45043 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39348)

(assert (=> b!1186905 (= lt!539370 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!886 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186906 () Bool)

(declare-fun res!789065 () Bool)

(assert (=> b!1186906 (=> (not res!789065) (not e!674860))))

(assert (=> b!1186906 (= res!789065 (validKeyInArray!0 k0!934))))

(declare-fun b!1186907 () Bool)

(declare-fun res!789059 () Bool)

(assert (=> b!1186907 (=> (not res!789059) (not e!674860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76669 (_ BitVec 32)) Bool)

(assert (=> b!1186907 (= res!789059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186908 () Bool)

(declare-fun e!674863 () Bool)

(declare-fun tp_is_empty!29937 () Bool)

(assert (=> b!1186908 (= e!674863 tp_is_empty!29937)))

(declare-fun b!1186909 () Bool)

(declare-fun e!674864 () Bool)

(declare-fun e!674862 () Bool)

(assert (=> b!1186909 (= e!674864 e!674862)))

(declare-fun res!789066 () Bool)

(assert (=> b!1186909 (=> res!789066 e!674862)))

(assert (=> b!1186909 (= res!789066 (not (= (select (arr!36984 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1186911 () Bool)

(declare-fun e!674861 () Bool)

(assert (=> b!1186911 (= e!674861 e!674859)))

(declare-fun res!789062 () Bool)

(assert (=> b!1186911 (=> res!789062 e!674859)))

(assert (=> b!1186911 (= res!789062 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!539363 () ListLongMap!17253)

(assert (=> b!1186911 (= lt!539363 (getCurrentListMapNoExtraKeys!5085 lt!539367 lt!539364 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!539361 () V!45043)

(assert (=> b!1186911 (= lt!539364 (array!76672 (store (arr!36985 _values!996) i!673 (ValueCellFull!14259 lt!539361)) (size!37521 _values!996)))))

(declare-fun dynLambda!3034 (Int (_ BitVec 64)) V!45043)

(assert (=> b!1186911 (= lt!539361 (dynLambda!3034 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!539353 () ListLongMap!17253)

(assert (=> b!1186911 (= lt!539353 (getCurrentListMapNoExtraKeys!5085 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186912 () Bool)

(assert (=> b!1186912 (= e!674865 true)))

(declare-fun lt!539352 () ListLongMap!17253)

(declare-fun lt!539365 () ListLongMap!17253)

(assert (=> b!1186912 (= (-!1674 lt!539352 k0!934) lt!539365)))

(declare-fun lt!539362 () V!45043)

(declare-fun lt!539356 () Unit!39348)

(declare-fun addRemoveCommutativeForDiffKeys!196 (ListLongMap!17253 (_ BitVec 64) V!45043 (_ BitVec 64)) Unit!39348)

(assert (=> b!1186912 (= lt!539356 (addRemoveCommutativeForDiffKeys!196 lt!539368 (select (arr!36984 _keys!1208) from!1455) lt!539362 k0!934))))

(assert (=> b!1186912 (and (= lt!539353 lt!539352) (= lt!539360 lt!539354))))

(declare-fun lt!539366 () tuple2!19284)

(declare-fun +!3933 (ListLongMap!17253 tuple2!19284) ListLongMap!17253)

(assert (=> b!1186912 (= lt!539352 (+!3933 lt!539368 lt!539366))))

(assert (=> b!1186912 (not (= (select (arr!36984 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539358 () Unit!39348)

(assert (=> b!1186912 (= lt!539358 e!674855)))

(declare-fun c!117234 () Bool)

(assert (=> b!1186912 (= c!117234 (= (select (arr!36984 _keys!1208) from!1455) k0!934))))

(assert (=> b!1186912 e!674864))

(declare-fun res!789069 () Bool)

(assert (=> b!1186912 (=> (not res!789069) (not e!674864))))

(assert (=> b!1186912 (= res!789069 (= lt!539363 lt!539365))))

(assert (=> b!1186912 (= lt!539365 (+!3933 lt!539360 lt!539366))))

(assert (=> b!1186912 (= lt!539366 (tuple2!19285 (select (arr!36984 _keys!1208) from!1455) lt!539362))))

(declare-fun get!18942 (ValueCell!14259 V!45043) V!45043)

(assert (=> b!1186912 (= lt!539362 (get!18942 (select (arr!36985 _values!996) from!1455) lt!539361))))

(declare-fun b!1186913 () Bool)

(declare-fun res!789064 () Bool)

(declare-fun e!674858 () Bool)

(assert (=> b!1186913 (=> (not res!789064) (not e!674858))))

(declare-datatypes ((List!26025 0))(
  ( (Nil!26022) (Cons!26021 (h!27230 (_ BitVec 64)) (t!38424 List!26025)) )
))
(declare-fun arrayNoDuplicates!0 (array!76669 (_ BitVec 32) List!26025) Bool)

(assert (=> b!1186913 (= res!789064 (arrayNoDuplicates!0 lt!539367 #b00000000000000000000000000000000 Nil!26022))))

(declare-fun b!1186914 () Bool)

(declare-fun arrayContainsKey!0 (array!76669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186914 (= e!674862 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186915 () Bool)

(declare-fun res!789060 () Bool)

(assert (=> b!1186915 (=> (not res!789060) (not e!674860))))

(assert (=> b!1186915 (= res!789060 (= (select (arr!36984 _keys!1208) i!673) k0!934))))

(declare-fun b!1186916 () Bool)

(assert (=> b!1186916 (= e!674860 e!674858)))

(declare-fun res!789072 () Bool)

(assert (=> b!1186916 (=> (not res!789072) (not e!674858))))

(assert (=> b!1186916 (= res!789072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539367 mask!1564))))

(assert (=> b!1186916 (= lt!539367 (array!76670 (store (arr!36984 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37520 _keys!1208)))))

(declare-fun b!1186917 () Bool)

(declare-fun res!789073 () Bool)

(assert (=> b!1186917 (=> (not res!789073) (not e!674860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186917 (= res!789073 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46733 () Bool)

(declare-fun tp!88934 () Bool)

(assert (=> mapNonEmpty!46733 (= mapRes!46733 (and tp!88934 e!674863))))

(declare-fun mapRest!46733 () (Array (_ BitVec 32) ValueCell!14259))

(declare-fun mapKey!46733 () (_ BitVec 32))

(declare-fun mapValue!46733 () ValueCell!14259)

(assert (=> mapNonEmpty!46733 (= (arr!36985 _values!996) (store mapRest!46733 mapKey!46733 mapValue!46733))))

(declare-fun b!1186918 () Bool)

(declare-fun e!674856 () Bool)

(declare-fun e!674857 () Bool)

(assert (=> b!1186918 (= e!674856 (and e!674857 mapRes!46733))))

(declare-fun condMapEmpty!46733 () Bool)

(declare-fun mapDefault!46733 () ValueCell!14259)

(assert (=> b!1186918 (= condMapEmpty!46733 (= (arr!36985 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14259)) mapDefault!46733)))))

(declare-fun b!1186919 () Bool)

(assert (=> b!1186919 (= e!674857 tp_is_empty!29937)))

(declare-fun b!1186920 () Bool)

(declare-fun Unit!39351 () Unit!39348)

(assert (=> b!1186920 (= e!674855 Unit!39351)))

(declare-fun lt!539359 () Unit!39348)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76669 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39348)

(assert (=> b!1186920 (= lt!539359 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1186920 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539355 () Unit!39348)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76669 (_ BitVec 32) (_ BitVec 32)) Unit!39348)

(assert (=> b!1186920 (= lt!539355 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186920 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26022)))

(declare-fun lt!539369 () Unit!39348)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76669 (_ BitVec 64) (_ BitVec 32) List!26025) Unit!39348)

(assert (=> b!1186920 (= lt!539369 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26022))))

(assert (=> b!1186920 false))

(declare-fun b!1186921 () Bool)

(assert (=> b!1186921 (= e!674858 (not e!674861))))

(declare-fun res!789070 () Bool)

(assert (=> b!1186921 (=> res!789070 e!674861)))

(assert (=> b!1186921 (= res!789070 (bvsgt from!1455 i!673))))

(assert (=> b!1186921 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539357 () Unit!39348)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76669 (_ BitVec 64) (_ BitVec 32)) Unit!39348)

(assert (=> b!1186921 (= lt!539357 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186922 () Bool)

(declare-fun res!789063 () Bool)

(assert (=> b!1186922 (=> (not res!789063) (not e!674860))))

(assert (=> b!1186922 (= res!789063 (and (= (size!37521 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37520 _keys!1208) (size!37521 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186910 () Bool)

(declare-fun res!789068 () Bool)

(assert (=> b!1186910 (=> (not res!789068) (not e!674860))))

(assert (=> b!1186910 (= res!789068 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26022))))

(declare-fun res!789071 () Bool)

(assert (=> start!99828 (=> (not res!789071) (not e!674860))))

(assert (=> start!99828 (= res!789071 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37520 _keys!1208))))))

(assert (=> start!99828 e!674860))

(assert (=> start!99828 tp_is_empty!29937))

(declare-fun array_inv!28222 (array!76669) Bool)

(assert (=> start!99828 (array_inv!28222 _keys!1208)))

(assert (=> start!99828 true))

(assert (=> start!99828 tp!88935))

(declare-fun array_inv!28223 (array!76671) Bool)

(assert (=> start!99828 (and (array_inv!28223 _values!996) e!674856)))

(assert (= (and start!99828 res!789071) b!1186917))

(assert (= (and b!1186917 res!789073) b!1186922))

(assert (= (and b!1186922 res!789063) b!1186907))

(assert (= (and b!1186907 res!789059) b!1186910))

(assert (= (and b!1186910 res!789068) b!1186903))

(assert (= (and b!1186903 res!789067) b!1186906))

(assert (= (and b!1186906 res!789065) b!1186915))

(assert (= (and b!1186915 res!789060) b!1186916))

(assert (= (and b!1186916 res!789072) b!1186913))

(assert (= (and b!1186913 res!789064) b!1186921))

(assert (= (and b!1186921 (not res!789070)) b!1186911))

(assert (= (and b!1186911 (not res!789062)) b!1186905))

(assert (= (and b!1186905 (not res!789061)) b!1186912))

(assert (= (and b!1186912 res!789069) b!1186909))

(assert (= (and b!1186909 (not res!789066)) b!1186914))

(assert (= (and b!1186912 c!117234) b!1186920))

(assert (= (and b!1186912 (not c!117234)) b!1186904))

(assert (= (and b!1186918 condMapEmpty!46733) mapIsEmpty!46733))

(assert (= (and b!1186918 (not condMapEmpty!46733)) mapNonEmpty!46733))

(get-info :version)

(assert (= (and mapNonEmpty!46733 ((_ is ValueCellFull!14259) mapValue!46733)) b!1186908))

(assert (= (and b!1186918 ((_ is ValueCellFull!14259) mapDefault!46733)) b!1186919))

(assert (= start!99828 b!1186918))

(declare-fun b_lambda!20551 () Bool)

(assert (=> (not b_lambda!20551) (not b!1186911)))

(declare-fun t!38422 () Bool)

(declare-fun tb!10219 () Bool)

(assert (=> (and start!99828 (= defaultEntry!1004 defaultEntry!1004) t!38422) tb!10219))

(declare-fun result!21005 () Bool)

(assert (=> tb!10219 (= result!21005 tp_is_empty!29937)))

(assert (=> b!1186911 t!38422))

(declare-fun b_and!41683 () Bool)

(assert (= b_and!41681 (and (=> t!38422 result!21005) b_and!41683)))

(declare-fun m!1095505 () Bool)

(assert (=> b!1186917 m!1095505))

(declare-fun m!1095507 () Bool)

(assert (=> b!1186911 m!1095507))

(declare-fun m!1095509 () Bool)

(assert (=> b!1186911 m!1095509))

(declare-fun m!1095511 () Bool)

(assert (=> b!1186911 m!1095511))

(declare-fun m!1095513 () Bool)

(assert (=> b!1186911 m!1095513))

(declare-fun m!1095515 () Bool)

(assert (=> b!1186913 m!1095515))

(declare-fun m!1095517 () Bool)

(assert (=> b!1186920 m!1095517))

(declare-fun m!1095519 () Bool)

(assert (=> b!1186920 m!1095519))

(declare-fun m!1095521 () Bool)

(assert (=> b!1186920 m!1095521))

(declare-fun m!1095523 () Bool)

(assert (=> b!1186920 m!1095523))

(declare-fun m!1095525 () Bool)

(assert (=> b!1186920 m!1095525))

(declare-fun m!1095527 () Bool)

(assert (=> b!1186914 m!1095527))

(declare-fun m!1095529 () Bool)

(assert (=> b!1186905 m!1095529))

(declare-fun m!1095531 () Bool)

(assert (=> b!1186905 m!1095531))

(declare-fun m!1095533 () Bool)

(assert (=> b!1186905 m!1095533))

(declare-fun m!1095535 () Bool)

(assert (=> b!1186905 m!1095535))

(declare-fun m!1095537 () Bool)

(assert (=> b!1186905 m!1095537))

(declare-fun m!1095539 () Bool)

(assert (=> b!1186905 m!1095539))

(assert (=> b!1186905 m!1095537))

(declare-fun m!1095541 () Bool)

(assert (=> start!99828 m!1095541))

(declare-fun m!1095543 () Bool)

(assert (=> start!99828 m!1095543))

(declare-fun m!1095545 () Bool)

(assert (=> b!1186916 m!1095545))

(declare-fun m!1095547 () Bool)

(assert (=> b!1186916 m!1095547))

(declare-fun m!1095549 () Bool)

(assert (=> mapNonEmpty!46733 m!1095549))

(declare-fun m!1095551 () Bool)

(assert (=> b!1186921 m!1095551))

(declare-fun m!1095553 () Bool)

(assert (=> b!1186921 m!1095553))

(declare-fun m!1095555 () Bool)

(assert (=> b!1186915 m!1095555))

(declare-fun m!1095557 () Bool)

(assert (=> b!1186912 m!1095557))

(assert (=> b!1186912 m!1095537))

(declare-fun m!1095559 () Bool)

(assert (=> b!1186912 m!1095559))

(declare-fun m!1095561 () Bool)

(assert (=> b!1186912 m!1095561))

(declare-fun m!1095563 () Bool)

(assert (=> b!1186912 m!1095563))

(declare-fun m!1095565 () Bool)

(assert (=> b!1186912 m!1095565))

(assert (=> b!1186912 m!1095537))

(declare-fun m!1095567 () Bool)

(assert (=> b!1186912 m!1095567))

(assert (=> b!1186912 m!1095561))

(declare-fun m!1095569 () Bool)

(assert (=> b!1186906 m!1095569))

(declare-fun m!1095571 () Bool)

(assert (=> b!1186910 m!1095571))

(declare-fun m!1095573 () Bool)

(assert (=> b!1186907 m!1095573))

(assert (=> b!1186909 m!1095537))

(check-sat (not start!99828) (not b!1186920) tp_is_empty!29937 (not b!1186905) (not b!1186906) (not b!1186911) (not b!1186907) (not b!1186916) (not b!1186921) (not b!1186913) (not b!1186912) (not b!1186914) (not b!1186917) b_and!41683 (not mapNonEmpty!46733) (not b_lambda!20551) (not b!1186910) (not b_next!25407))
(check-sat b_and!41683 (not b_next!25407))
