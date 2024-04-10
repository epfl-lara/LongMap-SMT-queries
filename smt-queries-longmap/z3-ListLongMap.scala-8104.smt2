; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99492 () Bool)

(assert start!99492)

(declare-fun b_free!25071 () Bool)

(declare-fun b_next!25071 () Bool)

(assert (=> start!99492 (= b_free!25071 (not b_next!25071))))

(declare-fun tp!87926 () Bool)

(declare-fun b_and!41009 () Bool)

(assert (=> start!99492 (= tp!87926 b_and!41009)))

(declare-fun b!1176150 () Bool)

(declare-fun e!668572 () Bool)

(declare-fun e!668561 () Bool)

(assert (=> b!1176150 (= e!668572 e!668561)))

(declare-fun res!781176 () Bool)

(assert (=> b!1176150 (=> res!781176 e!668561)))

(declare-datatypes ((array!76009 0))(
  ( (array!76010 (arr!36654 (Array (_ BitVec 32) (_ BitVec 64))) (size!37190 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76009)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1176150 (= res!781176 (not (= (select (arr!36654 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176151 () Bool)

(declare-fun e!668565 () Bool)

(declare-fun e!668569 () Bool)

(assert (=> b!1176151 (= e!668565 e!668569)))

(declare-fun res!781165 () Bool)

(assert (=> b!1176151 (=> res!781165 e!668569)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176151 (= res!781165 (not (validKeyInArray!0 (select (arr!36654 _keys!1208) from!1455))))))

(declare-datatypes ((V!44595 0))(
  ( (V!44596 (val!14857 Int)) )
))
(declare-datatypes ((tuple2!18996 0))(
  ( (tuple2!18997 (_1!9509 (_ BitVec 64)) (_2!9509 V!44595)) )
))
(declare-datatypes ((List!25735 0))(
  ( (Nil!25732) (Cons!25731 (h!26940 tuple2!18996) (t!37798 List!25735)) )
))
(declare-datatypes ((ListLongMap!16965 0))(
  ( (ListLongMap!16966 (toList!8498 List!25735)) )
))
(declare-fun lt!530776 () ListLongMap!16965)

(declare-fun lt!530770 () ListLongMap!16965)

(assert (=> b!1176151 (= lt!530776 lt!530770)))

(declare-fun lt!530772 () ListLongMap!16965)

(declare-fun -!1552 (ListLongMap!16965 (_ BitVec 64)) ListLongMap!16965)

(assert (=> b!1176151 (= lt!530770 (-!1552 lt!530772 k0!934))))

(declare-fun zeroValue!944 () V!44595)

(declare-datatypes ((ValueCell!14091 0))(
  ( (ValueCellFull!14091 (v!17495 V!44595)) (EmptyCell!14091) )
))
(declare-datatypes ((array!76011 0))(
  ( (array!76012 (arr!36655 (Array (_ BitVec 32) ValueCell!14091)) (size!37191 (_ BitVec 32))) )
))
(declare-fun lt!530767 () array!76011)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530769 () array!76009)

(declare-fun minValue!944 () V!44595)

(declare-fun getCurrentListMapNoExtraKeys!4957 (array!76009 array!76011 (_ BitVec 32) (_ BitVec 32) V!44595 V!44595 (_ BitVec 32) Int) ListLongMap!16965)

(assert (=> b!1176151 (= lt!530776 (getCurrentListMapNoExtraKeys!4957 lt!530769 lt!530767 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76011)

(assert (=> b!1176151 (= lt!530772 (getCurrentListMapNoExtraKeys!4957 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38820 0))(
  ( (Unit!38821) )
))
(declare-fun lt!530778 () Unit!38820)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!779 (array!76009 array!76011 (_ BitVec 32) (_ BitVec 32) V!44595 V!44595 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38820)

(assert (=> b!1176151 (= lt!530778 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!779 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176152 () Bool)

(declare-fun res!781166 () Bool)

(declare-fun e!668562 () Bool)

(assert (=> b!1176152 (=> (not res!781166) (not e!668562))))

(assert (=> b!1176152 (= res!781166 (validKeyInArray!0 k0!934))))

(declare-fun b!1176153 () Bool)

(declare-fun e!668567 () Unit!38820)

(declare-fun Unit!38822 () Unit!38820)

(assert (=> b!1176153 (= e!668567 Unit!38822)))

(declare-fun b!1176154 () Bool)

(declare-fun res!781173 () Bool)

(declare-fun e!668568 () Bool)

(assert (=> b!1176154 (=> (not res!781173) (not e!668568))))

(declare-datatypes ((List!25736 0))(
  ( (Nil!25733) (Cons!25732 (h!26941 (_ BitVec 64)) (t!37799 List!25736)) )
))
(declare-fun arrayNoDuplicates!0 (array!76009 (_ BitVec 32) List!25736) Bool)

(assert (=> b!1176154 (= res!781173 (arrayNoDuplicates!0 lt!530769 #b00000000000000000000000000000000 Nil!25733))))

(declare-fun res!781172 () Bool)

(assert (=> start!99492 (=> (not res!781172) (not e!668562))))

(assert (=> start!99492 (= res!781172 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37190 _keys!1208))))))

(assert (=> start!99492 e!668562))

(declare-fun tp_is_empty!29601 () Bool)

(assert (=> start!99492 tp_is_empty!29601))

(declare-fun array_inv!27994 (array!76009) Bool)

(assert (=> start!99492 (array_inv!27994 _keys!1208)))

(assert (=> start!99492 true))

(assert (=> start!99492 tp!87926))

(declare-fun e!668563 () Bool)

(declare-fun array_inv!27995 (array!76011) Bool)

(assert (=> start!99492 (and (array_inv!27995 _values!996) e!668563)))

(declare-fun b!1176155 () Bool)

(declare-fun e!668570 () Bool)

(assert (=> b!1176155 (= e!668570 e!668565)))

(declare-fun res!781167 () Bool)

(assert (=> b!1176155 (=> res!781167 e!668565)))

(assert (=> b!1176155 (= res!781167 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!530777 () ListLongMap!16965)

(assert (=> b!1176155 (= lt!530777 (getCurrentListMapNoExtraKeys!4957 lt!530769 lt!530767 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!530766 () V!44595)

(assert (=> b!1176155 (= lt!530767 (array!76012 (store (arr!36655 _values!996) i!673 (ValueCellFull!14091 lt!530766)) (size!37191 _values!996)))))

(declare-fun dynLambda!2923 (Int (_ BitVec 64)) V!44595)

(assert (=> b!1176155 (= lt!530766 (dynLambda!2923 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530765 () ListLongMap!16965)

(assert (=> b!1176155 (= lt!530765 (getCurrentListMapNoExtraKeys!4957 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176156 () Bool)

(declare-fun res!781177 () Bool)

(assert (=> b!1176156 (=> (not res!781177) (not e!668562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76009 (_ BitVec 32)) Bool)

(assert (=> b!1176156 (= res!781177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176157 () Bool)

(declare-fun lt!530774 () tuple2!18996)

(declare-fun e!668571 () Bool)

(declare-fun +!3814 (ListLongMap!16965 tuple2!18996) ListLongMap!16965)

(assert (=> b!1176157 (= e!668571 (= lt!530765 (+!3814 lt!530772 lt!530774)))))

(declare-fun b!1176158 () Bool)

(declare-fun e!668566 () Bool)

(assert (=> b!1176158 (= e!668566 tp_is_empty!29601)))

(declare-fun b!1176159 () Bool)

(assert (=> b!1176159 (= e!668569 true)))

(assert (=> b!1176159 e!668571))

(declare-fun res!781169 () Bool)

(assert (=> b!1176159 (=> (not res!781169) (not e!668571))))

(assert (=> b!1176159 (= res!781169 (not (= (select (arr!36654 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!530775 () Unit!38820)

(assert (=> b!1176159 (= lt!530775 e!668567)))

(declare-fun c!116730 () Bool)

(assert (=> b!1176159 (= c!116730 (= (select (arr!36654 _keys!1208) from!1455) k0!934))))

(assert (=> b!1176159 e!668572))

(declare-fun res!781168 () Bool)

(assert (=> b!1176159 (=> (not res!781168) (not e!668572))))

(assert (=> b!1176159 (= res!781168 (= lt!530777 (+!3814 lt!530770 lt!530774)))))

(declare-fun get!18718 (ValueCell!14091 V!44595) V!44595)

(assert (=> b!1176159 (= lt!530774 (tuple2!18997 (select (arr!36654 _keys!1208) from!1455) (get!18718 (select (arr!36655 _values!996) from!1455) lt!530766)))))

(declare-fun b!1176160 () Bool)

(declare-fun res!781164 () Bool)

(assert (=> b!1176160 (=> (not res!781164) (not e!668562))))

(assert (=> b!1176160 (= res!781164 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25733))))

(declare-fun b!1176161 () Bool)

(declare-fun arrayContainsKey!0 (array!76009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176161 (= e!668561 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176162 () Bool)

(declare-fun res!781174 () Bool)

(assert (=> b!1176162 (=> (not res!781174) (not e!668562))))

(assert (=> b!1176162 (= res!781174 (= (select (arr!36654 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46229 () Bool)

(declare-fun mapRes!46229 () Bool)

(declare-fun tp!87927 () Bool)

(assert (=> mapNonEmpty!46229 (= mapRes!46229 (and tp!87927 e!668566))))

(declare-fun mapRest!46229 () (Array (_ BitVec 32) ValueCell!14091))

(declare-fun mapKey!46229 () (_ BitVec 32))

(declare-fun mapValue!46229 () ValueCell!14091)

(assert (=> mapNonEmpty!46229 (= (arr!36655 _values!996) (store mapRest!46229 mapKey!46229 mapValue!46229))))

(declare-fun b!1176163 () Bool)

(declare-fun res!781171 () Bool)

(assert (=> b!1176163 (=> (not res!781171) (not e!668562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176163 (= res!781171 (validMask!0 mask!1564))))

(declare-fun b!1176164 () Bool)

(declare-fun e!668564 () Bool)

(assert (=> b!1176164 (= e!668563 (and e!668564 mapRes!46229))))

(declare-fun condMapEmpty!46229 () Bool)

(declare-fun mapDefault!46229 () ValueCell!14091)

(assert (=> b!1176164 (= condMapEmpty!46229 (= (arr!36655 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14091)) mapDefault!46229)))))

(declare-fun b!1176165 () Bool)

(assert (=> b!1176165 (= e!668562 e!668568)))

(declare-fun res!781175 () Bool)

(assert (=> b!1176165 (=> (not res!781175) (not e!668568))))

(assert (=> b!1176165 (= res!781175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530769 mask!1564))))

(assert (=> b!1176165 (= lt!530769 (array!76010 (store (arr!36654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37190 _keys!1208)))))

(declare-fun b!1176166 () Bool)

(declare-fun res!781163 () Bool)

(assert (=> b!1176166 (=> (not res!781163) (not e!668562))))

(assert (=> b!1176166 (= res!781163 (and (= (size!37191 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37190 _keys!1208) (size!37191 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176167 () Bool)

(assert (=> b!1176167 (= e!668564 tp_is_empty!29601)))

(declare-fun b!1176168 () Bool)

(declare-fun Unit!38823 () Unit!38820)

(assert (=> b!1176168 (= e!668567 Unit!38823)))

(declare-fun lt!530771 () Unit!38820)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76009 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38820)

(assert (=> b!1176168 (= lt!530771 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1176168 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530768 () Unit!38820)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76009 (_ BitVec 32) (_ BitVec 32)) Unit!38820)

(assert (=> b!1176168 (= lt!530768 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1176168 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25733)))

(declare-fun lt!530764 () Unit!38820)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76009 (_ BitVec 64) (_ BitVec 32) List!25736) Unit!38820)

(assert (=> b!1176168 (= lt!530764 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25733))))

(assert (=> b!1176168 false))

(declare-fun mapIsEmpty!46229 () Bool)

(assert (=> mapIsEmpty!46229 mapRes!46229))

(declare-fun b!1176169 () Bool)

(assert (=> b!1176169 (= e!668568 (not e!668570))))

(declare-fun res!781170 () Bool)

(assert (=> b!1176169 (=> res!781170 e!668570)))

(assert (=> b!1176169 (= res!781170 (bvsgt from!1455 i!673))))

(assert (=> b!1176169 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530773 () Unit!38820)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76009 (_ BitVec 64) (_ BitVec 32)) Unit!38820)

(assert (=> b!1176169 (= lt!530773 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176170 () Bool)

(declare-fun res!781162 () Bool)

(assert (=> b!1176170 (=> (not res!781162) (not e!668562))))

(assert (=> b!1176170 (= res!781162 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37190 _keys!1208))))))

(assert (= (and start!99492 res!781172) b!1176163))

(assert (= (and b!1176163 res!781171) b!1176166))

(assert (= (and b!1176166 res!781163) b!1176156))

(assert (= (and b!1176156 res!781177) b!1176160))

(assert (= (and b!1176160 res!781164) b!1176170))

(assert (= (and b!1176170 res!781162) b!1176152))

(assert (= (and b!1176152 res!781166) b!1176162))

(assert (= (and b!1176162 res!781174) b!1176165))

(assert (= (and b!1176165 res!781175) b!1176154))

(assert (= (and b!1176154 res!781173) b!1176169))

(assert (= (and b!1176169 (not res!781170)) b!1176155))

(assert (= (and b!1176155 (not res!781167)) b!1176151))

(assert (= (and b!1176151 (not res!781165)) b!1176159))

(assert (= (and b!1176159 res!781168) b!1176150))

(assert (= (and b!1176150 (not res!781176)) b!1176161))

(assert (= (and b!1176159 c!116730) b!1176168))

(assert (= (and b!1176159 (not c!116730)) b!1176153))

(assert (= (and b!1176159 res!781169) b!1176157))

(assert (= (and b!1176164 condMapEmpty!46229) mapIsEmpty!46229))

(assert (= (and b!1176164 (not condMapEmpty!46229)) mapNonEmpty!46229))

(get-info :version)

(assert (= (and mapNonEmpty!46229 ((_ is ValueCellFull!14091) mapValue!46229)) b!1176158))

(assert (= (and b!1176164 ((_ is ValueCellFull!14091) mapDefault!46229)) b!1176167))

(assert (= start!99492 b!1176164))

(declare-fun b_lambda!20215 () Bool)

(assert (=> (not b_lambda!20215) (not b!1176155)))

(declare-fun t!37797 () Bool)

(declare-fun tb!9883 () Bool)

(assert (=> (and start!99492 (= defaultEntry!1004 defaultEntry!1004) t!37797) tb!9883))

(declare-fun result!20333 () Bool)

(assert (=> tb!9883 (= result!20333 tp_is_empty!29601)))

(assert (=> b!1176155 t!37797))

(declare-fun b_and!41011 () Bool)

(assert (= b_and!41009 (and (=> t!37797 result!20333) b_and!41011)))

(declare-fun m!1084077 () Bool)

(assert (=> mapNonEmpty!46229 m!1084077))

(declare-fun m!1084079 () Bool)

(assert (=> b!1176161 m!1084079))

(declare-fun m!1084081 () Bool)

(assert (=> b!1176151 m!1084081))

(declare-fun m!1084083 () Bool)

(assert (=> b!1176151 m!1084083))

(declare-fun m!1084085 () Bool)

(assert (=> b!1176151 m!1084085))

(declare-fun m!1084087 () Bool)

(assert (=> b!1176151 m!1084087))

(declare-fun m!1084089 () Bool)

(assert (=> b!1176151 m!1084089))

(declare-fun m!1084091 () Bool)

(assert (=> b!1176151 m!1084091))

(assert (=> b!1176151 m!1084089))

(declare-fun m!1084093 () Bool)

(assert (=> b!1176168 m!1084093))

(declare-fun m!1084095 () Bool)

(assert (=> b!1176168 m!1084095))

(declare-fun m!1084097 () Bool)

(assert (=> b!1176168 m!1084097))

(declare-fun m!1084099 () Bool)

(assert (=> b!1176168 m!1084099))

(declare-fun m!1084101 () Bool)

(assert (=> b!1176168 m!1084101))

(declare-fun m!1084103 () Bool)

(assert (=> b!1176160 m!1084103))

(declare-fun m!1084105 () Bool)

(assert (=> b!1176165 m!1084105))

(declare-fun m!1084107 () Bool)

(assert (=> b!1176165 m!1084107))

(assert (=> b!1176159 m!1084089))

(declare-fun m!1084109 () Bool)

(assert (=> b!1176159 m!1084109))

(declare-fun m!1084111 () Bool)

(assert (=> b!1176159 m!1084111))

(assert (=> b!1176159 m!1084111))

(declare-fun m!1084113 () Bool)

(assert (=> b!1176159 m!1084113))

(declare-fun m!1084115 () Bool)

(assert (=> b!1176156 m!1084115))

(assert (=> b!1176150 m!1084089))

(declare-fun m!1084117 () Bool)

(assert (=> b!1176154 m!1084117))

(declare-fun m!1084119 () Bool)

(assert (=> b!1176152 m!1084119))

(declare-fun m!1084121 () Bool)

(assert (=> b!1176157 m!1084121))

(declare-fun m!1084123 () Bool)

(assert (=> b!1176155 m!1084123))

(declare-fun m!1084125 () Bool)

(assert (=> b!1176155 m!1084125))

(declare-fun m!1084127 () Bool)

(assert (=> b!1176155 m!1084127))

(declare-fun m!1084129 () Bool)

(assert (=> b!1176155 m!1084129))

(declare-fun m!1084131 () Bool)

(assert (=> b!1176169 m!1084131))

(declare-fun m!1084133 () Bool)

(assert (=> b!1176169 m!1084133))

(declare-fun m!1084135 () Bool)

(assert (=> b!1176163 m!1084135))

(declare-fun m!1084137 () Bool)

(assert (=> b!1176162 m!1084137))

(declare-fun m!1084139 () Bool)

(assert (=> start!99492 m!1084139))

(declare-fun m!1084141 () Bool)

(assert (=> start!99492 m!1084141))

(check-sat (not b!1176161) (not b!1176152) tp_is_empty!29601 (not b!1176165) (not b_next!25071) (not b_lambda!20215) (not b!1176156) (not start!99492) (not b!1176151) (not b!1176169) (not b!1176154) (not b!1176160) (not b!1176155) (not b!1176168) (not b!1176159) (not b!1176163) b_and!41011 (not mapNonEmpty!46229) (not b!1176157))
(check-sat b_and!41011 (not b_next!25071))
