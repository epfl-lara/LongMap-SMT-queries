; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101370 () Bool)

(assert start!101370)

(declare-fun b_free!26241 () Bool)

(declare-fun b_next!26241 () Bool)

(assert (=> start!101370 (= b_free!26241 (not b_next!26241))))

(declare-fun tp!91750 () Bool)

(declare-fun b_and!43635 () Bool)

(assert (=> start!101370 (= tp!91750 b_and!43635)))

(declare-fun b!1218055 () Bool)

(declare-fun res!808929 () Bool)

(declare-fun e!691546 () Bool)

(assert (=> b!1218055 (=> (not res!808929) (not e!691546))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218055 (= res!808929 (validMask!0 mask!1564))))

(declare-fun b!1218056 () Bool)

(declare-fun e!691545 () Bool)

(declare-fun e!691549 () Bool)

(assert (=> b!1218056 (= e!691545 (not e!691549))))

(declare-fun res!808928 () Bool)

(assert (=> b!1218056 (=> res!808928 e!691549)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1218056 (= res!808928 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78665 0))(
  ( (array!78666 (arr!37965 (Array (_ BitVec 32) (_ BitVec 64))) (size!38501 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78665)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218056 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40378 0))(
  ( (Unit!40379) )
))
(declare-fun lt!553685 () Unit!40378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78665 (_ BitVec 64) (_ BitVec 32)) Unit!40378)

(assert (=> b!1218056 (= lt!553685 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218057 () Bool)

(assert (=> b!1218057 (= e!691546 e!691545)))

(declare-fun res!808930 () Bool)

(assert (=> b!1218057 (=> (not res!808930) (not e!691545))))

(declare-fun lt!553689 () array!78665)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78665 (_ BitVec 32)) Bool)

(assert (=> b!1218057 (= res!808930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553689 mask!1564))))

