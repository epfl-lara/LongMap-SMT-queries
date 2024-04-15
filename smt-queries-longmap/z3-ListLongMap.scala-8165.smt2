; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99850 () Bool)

(assert start!99850)

(declare-fun b_free!25435 () Bool)

(declare-fun b_next!25435 () Bool)

(assert (=> start!99850 (= b_free!25435 (not b_next!25435))))

(declare-fun tp!89018 () Bool)

(declare-fun b_and!41715 () Bool)

(assert (=> start!99850 (= tp!89018 b_and!41715)))

(declare-fun b!1187647 () Bool)

(declare-fun res!789626 () Bool)

(declare-fun e!675289 () Bool)

(assert (=> b!1187647 (=> (not res!789626) (not e!675289))))

(declare-datatypes ((array!76664 0))(
  ( (array!76665 (arr!36982 (Array (_ BitVec 32) (_ BitVec 64))) (size!37520 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76664)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1187647 (= res!789626 (= (select (arr!36982 _keys!1208) i!673) k0!934))))

(declare-fun b!1187648 () Bool)

(declare-fun res!789627 () Bool)

(assert (=> b!1187648 (=> (not res!789627) (not e!675289))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187648 (= res!789627 (validMask!0 mask!1564))))

(declare-fun b!1187649 () Bool)

(declare-fun e!675283 () Bool)

(declare-fun tp_is_empty!29965 () Bool)

(assert (=> b!1187649 (= e!675283 tp_is_empty!29965)))

(declare-fun b!1187650 () Bool)

(declare-fun res!789635 () Bool)

(assert (=> b!1187650 (=> (not res!789635) (not e!675289))))

(declare-datatypes ((List!26136 0))(
  ( (Nil!26133) (Cons!26132 (h!27341 (_ BitVec 64)) (t!38554 List!26136)) )
))
(declare-fun arrayNoDuplicates!0 (array!76664 (_ BitVec 32) List!26136) Bool)

(assert (=> b!1187650 (= res!789635 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26133))))

(declare-fun b!1187651 () Bool)

(declare-fun res!789636 () Bool)

(assert (=> b!1187651 (=> (not res!789636) (not e!675289))))

(assert (=> b!1187651 (= res!789636 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37520 _keys!1208))))))

(declare-fun mapNonEmpty!46775 () Bool)

(declare-fun mapRes!46775 () Bool)

(declare-fun tp!89019 () Bool)

(assert (=> mapNonEmpty!46775 (= mapRes!46775 (and tp!89019 e!675283))))

(declare-datatypes ((V!45081 0))(
  ( (V!45082 (val!15039 Int)) )
))
(declare-datatypes ((ValueCell!14273 0))(
  ( (ValueCellFull!14273 (v!17676 V!45081)) (EmptyCell!14273) )
))
(declare-fun mapValue!46775 () ValueCell!14273)

(declare-fun mapRest!46775 () (Array (_ BitVec 32) ValueCell!14273))

(declare-fun mapKey!46775 () (_ BitVec 32))

