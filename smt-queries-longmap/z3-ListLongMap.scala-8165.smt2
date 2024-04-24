; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100092 () Bool)

(assert start!100092)

(declare-fun b_free!25435 () Bool)

(declare-fun b_next!25435 () Bool)

(assert (=> start!100092 (= b_free!25435 (not b_next!25435))))

(declare-fun tp!89019 () Bool)

(declare-fun b_and!41739 () Bool)

(assert (=> start!100092 (= tp!89019 b_and!41739)))

(declare-fun b!1189060 () Bool)

(declare-fun e!676193 () Bool)

(assert (=> b!1189060 (= e!676193 true)))

(declare-datatypes ((V!45081 0))(
  ( (V!45082 (val!15039 Int)) )
))
(declare-datatypes ((tuple2!19344 0))(
  ( (tuple2!19345 (_1!9683 (_ BitVec 64)) (_2!9683 V!45081)) )
))
(declare-datatypes ((List!26083 0))(
  ( (Nil!26080) (Cons!26079 (h!27297 tuple2!19344) (t!38502 List!26083)) )
))
(declare-datatypes ((ListLongMap!17321 0))(
  ( (ListLongMap!17322 (toList!8676 List!26083)) )
))
(declare-fun lt!540647 () ListLongMap!17321)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!540636 () ListLongMap!17321)

(declare-fun -!1695 (ListLongMap!17321 (_ BitVec 64)) ListLongMap!17321)

(assert (=> b!1189060 (= (-!1695 lt!540647 k0!934) lt!540636)))

