; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99856 () Bool)

(assert start!99856)

(declare-fun b_free!25441 () Bool)

(declare-fun b_next!25441 () Bool)

(assert (=> start!99856 (= b_free!25441 (not b_next!25441))))

(declare-fun tp!89037 () Bool)

(declare-fun b_and!41727 () Bool)

(assert (=> start!99856 (= tp!89037 b_and!41727)))

(declare-fun b!1187833 () Bool)

(declare-fun e!675393 () Bool)

(declare-fun e!675392 () Bool)

(assert (=> b!1187833 (= e!675393 e!675392)))

(declare-fun res!789772 () Bool)

(assert (=> b!1187833 (=> res!789772 e!675392)))

(declare-datatypes ((array!76676 0))(
  ( (array!76677 (arr!36988 (Array (_ BitVec 32) (_ BitVec 64))) (size!37526 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76676)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1187833 (= res!789772 (not (= (select (arr!36988 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1187834 () Bool)

(declare-fun res!789760 () Bool)

(declare-fun e!675394 () Bool)

(assert (=> b!1187834 (=> (not res!789760) (not e!675394))))

(declare-datatypes ((List!26140 0))(
  ( (Nil!26137) (Cons!26136 (h!27345 (_ BitVec 64)) (t!38564 List!26140)) )
))
(declare-fun arrayNoDuplicates!0 (array!76676 (_ BitVec 32) List!26140) Bool)

(assert (=> b!1187834 (= res!789760 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26137))))

(declare-fun b!1187835 () Bool)

(declare-fun res!789761 () Bool)

(assert (=> b!1187835 (=> (not res!789761) (not e!675394))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1187835 (= res!789761 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37526 _keys!1208))))))

(declare-fun b!1187836 () Bool)

(declare-fun res!789762 () Bool)

(assert (=> b!1187836 (=> (not res!789762) (not e!675394))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45089 0))(
  ( (V!45090 (val!15042 Int)) )
))
(declare-datatypes ((ValueCell!14276 0))(
  ( (ValueCellFull!14276 (v!17679 V!45089)) (EmptyCell!14276) )
))
(declare-datatypes ((array!76678 0))(
  ( (array!76679 (arr!36989 (Array (_ BitVec 32) ValueCell!14276)) (size!37527 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76678)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1187836 (= res!789762 (and (= (size!37527 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37526 _keys!1208) (size!37527 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187837 () Bool)

(declare-fun e!675389 () Bool)

(declare-fun e!675399 () Bool)

(assert (=> b!1187837 (= e!675389 (not e!675399))))

(declare-fun res!789765 () Bool)

(assert (=> b!1187837 (=> res!789765 e!675399)))

(assert (=> b!1187837 (= res!789765 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187837 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39275 0))(
  ( (Unit!39276) )
))
(declare-fun lt!540130 () Unit!39275)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76676 (_ BitVec 64) (_ BitVec 32)) Unit!39275)

(assert (=> b!1187837 (= lt!540130 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187838 () Bool)

(declare-fun res!789759 () Bool)

(assert (=> b!1187838 (=> (not res!789759) (not e!675394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187838 (= res!789759 (validMask!0 mask!1564))))

(declare-fun b!1187839 () Bool)

(declare-fun res!789769 () Bool)

(assert (=> b!1187839 (=> (not res!789769) (not e!675389))))

(declare-fun lt!540139 () array!76676)

(assert (=> b!1187839 (= res!789769 (arrayNoDuplicates!0 lt!540139 #b00000000000000000000000000000000 Nil!26137))))

(declare-fun b!1187840 () Bool)

(declare-fun e!675390 () Bool)

(assert (=> b!1187840 (= e!675399 e!675390)))

(declare-fun res!789770 () Bool)

(assert (=> b!1187840 (=> res!789770 e!675390)))

(assert (=> b!1187840 (= res!789770 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45089)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19428 0))(
  ( (tuple2!19429 (_1!9725 (_ BitVec 64)) (_2!9725 V!45089)) )
))
(declare-datatypes ((List!26141 0))(
  ( (Nil!26138) (Cons!26137 (h!27346 tuple2!19428) (t!38565 List!26141)) )
))
(declare-datatypes ((ListLongMap!17397 0))(
  ( (ListLongMap!17398 (toList!8714 List!26141)) )
))
(declare-fun lt!540133 () ListLongMap!17397)

(declare-fun lt!540145 () array!76678)

(declare-fun minValue!944 () V!45089)

(declare-fun getCurrentListMapNoExtraKeys!5164 (array!76676 array!76678 (_ BitVec 32) (_ BitVec 32) V!45089 V!45089 (_ BitVec 32) Int) ListLongMap!17397)

(assert (=> b!1187840 (= lt!540133 (getCurrentListMapNoExtraKeys!5164 lt!540139 lt!540145 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!540138 () V!45089)

(assert (=> b!1187840 (= lt!540145 (array!76679 (store (arr!36989 _values!996) i!673 (ValueCellFull!14276 lt!540138)) (size!37527 _values!996)))))

(declare-fun dynLambda!3062 (Int (_ BitVec 64)) V!45089)

(assert (=> b!1187840 (= lt!540138 (dynLambda!3062 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!540147 () ListLongMap!17397)

(assert (=> b!1187840 (= lt!540147 (getCurrentListMapNoExtraKeys!5164 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187841 () Bool)

(declare-fun res!789764 () Bool)

(assert (=> b!1187841 (=> (not res!789764) (not e!675394))))

(assert (=> b!1187841 (= res!789764 (= (select (arr!36988 _keys!1208) i!673) k0!934))))

(declare-fun res!789763 () Bool)

(assert (=> start!99856 (=> (not res!789763) (not e!675394))))

(assert (=> start!99856 (= res!789763 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37526 _keys!1208))))))

(assert (=> start!99856 e!675394))

(declare-fun tp_is_empty!29971 () Bool)

(assert (=> start!99856 tp_is_empty!29971))

(declare-fun array_inv!28330 (array!76676) Bool)

(assert (=> start!99856 (array_inv!28330 _keys!1208)))

(assert (=> start!99856 true))

(assert (=> start!99856 tp!89037))

(declare-fun e!675395 () Bool)

(declare-fun array_inv!28331 (array!76678) Bool)

(assert (=> start!99856 (and (array_inv!28331 _values!996) e!675395)))

(declare-fun b!1187842 () Bool)

(declare-fun res!789768 () Bool)

(assert (=> b!1187842 (=> (not res!789768) (not e!675394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76676 (_ BitVec 32)) Bool)

(assert (=> b!1187842 (= res!789768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187843 () Bool)

(assert (=> b!1187843 (= e!675394 e!675389)))

(declare-fun res!789766 () Bool)

(assert (=> b!1187843 (=> (not res!789766) (not e!675389))))

(assert (=> b!1187843 (= res!789766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540139 mask!1564))))

(assert (=> b!1187843 (= lt!540139 (array!76677 (store (arr!36988 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37526 _keys!1208)))))

(declare-fun mapNonEmpty!46784 () Bool)

(declare-fun mapRes!46784 () Bool)

(declare-fun tp!89036 () Bool)

(declare-fun e!675398 () Bool)

(assert (=> mapNonEmpty!46784 (= mapRes!46784 (and tp!89036 e!675398))))

(declare-fun mapRest!46784 () (Array (_ BitVec 32) ValueCell!14276))

(declare-fun mapKey!46784 () (_ BitVec 32))

(declare-fun mapValue!46784 () ValueCell!14276)

(assert (=> mapNonEmpty!46784 (= (arr!36989 _values!996) (store mapRest!46784 mapKey!46784 mapValue!46784))))

(declare-fun mapIsEmpty!46784 () Bool)

(assert (=> mapIsEmpty!46784 mapRes!46784))

(declare-fun b!1187844 () Bool)

(declare-fun e!675400 () Bool)

(assert (=> b!1187844 (= e!675395 (and e!675400 mapRes!46784))))

(declare-fun condMapEmpty!46784 () Bool)

(declare-fun mapDefault!46784 () ValueCell!14276)

(assert (=> b!1187844 (= condMapEmpty!46784 (= (arr!36989 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14276)) mapDefault!46784)))))

(declare-fun b!1187845 () Bool)

(assert (=> b!1187845 (= e!675398 tp_is_empty!29971)))

(declare-fun b!1187846 () Bool)

(declare-fun e!675396 () Unit!39275)

(declare-fun Unit!39277 () Unit!39275)

(assert (=> b!1187846 (= e!675396 Unit!39277)))

(declare-fun b!1187847 () Bool)

(declare-fun Unit!39278 () Unit!39275)

(assert (=> b!1187847 (= e!675396 Unit!39278)))

(declare-fun lt!540132 () Unit!39275)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76676 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39275)

(assert (=> b!1187847 (= lt!540132 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187847 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540137 () Unit!39275)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76676 (_ BitVec 32) (_ BitVec 32)) Unit!39275)

(assert (=> b!1187847 (= lt!540137 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1187847 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26137)))

(declare-fun lt!540143 () Unit!39275)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76676 (_ BitVec 64) (_ BitVec 32) List!26140) Unit!39275)

(assert (=> b!1187847 (= lt!540143 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26137))))

(assert (=> b!1187847 false))

(declare-fun b!1187848 () Bool)

(declare-fun res!789771 () Bool)

(assert (=> b!1187848 (=> (not res!789771) (not e!675394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187848 (= res!789771 (validKeyInArray!0 k0!934))))

(declare-fun b!1187849 () Bool)

(assert (=> b!1187849 (= e!675400 tp_is_empty!29971)))

(declare-fun b!1187850 () Bool)

(declare-fun e!675397 () Bool)

(assert (=> b!1187850 (= e!675397 true)))

(declare-fun lt!540134 () ListLongMap!17397)

(declare-fun lt!540146 () ListLongMap!17397)

(declare-fun -!1663 (ListLongMap!17397 (_ BitVec 64)) ListLongMap!17397)

(assert (=> b!1187850 (= (-!1663 lt!540134 k0!934) lt!540146)))

(declare-fun lt!540135 () V!45089)

(declare-fun lt!540141 () ListLongMap!17397)

(declare-fun lt!540136 () Unit!39275)

(declare-fun addRemoveCommutativeForDiffKeys!206 (ListLongMap!17397 (_ BitVec 64) V!45089 (_ BitVec 64)) Unit!39275)

(assert (=> b!1187850 (= lt!540136 (addRemoveCommutativeForDiffKeys!206 lt!540141 (select (arr!36988 _keys!1208) from!1455) lt!540135 k0!934))))

(declare-fun lt!540142 () ListLongMap!17397)

(declare-fun lt!540129 () ListLongMap!17397)

(assert (=> b!1187850 (and (= lt!540147 lt!540134) (= lt!540129 lt!540142))))

(declare-fun lt!540144 () tuple2!19428)

(declare-fun +!3992 (ListLongMap!17397 tuple2!19428) ListLongMap!17397)

(assert (=> b!1187850 (= lt!540134 (+!3992 lt!540141 lt!540144))))

(assert (=> b!1187850 (not (= (select (arr!36988 _keys!1208) from!1455) k0!934))))

(declare-fun lt!540140 () Unit!39275)

(assert (=> b!1187850 (= lt!540140 e!675396)))

(declare-fun c!117259 () Bool)

(assert (=> b!1187850 (= c!117259 (= (select (arr!36988 _keys!1208) from!1455) k0!934))))

(assert (=> b!1187850 e!675393))

(declare-fun res!789758 () Bool)

(assert (=> b!1187850 (=> (not res!789758) (not e!675393))))

(assert (=> b!1187850 (= res!789758 (= lt!540133 lt!540146))))

(assert (=> b!1187850 (= lt!540146 (+!3992 lt!540129 lt!540144))))

(assert (=> b!1187850 (= lt!540144 (tuple2!19429 (select (arr!36988 _keys!1208) from!1455) lt!540135))))

(declare-fun get!18961 (ValueCell!14276 V!45089) V!45089)

(assert (=> b!1187850 (= lt!540135 (get!18961 (select (arr!36989 _values!996) from!1455) lt!540138))))

(declare-fun b!1187851 () Bool)

(assert (=> b!1187851 (= e!675390 e!675397)))

(declare-fun res!789767 () Bool)

(assert (=> b!1187851 (=> res!789767 e!675397)))

(assert (=> b!1187851 (= res!789767 (not (validKeyInArray!0 (select (arr!36988 _keys!1208) from!1455))))))

(assert (=> b!1187851 (= lt!540142 lt!540129)))

(assert (=> b!1187851 (= lt!540129 (-!1663 lt!540141 k0!934))))

(assert (=> b!1187851 (= lt!540142 (getCurrentListMapNoExtraKeys!5164 lt!540139 lt!540145 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187851 (= lt!540141 (getCurrentListMapNoExtraKeys!5164 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!540131 () Unit!39275)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!913 (array!76676 array!76678 (_ BitVec 32) (_ BitVec 32) V!45089 V!45089 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39275)

(assert (=> b!1187851 (= lt!540131 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!913 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187852 () Bool)

(assert (=> b!1187852 (= e!675392 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99856 res!789763) b!1187838))

(assert (= (and b!1187838 res!789759) b!1187836))

(assert (= (and b!1187836 res!789762) b!1187842))

(assert (= (and b!1187842 res!789768) b!1187834))

(assert (= (and b!1187834 res!789760) b!1187835))

(assert (= (and b!1187835 res!789761) b!1187848))

(assert (= (and b!1187848 res!789771) b!1187841))

(assert (= (and b!1187841 res!789764) b!1187843))

(assert (= (and b!1187843 res!789766) b!1187839))

(assert (= (and b!1187839 res!789769) b!1187837))

(assert (= (and b!1187837 (not res!789765)) b!1187840))

(assert (= (and b!1187840 (not res!789770)) b!1187851))

(assert (= (and b!1187851 (not res!789767)) b!1187850))

(assert (= (and b!1187850 res!789758) b!1187833))

(assert (= (and b!1187833 (not res!789772)) b!1187852))

(assert (= (and b!1187850 c!117259) b!1187847))

(assert (= (and b!1187850 (not c!117259)) b!1187846))

(assert (= (and b!1187844 condMapEmpty!46784) mapIsEmpty!46784))

(assert (= (and b!1187844 (not condMapEmpty!46784)) mapNonEmpty!46784))

(get-info :version)

(assert (= (and mapNonEmpty!46784 ((_ is ValueCellFull!14276) mapValue!46784)) b!1187845))

(assert (= (and b!1187844 ((_ is ValueCellFull!14276) mapDefault!46784)) b!1187849))

(assert (= start!99856 b!1187844))

(declare-fun b_lambda!20567 () Bool)

(assert (=> (not b_lambda!20567) (not b!1187840)))

(declare-fun t!38563 () Bool)

(declare-fun tb!10245 () Bool)

(assert (=> (and start!99856 (= defaultEntry!1004 defaultEntry!1004) t!38563) tb!10245))

(declare-fun result!21065 () Bool)

(assert (=> tb!10245 (= result!21065 tp_is_empty!29971)))

(assert (=> b!1187840 t!38563))

(declare-fun b_and!41729 () Bool)

(assert (= b_and!41727 (and (=> t!38563 result!21065) b_and!41729)))

(declare-fun m!1096085 () Bool)

(assert (=> b!1187834 m!1096085))

(declare-fun m!1096087 () Bool)

(assert (=> b!1187843 m!1096087))

(declare-fun m!1096089 () Bool)

(assert (=> b!1187843 m!1096089))

(declare-fun m!1096091 () Bool)

(assert (=> b!1187838 m!1096091))

(declare-fun m!1096093 () Bool)

(assert (=> b!1187837 m!1096093))

(declare-fun m!1096095 () Bool)

(assert (=> b!1187837 m!1096095))

(declare-fun m!1096097 () Bool)

(assert (=> b!1187841 m!1096097))

(declare-fun m!1096099 () Bool)

(assert (=> b!1187847 m!1096099))

(declare-fun m!1096101 () Bool)

(assert (=> b!1187847 m!1096101))

(declare-fun m!1096103 () Bool)

(assert (=> b!1187847 m!1096103))

(declare-fun m!1096105 () Bool)

(assert (=> b!1187847 m!1096105))

(declare-fun m!1096107 () Bool)

(assert (=> b!1187847 m!1096107))

(declare-fun m!1096109 () Bool)

(assert (=> b!1187851 m!1096109))

(declare-fun m!1096111 () Bool)

(assert (=> b!1187851 m!1096111))

(declare-fun m!1096113 () Bool)

(assert (=> b!1187851 m!1096113))

(declare-fun m!1096115 () Bool)

(assert (=> b!1187851 m!1096115))

(declare-fun m!1096117 () Bool)

(assert (=> b!1187851 m!1096117))

(declare-fun m!1096119 () Bool)

(assert (=> b!1187851 m!1096119))

(assert (=> b!1187851 m!1096117))

(declare-fun m!1096121 () Bool)

(assert (=> b!1187848 m!1096121))

(declare-fun m!1096123 () Bool)

(assert (=> start!99856 m!1096123))

(declare-fun m!1096125 () Bool)

(assert (=> start!99856 m!1096125))

(declare-fun m!1096127 () Bool)

(assert (=> b!1187852 m!1096127))

(declare-fun m!1096129 () Bool)

(assert (=> b!1187842 m!1096129))

(assert (=> b!1187850 m!1096117))

(declare-fun m!1096131 () Bool)

(assert (=> b!1187850 m!1096131))

(declare-fun m!1096133 () Bool)

(assert (=> b!1187850 m!1096133))

(declare-fun m!1096135 () Bool)

(assert (=> b!1187850 m!1096135))

(assert (=> b!1187850 m!1096133))

(declare-fun m!1096137 () Bool)

(assert (=> b!1187850 m!1096137))

(declare-fun m!1096139 () Bool)

(assert (=> b!1187850 m!1096139))

(declare-fun m!1096141 () Bool)

(assert (=> b!1187850 m!1096141))

(assert (=> b!1187850 m!1096117))

(declare-fun m!1096143 () Bool)

(assert (=> mapNonEmpty!46784 m!1096143))

(declare-fun m!1096145 () Bool)

(assert (=> b!1187840 m!1096145))

(declare-fun m!1096147 () Bool)

(assert (=> b!1187840 m!1096147))

(declare-fun m!1096149 () Bool)

(assert (=> b!1187840 m!1096149))

(declare-fun m!1096151 () Bool)

(assert (=> b!1187840 m!1096151))

(declare-fun m!1096153 () Bool)

(assert (=> b!1187839 m!1096153))

(assert (=> b!1187833 m!1096117))

(check-sat (not b!1187848) (not b!1187834) (not b!1187852) (not b!1187840) (not b_next!25441) (not b!1187850) (not b_lambda!20567) (not b!1187839) (not b!1187843) (not start!99856) (not b!1187842) b_and!41729 (not b!1187838) (not mapNonEmpty!46784) (not b!1187847) (not b!1187851) tp_is_empty!29971 (not b!1187837))
(check-sat b_and!41729 (not b_next!25441))