(declare-datatypes ((array!76666 0))(
  ( (array!76667 (arr!36983 (Array (_ BitVec 32) ValueCell!14273)) (size!37521 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76666)

(assert (=> mapNonEmpty!46775 (= (arr!36983 _values!996) (store mapRest!46775 mapKey!46775 mapValue!46775))))

(declare-fun b!1187652 () Bool)

(declare-fun e!675285 () Bool)

(declare-fun e!675286 () Bool)

(assert (=> b!1187652 (= e!675285 e!675286)))

(declare-fun res!789632 () Bool)

(assert (=> b!1187652 (=> res!789632 e!675286)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187652 (= res!789632 (not (validKeyInArray!0 (select (arr!36982 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19424 0))(
  ( (tuple2!19425 (_1!9723 (_ BitVec 64)) (_2!9723 V!45081)) )
))
(declare-datatypes ((List!26137 0))(
  ( (Nil!26134) (Cons!26133 (h!27342 tuple2!19424) (t!38555 List!26137)) )
))
(declare-datatypes ((ListLongMap!17393 0))(
  ( (ListLongMap!17394 (toList!8712 List!26137)) )
))
(declare-fun lt!539973 () ListLongMap!17393)

(declare-fun lt!539962 () ListLongMap!17393)

(assert (=> b!1187652 (= lt!539973 lt!539962)))

(declare-fun lt!539964 () ListLongMap!17393)

(declare-fun -!1661 (ListLongMap!17393 (_ BitVec 64)) ListLongMap!17393)

(assert (=> b!1187652 (= lt!539962 (-!1661 lt!539964 k0!934))))

(declare-fun zeroValue!944 () V!45081)

(declare-fun lt!539958 () array!76666)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!539966 () array!76664)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45081)

(declare-fun getCurrentListMapNoExtraKeys!5162 (array!76664 array!76666 (_ BitVec 32) (_ BitVec 32) V!45081 V!45081 (_ BitVec 32) Int) ListLongMap!17393)

(assert (=> b!1187652 (= lt!539973 (getCurrentListMapNoExtraKeys!5162 lt!539966 lt!539958 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187652 (= lt!539964 (getCurrentListMapNoExtraKeys!5162 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39267 0))(
  ( (Unit!39268) )
))
(declare-fun lt!539968 () Unit!39267)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!911 (array!76664 array!76666 (_ BitVec 32) (_ BitVec 32) V!45081 V!45081 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39267)

(assert (=> b!1187652 (= lt!539968 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!911 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187653 () Bool)

(declare-fun e!675287 () Bool)

(assert (=> b!1187653 (= e!675289 e!675287)))

(declare-fun res!789625 () Bool)

(assert (=> b!1187653 (=> (not res!789625) (not e!675287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76664 (_ BitVec 32)) Bool)

(assert (=> b!1187653 (= res!789625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539966 mask!1564))))

(assert (=> b!1187653 (= lt!539966 (array!76665 (store (arr!36982 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37520 _keys!1208)))))

(declare-fun b!1187654 () Bool)

(declare-fun res!789637 () Bool)

(assert (=> b!1187654 (=> (not res!789637) (not e!675289))))

(assert (=> b!1187654 (= res!789637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187655 () Bool)

(declare-fun e!675292 () Bool)

(declare-fun e!675281 () Bool)

(assert (=> b!1187655 (= e!675292 e!675281)))

(declare-fun res!789630 () Bool)

(assert (=> b!1187655 (=> res!789630 e!675281)))

(assert (=> b!1187655 (= res!789630 (not (= (select (arr!36982 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1187657 () Bool)

(declare-fun e!675288 () Bool)

(declare-fun e!675291 () Bool)

(assert (=> b!1187657 (= e!675288 (and e!675291 mapRes!46775))))

(declare-fun condMapEmpty!46775 () Bool)

(declare-fun mapDefault!46775 () ValueCell!14273)

(assert (=> b!1187657 (= condMapEmpty!46775 (= (arr!36983 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14273)) mapDefault!46775)))))

(declare-fun b!1187658 () Bool)

(declare-fun e!675284 () Unit!39267)

(declare-fun Unit!39269 () Unit!39267)

(assert (=> b!1187658 (= e!675284 Unit!39269)))

(declare-fun b!1187659 () Bool)

(declare-fun arrayContainsKey!0 (array!76664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187659 (= e!675281 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187660 () Bool)

(declare-fun res!789624 () Bool)

(assert (=> b!1187660 (=> (not res!789624) (not e!675289))))

(assert (=> b!1187660 (= res!789624 (validKeyInArray!0 k0!934))))

(declare-fun b!1187661 () Bool)

(declare-fun Unit!39270 () Unit!39267)

(assert (=> b!1187661 (= e!675284 Unit!39270)))

(declare-fun lt!539974 () Unit!39267)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76664 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39267)

(assert (=> b!1187661 (= lt!539974 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187661 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539963 () Unit!39267)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76664 (_ BitVec 32) (_ BitVec 32)) Unit!39267)

(assert (=> b!1187661 (= lt!539963 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1187661 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26133)))

(declare-fun lt!539967 () Unit!39267)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76664 (_ BitVec 64) (_ BitVec 32) List!26136) Unit!39267)

(assert (=> b!1187661 (= lt!539967 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26133))))

(assert (=> b!1187661 false))

(declare-fun b!1187662 () Bool)

(assert (=> b!1187662 (= e!675286 true)))

(declare-fun lt!539960 () ListLongMap!17393)

(declare-fun lt!539961 () ListLongMap!17393)

(assert (=> b!1187662 (= (-!1661 lt!539960 k0!934) lt!539961)))

(declare-fun lt!539969 () V!45081)

(declare-fun lt!539971 () Unit!39267)

(declare-fun addRemoveCommutativeForDiffKeys!204 (ListLongMap!17393 (_ BitVec 64) V!45081 (_ BitVec 64)) Unit!39267)

(assert (=> b!1187662 (= lt!539971 (addRemoveCommutativeForDiffKeys!204 lt!539964 (select (arr!36982 _keys!1208) from!1455) lt!539969 k0!934))))

(declare-fun lt!539975 () ListLongMap!17393)

(assert (=> b!1187662 (and (= lt!539975 lt!539960) (= lt!539962 lt!539973))))

(declare-fun lt!539976 () tuple2!19424)

(declare-fun +!3990 (ListLongMap!17393 tuple2!19424) ListLongMap!17393)

(assert (=> b!1187662 (= lt!539960 (+!3990 lt!539964 lt!539976))))

(assert (=> b!1187662 (not (= (select (arr!36982 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539972 () Unit!39267)

(assert (=> b!1187662 (= lt!539972 e!675284)))

(declare-fun c!117250 () Bool)

(assert (=> b!1187662 (= c!117250 (= (select (arr!36982 _keys!1208) from!1455) k0!934))))

(assert (=> b!1187662 e!675292))

(declare-fun res!789634 () Bool)

(assert (=> b!1187662 (=> (not res!789634) (not e!675292))))

(declare-fun lt!539965 () ListLongMap!17393)

(assert (=> b!1187662 (= res!789634 (= lt!539965 lt!539961))))

(assert (=> b!1187662 (= lt!539961 (+!3990 lt!539962 lt!539976))))

(assert (=> b!1187662 (= lt!539976 (tuple2!19425 (select (arr!36982 _keys!1208) from!1455) lt!539969))))

(declare-fun lt!539970 () V!45081)

(declare-fun get!18957 (ValueCell!14273 V!45081) V!45081)

(assert (=> b!1187662 (= lt!539969 (get!18957 (select (arr!36983 _values!996) from!1455) lt!539970))))

(declare-fun b!1187663 () Bool)

(declare-fun res!789623 () Bool)

(assert (=> b!1187663 (=> (not res!789623) (not e!675289))))

(assert (=> b!1187663 (= res!789623 (and (= (size!37521 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37520 _keys!1208) (size!37521 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187664 () Bool)

(assert (=> b!1187664 (= e!675291 tp_is_empty!29965)))

(declare-fun mapIsEmpty!46775 () Bool)

(assert (=> mapIsEmpty!46775 mapRes!46775))

(declare-fun res!789631 () Bool)

(assert (=> start!99850 (=> (not res!789631) (not e!675289))))

(assert (=> start!99850 (= res!789631 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37520 _keys!1208))))))

(assert (=> start!99850 e!675289))

(assert (=> start!99850 tp_is_empty!29965))

(declare-fun array_inv!28326 (array!76664) Bool)

(assert (=> start!99850 (array_inv!28326 _keys!1208)))

(assert (=> start!99850 true))

(assert (=> start!99850 tp!89018))

(declare-fun array_inv!28327 (array!76666) Bool)

(assert (=> start!99850 (and (array_inv!28327 _values!996) e!675288)))

(declare-fun b!1187656 () Bool)

(declare-fun e!675282 () Bool)

(assert (=> b!1187656 (= e!675282 e!675285)))

(declare-fun res!789629 () Bool)

(assert (=> b!1187656 (=> res!789629 e!675285)))

(assert (=> b!1187656 (= res!789629 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1187656 (= lt!539965 (getCurrentListMapNoExtraKeys!5162 lt!539966 lt!539958 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1187656 (= lt!539958 (array!76667 (store (arr!36983 _values!996) i!673 (ValueCellFull!14273 lt!539970)) (size!37521 _values!996)))))

(declare-fun dynLambda!3060 (Int (_ BitVec 64)) V!45081)

(assert (=> b!1187656 (= lt!539970 (dynLambda!3060 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1187656 (= lt!539975 (getCurrentListMapNoExtraKeys!5162 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187665 () Bool)

(declare-fun res!789628 () Bool)

(assert (=> b!1187665 (=> (not res!789628) (not e!675287))))

(assert (=> b!1187665 (= res!789628 (arrayNoDuplicates!0 lt!539966 #b00000000000000000000000000000000 Nil!26133))))

(declare-fun b!1187666 () Bool)

(assert (=> b!1187666 (= e!675287 (not e!675282))))

(declare-fun res!789633 () Bool)

(assert (=> b!1187666 (=> res!789633 e!675282)))

(assert (=> b!1187666 (= res!789633 (bvsgt from!1455 i!673))))

(assert (=> b!1187666 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539959 () Unit!39267)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76664 (_ BitVec 64) (_ BitVec 32)) Unit!39267)

(assert (=> b!1187666 (= lt!539959 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99850 res!789631) b!1187648))

(assert (= (and b!1187648 res!789627) b!1187663))

(assert (= (and b!1187663 res!789623) b!1187654))

(assert (= (and b!1187654 res!789637) b!1187650))

(assert (= (and b!1187650 res!789635) b!1187651))

(assert (= (and b!1187651 res!789636) b!1187660))

(assert (= (and b!1187660 res!789624) b!1187647))

(assert (= (and b!1187647 res!789626) b!1187653))

(assert (= (and b!1187653 res!789625) b!1187665))

(assert (= (and b!1187665 res!789628) b!1187666))

(assert (= (and b!1187666 (not res!789633)) b!1187656))

(assert (= (and b!1187656 (not res!789629)) b!1187652))

(assert (= (and b!1187652 (not res!789632)) b!1187662))

(assert (= (and b!1187662 res!789634) b!1187655))

(assert (= (and b!1187655 (not res!789630)) b!1187659))

(assert (= (and b!1187662 c!117250) b!1187661))

(assert (= (and b!1187662 (not c!117250)) b!1187658))

(assert (= (and b!1187657 condMapEmpty!46775) mapIsEmpty!46775))

(assert (= (and b!1187657 (not condMapEmpty!46775)) mapNonEmpty!46775))

(get-info :version)

(assert (= (and mapNonEmpty!46775 ((_ is ValueCellFull!14273) mapValue!46775)) b!1187649))

(assert (= (and b!1187657 ((_ is ValueCellFull!14273) mapDefault!46775)) b!1187664))

(assert (= start!99850 b!1187657))

(declare-fun b_lambda!20561 () Bool)

(assert (=> (not b_lambda!20561) (not b!1187656)))

(declare-fun t!38553 () Bool)

(declare-fun tb!10239 () Bool)

(assert (=> (and start!99850 (= defaultEntry!1004 defaultEntry!1004) t!38553) tb!10239))

(declare-fun result!21053 () Bool)

(assert (=> tb!10239 (= result!21053 tp_is_empty!29965)))

(assert (=> b!1187656 t!38553))

(declare-fun b_and!41717 () Bool)

(assert (= b_and!41715 (and (=> t!38553 result!21053) b_and!41717)))

(declare-fun m!1095875 () Bool)

(assert (=> b!1187659 m!1095875))

(declare-fun m!1095877 () Bool)

(assert (=> mapNonEmpty!46775 m!1095877))

(declare-fun m!1095879 () Bool)

(assert (=> b!1187648 m!1095879))

(declare-fun m!1095881 () Bool)

(assert (=> b!1187666 m!1095881))

(declare-fun m!1095883 () Bool)

(assert (=> b!1187666 m!1095883))

(declare-fun m!1095885 () Bool)

(assert (=> b!1187650 m!1095885))

(declare-fun m!1095887 () Bool)

(assert (=> b!1187647 m!1095887))

(declare-fun m!1095889 () Bool)

(assert (=> b!1187654 m!1095889))

(declare-fun m!1095891 () Bool)

(assert (=> b!1187652 m!1095891))

(declare-fun m!1095893 () Bool)

(assert (=> b!1187652 m!1095893))

(declare-fun m!1095895 () Bool)

(assert (=> b!1187652 m!1095895))

(declare-fun m!1095897 () Bool)

(assert (=> b!1187652 m!1095897))

(assert (=> b!1187652 m!1095895))

(declare-fun m!1095899 () Bool)

(assert (=> b!1187652 m!1095899))

(declare-fun m!1095901 () Bool)

(assert (=> b!1187652 m!1095901))

(declare-fun m!1095903 () Bool)

(assert (=> b!1187665 m!1095903))

(declare-fun m!1095905 () Bool)

(assert (=> b!1187661 m!1095905))

(declare-fun m!1095907 () Bool)

(assert (=> b!1187661 m!1095907))

(declare-fun m!1095909 () Bool)

(assert (=> b!1187661 m!1095909))

(declare-fun m!1095911 () Bool)

(assert (=> b!1187661 m!1095911))

(declare-fun m!1095913 () Bool)

(assert (=> b!1187661 m!1095913))

(declare-fun m!1095915 () Bool)

(assert (=> b!1187660 m!1095915))

(declare-fun m!1095917 () Bool)

(assert (=> b!1187656 m!1095917))

(declare-fun m!1095919 () Bool)

(assert (=> b!1187656 m!1095919))

(declare-fun m!1095921 () Bool)

(assert (=> b!1187656 m!1095921))

(declare-fun m!1095923 () Bool)

(assert (=> b!1187656 m!1095923))

(assert (=> b!1187655 m!1095895))

(declare-fun m!1095925 () Bool)

(assert (=> b!1187653 m!1095925))

(declare-fun m!1095927 () Bool)

(assert (=> b!1187653 m!1095927))

(declare-fun m!1095929 () Bool)

(assert (=> start!99850 m!1095929))

(declare-fun m!1095931 () Bool)

(assert (=> start!99850 m!1095931))

(declare-fun m!1095933 () Bool)

(assert (=> b!1187662 m!1095933))

(declare-fun m!1095935 () Bool)

(assert (=> b!1187662 m!1095935))

(declare-fun m!1095937 () Bool)

(assert (=> b!1187662 m!1095937))

(assert (=> b!1187662 m!1095895))

(declare-fun m!1095939 () Bool)

(assert (=> b!1187662 m!1095939))

(declare-fun m!1095941 () Bool)

(assert (=> b!1187662 m!1095941))

(assert (=> b!1187662 m!1095933))

(declare-fun m!1095943 () Bool)

(assert (=> b!1187662 m!1095943))

(assert (=> b!1187662 m!1095895))

(check-sat (not b!1187659) (not b_lambda!20561) (not b!1187653) (not b!1187662) (not b!1187660) (not mapNonEmpty!46775) tp_is_empty!29965 (not b!1187666) (not b!1187665) b_and!41717 (not b_next!25435) (not start!99850) (not b!1187652) (not b!1187654) (not b!1187648) (not b!1187650) (not b!1187656) (not b!1187661))
(check-sat b_and!41717 (not b_next!25435))
