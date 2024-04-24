; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100062 () Bool)

(assert start!100062)

(declare-fun b_free!25405 () Bool)

(declare-fun b_next!25405 () Bool)

(assert (=> start!100062 (= b_free!25405 (not b_next!25405))))

(declare-fun tp!88928 () Bool)

(declare-fun b_and!41679 () Bool)

(assert (=> start!100062 (= tp!88928 b_and!41679)))

(declare-fun b!1188130 () Bool)

(declare-fun e!675657 () Bool)

(declare-fun tp_is_empty!29935 () Bool)

(assert (=> b!1188130 (= e!675657 tp_is_empty!29935)))

(declare-fun b!1188131 () Bool)

(declare-fun res!789525 () Bool)

(declare-fun e!675653 () Bool)

(assert (=> b!1188131 (=> (not res!789525) (not e!675653))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188131 (= res!789525 (validMask!0 mask!1564))))

(declare-fun b!1188132 () Bool)

(declare-fun e!675660 () Bool)

(declare-fun e!675661 () Bool)

(assert (=> b!1188132 (= e!675660 e!675661)))

(declare-fun res!789534 () Bool)

(assert (=> b!1188132 (=> res!789534 e!675661)))

(declare-datatypes ((array!76711 0))(
  ( (array!76712 (arr!36999 (Array (_ BitVec 32) (_ BitVec 64))) (size!37536 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76711)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188132 (= res!789534 (not (validKeyInArray!0 (select (arr!36999 _keys!1208) from!1455))))))

(declare-datatypes ((V!45041 0))(
  ( (V!45042 (val!15024 Int)) )
))
(declare-datatypes ((tuple2!19324 0))(
  ( (tuple2!19325 (_1!9673 (_ BitVec 64)) (_2!9673 V!45041)) )
))
(declare-datatypes ((List!26059 0))(
  ( (Nil!26056) (Cons!26055 (h!27273 tuple2!19324) (t!38448 List!26059)) )
))
(declare-datatypes ((ListLongMap!17301 0))(
  ( (ListLongMap!17302 (toList!8666 List!26059)) )
))
(declare-fun lt!539783 () ListLongMap!17301)

(declare-fun lt!539784 () ListLongMap!17301)

(assert (=> b!1188132 (= lt!539783 lt!539784)))

(declare-fun lt!539785 () ListLongMap!17301)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1686 (ListLongMap!17301 (_ BitVec 64)) ListLongMap!17301)

(assert (=> b!1188132 (= lt!539784 (-!1686 lt!539785 k0!934))))

(declare-fun zeroValue!944 () V!45041)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14258 0))(
  ( (ValueCellFull!14258 (v!17658 V!45041)) (EmptyCell!14258) )
))
(declare-datatypes ((array!76713 0))(
  ( (array!76714 (arr!37000 (Array (_ BitVec 32) ValueCell!14258)) (size!37537 (_ BitVec 32))) )
))
(declare-fun lt!539794 () array!76713)

(declare-fun minValue!944 () V!45041)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!539797 () array!76711)

(declare-fun getCurrentListMapNoExtraKeys!5135 (array!76711 array!76713 (_ BitVec 32) (_ BitVec 32) V!45041 V!45041 (_ BitVec 32) Int) ListLongMap!17301)