(declare-datatypes ((array!76771 0))(
  ( (array!76772 (arr!37029 (Array (_ BitVec 32) (_ BitVec 64))) (size!37566 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76771)

(declare-datatypes ((Unit!39376 0))(
  ( (Unit!39377) )
))
(declare-fun lt!540649 () Unit!39376)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!540640 () ListLongMap!17321)

(declare-fun lt!540651 () V!45081)

(declare-fun addRemoveCommutativeForDiffKeys!207 (ListLongMap!17321 (_ BitVec 64) V!45081 (_ BitVec 64)) Unit!39376)

(assert (=> b!1189060 (= lt!540649 (addRemoveCommutativeForDiffKeys!207 lt!540640 (select (arr!37029 _keys!1208) from!1455) lt!540651 k0!934))))

(declare-fun lt!540639 () ListLongMap!17321)

(declare-fun lt!540634 () ListLongMap!17321)

(declare-fun lt!540650 () ListLongMap!17321)

(assert (=> b!1189060 (and (= lt!540650 lt!540647) (= lt!540639 lt!540634))))

(declare-fun lt!540645 () tuple2!19344)

(declare-fun +!3991 (ListLongMap!17321 tuple2!19344) ListLongMap!17321)

(assert (=> b!1189060 (= lt!540647 (+!3991 lt!540640 lt!540645))))

(assert (=> b!1189060 (not (= (select (arr!37029 _keys!1208) from!1455) k0!934))))

(declare-fun lt!540648 () Unit!39376)

(declare-fun e!676200 () Unit!39376)

(assert (=> b!1189060 (= lt!540648 e!676200)))

(declare-fun c!117674 () Bool)

(assert (=> b!1189060 (= c!117674 (= (select (arr!37029 _keys!1208) from!1455) k0!934))))

(declare-fun e!676192 () Bool)

(assert (=> b!1189060 e!676192))

(declare-fun res!790200 () Bool)

(assert (=> b!1189060 (=> (not res!790200) (not e!676192))))

(declare-fun lt!540635 () ListLongMap!17321)

(assert (=> b!1189060 (= res!790200 (= lt!540635 lt!540636))))

(assert (=> b!1189060 (= lt!540636 (+!3991 lt!540639 lt!540645))))

(assert (=> b!1189060 (= lt!540645 (tuple2!19345 (select (arr!37029 _keys!1208) from!1455) lt!540651))))

(declare-fun lt!540652 () V!45081)

(declare-datatypes ((ValueCell!14273 0))(
  ( (ValueCellFull!14273 (v!17673 V!45081)) (EmptyCell!14273) )
))
(declare-datatypes ((array!76773 0))(
  ( (array!76774 (arr!37030 (Array (_ BitVec 32) ValueCell!14273)) (size!37567 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76773)

(declare-fun get!19014 (ValueCell!14273 V!45081) V!45081)

(assert (=> b!1189060 (= lt!540651 (get!19014 (select (arr!37030 _values!996) from!1455) lt!540652))))

(declare-fun b!1189061 () Bool)

(declare-fun res!790204 () Bool)

(declare-fun e!676197 () Bool)

(assert (=> b!1189061 (=> (not res!790204) (not e!676197))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1189061 (= res!790204 (= (select (arr!37029 _keys!1208) i!673) k0!934))))

(declare-fun b!1189062 () Bool)

(declare-fun res!790202 () Bool)

(declare-fun e!676201 () Bool)

(assert (=> b!1189062 (=> (not res!790202) (not e!676201))))

(declare-fun lt!540646 () array!76771)

(declare-datatypes ((List!26084 0))(
  ( (Nil!26081) (Cons!26080 (h!27298 (_ BitVec 64)) (t!38503 List!26084)) )
))
(declare-fun arrayNoDuplicates!0 (array!76771 (_ BitVec 32) List!26084) Bool)

(assert (=> b!1189062 (= res!790202 (arrayNoDuplicates!0 lt!540646 #b00000000000000000000000000000000 Nil!26081))))

(declare-fun b!1189063 () Bool)

(declare-fun e!676199 () Bool)

(assert (=> b!1189063 (= e!676201 (not e!676199))))

(declare-fun res!790206 () Bool)

(assert (=> b!1189063 (=> res!790206 e!676199)))

(assert (=> b!1189063 (= res!790206 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189063 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540643 () Unit!39376)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76771 (_ BitVec 64) (_ BitVec 32)) Unit!39376)

(assert (=> b!1189063 (= lt!540643 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189064 () Bool)

(assert (=> b!1189064 (= e!676197 e!676201)))

(declare-fun res!790209 () Bool)

(assert (=> b!1189064 (=> (not res!790209) (not e!676201))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76771 (_ BitVec 32)) Bool)

(assert (=> b!1189064 (= res!790209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540646 mask!1564))))

(assert (=> b!1189064 (= lt!540646 (array!76772 (store (arr!37029 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37566 _keys!1208)))))

(declare-fun res!790205 () Bool)

(assert (=> start!100092 (=> (not res!790205) (not e!676197))))

(assert (=> start!100092 (= res!790205 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37566 _keys!1208))))))

(assert (=> start!100092 e!676197))

(declare-fun tp_is_empty!29965 () Bool)

(assert (=> start!100092 tp_is_empty!29965))

(declare-fun array_inv!28320 (array!76771) Bool)

(assert (=> start!100092 (array_inv!28320 _keys!1208)))

(assert (=> start!100092 true))

(assert (=> start!100092 tp!89019))

(declare-fun e!676195 () Bool)

(declare-fun array_inv!28321 (array!76773) Bool)

(assert (=> start!100092 (and (array_inv!28321 _values!996) e!676195)))

(declare-fun b!1189065 () Bool)

(declare-fun e!676196 () Bool)

(assert (=> b!1189065 (= e!676196 tp_is_empty!29965)))

(declare-fun mapNonEmpty!46775 () Bool)

(declare-fun mapRes!46775 () Bool)

(declare-fun tp!89018 () Bool)

(assert (=> mapNonEmpty!46775 (= mapRes!46775 (and tp!89018 e!676196))))

(declare-fun mapKey!46775 () (_ BitVec 32))

(declare-fun mapRest!46775 () (Array (_ BitVec 32) ValueCell!14273))

(declare-fun mapValue!46775 () ValueCell!14273)

(assert (=> mapNonEmpty!46775 (= (arr!37030 _values!996) (store mapRest!46775 mapKey!46775 mapValue!46775))))

(declare-fun mapIsEmpty!46775 () Bool)

(assert (=> mapIsEmpty!46775 mapRes!46775))

(declare-fun b!1189066 () Bool)

(declare-fun res!790199 () Bool)

(assert (=> b!1189066 (=> (not res!790199) (not e!676197))))

(assert (=> b!1189066 (= res!790199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189067 () Bool)

(declare-fun e!676191 () Bool)

(assert (=> b!1189067 (= e!676192 e!676191)))

(declare-fun res!790208 () Bool)

(assert (=> b!1189067 (=> res!790208 e!676191)))

(assert (=> b!1189067 (= res!790208 (not (= (select (arr!37029 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1189068 () Bool)

(declare-fun res!790198 () Bool)

(assert (=> b!1189068 (=> (not res!790198) (not e!676197))))

(assert (=> b!1189068 (= res!790198 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26081))))

(declare-fun b!1189069 () Bool)

(declare-fun Unit!39378 () Unit!39376)

(assert (=> b!1189069 (= e!676200 Unit!39378)))

(declare-fun lt!540644 () Unit!39376)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76771 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39376)

(assert (=> b!1189069 (= lt!540644 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1189069 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540642 () Unit!39376)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76771 (_ BitVec 32) (_ BitVec 32)) Unit!39376)

(assert (=> b!1189069 (= lt!540642 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1189069 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26081)))

(declare-fun lt!540641 () Unit!39376)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76771 (_ BitVec 64) (_ BitVec 32) List!26084) Unit!39376)

(assert (=> b!1189069 (= lt!540641 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26081))))

(assert (=> b!1189069 false))

(declare-fun b!1189070 () Bool)

(assert (=> b!1189070 (= e!676191 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189071 () Bool)

(declare-fun e!676202 () Bool)

(assert (=> b!1189071 (= e!676202 e!676193)))

(declare-fun res!790201 () Bool)

(assert (=> b!1189071 (=> res!790201 e!676193)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189071 (= res!790201 (not (validKeyInArray!0 (select (arr!37029 _keys!1208) from!1455))))))

(assert (=> b!1189071 (= lt!540634 lt!540639)))

(assert (=> b!1189071 (= lt!540639 (-!1695 lt!540640 k0!934))))

(declare-fun zeroValue!944 () V!45081)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45081)

(declare-fun lt!540638 () array!76773)

(declare-fun getCurrentListMapNoExtraKeys!5145 (array!76771 array!76773 (_ BitVec 32) (_ BitVec 32) V!45081 V!45081 (_ BitVec 32) Int) ListLongMap!17321)

(assert (=> b!1189071 (= lt!540634 (getCurrentListMapNoExtraKeys!5145 lt!540646 lt!540638 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1189071 (= lt!540640 (getCurrentListMapNoExtraKeys!5145 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!540637 () Unit!39376)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!911 (array!76771 array!76773 (_ BitVec 32) (_ BitVec 32) V!45081 V!45081 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39376)

(assert (=> b!1189071 (= lt!540637 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!911 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189072 () Bool)

(declare-fun res!790211 () Bool)

(assert (=> b!1189072 (=> (not res!790211) (not e!676197))))

(assert (=> b!1189072 (= res!790211 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37566 _keys!1208))))))

(declare-fun b!1189073 () Bool)

(assert (=> b!1189073 (= e!676199 e!676202)))

(declare-fun res!790210 () Bool)

(assert (=> b!1189073 (=> res!790210 e!676202)))

(assert (=> b!1189073 (= res!790210 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1189073 (= lt!540635 (getCurrentListMapNoExtraKeys!5145 lt!540646 lt!540638 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1189073 (= lt!540638 (array!76774 (store (arr!37030 _values!996) i!673 (ValueCellFull!14273 lt!540652)) (size!37567 _values!996)))))

(declare-fun dynLambda!3104 (Int (_ BitVec 64)) V!45081)

(assert (=> b!1189073 (= lt!540652 (dynLambda!3104 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1189073 (= lt!540650 (getCurrentListMapNoExtraKeys!5145 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189074 () Bool)

(declare-fun res!790207 () Bool)

(assert (=> b!1189074 (=> (not res!790207) (not e!676197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189074 (= res!790207 (validMask!0 mask!1564))))

(declare-fun b!1189075 () Bool)

(declare-fun Unit!39379 () Unit!39376)

(assert (=> b!1189075 (= e!676200 Unit!39379)))

(declare-fun b!1189076 () Bool)

(declare-fun res!790203 () Bool)

(assert (=> b!1189076 (=> (not res!790203) (not e!676197))))

(assert (=> b!1189076 (= res!790203 (validKeyInArray!0 k0!934))))

(declare-fun b!1189077 () Bool)

(declare-fun e!676198 () Bool)

(assert (=> b!1189077 (= e!676198 tp_is_empty!29965)))

(declare-fun b!1189078 () Bool)

(declare-fun res!790197 () Bool)

(assert (=> b!1189078 (=> (not res!790197) (not e!676197))))

(assert (=> b!1189078 (= res!790197 (and (= (size!37567 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37566 _keys!1208) (size!37567 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189079 () Bool)

(assert (=> b!1189079 (= e!676195 (and e!676198 mapRes!46775))))

(declare-fun condMapEmpty!46775 () Bool)

(declare-fun mapDefault!46775 () ValueCell!14273)

(assert (=> b!1189079 (= condMapEmpty!46775 (= (arr!37030 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14273)) mapDefault!46775)))))

(assert (= (and start!100092 res!790205) b!1189074))

(assert (= (and b!1189074 res!790207) b!1189078))

(assert (= (and b!1189078 res!790197) b!1189066))

(assert (= (and b!1189066 res!790199) b!1189068))

(assert (= (and b!1189068 res!790198) b!1189072))

(assert (= (and b!1189072 res!790211) b!1189076))

(assert (= (and b!1189076 res!790203) b!1189061))

(assert (= (and b!1189061 res!790204) b!1189064))

(assert (= (and b!1189064 res!790209) b!1189062))

(assert (= (and b!1189062 res!790202) b!1189063))

(assert (= (and b!1189063 (not res!790206)) b!1189073))

(assert (= (and b!1189073 (not res!790210)) b!1189071))

(assert (= (and b!1189071 (not res!790201)) b!1189060))

(assert (= (and b!1189060 res!790200) b!1189067))

(assert (= (and b!1189067 (not res!790208)) b!1189070))

(assert (= (and b!1189060 c!117674) b!1189069))

(assert (= (and b!1189060 (not c!117674)) b!1189075))

(assert (= (and b!1189079 condMapEmpty!46775) mapIsEmpty!46775))

(assert (= (and b!1189079 (not condMapEmpty!46775)) mapNonEmpty!46775))

(get-info :version)

(assert (= (and mapNonEmpty!46775 ((_ is ValueCellFull!14273) mapValue!46775)) b!1189065))

(assert (= (and b!1189079 ((_ is ValueCellFull!14273) mapDefault!46775)) b!1189077))

(assert (= start!100092 b!1189079))

(declare-fun b_lambda!20573 () Bool)

(assert (=> (not b_lambda!20573) (not b!1189073)))

(declare-fun t!38501 () Bool)

(declare-fun tb!10239 () Bool)

(assert (=> (and start!100092 (= defaultEntry!1004 defaultEntry!1004) t!38501) tb!10239))

(declare-fun result!21053 () Bool)

(assert (=> tb!10239 (= result!21053 tp_is_empty!29965)))

(assert (=> b!1189073 t!38501))

(declare-fun b_and!41741 () Bool)

(assert (= b_and!41739 (and (=> t!38501 result!21053) b_and!41741)))

(declare-fun m!1098057 () Bool)

(assert (=> b!1189073 m!1098057))

(declare-fun m!1098059 () Bool)

(assert (=> b!1189073 m!1098059))

(declare-fun m!1098061 () Bool)

(assert (=> b!1189073 m!1098061))

(declare-fun m!1098063 () Bool)

(assert (=> b!1189073 m!1098063))

(declare-fun m!1098065 () Bool)

(assert (=> b!1189060 m!1098065))

(declare-fun m!1098067 () Bool)

(assert (=> b!1189060 m!1098067))

(declare-fun m!1098069 () Bool)

(assert (=> b!1189060 m!1098069))

(assert (=> b!1189060 m!1098067))

(declare-fun m!1098071 () Bool)

(assert (=> b!1189060 m!1098071))

(declare-fun m!1098073 () Bool)

(assert (=> b!1189060 m!1098073))

(declare-fun m!1098075 () Bool)

(assert (=> b!1189060 m!1098075))

(assert (=> b!1189060 m!1098073))

(declare-fun m!1098077 () Bool)

(assert (=> b!1189060 m!1098077))

(declare-fun m!1098079 () Bool)

(assert (=> b!1189070 m!1098079))

(declare-fun m!1098081 () Bool)

(assert (=> b!1189071 m!1098081))

(declare-fun m!1098083 () Bool)

(assert (=> b!1189071 m!1098083))

(declare-fun m!1098085 () Bool)

(assert (=> b!1189071 m!1098085))

(declare-fun m!1098087 () Bool)

(assert (=> b!1189071 m!1098087))

(assert (=> b!1189071 m!1098073))

(declare-fun m!1098089 () Bool)

(assert (=> b!1189071 m!1098089))

(assert (=> b!1189071 m!1098073))

(declare-fun m!1098091 () Bool)

(assert (=> start!100092 m!1098091))

(declare-fun m!1098093 () Bool)

(assert (=> start!100092 m!1098093))

(declare-fun m!1098095 () Bool)

(assert (=> b!1189074 m!1098095))

(declare-fun m!1098097 () Bool)

(assert (=> b!1189076 m!1098097))

(declare-fun m!1098099 () Bool)

(assert (=> b!1189061 m!1098099))

(assert (=> b!1189067 m!1098073))

(declare-fun m!1098101 () Bool)

(assert (=> b!1189068 m!1098101))

(declare-fun m!1098103 () Bool)

(assert (=> b!1189064 m!1098103))

(declare-fun m!1098105 () Bool)

(assert (=> b!1189064 m!1098105))

(declare-fun m!1098107 () Bool)

(assert (=> mapNonEmpty!46775 m!1098107))

(declare-fun m!1098109 () Bool)

(assert (=> b!1189066 m!1098109))

(declare-fun m!1098111 () Bool)

(assert (=> b!1189062 m!1098111))

(declare-fun m!1098113 () Bool)

(assert (=> b!1189063 m!1098113))

(declare-fun m!1098115 () Bool)

(assert (=> b!1189063 m!1098115))

(declare-fun m!1098117 () Bool)

(assert (=> b!1189069 m!1098117))

(declare-fun m!1098119 () Bool)

(assert (=> b!1189069 m!1098119))

(declare-fun m!1098121 () Bool)

(assert (=> b!1189069 m!1098121))

(declare-fun m!1098123 () Bool)

(assert (=> b!1189069 m!1098123))

(declare-fun m!1098125 () Bool)

(assert (=> b!1189069 m!1098125))

(check-sat (not b!1189062) (not start!100092) (not b!1189076) (not b_next!25435) (not b!1189060) (not mapNonEmpty!46775) b_and!41741 tp_is_empty!29965 (not b!1189071) (not b!1189073) (not b!1189074) (not b_lambda!20573) (not b!1189064) (not b!1189070) (not b!1189068) (not b!1189069) (not b!1189066) (not b!1189063))
(check-sat b_and!41741 (not b_next!25435))