(assert (=> b!1218057 (= lt!553689 (array!78666 (store (arr!37965 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38501 _keys!1208)))))

(declare-fun b!1218058 () Bool)

(declare-fun res!808931 () Bool)

(assert (=> b!1218058 (=> (not res!808931) (not e!691546))))

(assert (=> b!1218058 (= res!808931 (= (select (arr!37965 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!48298 () Bool)

(declare-fun mapRes!48298 () Bool)

(assert (=> mapIsEmpty!48298 mapRes!48298))

(declare-fun b!1218059 () Bool)

(declare-fun res!808918 () Bool)

(assert (=> b!1218059 (=> (not res!808918) (not e!691546))))

(assert (=> b!1218059 (= res!808918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218060 () Bool)

(declare-fun e!691548 () Bool)

(declare-fun e!691552 () Bool)

(assert (=> b!1218060 (= e!691548 e!691552)))

(declare-fun res!808922 () Bool)

(assert (=> b!1218060 (=> res!808922 e!691552)))

(assert (=> b!1218060 (= res!808922 (not (= (select (arr!37965 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1218061 () Bool)

(declare-fun e!691551 () Bool)

(declare-fun e!691544 () Bool)

(assert (=> b!1218061 (= e!691551 e!691544)))

(declare-fun res!808917 () Bool)

(assert (=> b!1218061 (=> res!808917 e!691544)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218061 (= res!808917 (not (validKeyInArray!0 (select (arr!37965 _keys!1208) from!1455))))))

(declare-datatypes ((V!46387 0))(
  ( (V!46388 (val!15529 Int)) )
))
(declare-datatypes ((tuple2!19974 0))(
  ( (tuple2!19975 (_1!9998 (_ BitVec 64)) (_2!9998 V!46387)) )
))
(declare-datatypes ((List!26777 0))(
  ( (Nil!26774) (Cons!26773 (h!27982 tuple2!19974) (t!39998 List!26777)) )
))
(declare-datatypes ((ListLongMap!17943 0))(
  ( (ListLongMap!17944 (toList!8987 List!26777)) )
))
(declare-fun lt!553690 () ListLongMap!17943)

(declare-fun lt!553687 () ListLongMap!17943)

(assert (=> b!1218061 (= lt!553690 lt!553687)))

(declare-fun lt!553691 () ListLongMap!17943)

(declare-fun -!1902 (ListLongMap!17943 (_ BitVec 64)) ListLongMap!17943)

(assert (=> b!1218061 (= lt!553687 (-!1902 lt!553691 k0!934))))

(declare-fun zeroValue!944 () V!46387)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14763 0))(
  ( (ValueCellFull!14763 (v!18184 V!46387)) (EmptyCell!14763) )
))
(declare-datatypes ((array!78667 0))(
  ( (array!78668 (arr!37966 (Array (_ BitVec 32) ValueCell!14763)) (size!38502 (_ BitVec 32))) )
))
(declare-fun lt!553688 () array!78667)

(declare-fun minValue!944 () V!46387)

(declare-fun getCurrentListMapNoExtraKeys!5413 (array!78665 array!78667 (_ BitVec 32) (_ BitVec 32) V!46387 V!46387 (_ BitVec 32) Int) ListLongMap!17943)

(assert (=> b!1218061 (= lt!553690 (getCurrentListMapNoExtraKeys!5413 lt!553689 lt!553688 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78667)

(assert (=> b!1218061 (= lt!553691 (getCurrentListMapNoExtraKeys!5413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553686 () Unit!40378)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1109 (array!78665 array!78667 (_ BitVec 32) (_ BitVec 32) V!46387 V!46387 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40378)

(assert (=> b!1218061 (= lt!553686 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1109 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!808920 () Bool)

(assert (=> start!101370 (=> (not res!808920) (not e!691546))))

(assert (=> start!101370 (= res!808920 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38501 _keys!1208))))))

(assert (=> start!101370 e!691546))

(declare-fun tp_is_empty!30945 () Bool)

(assert (=> start!101370 tp_is_empty!30945))

(declare-fun array_inv!28896 (array!78665) Bool)

(assert (=> start!101370 (array_inv!28896 _keys!1208)))

(assert (=> start!101370 true))

(assert (=> start!101370 tp!91750))

(declare-fun e!691550 () Bool)

(declare-fun array_inv!28897 (array!78667) Bool)

(assert (=> start!101370 (and (array_inv!28897 _values!996) e!691550)))

(declare-fun b!1218062 () Bool)

(declare-fun e!691543 () Bool)

(assert (=> b!1218062 (= e!691543 tp_is_empty!30945)))

(declare-fun b!1218063 () Bool)

(assert (=> b!1218063 (= e!691550 (and e!691543 mapRes!48298))))

(declare-fun condMapEmpty!48298 () Bool)

(declare-fun mapDefault!48298 () ValueCell!14763)

(assert (=> b!1218063 (= condMapEmpty!48298 (= (arr!37966 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14763)) mapDefault!48298)))))

(declare-fun b!1218064 () Bool)

(declare-fun res!808926 () Bool)

(assert (=> b!1218064 (=> (not res!808926) (not e!691546))))

(assert (=> b!1218064 (= res!808926 (validKeyInArray!0 k0!934))))

(declare-fun b!1218065 () Bool)

(declare-fun res!808927 () Bool)

(assert (=> b!1218065 (=> (not res!808927) (not e!691546))))

(assert (=> b!1218065 (= res!808927 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38501 _keys!1208))))))

(declare-fun b!1218066 () Bool)

(declare-fun res!808924 () Bool)

(assert (=> b!1218066 (=> (not res!808924) (not e!691546))))

(assert (=> b!1218066 (= res!808924 (and (= (size!38502 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38501 _keys!1208) (size!38502 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218067 () Bool)

(assert (=> b!1218067 (= e!691544 true)))

(assert (=> b!1218067 e!691548))

(declare-fun res!808921 () Bool)

(assert (=> b!1218067 (=> (not res!808921) (not e!691548))))

(declare-fun lt!553683 () V!46387)

(declare-fun lt!553692 () ListLongMap!17943)

(declare-fun +!4058 (ListLongMap!17943 tuple2!19974) ListLongMap!17943)

(declare-fun get!19349 (ValueCell!14763 V!46387) V!46387)

(assert (=> b!1218067 (= res!808921 (= lt!553692 (+!4058 lt!553687 (tuple2!19975 (select (arr!37965 _keys!1208) from!1455) (get!19349 (select (arr!37966 _values!996) from!1455) lt!553683)))))))

(declare-fun b!1218068 () Bool)

(declare-fun res!808923 () Bool)

(assert (=> b!1218068 (=> (not res!808923) (not e!691546))))

(declare-datatypes ((List!26778 0))(
  ( (Nil!26775) (Cons!26774 (h!27983 (_ BitVec 64)) (t!39999 List!26778)) )
))
(declare-fun arrayNoDuplicates!0 (array!78665 (_ BitVec 32) List!26778) Bool)

(assert (=> b!1218068 (= res!808923 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26775))))

(declare-fun b!1218069 () Bool)

(assert (=> b!1218069 (= e!691552 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48298 () Bool)

(declare-fun tp!91751 () Bool)

(declare-fun e!691547 () Bool)

(assert (=> mapNonEmpty!48298 (= mapRes!48298 (and tp!91751 e!691547))))

(declare-fun mapRest!48298 () (Array (_ BitVec 32) ValueCell!14763))

(declare-fun mapKey!48298 () (_ BitVec 32))

(declare-fun mapValue!48298 () ValueCell!14763)

(assert (=> mapNonEmpty!48298 (= (arr!37966 _values!996) (store mapRest!48298 mapKey!48298 mapValue!48298))))

(declare-fun b!1218070 () Bool)

(assert (=> b!1218070 (= e!691547 tp_is_empty!30945)))

(declare-fun b!1218071 () Bool)

(assert (=> b!1218071 (= e!691549 e!691551)))

(declare-fun res!808925 () Bool)

(assert (=> b!1218071 (=> res!808925 e!691551)))

(assert (=> b!1218071 (= res!808925 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1218071 (= lt!553692 (getCurrentListMapNoExtraKeys!5413 lt!553689 lt!553688 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1218071 (= lt!553688 (array!78668 (store (arr!37966 _values!996) i!673 (ValueCellFull!14763 lt!553683)) (size!38502 _values!996)))))

(declare-fun dynLambda!3297 (Int (_ BitVec 64)) V!46387)

(assert (=> b!1218071 (= lt!553683 (dynLambda!3297 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553684 () ListLongMap!17943)

(assert (=> b!1218071 (= lt!553684 (getCurrentListMapNoExtraKeys!5413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218072 () Bool)

(declare-fun res!808919 () Bool)

(assert (=> b!1218072 (=> (not res!808919) (not e!691545))))

(assert (=> b!1218072 (= res!808919 (arrayNoDuplicates!0 lt!553689 #b00000000000000000000000000000000 Nil!26775))))

(assert (= (and start!101370 res!808920) b!1218055))

(assert (= (and b!1218055 res!808929) b!1218066))

(assert (= (and b!1218066 res!808924) b!1218059))

(assert (= (and b!1218059 res!808918) b!1218068))

(assert (= (and b!1218068 res!808923) b!1218065))

(assert (= (and b!1218065 res!808927) b!1218064))

(assert (= (and b!1218064 res!808926) b!1218058))

(assert (= (and b!1218058 res!808931) b!1218057))

(assert (= (and b!1218057 res!808930) b!1218072))

(assert (= (and b!1218072 res!808919) b!1218056))

(assert (= (and b!1218056 (not res!808928)) b!1218071))

(assert (= (and b!1218071 (not res!808925)) b!1218061))

(assert (= (and b!1218061 (not res!808917)) b!1218067))

(assert (= (and b!1218067 res!808921) b!1218060))

(assert (= (and b!1218060 (not res!808922)) b!1218069))

(assert (= (and b!1218063 condMapEmpty!48298) mapIsEmpty!48298))

(assert (= (and b!1218063 (not condMapEmpty!48298)) mapNonEmpty!48298))

(get-info :version)

(assert (= (and mapNonEmpty!48298 ((_ is ValueCellFull!14763) mapValue!48298)) b!1218070))

(assert (= (and b!1218063 ((_ is ValueCellFull!14763) mapDefault!48298)) b!1218062))

(assert (= start!101370 b!1218063))

(declare-fun b_lambda!21993 () Bool)

(assert (=> (not b_lambda!21993) (not b!1218071)))

(declare-fun t!39997 () Bool)

(declare-fun tb!11041 () Bool)

(assert (=> (and start!101370 (= defaultEntry!1004 defaultEntry!1004) t!39997) tb!11041))

(declare-fun result!22683 () Bool)

(assert (=> tb!11041 (= result!22683 tp_is_empty!30945)))

(assert (=> b!1218071 t!39997))

(declare-fun b_and!43637 () Bool)

(assert (= b_and!43635 (and (=> t!39997 result!22683) b_and!43637)))

(declare-fun m!1122811 () Bool)

(assert (=> start!101370 m!1122811))

(declare-fun m!1122813 () Bool)

(assert (=> start!101370 m!1122813))

(declare-fun m!1122815 () Bool)

(assert (=> b!1218067 m!1122815))

(declare-fun m!1122817 () Bool)

(assert (=> b!1218067 m!1122817))

(assert (=> b!1218067 m!1122817))

(declare-fun m!1122819 () Bool)

(assert (=> b!1218067 m!1122819))

(declare-fun m!1122821 () Bool)

(assert (=> b!1218067 m!1122821))

(declare-fun m!1122823 () Bool)

(assert (=> b!1218072 m!1122823))

(declare-fun m!1122825 () Bool)

(assert (=> b!1218056 m!1122825))

(declare-fun m!1122827 () Bool)

(assert (=> b!1218056 m!1122827))

(assert (=> b!1218060 m!1122815))

(declare-fun m!1122829 () Bool)

(assert (=> b!1218059 m!1122829))

(declare-fun m!1122831 () Bool)

(assert (=> b!1218055 m!1122831))

(declare-fun m!1122833 () Bool)

(assert (=> b!1218064 m!1122833))

(declare-fun m!1122835 () Bool)

(assert (=> b!1218058 m!1122835))

(declare-fun m!1122837 () Bool)

(assert (=> b!1218057 m!1122837))

(declare-fun m!1122839 () Bool)

(assert (=> b!1218057 m!1122839))

(declare-fun m!1122841 () Bool)

(assert (=> b!1218069 m!1122841))

(declare-fun m!1122843 () Bool)

(assert (=> b!1218061 m!1122843))

(declare-fun m!1122845 () Bool)

(assert (=> b!1218061 m!1122845))

(declare-fun m!1122847 () Bool)

(assert (=> b!1218061 m!1122847))

(declare-fun m!1122849 () Bool)

(assert (=> b!1218061 m!1122849))

(assert (=> b!1218061 m!1122815))

(declare-fun m!1122851 () Bool)

(assert (=> b!1218061 m!1122851))

(assert (=> b!1218061 m!1122815))

(declare-fun m!1122853 () Bool)

(assert (=> b!1218068 m!1122853))

(declare-fun m!1122855 () Bool)

(assert (=> b!1218071 m!1122855))

(declare-fun m!1122857 () Bool)

(assert (=> b!1218071 m!1122857))

(declare-fun m!1122859 () Bool)

(assert (=> b!1218071 m!1122859))

(declare-fun m!1122861 () Bool)

(assert (=> b!1218071 m!1122861))

(declare-fun m!1122863 () Bool)

(assert (=> mapNonEmpty!48298 m!1122863))

(check-sat (not b!1218059) (not b_next!26241) (not b!1218069) (not b!1218064) (not b!1218072) (not b!1218067) (not b_lambda!21993) tp_is_empty!30945 (not b!1218061) (not mapNonEmpty!48298) (not b!1218055) (not b!1218071) (not b!1218057) (not start!101370) (not b!1218056) (not b!1218068) b_and!43637)
(check-sat b_and!43637 (not b_next!26241))