(assert (=> b!1188132 (= lt!539783 (getCurrentListMapNoExtraKeys!5135 lt!539797 lt!539794 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76713)

(assert (=> b!1188132 (= lt!539785 (getCurrentListMapNoExtraKeys!5135 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39338 0))(
  ( (Unit!39339) )
))
(declare-fun lt!539780 () Unit!39338)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!902 (array!76711 array!76713 (_ BitVec 32) (_ BitVec 32) V!45041 V!45041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39338)

(assert (=> b!1188132 (= lt!539780 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!902 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188133 () Bool)

(declare-fun e!675656 () Bool)

(declare-fun mapRes!46730 () Bool)

(assert (=> b!1188133 (= e!675656 (and e!675657 mapRes!46730))))

(declare-fun condMapEmpty!46730 () Bool)

(declare-fun mapDefault!46730 () ValueCell!14258)

(assert (=> b!1188133 (= condMapEmpty!46730 (= (arr!37000 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14258)) mapDefault!46730)))))

(declare-fun b!1188135 () Bool)

(declare-fun e!675654 () Bool)

(declare-fun e!675651 () Bool)

(assert (=> b!1188135 (= e!675654 (not e!675651))))

(declare-fun res!789529 () Bool)

(assert (=> b!1188135 (=> res!789529 e!675651)))

(assert (=> b!1188135 (= res!789529 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188135 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539788 () Unit!39338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76711 (_ BitVec 64) (_ BitVec 32)) Unit!39338)

(assert (=> b!1188135 (= lt!539788 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188136 () Bool)

(declare-fun res!789524 () Bool)

(assert (=> b!1188136 (=> (not res!789524) (not e!675653))))

(assert (=> b!1188136 (= res!789524 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37536 _keys!1208))))))

(declare-fun b!1188137 () Bool)

(declare-fun e!675659 () Unit!39338)

(declare-fun Unit!39340 () Unit!39338)

(assert (=> b!1188137 (= e!675659 Unit!39340)))

(declare-fun lt!539787 () Unit!39338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76711 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39338)

(assert (=> b!1188137 (= lt!539787 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1188137 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539791 () Unit!39338)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76711 (_ BitVec 32) (_ BitVec 32)) Unit!39338)

(assert (=> b!1188137 (= lt!539791 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26060 0))(
  ( (Nil!26057) (Cons!26056 (h!27274 (_ BitVec 64)) (t!38449 List!26060)) )
))
(declare-fun arrayNoDuplicates!0 (array!76711 (_ BitVec 32) List!26060) Bool)

(assert (=> b!1188137 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26057)))

(declare-fun lt!539786 () Unit!39338)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76711 (_ BitVec 64) (_ BitVec 32) List!26060) Unit!39338)

(assert (=> b!1188137 (= lt!539786 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26057))))

(assert (=> b!1188137 false))

(declare-fun b!1188138 () Bool)

(declare-fun res!789526 () Bool)

(assert (=> b!1188138 (=> (not res!789526) (not e!675654))))

(assert (=> b!1188138 (= res!789526 (arrayNoDuplicates!0 lt!539797 #b00000000000000000000000000000000 Nil!26057))))

(declare-fun b!1188139 () Bool)

(assert (=> b!1188139 (= e!675651 e!675660)))

(declare-fun res!789532 () Bool)

(assert (=> b!1188139 (=> res!789532 e!675660)))

(assert (=> b!1188139 (= res!789532 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!539782 () ListLongMap!17301)

(assert (=> b!1188139 (= lt!539782 (getCurrentListMapNoExtraKeys!5135 lt!539797 lt!539794 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!539795 () V!45041)

(assert (=> b!1188139 (= lt!539794 (array!76714 (store (arr!37000 _values!996) i!673 (ValueCellFull!14258 lt!539795)) (size!37537 _values!996)))))

(declare-fun dynLambda!3094 (Int (_ BitVec 64)) V!45041)

(assert (=> b!1188139 (= lt!539795 (dynLambda!3094 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!539790 () ListLongMap!17301)

(assert (=> b!1188139 (= lt!539790 (getCurrentListMapNoExtraKeys!5135 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188140 () Bool)

(assert (=> b!1188140 (= e!675661 true)))

(declare-fun lt!539781 () ListLongMap!17301)

(declare-fun lt!539779 () ListLongMap!17301)

(assert (=> b!1188140 (= (-!1686 lt!539781 k0!934) lt!539779)))

(declare-fun lt!539796 () Unit!39338)

(declare-fun lt!539792 () V!45041)

(declare-fun addRemoveCommutativeForDiffKeys!199 (ListLongMap!17301 (_ BitVec 64) V!45041 (_ BitVec 64)) Unit!39338)

(assert (=> b!1188140 (= lt!539796 (addRemoveCommutativeForDiffKeys!199 lt!539785 (select (arr!36999 _keys!1208) from!1455) lt!539792 k0!934))))

(assert (=> b!1188140 (and (= lt!539790 lt!539781) (= lt!539784 lt!539783))))

(declare-fun lt!539793 () tuple2!19324)

(declare-fun +!3983 (ListLongMap!17301 tuple2!19324) ListLongMap!17301)

(assert (=> b!1188140 (= lt!539781 (+!3983 lt!539785 lt!539793))))

(assert (=> b!1188140 (not (= (select (arr!36999 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539789 () Unit!39338)

(assert (=> b!1188140 (= lt!539789 e!675659)))

(declare-fun c!117629 () Bool)

(assert (=> b!1188140 (= c!117629 (= (select (arr!36999 _keys!1208) from!1455) k0!934))))

(declare-fun e!675662 () Bool)

(assert (=> b!1188140 e!675662))

(declare-fun res!789533 () Bool)

(assert (=> b!1188140 (=> (not res!789533) (not e!675662))))

(assert (=> b!1188140 (= res!789533 (= lt!539782 lt!539779))))

(assert (=> b!1188140 (= lt!539779 (+!3983 lt!539784 lt!539793))))

(assert (=> b!1188140 (= lt!539793 (tuple2!19325 (select (arr!36999 _keys!1208) from!1455) lt!539792))))

(declare-fun get!18996 (ValueCell!14258 V!45041) V!45041)

(assert (=> b!1188140 (= lt!539792 (get!18996 (select (arr!37000 _values!996) from!1455) lt!539795))))

(declare-fun e!675655 () Bool)

(declare-fun b!1188141 () Bool)

(assert (=> b!1188141 (= e!675655 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188142 () Bool)

(declare-fun res!789527 () Bool)

(assert (=> b!1188142 (=> (not res!789527) (not e!675653))))

(assert (=> b!1188142 (= res!789527 (and (= (size!37537 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37536 _keys!1208) (size!37537 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188143 () Bool)

(declare-fun Unit!39341 () Unit!39338)

(assert (=> b!1188143 (= e!675659 Unit!39341)))

(declare-fun mapIsEmpty!46730 () Bool)

(assert (=> mapIsEmpty!46730 mapRes!46730))

(declare-fun mapNonEmpty!46730 () Bool)

(declare-fun tp!88929 () Bool)

(declare-fun e!675652 () Bool)

(assert (=> mapNonEmpty!46730 (= mapRes!46730 (and tp!88929 e!675652))))

(declare-fun mapKey!46730 () (_ BitVec 32))

(declare-fun mapValue!46730 () ValueCell!14258)

(declare-fun mapRest!46730 () (Array (_ BitVec 32) ValueCell!14258))

(assert (=> mapNonEmpty!46730 (= (arr!37000 _values!996) (store mapRest!46730 mapKey!46730 mapValue!46730))))

(declare-fun res!789522 () Bool)

(assert (=> start!100062 (=> (not res!789522) (not e!675653))))

(assert (=> start!100062 (= res!789522 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37536 _keys!1208))))))

(assert (=> start!100062 e!675653))

(assert (=> start!100062 tp_is_empty!29935))

(declare-fun array_inv!28306 (array!76711) Bool)

(assert (=> start!100062 (array_inv!28306 _keys!1208)))

(assert (=> start!100062 true))

(assert (=> start!100062 tp!88928))

(declare-fun array_inv!28307 (array!76713) Bool)

(assert (=> start!100062 (and (array_inv!28307 _values!996) e!675656)))

(declare-fun b!1188134 () Bool)

(declare-fun res!789528 () Bool)

(assert (=> b!1188134 (=> (not res!789528) (not e!675653))))

(assert (=> b!1188134 (= res!789528 (validKeyInArray!0 k0!934))))

(declare-fun b!1188144 () Bool)

(assert (=> b!1188144 (= e!675653 e!675654)))

(declare-fun res!789530 () Bool)

(assert (=> b!1188144 (=> (not res!789530) (not e!675654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76711 (_ BitVec 32)) Bool)

(assert (=> b!1188144 (= res!789530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539797 mask!1564))))

(assert (=> b!1188144 (= lt!539797 (array!76712 (store (arr!36999 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37536 _keys!1208)))))

(declare-fun b!1188145 () Bool)

(assert (=> b!1188145 (= e!675662 e!675655)))

(declare-fun res!789531 () Bool)

(assert (=> b!1188145 (=> res!789531 e!675655)))

(assert (=> b!1188145 (= res!789531 (not (= (select (arr!36999 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1188146 () Bool)

(assert (=> b!1188146 (= e!675652 tp_is_empty!29935)))

(declare-fun b!1188147 () Bool)

(declare-fun res!789536 () Bool)

(assert (=> b!1188147 (=> (not res!789536) (not e!675653))))

(assert (=> b!1188147 (= res!789536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188148 () Bool)

(declare-fun res!789535 () Bool)

(assert (=> b!1188148 (=> (not res!789535) (not e!675653))))

(assert (=> b!1188148 (= res!789535 (= (select (arr!36999 _keys!1208) i!673) k0!934))))

(declare-fun b!1188149 () Bool)

(declare-fun res!789523 () Bool)

(assert (=> b!1188149 (=> (not res!789523) (not e!675653))))

(assert (=> b!1188149 (= res!789523 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26057))))

(assert (= (and start!100062 res!789522) b!1188131))

(assert (= (and b!1188131 res!789525) b!1188142))

(assert (= (and b!1188142 res!789527) b!1188147))

(assert (= (and b!1188147 res!789536) b!1188149))

(assert (= (and b!1188149 res!789523) b!1188136))

(assert (= (and b!1188136 res!789524) b!1188134))

(assert (= (and b!1188134 res!789528) b!1188148))

(assert (= (and b!1188148 res!789535) b!1188144))

(assert (= (and b!1188144 res!789530) b!1188138))

(assert (= (and b!1188138 res!789526) b!1188135))

(assert (= (and b!1188135 (not res!789529)) b!1188139))

(assert (= (and b!1188139 (not res!789532)) b!1188132))

(assert (= (and b!1188132 (not res!789534)) b!1188140))

(assert (= (and b!1188140 res!789533) b!1188145))

(assert (= (and b!1188145 (not res!789531)) b!1188141))

(assert (= (and b!1188140 c!117629) b!1188137))

(assert (= (and b!1188140 (not c!117629)) b!1188143))

(assert (= (and b!1188133 condMapEmpty!46730) mapIsEmpty!46730))

(assert (= (and b!1188133 (not condMapEmpty!46730)) mapNonEmpty!46730))

(get-info :version)

(assert (= (and mapNonEmpty!46730 ((_ is ValueCellFull!14258) mapValue!46730)) b!1188146))

(assert (= (and b!1188133 ((_ is ValueCellFull!14258) mapDefault!46730)) b!1188130))

(assert (= start!100062 b!1188133))

(declare-fun b_lambda!20543 () Bool)

(assert (=> (not b_lambda!20543) (not b!1188139)))

(declare-fun t!38447 () Bool)

(declare-fun tb!10209 () Bool)

(assert (=> (and start!100062 (= defaultEntry!1004 defaultEntry!1004) t!38447) tb!10209))

(declare-fun result!20993 () Bool)

(assert (=> tb!10209 (= result!20993 tp_is_empty!29935)))

(assert (=> b!1188139 t!38447))

(declare-fun b_and!41681 () Bool)

(assert (= b_and!41679 (and (=> t!38447 result!20993) b_and!41681)))

(declare-fun m!1097007 () Bool)

(assert (=> b!1188145 m!1097007))

(declare-fun m!1097009 () Bool)

(assert (=> start!100062 m!1097009))

(declare-fun m!1097011 () Bool)

(assert (=> start!100062 m!1097011))

(declare-fun m!1097013 () Bool)

(assert (=> b!1188135 m!1097013))

(declare-fun m!1097015 () Bool)

(assert (=> b!1188135 m!1097015))

(declare-fun m!1097017 () Bool)

(assert (=> b!1188149 m!1097017))

(declare-fun m!1097019 () Bool)

(assert (=> b!1188131 m!1097019))

(declare-fun m!1097021 () Bool)

(assert (=> mapNonEmpty!46730 m!1097021))

(assert (=> b!1188140 m!1097007))

(declare-fun m!1097023 () Bool)

(assert (=> b!1188140 m!1097023))

(declare-fun m!1097025 () Bool)

(assert (=> b!1188140 m!1097025))

(declare-fun m!1097027 () Bool)

(assert (=> b!1188140 m!1097027))

(declare-fun m!1097029 () Bool)

(assert (=> b!1188140 m!1097029))

(declare-fun m!1097031 () Bool)

(assert (=> b!1188140 m!1097031))

(assert (=> b!1188140 m!1097007))

(declare-fun m!1097033 () Bool)

(assert (=> b!1188140 m!1097033))

(assert (=> b!1188140 m!1097025))

(declare-fun m!1097035 () Bool)

(assert (=> b!1188134 m!1097035))

(declare-fun m!1097037 () Bool)

(assert (=> b!1188137 m!1097037))

(declare-fun m!1097039 () Bool)

(assert (=> b!1188137 m!1097039))

(declare-fun m!1097041 () Bool)

(assert (=> b!1188137 m!1097041))

(declare-fun m!1097043 () Bool)

(assert (=> b!1188137 m!1097043))

(declare-fun m!1097045 () Bool)

(assert (=> b!1188137 m!1097045))

(declare-fun m!1097047 () Bool)

(assert (=> b!1188132 m!1097047))

(declare-fun m!1097049 () Bool)

(assert (=> b!1188132 m!1097049))

(declare-fun m!1097051 () Bool)

(assert (=> b!1188132 m!1097051))

(declare-fun m!1097053 () Bool)

(assert (=> b!1188132 m!1097053))

(assert (=> b!1188132 m!1097007))

(declare-fun m!1097055 () Bool)

(assert (=> b!1188132 m!1097055))

(assert (=> b!1188132 m!1097007))

(declare-fun m!1097057 () Bool)

(assert (=> b!1188139 m!1097057))

(declare-fun m!1097059 () Bool)

(assert (=> b!1188139 m!1097059))

(declare-fun m!1097061 () Bool)

(assert (=> b!1188139 m!1097061))

(declare-fun m!1097063 () Bool)

(assert (=> b!1188139 m!1097063))

(declare-fun m!1097065 () Bool)

(assert (=> b!1188138 m!1097065))

(declare-fun m!1097067 () Bool)

(assert (=> b!1188147 m!1097067))

(declare-fun m!1097069 () Bool)

(assert (=> b!1188144 m!1097069))

(declare-fun m!1097071 () Bool)

(assert (=> b!1188144 m!1097071))

(declare-fun m!1097073 () Bool)

(assert (=> b!1188141 m!1097073))

(declare-fun m!1097075 () Bool)

(assert (=> b!1188148 m!1097075))

(check-sat (not start!100062) (not b!1188139) tp_is_empty!29935 (not b!1188141) (not b!1188134) (not mapNonEmpty!46730) (not b!1188131) (not b!1188138) (not b_lambda!20543) (not b!1188144) (not b_next!25405) (not b!1188147) b_and!41681 (not b!1188137) (not b!1188135) (not b!1188140) (not b!1188132) (not b!1188149))
(check-sat b_and!41681 (not b_next!25405))
