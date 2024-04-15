; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96550 () Bool)

(assert start!96550)

(declare-fun b_free!23083 () Bool)

(declare-fun b_next!23083 () Bool)

(assert (=> start!96550 (= b_free!23083 (not b_next!23083))))

(declare-fun tp!81181 () Bool)

(declare-fun b_and!36831 () Bool)

(assert (=> start!96550 (= tp!81181 b_and!36831)))

(declare-fun b!1097953 () Bool)

(declare-fun res!732804 () Bool)

(declare-fun e!626653 () Bool)

(assert (=> b!1097953 (=> (not res!732804) (not e!626653))))

(declare-datatypes ((array!71086 0))(
  ( (array!71087 (arr!34213 (Array (_ BitVec 32) (_ BitVec 64))) (size!34751 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71086)

(declare-datatypes ((List!23960 0))(
  ( (Nil!23957) (Cons!23956 (h!25165 (_ BitVec 64)) (t!34080 List!23960)) )
))
(declare-fun arrayNoDuplicates!0 (array!71086 (_ BitVec 32) List!23960) Bool)

(assert (=> b!1097953 (= res!732804 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23957))))

(declare-fun mapNonEmpty!42466 () Bool)

(declare-fun mapRes!42466 () Bool)

(declare-fun tp!81182 () Bool)

(declare-fun e!626650 () Bool)

(assert (=> mapNonEmpty!42466 (= mapRes!42466 (and tp!81182 e!626650))))

(declare-datatypes ((V!41305 0))(
  ( (V!41306 (val!13623 Int)) )
))
(declare-datatypes ((ValueCell!12857 0))(
  ( (ValueCellFull!12857 (v!16245 V!41305)) (EmptyCell!12857) )
))
(declare-datatypes ((array!71088 0))(
  ( (array!71089 (arr!34214 (Array (_ BitVec 32) ValueCell!12857)) (size!34752 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71088)

(declare-fun mapRest!42466 () (Array (_ BitVec 32) ValueCell!12857))

(declare-fun mapKey!42466 () (_ BitVec 32))

(declare-fun mapValue!42466 () ValueCell!12857)

(assert (=> mapNonEmpty!42466 (= (arr!34214 _values!874) (store mapRest!42466 mapKey!42466 mapValue!42466))))

(declare-fun b!1097954 () Bool)

(declare-fun e!626649 () Bool)

(declare-fun e!626654 () Bool)

(assert (=> b!1097954 (= e!626649 (and e!626654 mapRes!42466))))

(declare-fun condMapEmpty!42466 () Bool)

(declare-fun mapDefault!42466 () ValueCell!12857)

(assert (=> b!1097954 (= condMapEmpty!42466 (= (arr!34214 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12857)) mapDefault!42466)))))

(declare-fun mapIsEmpty!42466 () Bool)

(assert (=> mapIsEmpty!42466 mapRes!42466))

(declare-fun b!1097955 () Bool)

(declare-fun res!732798 () Bool)

(assert (=> b!1097955 (=> (not res!732798) (not e!626653))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097955 (= res!732798 (= (select (arr!34213 _keys!1070) i!650) k0!904))))

(declare-fun b!1097956 () Bool)

(declare-fun tp_is_empty!27133 () Bool)

(assert (=> b!1097956 (= e!626654 tp_is_empty!27133)))

(declare-datatypes ((tuple2!17368 0))(
  ( (tuple2!17369 (_1!8695 (_ BitVec 64)) (_2!8695 V!41305)) )
))
(declare-fun lt!490887 () tuple2!17368)

(declare-datatypes ((List!23961 0))(
  ( (Nil!23958) (Cons!23957 (h!25166 tuple2!17368) (t!34081 List!23961)) )
))
(declare-datatypes ((ListLongMap!15337 0))(
  ( (ListLongMap!15338 (toList!7684 List!23961)) )
))
(declare-fun lt!490889 () ListLongMap!15337)

(declare-fun lt!490894 () ListLongMap!15337)

(declare-fun b!1097957 () Bool)

(declare-fun e!626651 () Bool)

(declare-fun lt!490890 () tuple2!17368)

(declare-fun +!3396 (ListLongMap!15337 tuple2!17368) ListLongMap!15337)

(assert (=> b!1097957 (= e!626651 (= lt!490889 (+!3396 (+!3396 lt!490894 lt!490890) lt!490887)))))

(declare-fun b!1097958 () Bool)

(declare-fun res!732802 () Bool)

(assert (=> b!1097958 (=> (not res!732802) (not e!626651))))

(declare-fun lt!490892 () ListLongMap!15337)

(declare-fun lt!490888 () ListLongMap!15337)

(assert (=> b!1097958 (= res!732802 (= lt!490888 (+!3396 (+!3396 lt!490892 lt!490890) lt!490887)))))

(declare-fun res!732800 () Bool)

(assert (=> start!96550 (=> (not res!732800) (not e!626653))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96550 (= res!732800 (validMask!0 mask!1414))))

(assert (=> start!96550 e!626653))

(assert (=> start!96550 tp!81181))

(assert (=> start!96550 true))

(assert (=> start!96550 tp_is_empty!27133))

(declare-fun array_inv!26392 (array!71086) Bool)

(assert (=> start!96550 (array_inv!26392 _keys!1070)))

(declare-fun array_inv!26393 (array!71088) Bool)

(assert (=> start!96550 (and (array_inv!26393 _values!874) e!626649)))

(declare-fun b!1097959 () Bool)

(declare-fun res!732795 () Bool)

(declare-fun e!626647 () Bool)

(assert (=> b!1097959 (=> (not res!732795) (not e!626647))))

(declare-fun lt!490891 () array!71086)

(assert (=> b!1097959 (= res!732795 (arrayNoDuplicates!0 lt!490891 #b00000000000000000000000000000000 Nil!23957))))

(declare-fun b!1097960 () Bool)

(declare-fun res!732793 () Bool)

(assert (=> b!1097960 (=> (not res!732793) (not e!626653))))

(assert (=> b!1097960 (= res!732793 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34751 _keys!1070))))))

(declare-fun b!1097961 () Bool)

(declare-fun res!732799 () Bool)

(assert (=> b!1097961 (=> (not res!732799) (not e!626653))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1097961 (= res!732799 (and (= (size!34752 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34751 _keys!1070) (size!34752 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097962 () Bool)

(assert (=> b!1097962 (= e!626653 e!626647)))

(declare-fun res!732803 () Bool)

(assert (=> b!1097962 (=> (not res!732803) (not e!626647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71086 (_ BitVec 32)) Bool)

(assert (=> b!1097962 (= res!732803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490891 mask!1414))))

(assert (=> b!1097962 (= lt!490891 (array!71087 (store (arr!34213 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34751 _keys!1070)))))

(declare-fun b!1097963 () Bool)

(declare-fun res!732797 () Bool)

(assert (=> b!1097963 (=> (not res!732797) (not e!626653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097963 (= res!732797 (validKeyInArray!0 k0!904))))

(declare-fun b!1097964 () Bool)

(declare-fun e!626648 () Bool)

(assert (=> b!1097964 (= e!626647 (not e!626648))))

(declare-fun res!732801 () Bool)

(assert (=> b!1097964 (=> res!732801 e!626648)))

(assert (=> b!1097964 (= res!732801 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41305)

(declare-fun zeroValue!831 () V!41305)

(declare-fun getCurrentListMap!4307 (array!71086 array!71088 (_ BitVec 32) (_ BitVec 32) V!41305 V!41305 (_ BitVec 32) Int) ListLongMap!15337)

(assert (=> b!1097964 (= lt!490888 (getCurrentListMap!4307 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490896 () array!71088)

(assert (=> b!1097964 (= lt!490889 (getCurrentListMap!4307 lt!490891 lt!490896 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490893 () ListLongMap!15337)

(assert (=> b!1097964 (and (= lt!490893 lt!490894) (= lt!490894 lt!490893))))

(declare-fun -!921 (ListLongMap!15337 (_ BitVec 64)) ListLongMap!15337)

(assert (=> b!1097964 (= lt!490894 (-!921 lt!490892 k0!904))))

(declare-datatypes ((Unit!35953 0))(
  ( (Unit!35954) )
))
(declare-fun lt!490897 () Unit!35953)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!196 (array!71086 array!71088 (_ BitVec 32) (_ BitVec 32) V!41305 V!41305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35953)

(assert (=> b!1097964 (= lt!490897 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!196 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4214 (array!71086 array!71088 (_ BitVec 32) (_ BitVec 32) V!41305 V!41305 (_ BitVec 32) Int) ListLongMap!15337)

(assert (=> b!1097964 (= lt!490893 (getCurrentListMapNoExtraKeys!4214 lt!490891 lt!490896 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2283 (Int (_ BitVec 64)) V!41305)

(assert (=> b!1097964 (= lt!490896 (array!71089 (store (arr!34214 _values!874) i!650 (ValueCellFull!12857 (dynLambda!2283 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34752 _values!874)))))

(assert (=> b!1097964 (= lt!490892 (getCurrentListMapNoExtraKeys!4214 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097964 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490895 () Unit!35953)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71086 (_ BitVec 64) (_ BitVec 32)) Unit!35953)

(assert (=> b!1097964 (= lt!490895 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1097965 () Bool)

(assert (=> b!1097965 (= e!626648 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904)))))

(assert (=> b!1097965 e!626651))

(declare-fun res!732794 () Bool)

(assert (=> b!1097965 (=> (not res!732794) (not e!626651))))

(assert (=> b!1097965 (= res!732794 (= lt!490889 (+!3396 (+!3396 lt!490893 lt!490890) lt!490887)))))

(assert (=> b!1097965 (= lt!490887 (tuple2!17369 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1097965 (= lt!490890 (tuple2!17369 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1097966 () Bool)

(assert (=> b!1097966 (= e!626650 tp_is_empty!27133)))

(declare-fun b!1097967 () Bool)

(declare-fun res!732796 () Bool)

(assert (=> b!1097967 (=> (not res!732796) (not e!626653))))

(assert (=> b!1097967 (= res!732796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96550 res!732800) b!1097961))

(assert (= (and b!1097961 res!732799) b!1097967))

(assert (= (and b!1097967 res!732796) b!1097953))

(assert (= (and b!1097953 res!732804) b!1097960))

(assert (= (and b!1097960 res!732793) b!1097963))

(assert (= (and b!1097963 res!732797) b!1097955))

(assert (= (and b!1097955 res!732798) b!1097962))

(assert (= (and b!1097962 res!732803) b!1097959))

(assert (= (and b!1097959 res!732795) b!1097964))

(assert (= (and b!1097964 (not res!732801)) b!1097965))

(assert (= (and b!1097965 res!732794) b!1097958))

(assert (= (and b!1097958 res!732802) b!1097957))

(assert (= (and b!1097954 condMapEmpty!42466) mapIsEmpty!42466))

(assert (= (and b!1097954 (not condMapEmpty!42466)) mapNonEmpty!42466))

(get-info :version)

(assert (= (and mapNonEmpty!42466 ((_ is ValueCellFull!12857) mapValue!42466)) b!1097966))

(assert (= (and b!1097954 ((_ is ValueCellFull!12857) mapDefault!42466)) b!1097956))

(assert (= start!96550 b!1097954))

(declare-fun b_lambda!17779 () Bool)

(assert (=> (not b_lambda!17779) (not b!1097964)))

(declare-fun t!34079 () Bool)

(declare-fun tb!7941 () Bool)

(assert (=> (and start!96550 (= defaultEntry!882 defaultEntry!882) t!34079) tb!7941))

(declare-fun result!16417 () Bool)

(assert (=> tb!7941 (= result!16417 tp_is_empty!27133)))

(assert (=> b!1097964 t!34079))

(declare-fun b_and!36833 () Bool)

(assert (= b_and!36831 (and (=> t!34079 result!16417) b_and!36833)))

(declare-fun m!1017067 () Bool)

(assert (=> start!96550 m!1017067))

(declare-fun m!1017069 () Bool)

(assert (=> start!96550 m!1017069))

(declare-fun m!1017071 () Bool)

(assert (=> start!96550 m!1017071))

(declare-fun m!1017073 () Bool)

(assert (=> b!1097958 m!1017073))

(assert (=> b!1097958 m!1017073))

(declare-fun m!1017075 () Bool)

(assert (=> b!1097958 m!1017075))

(declare-fun m!1017077 () Bool)

(assert (=> b!1097955 m!1017077))

(declare-fun m!1017079 () Bool)

(assert (=> b!1097965 m!1017079))

(assert (=> b!1097965 m!1017079))

(declare-fun m!1017081 () Bool)

(assert (=> b!1097965 m!1017081))

(declare-fun m!1017083 () Bool)

(assert (=> b!1097957 m!1017083))

(assert (=> b!1097957 m!1017083))

(declare-fun m!1017085 () Bool)

(assert (=> b!1097957 m!1017085))

(declare-fun m!1017087 () Bool)

(assert (=> b!1097962 m!1017087))

(declare-fun m!1017089 () Bool)

(assert (=> b!1097962 m!1017089))

(declare-fun m!1017091 () Bool)

(assert (=> b!1097967 m!1017091))

(declare-fun m!1017093 () Bool)

(assert (=> b!1097953 m!1017093))

(declare-fun m!1017095 () Bool)

(assert (=> mapNonEmpty!42466 m!1017095))

(declare-fun m!1017097 () Bool)

(assert (=> b!1097964 m!1017097))

(declare-fun m!1017099 () Bool)

(assert (=> b!1097964 m!1017099))

(declare-fun m!1017101 () Bool)

(assert (=> b!1097964 m!1017101))

(declare-fun m!1017103 () Bool)

(assert (=> b!1097964 m!1017103))

(declare-fun m!1017105 () Bool)

(assert (=> b!1097964 m!1017105))

(declare-fun m!1017107 () Bool)

(assert (=> b!1097964 m!1017107))

(declare-fun m!1017109 () Bool)

(assert (=> b!1097964 m!1017109))

(declare-fun m!1017111 () Bool)

(assert (=> b!1097964 m!1017111))

(declare-fun m!1017113 () Bool)

(assert (=> b!1097964 m!1017113))

(declare-fun m!1017115 () Bool)

(assert (=> b!1097964 m!1017115))

(declare-fun m!1017117 () Bool)

(assert (=> b!1097959 m!1017117))

(declare-fun m!1017119 () Bool)

(assert (=> b!1097963 m!1017119))

(check-sat (not b!1097957) tp_is_empty!27133 (not b!1097959) (not start!96550) (not b!1097965) (not b_next!23083) (not b_lambda!17779) b_and!36833 (not b!1097963) (not b!1097967) (not b!1097964) (not b!1097958) (not b!1097953) (not b!1097962) (not mapNonEmpty!42466))
(check-sat b_and!36833 (not b_next!23083))
(get-model)

(declare-fun b_lambda!17785 () Bool)

(assert (= b_lambda!17779 (or (and start!96550 b_free!23083) b_lambda!17785)))

(check-sat (not b!1097957) tp_is_empty!27133 (not b!1097959) (not start!96550) (not b!1097965) (not b_next!23083) b_and!36833 (not b!1097963) (not b_lambda!17785) (not b!1097967) (not b!1097964) (not b!1097958) (not b!1097953) (not b!1097962) (not mapNonEmpty!42466))
(check-sat b_and!36833 (not b_next!23083))
(get-model)

(declare-fun b!1098072 () Bool)

(declare-fun e!626711 () Bool)

(declare-fun call!45836 () Bool)

(assert (=> b!1098072 (= e!626711 call!45836)))

(declare-fun b!1098074 () Bool)

(declare-fun e!626709 () Bool)

(assert (=> b!1098074 (= e!626709 call!45836)))

(declare-fun b!1098075 () Bool)

(assert (=> b!1098075 (= e!626711 e!626709)))

(declare-fun lt!490970 () (_ BitVec 64))

(assert (=> b!1098075 (= lt!490970 (select (arr!34213 lt!490891) #b00000000000000000000000000000000))))

(declare-fun lt!490971 () Unit!35953)

(assert (=> b!1098075 (= lt!490971 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!490891 lt!490970 #b00000000000000000000000000000000))))

(assert (=> b!1098075 (arrayContainsKey!0 lt!490891 lt!490970 #b00000000000000000000000000000000)))

(declare-fun lt!490972 () Unit!35953)

(assert (=> b!1098075 (= lt!490972 lt!490971)))

(declare-fun res!732881 () Bool)

(declare-datatypes ((SeekEntryResult!9907 0))(
  ( (MissingZero!9907 (index!41999 (_ BitVec 32))) (Found!9907 (index!42000 (_ BitVec 32))) (Intermediate!9907 (undefined!10719 Bool) (index!42001 (_ BitVec 32)) (x!98772 (_ BitVec 32))) (Undefined!9907) (MissingVacant!9907 (index!42002 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71086 (_ BitVec 32)) SeekEntryResult!9907)

(assert (=> b!1098075 (= res!732881 (= (seekEntryOrOpen!0 (select (arr!34213 lt!490891) #b00000000000000000000000000000000) lt!490891 mask!1414) (Found!9907 #b00000000000000000000000000000000)))))

(assert (=> b!1098075 (=> (not res!732881) (not e!626709))))

(declare-fun bm!45833 () Bool)

(assert (=> bm!45833 (= call!45836 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!490891 mask!1414))))

(declare-fun b!1098073 () Bool)

(declare-fun e!626710 () Bool)

(assert (=> b!1098073 (= e!626710 e!626711)))

(declare-fun c!108424 () Bool)

(assert (=> b!1098073 (= c!108424 (validKeyInArray!0 (select (arr!34213 lt!490891) #b00000000000000000000000000000000)))))

(declare-fun d!130219 () Bool)

(declare-fun res!732882 () Bool)

(assert (=> d!130219 (=> res!732882 e!626710)))

(assert (=> d!130219 (= res!732882 (bvsge #b00000000000000000000000000000000 (size!34751 lt!490891)))))

(assert (=> d!130219 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490891 mask!1414) e!626710)))

(assert (= (and d!130219 (not res!732882)) b!1098073))

(assert (= (and b!1098073 c!108424) b!1098075))

(assert (= (and b!1098073 (not c!108424)) b!1098072))

(assert (= (and b!1098075 res!732881) b!1098074))

(assert (= (or b!1098074 b!1098072) bm!45833))

(declare-fun m!1017229 () Bool)

(assert (=> b!1098075 m!1017229))

(declare-fun m!1017231 () Bool)

(assert (=> b!1098075 m!1017231))

(declare-fun m!1017233 () Bool)

(assert (=> b!1098075 m!1017233))

(assert (=> b!1098075 m!1017229))

(declare-fun m!1017235 () Bool)

(assert (=> b!1098075 m!1017235))

(declare-fun m!1017237 () Bool)

(assert (=> bm!45833 m!1017237))

(assert (=> b!1098073 m!1017229))

(assert (=> b!1098073 m!1017229))

(declare-fun m!1017239 () Bool)

(assert (=> b!1098073 m!1017239))

(assert (=> b!1097962 d!130219))

(declare-fun bm!45836 () Bool)

(declare-fun call!45839 () Bool)

(declare-fun c!108427 () Bool)

(assert (=> bm!45836 (= call!45839 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108427 (Cons!23956 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000) Nil!23957) Nil!23957)))))

(declare-fun b!1098086 () Bool)

(declare-fun e!626721 () Bool)

(assert (=> b!1098086 (= e!626721 call!45839)))

(declare-fun b!1098087 () Bool)

(declare-fun e!626722 () Bool)

(declare-fun e!626720 () Bool)

(assert (=> b!1098087 (= e!626722 e!626720)))

(declare-fun res!732890 () Bool)

(assert (=> b!1098087 (=> (not res!732890) (not e!626720))))

(declare-fun e!626723 () Bool)

(assert (=> b!1098087 (= res!732890 (not e!626723))))

(declare-fun res!732889 () Bool)

(assert (=> b!1098087 (=> (not res!732889) (not e!626723))))

(assert (=> b!1098087 (= res!732889 (validKeyInArray!0 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098088 () Bool)

(assert (=> b!1098088 (= e!626720 e!626721)))

(assert (=> b!1098088 (= c!108427 (validKeyInArray!0 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098089 () Bool)

(assert (=> b!1098089 (= e!626721 call!45839)))

(declare-fun d!130221 () Bool)

(declare-fun res!732891 () Bool)

(assert (=> d!130221 (=> res!732891 e!626722)))

(assert (=> d!130221 (= res!732891 (bvsge #b00000000000000000000000000000000 (size!34751 _keys!1070)))))

(assert (=> d!130221 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23957) e!626722)))

(declare-fun b!1098090 () Bool)

(declare-fun contains!6353 (List!23960 (_ BitVec 64)) Bool)

(assert (=> b!1098090 (= e!626723 (contains!6353 Nil!23957 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130221 (not res!732891)) b!1098087))

(assert (= (and b!1098087 res!732889) b!1098090))

(assert (= (and b!1098087 res!732890) b!1098088))

(assert (= (and b!1098088 c!108427) b!1098089))

(assert (= (and b!1098088 (not c!108427)) b!1098086))

(assert (= (or b!1098089 b!1098086) bm!45836))

(declare-fun m!1017241 () Bool)

(assert (=> bm!45836 m!1017241))

(declare-fun m!1017243 () Bool)

(assert (=> bm!45836 m!1017243))

(assert (=> b!1098087 m!1017241))

(assert (=> b!1098087 m!1017241))

(declare-fun m!1017245 () Bool)

(assert (=> b!1098087 m!1017245))

(assert (=> b!1098088 m!1017241))

(assert (=> b!1098088 m!1017241))

(assert (=> b!1098088 m!1017245))

(assert (=> b!1098090 m!1017241))

(assert (=> b!1098090 m!1017241))

(declare-fun m!1017247 () Bool)

(assert (=> b!1098090 m!1017247))

(assert (=> b!1097953 d!130221))

(declare-fun b!1098091 () Bool)

(declare-fun e!626726 () Bool)

(declare-fun call!45840 () Bool)

(assert (=> b!1098091 (= e!626726 call!45840)))

(declare-fun b!1098093 () Bool)

(declare-fun e!626724 () Bool)

(assert (=> b!1098093 (= e!626724 call!45840)))

(declare-fun b!1098094 () Bool)

(assert (=> b!1098094 (= e!626726 e!626724)))

(declare-fun lt!490973 () (_ BitVec 64))

(assert (=> b!1098094 (= lt!490973 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490974 () Unit!35953)

(assert (=> b!1098094 (= lt!490974 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!490973 #b00000000000000000000000000000000))))

(assert (=> b!1098094 (arrayContainsKey!0 _keys!1070 lt!490973 #b00000000000000000000000000000000)))

(declare-fun lt!490975 () Unit!35953)

(assert (=> b!1098094 (= lt!490975 lt!490974)))

(declare-fun res!732892 () Bool)

(assert (=> b!1098094 (= res!732892 (= (seekEntryOrOpen!0 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9907 #b00000000000000000000000000000000)))))

(assert (=> b!1098094 (=> (not res!732892) (not e!626724))))

(declare-fun bm!45837 () Bool)

(assert (=> bm!45837 (= call!45840 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1098092 () Bool)

(declare-fun e!626725 () Bool)

(assert (=> b!1098092 (= e!626725 e!626726)))

(declare-fun c!108428 () Bool)

(assert (=> b!1098092 (= c!108428 (validKeyInArray!0 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130223 () Bool)

(declare-fun res!732893 () Bool)

(assert (=> d!130223 (=> res!732893 e!626725)))

(assert (=> d!130223 (= res!732893 (bvsge #b00000000000000000000000000000000 (size!34751 _keys!1070)))))

(assert (=> d!130223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!626725)))

(assert (= (and d!130223 (not res!732893)) b!1098092))

(assert (= (and b!1098092 c!108428) b!1098094))

(assert (= (and b!1098092 (not c!108428)) b!1098091))

(assert (= (and b!1098094 res!732892) b!1098093))

(assert (= (or b!1098093 b!1098091) bm!45837))

(assert (=> b!1098094 m!1017241))

(declare-fun m!1017249 () Bool)

(assert (=> b!1098094 m!1017249))

(declare-fun m!1017251 () Bool)

(assert (=> b!1098094 m!1017251))

(assert (=> b!1098094 m!1017241))

(declare-fun m!1017253 () Bool)

(assert (=> b!1098094 m!1017253))

(declare-fun m!1017255 () Bool)

(assert (=> bm!45837 m!1017255))

(assert (=> b!1098092 m!1017241))

(assert (=> b!1098092 m!1017241))

(assert (=> b!1098092 m!1017245))

(assert (=> b!1097967 d!130223))

(declare-fun d!130225 () Bool)

(declare-fun e!626729 () Bool)

(assert (=> d!130225 e!626729))

(declare-fun res!732899 () Bool)

(assert (=> d!130225 (=> (not res!732899) (not e!626729))))

(declare-fun lt!490986 () ListLongMap!15337)

(declare-fun contains!6354 (ListLongMap!15337 (_ BitVec 64)) Bool)

(assert (=> d!130225 (= res!732899 (contains!6354 lt!490986 (_1!8695 lt!490887)))))

(declare-fun lt!490984 () List!23961)

(assert (=> d!130225 (= lt!490986 (ListLongMap!15338 lt!490984))))

(declare-fun lt!490987 () Unit!35953)

(declare-fun lt!490985 () Unit!35953)

(assert (=> d!130225 (= lt!490987 lt!490985)))

(declare-datatypes ((Option!673 0))(
  ( (Some!672 (v!16248 V!41305)) (None!671) )
))
(declare-fun getValueByKey!622 (List!23961 (_ BitVec 64)) Option!673)

(assert (=> d!130225 (= (getValueByKey!622 lt!490984 (_1!8695 lt!490887)) (Some!672 (_2!8695 lt!490887)))))

(declare-fun lemmaContainsTupThenGetReturnValue!298 (List!23961 (_ BitVec 64) V!41305) Unit!35953)

(assert (=> d!130225 (= lt!490985 (lemmaContainsTupThenGetReturnValue!298 lt!490984 (_1!8695 lt!490887) (_2!8695 lt!490887)))))

(declare-fun insertStrictlySorted!391 (List!23961 (_ BitVec 64) V!41305) List!23961)

(assert (=> d!130225 (= lt!490984 (insertStrictlySorted!391 (toList!7684 (+!3396 lt!490893 lt!490890)) (_1!8695 lt!490887) (_2!8695 lt!490887)))))

(assert (=> d!130225 (= (+!3396 (+!3396 lt!490893 lt!490890) lt!490887) lt!490986)))

(declare-fun b!1098099 () Bool)

(declare-fun res!732898 () Bool)

(assert (=> b!1098099 (=> (not res!732898) (not e!626729))))

(assert (=> b!1098099 (= res!732898 (= (getValueByKey!622 (toList!7684 lt!490986) (_1!8695 lt!490887)) (Some!672 (_2!8695 lt!490887))))))

(declare-fun b!1098100 () Bool)

(declare-fun contains!6355 (List!23961 tuple2!17368) Bool)

(assert (=> b!1098100 (= e!626729 (contains!6355 (toList!7684 lt!490986) lt!490887))))

(assert (= (and d!130225 res!732899) b!1098099))

(assert (= (and b!1098099 res!732898) b!1098100))

(declare-fun m!1017257 () Bool)

(assert (=> d!130225 m!1017257))

(declare-fun m!1017259 () Bool)

(assert (=> d!130225 m!1017259))

(declare-fun m!1017261 () Bool)

(assert (=> d!130225 m!1017261))

(declare-fun m!1017263 () Bool)

(assert (=> d!130225 m!1017263))

(declare-fun m!1017265 () Bool)

(assert (=> b!1098099 m!1017265))

(declare-fun m!1017267 () Bool)

(assert (=> b!1098100 m!1017267))

(assert (=> b!1097965 d!130225))

(declare-fun d!130227 () Bool)

(declare-fun e!626730 () Bool)

(assert (=> d!130227 e!626730))

(declare-fun res!732901 () Bool)

(assert (=> d!130227 (=> (not res!732901) (not e!626730))))

(declare-fun lt!490990 () ListLongMap!15337)

(assert (=> d!130227 (= res!732901 (contains!6354 lt!490990 (_1!8695 lt!490890)))))

(declare-fun lt!490988 () List!23961)

(assert (=> d!130227 (= lt!490990 (ListLongMap!15338 lt!490988))))

(declare-fun lt!490991 () Unit!35953)

(declare-fun lt!490989 () Unit!35953)

(assert (=> d!130227 (= lt!490991 lt!490989)))

(assert (=> d!130227 (= (getValueByKey!622 lt!490988 (_1!8695 lt!490890)) (Some!672 (_2!8695 lt!490890)))))

(assert (=> d!130227 (= lt!490989 (lemmaContainsTupThenGetReturnValue!298 lt!490988 (_1!8695 lt!490890) (_2!8695 lt!490890)))))

(assert (=> d!130227 (= lt!490988 (insertStrictlySorted!391 (toList!7684 lt!490893) (_1!8695 lt!490890) (_2!8695 lt!490890)))))

(assert (=> d!130227 (= (+!3396 lt!490893 lt!490890) lt!490990)))

(declare-fun b!1098101 () Bool)

(declare-fun res!732900 () Bool)

(assert (=> b!1098101 (=> (not res!732900) (not e!626730))))

(assert (=> b!1098101 (= res!732900 (= (getValueByKey!622 (toList!7684 lt!490990) (_1!8695 lt!490890)) (Some!672 (_2!8695 lt!490890))))))

(declare-fun b!1098102 () Bool)

(assert (=> b!1098102 (= e!626730 (contains!6355 (toList!7684 lt!490990) lt!490890))))

(assert (= (and d!130227 res!732901) b!1098101))

(assert (= (and b!1098101 res!732900) b!1098102))

(declare-fun m!1017269 () Bool)

(assert (=> d!130227 m!1017269))

(declare-fun m!1017271 () Bool)

(assert (=> d!130227 m!1017271))

(declare-fun m!1017273 () Bool)

(assert (=> d!130227 m!1017273))

(declare-fun m!1017275 () Bool)

(assert (=> d!130227 m!1017275))

(declare-fun m!1017277 () Bool)

(assert (=> b!1098101 m!1017277))

(declare-fun m!1017279 () Bool)

(assert (=> b!1098102 m!1017279))

(assert (=> b!1097965 d!130227))

(declare-fun bm!45838 () Bool)

(declare-fun call!45841 () Bool)

(declare-fun c!108429 () Bool)

(assert (=> bm!45838 (= call!45841 (arrayNoDuplicates!0 lt!490891 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108429 (Cons!23956 (select (arr!34213 lt!490891) #b00000000000000000000000000000000) Nil!23957) Nil!23957)))))

(declare-fun b!1098103 () Bool)

(declare-fun e!626732 () Bool)

(assert (=> b!1098103 (= e!626732 call!45841)))

(declare-fun b!1098104 () Bool)

(declare-fun e!626733 () Bool)

(declare-fun e!626731 () Bool)

(assert (=> b!1098104 (= e!626733 e!626731)))

(declare-fun res!732903 () Bool)

(assert (=> b!1098104 (=> (not res!732903) (not e!626731))))

(declare-fun e!626734 () Bool)

(assert (=> b!1098104 (= res!732903 (not e!626734))))

(declare-fun res!732902 () Bool)

(assert (=> b!1098104 (=> (not res!732902) (not e!626734))))

(assert (=> b!1098104 (= res!732902 (validKeyInArray!0 (select (arr!34213 lt!490891) #b00000000000000000000000000000000)))))

(declare-fun b!1098105 () Bool)

(assert (=> b!1098105 (= e!626731 e!626732)))

(assert (=> b!1098105 (= c!108429 (validKeyInArray!0 (select (arr!34213 lt!490891) #b00000000000000000000000000000000)))))

(declare-fun b!1098106 () Bool)

(assert (=> b!1098106 (= e!626732 call!45841)))

(declare-fun d!130229 () Bool)

(declare-fun res!732904 () Bool)

(assert (=> d!130229 (=> res!732904 e!626733)))

(assert (=> d!130229 (= res!732904 (bvsge #b00000000000000000000000000000000 (size!34751 lt!490891)))))

(assert (=> d!130229 (= (arrayNoDuplicates!0 lt!490891 #b00000000000000000000000000000000 Nil!23957) e!626733)))

(declare-fun b!1098107 () Bool)

(assert (=> b!1098107 (= e!626734 (contains!6353 Nil!23957 (select (arr!34213 lt!490891) #b00000000000000000000000000000000)))))

(assert (= (and d!130229 (not res!732904)) b!1098104))

(assert (= (and b!1098104 res!732902) b!1098107))

(assert (= (and b!1098104 res!732903) b!1098105))

(assert (= (and b!1098105 c!108429) b!1098106))

(assert (= (and b!1098105 (not c!108429)) b!1098103))

(assert (= (or b!1098106 b!1098103) bm!45838))

(assert (=> bm!45838 m!1017229))

(declare-fun m!1017281 () Bool)

(assert (=> bm!45838 m!1017281))

(assert (=> b!1098104 m!1017229))

(assert (=> b!1098104 m!1017229))

(assert (=> b!1098104 m!1017239))

(assert (=> b!1098105 m!1017229))

(assert (=> b!1098105 m!1017229))

(assert (=> b!1098105 m!1017239))

(assert (=> b!1098107 m!1017229))

(assert (=> b!1098107 m!1017229))

(declare-fun m!1017283 () Bool)

(assert (=> b!1098107 m!1017283))

(assert (=> b!1097959 d!130229))

(declare-fun d!130231 () Bool)

(declare-fun res!732909 () Bool)

(declare-fun e!626739 () Bool)

(assert (=> d!130231 (=> res!732909 e!626739)))

(assert (=> d!130231 (= res!732909 (= (select (arr!34213 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130231 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!626739)))

(declare-fun b!1098112 () Bool)

(declare-fun e!626740 () Bool)

(assert (=> b!1098112 (= e!626739 e!626740)))

(declare-fun res!732910 () Bool)

(assert (=> b!1098112 (=> (not res!732910) (not e!626740))))

(assert (=> b!1098112 (= res!732910 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34751 _keys!1070)))))

(declare-fun b!1098113 () Bool)

(assert (=> b!1098113 (= e!626740 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130231 (not res!732909)) b!1098112))

(assert (= (and b!1098112 res!732910) b!1098113))

(assert (=> d!130231 m!1017241))

(declare-fun m!1017285 () Bool)

(assert (=> b!1098113 m!1017285))

(assert (=> b!1097964 d!130231))

(declare-fun b!1098156 () Bool)

(declare-fun e!626772 () ListLongMap!15337)

(declare-fun call!45861 () ListLongMap!15337)

(assert (=> b!1098156 (= e!626772 call!45861)))

(declare-fun b!1098157 () Bool)

(declare-fun call!45856 () ListLongMap!15337)

(assert (=> b!1098157 (= e!626772 call!45856)))

(declare-fun d!130233 () Bool)

(declare-fun e!626768 () Bool)

(assert (=> d!130233 e!626768))

(declare-fun res!732931 () Bool)

(assert (=> d!130233 (=> (not res!732931) (not e!626768))))

(assert (=> d!130233 (= res!732931 (or (bvsge #b00000000000000000000000000000000 (size!34751 lt!490891)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34751 lt!490891)))))))

(declare-fun lt!491036 () ListLongMap!15337)

(declare-fun lt!491040 () ListLongMap!15337)

(assert (=> d!130233 (= lt!491036 lt!491040)))

(declare-fun lt!491053 () Unit!35953)

(declare-fun e!626774 () Unit!35953)

(assert (=> d!130233 (= lt!491053 e!626774)))

(declare-fun c!108446 () Bool)

(declare-fun e!626767 () Bool)

(assert (=> d!130233 (= c!108446 e!626767)))

(declare-fun res!732930 () Bool)

(assert (=> d!130233 (=> (not res!732930) (not e!626767))))

(assert (=> d!130233 (= res!732930 (bvslt #b00000000000000000000000000000000 (size!34751 lt!490891)))))

(declare-fun e!626779 () ListLongMap!15337)

(assert (=> d!130233 (= lt!491040 e!626779)))

(declare-fun c!108443 () Bool)

(assert (=> d!130233 (= c!108443 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130233 (validMask!0 mask!1414)))

(assert (=> d!130233 (= (getCurrentListMap!4307 lt!490891 lt!490896 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491036)))

(declare-fun b!1098158 () Bool)

(declare-fun lt!491044 () Unit!35953)

(assert (=> b!1098158 (= e!626774 lt!491044)))

(declare-fun lt!491054 () ListLongMap!15337)

(assert (=> b!1098158 (= lt!491054 (getCurrentListMapNoExtraKeys!4214 lt!490891 lt!490896 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491050 () (_ BitVec 64))

(assert (=> b!1098158 (= lt!491050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491056 () (_ BitVec 64))

(assert (=> b!1098158 (= lt!491056 (select (arr!34213 lt!490891) #b00000000000000000000000000000000))))

(declare-fun lt!491039 () Unit!35953)

(declare-fun addStillContains!651 (ListLongMap!15337 (_ BitVec 64) V!41305 (_ BitVec 64)) Unit!35953)

(assert (=> b!1098158 (= lt!491039 (addStillContains!651 lt!491054 lt!491050 zeroValue!831 lt!491056))))

(assert (=> b!1098158 (contains!6354 (+!3396 lt!491054 (tuple2!17369 lt!491050 zeroValue!831)) lt!491056)))

(declare-fun lt!491048 () Unit!35953)

(assert (=> b!1098158 (= lt!491048 lt!491039)))

(declare-fun lt!491037 () ListLongMap!15337)

(assert (=> b!1098158 (= lt!491037 (getCurrentListMapNoExtraKeys!4214 lt!490891 lt!490896 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491046 () (_ BitVec 64))

(assert (=> b!1098158 (= lt!491046 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491042 () (_ BitVec 64))

(assert (=> b!1098158 (= lt!491042 (select (arr!34213 lt!490891) #b00000000000000000000000000000000))))

(declare-fun lt!491045 () Unit!35953)

(declare-fun addApplyDifferent!507 (ListLongMap!15337 (_ BitVec 64) V!41305 (_ BitVec 64)) Unit!35953)

(assert (=> b!1098158 (= lt!491045 (addApplyDifferent!507 lt!491037 lt!491046 minValue!831 lt!491042))))

(declare-fun apply!938 (ListLongMap!15337 (_ BitVec 64)) V!41305)

(assert (=> b!1098158 (= (apply!938 (+!3396 lt!491037 (tuple2!17369 lt!491046 minValue!831)) lt!491042) (apply!938 lt!491037 lt!491042))))

(declare-fun lt!491043 () Unit!35953)

(assert (=> b!1098158 (= lt!491043 lt!491045)))

(declare-fun lt!491057 () ListLongMap!15337)

(assert (=> b!1098158 (= lt!491057 (getCurrentListMapNoExtraKeys!4214 lt!490891 lt!490896 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491055 () (_ BitVec 64))

(assert (=> b!1098158 (= lt!491055 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491052 () (_ BitVec 64))

(assert (=> b!1098158 (= lt!491052 (select (arr!34213 lt!490891) #b00000000000000000000000000000000))))

(declare-fun lt!491051 () Unit!35953)

(assert (=> b!1098158 (= lt!491051 (addApplyDifferent!507 lt!491057 lt!491055 zeroValue!831 lt!491052))))

(assert (=> b!1098158 (= (apply!938 (+!3396 lt!491057 (tuple2!17369 lt!491055 zeroValue!831)) lt!491052) (apply!938 lt!491057 lt!491052))))

(declare-fun lt!491041 () Unit!35953)

(assert (=> b!1098158 (= lt!491041 lt!491051)))

(declare-fun lt!491038 () ListLongMap!15337)

(assert (=> b!1098158 (= lt!491038 (getCurrentListMapNoExtraKeys!4214 lt!490891 lt!490896 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491047 () (_ BitVec 64))

(assert (=> b!1098158 (= lt!491047 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491049 () (_ BitVec 64))

(assert (=> b!1098158 (= lt!491049 (select (arr!34213 lt!490891) #b00000000000000000000000000000000))))

(assert (=> b!1098158 (= lt!491044 (addApplyDifferent!507 lt!491038 lt!491047 minValue!831 lt!491049))))

(assert (=> b!1098158 (= (apply!938 (+!3396 lt!491038 (tuple2!17369 lt!491047 minValue!831)) lt!491049) (apply!938 lt!491038 lt!491049))))

(declare-fun b!1098159 () Bool)

(declare-fun e!626778 () Bool)

(assert (=> b!1098159 (= e!626778 (= (apply!938 lt!491036 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1098160 () Bool)

(declare-fun e!626777 () Bool)

(assert (=> b!1098160 (= e!626777 (validKeyInArray!0 (select (arr!34213 lt!490891) #b00000000000000000000000000000000)))))

(declare-fun call!45859 () ListLongMap!15337)

(declare-fun bm!45853 () Bool)

(assert (=> bm!45853 (= call!45859 (getCurrentListMapNoExtraKeys!4214 lt!490891 lt!490896 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun call!45858 () ListLongMap!15337)

(declare-fun c!108442 () Bool)

(declare-fun bm!45854 () Bool)

(declare-fun call!45862 () ListLongMap!15337)

(assert (=> bm!45854 (= call!45862 (+!3396 (ite c!108443 call!45859 (ite c!108442 call!45858 call!45861)) (ite (or c!108443 c!108442) (tuple2!17369 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17369 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun bm!45855 () Bool)

(declare-fun call!45857 () Bool)

(assert (=> bm!45855 (= call!45857 (contains!6354 lt!491036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098161 () Bool)

(declare-fun c!108444 () Bool)

(assert (=> b!1098161 (= c!108444 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!626769 () ListLongMap!15337)

(assert (=> b!1098161 (= e!626769 e!626772)))

(declare-fun b!1098162 () Bool)

(declare-fun e!626770 () Bool)

(assert (=> b!1098162 (= e!626770 (not call!45857))))

(declare-fun b!1098163 () Bool)

(assert (=> b!1098163 (= e!626769 call!45856)))

(declare-fun bm!45856 () Bool)

(declare-fun call!45860 () Bool)

(assert (=> bm!45856 (= call!45860 (contains!6354 lt!491036 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098164 () Bool)

(declare-fun Unit!35955 () Unit!35953)

(assert (=> b!1098164 (= e!626774 Unit!35955)))

(declare-fun b!1098165 () Bool)

(declare-fun e!626773 () Bool)

(declare-fun e!626775 () Bool)

(assert (=> b!1098165 (= e!626773 e!626775)))

(declare-fun res!732929 () Bool)

(assert (=> b!1098165 (= res!732929 call!45860)))

(assert (=> b!1098165 (=> (not res!732929) (not e!626775))))

(declare-fun b!1098166 () Bool)

(assert (=> b!1098166 (= e!626779 (+!3396 call!45862 (tuple2!17369 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1098167 () Bool)

(assert (=> b!1098167 (= e!626767 (validKeyInArray!0 (select (arr!34213 lt!490891) #b00000000000000000000000000000000)))))

(declare-fun b!1098168 () Bool)

(declare-fun res!732933 () Bool)

(assert (=> b!1098168 (=> (not res!732933) (not e!626768))))

(assert (=> b!1098168 (= res!732933 e!626770)))

(declare-fun c!108445 () Bool)

(assert (=> b!1098168 (= c!108445 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!626771 () Bool)

(declare-fun b!1098169 () Bool)

(declare-fun get!17614 (ValueCell!12857 V!41305) V!41305)

(assert (=> b!1098169 (= e!626771 (= (apply!938 lt!491036 (select (arr!34213 lt!490891) #b00000000000000000000000000000000)) (get!17614 (select (arr!34214 lt!490896) #b00000000000000000000000000000000) (dynLambda!2283 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098169 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34752 lt!490896)))))

(assert (=> b!1098169 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34751 lt!490891)))))

(declare-fun b!1098170 () Bool)

(assert (=> b!1098170 (= e!626768 e!626773)))

(declare-fun c!108447 () Bool)

(assert (=> b!1098170 (= c!108447 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45857 () Bool)

(assert (=> bm!45857 (= call!45861 call!45858)))

(declare-fun b!1098171 () Bool)

(assert (=> b!1098171 (= e!626775 (= (apply!938 lt!491036 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1098172 () Bool)

(assert (=> b!1098172 (= e!626773 (not call!45860))))

(declare-fun bm!45858 () Bool)

(assert (=> bm!45858 (= call!45858 call!45859)))

(declare-fun b!1098173 () Bool)

(assert (=> b!1098173 (= e!626779 e!626769)))

(assert (=> b!1098173 (= c!108442 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1098174 () Bool)

(declare-fun res!732932 () Bool)

(assert (=> b!1098174 (=> (not res!732932) (not e!626768))))

(declare-fun e!626776 () Bool)

(assert (=> b!1098174 (= res!732932 e!626776)))

(declare-fun res!732934 () Bool)

(assert (=> b!1098174 (=> res!732934 e!626776)))

(assert (=> b!1098174 (= res!732934 (not e!626777))))

(declare-fun res!732935 () Bool)

(assert (=> b!1098174 (=> (not res!732935) (not e!626777))))

(assert (=> b!1098174 (= res!732935 (bvslt #b00000000000000000000000000000000 (size!34751 lt!490891)))))

(declare-fun bm!45859 () Bool)

(assert (=> bm!45859 (= call!45856 call!45862)))

(declare-fun b!1098175 () Bool)

(assert (=> b!1098175 (= e!626776 e!626771)))

(declare-fun res!732937 () Bool)

(assert (=> b!1098175 (=> (not res!732937) (not e!626771))))

(assert (=> b!1098175 (= res!732937 (contains!6354 lt!491036 (select (arr!34213 lt!490891) #b00000000000000000000000000000000)))))

(assert (=> b!1098175 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34751 lt!490891)))))

(declare-fun b!1098176 () Bool)

(assert (=> b!1098176 (= e!626770 e!626778)))

(declare-fun res!732936 () Bool)

(assert (=> b!1098176 (= res!732936 call!45857)))

(assert (=> b!1098176 (=> (not res!732936) (not e!626778))))

(assert (= (and d!130233 c!108443) b!1098166))

(assert (= (and d!130233 (not c!108443)) b!1098173))

(assert (= (and b!1098173 c!108442) b!1098163))

(assert (= (and b!1098173 (not c!108442)) b!1098161))

(assert (= (and b!1098161 c!108444) b!1098157))

(assert (= (and b!1098161 (not c!108444)) b!1098156))

(assert (= (or b!1098157 b!1098156) bm!45857))

(assert (= (or b!1098163 bm!45857) bm!45858))

(assert (= (or b!1098163 b!1098157) bm!45859))

(assert (= (or b!1098166 bm!45858) bm!45853))

(assert (= (or b!1098166 bm!45859) bm!45854))

(assert (= (and d!130233 res!732930) b!1098167))

(assert (= (and d!130233 c!108446) b!1098158))

(assert (= (and d!130233 (not c!108446)) b!1098164))

(assert (= (and d!130233 res!732931) b!1098174))

(assert (= (and b!1098174 res!732935) b!1098160))

(assert (= (and b!1098174 (not res!732934)) b!1098175))

(assert (= (and b!1098175 res!732937) b!1098169))

(assert (= (and b!1098174 res!732932) b!1098168))

(assert (= (and b!1098168 c!108445) b!1098176))

(assert (= (and b!1098168 (not c!108445)) b!1098162))

(assert (= (and b!1098176 res!732936) b!1098159))

(assert (= (or b!1098176 b!1098162) bm!45855))

(assert (= (and b!1098168 res!732933) b!1098170))

(assert (= (and b!1098170 c!108447) b!1098165))

(assert (= (and b!1098170 (not c!108447)) b!1098172))

(assert (= (and b!1098165 res!732929) b!1098171))

(assert (= (or b!1098165 b!1098172) bm!45856))

(declare-fun b_lambda!17787 () Bool)

(assert (=> (not b_lambda!17787) (not b!1098169)))

(assert (=> b!1098169 t!34079))

(declare-fun b_and!36843 () Bool)

(assert (= b_and!36833 (and (=> t!34079 result!16417) b_and!36843)))

(assert (=> b!1098175 m!1017229))

(assert (=> b!1098175 m!1017229))

(declare-fun m!1017287 () Bool)

(assert (=> b!1098175 m!1017287))

(declare-fun m!1017289 () Bool)

(assert (=> bm!45855 m!1017289))

(assert (=> d!130233 m!1017067))

(assert (=> b!1098167 m!1017229))

(assert (=> b!1098167 m!1017229))

(assert (=> b!1098167 m!1017239))

(declare-fun m!1017291 () Bool)

(assert (=> b!1098166 m!1017291))

(declare-fun m!1017293 () Bool)

(assert (=> bm!45854 m!1017293))

(declare-fun m!1017295 () Bool)

(assert (=> b!1098158 m!1017295))

(declare-fun m!1017297 () Bool)

(assert (=> b!1098158 m!1017297))

(declare-fun m!1017299 () Bool)

(assert (=> b!1098158 m!1017299))

(declare-fun m!1017301 () Bool)

(assert (=> b!1098158 m!1017301))

(declare-fun m!1017303 () Bool)

(assert (=> b!1098158 m!1017303))

(declare-fun m!1017305 () Bool)

(assert (=> b!1098158 m!1017305))

(assert (=> b!1098158 m!1017109))

(declare-fun m!1017307 () Bool)

(assert (=> b!1098158 m!1017307))

(assert (=> b!1098158 m!1017303))

(declare-fun m!1017309 () Bool)

(assert (=> b!1098158 m!1017309))

(declare-fun m!1017311 () Bool)

(assert (=> b!1098158 m!1017311))

(assert (=> b!1098158 m!1017299))

(assert (=> b!1098158 m!1017229))

(declare-fun m!1017313 () Bool)

(assert (=> b!1098158 m!1017313))

(declare-fun m!1017315 () Bool)

(assert (=> b!1098158 m!1017315))

(assert (=> b!1098158 m!1017295))

(declare-fun m!1017317 () Bool)

(assert (=> b!1098158 m!1017317))

(declare-fun m!1017319 () Bool)

(assert (=> b!1098158 m!1017319))

(assert (=> b!1098158 m!1017319))

(declare-fun m!1017321 () Bool)

(assert (=> b!1098158 m!1017321))

(declare-fun m!1017323 () Bool)

(assert (=> b!1098158 m!1017323))

(assert (=> b!1098169 m!1017229))

(declare-fun m!1017325 () Bool)

(assert (=> b!1098169 m!1017325))

(declare-fun m!1017327 () Bool)

(assert (=> b!1098169 m!1017327))

(assert (=> b!1098169 m!1017097))

(assert (=> b!1098169 m!1017229))

(assert (=> b!1098169 m!1017327))

(assert (=> b!1098169 m!1017097))

(declare-fun m!1017329 () Bool)

(assert (=> b!1098169 m!1017329))

(assert (=> b!1098160 m!1017229))

(assert (=> b!1098160 m!1017229))

(assert (=> b!1098160 m!1017239))

(declare-fun m!1017331 () Bool)

(assert (=> b!1098159 m!1017331))

(declare-fun m!1017333 () Bool)

(assert (=> b!1098171 m!1017333))

(assert (=> bm!45853 m!1017109))

(declare-fun m!1017335 () Bool)

(assert (=> bm!45856 m!1017335))

(assert (=> b!1097964 d!130233))

(declare-fun b!1098177 () Bool)

(declare-fun e!626785 () ListLongMap!15337)

(declare-fun call!45868 () ListLongMap!15337)

(assert (=> b!1098177 (= e!626785 call!45868)))

(declare-fun b!1098178 () Bool)

(declare-fun call!45863 () ListLongMap!15337)

(assert (=> b!1098178 (= e!626785 call!45863)))

(declare-fun d!130235 () Bool)

(declare-fun e!626781 () Bool)

(assert (=> d!130235 e!626781))

(declare-fun res!732940 () Bool)

(assert (=> d!130235 (=> (not res!732940) (not e!626781))))

(assert (=> d!130235 (= res!732940 (or (bvsge #b00000000000000000000000000000000 (size!34751 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34751 _keys!1070)))))))

(declare-fun lt!491058 () ListLongMap!15337)

(declare-fun lt!491062 () ListLongMap!15337)

(assert (=> d!130235 (= lt!491058 lt!491062)))

(declare-fun lt!491075 () Unit!35953)

(declare-fun e!626787 () Unit!35953)

(assert (=> d!130235 (= lt!491075 e!626787)))

(declare-fun c!108452 () Bool)

(declare-fun e!626780 () Bool)

(assert (=> d!130235 (= c!108452 e!626780)))

(declare-fun res!732939 () Bool)

(assert (=> d!130235 (=> (not res!732939) (not e!626780))))

(assert (=> d!130235 (= res!732939 (bvslt #b00000000000000000000000000000000 (size!34751 _keys!1070)))))

(declare-fun e!626792 () ListLongMap!15337)

(assert (=> d!130235 (= lt!491062 e!626792)))

(declare-fun c!108449 () Bool)

(assert (=> d!130235 (= c!108449 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130235 (validMask!0 mask!1414)))

(assert (=> d!130235 (= (getCurrentListMap!4307 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491058)))

(declare-fun b!1098179 () Bool)

(declare-fun lt!491066 () Unit!35953)

(assert (=> b!1098179 (= e!626787 lt!491066)))

(declare-fun lt!491076 () ListLongMap!15337)

(assert (=> b!1098179 (= lt!491076 (getCurrentListMapNoExtraKeys!4214 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491072 () (_ BitVec 64))

(assert (=> b!1098179 (= lt!491072 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491078 () (_ BitVec 64))

(assert (=> b!1098179 (= lt!491078 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491061 () Unit!35953)

(assert (=> b!1098179 (= lt!491061 (addStillContains!651 lt!491076 lt!491072 zeroValue!831 lt!491078))))

(assert (=> b!1098179 (contains!6354 (+!3396 lt!491076 (tuple2!17369 lt!491072 zeroValue!831)) lt!491078)))

(declare-fun lt!491070 () Unit!35953)

(assert (=> b!1098179 (= lt!491070 lt!491061)))

(declare-fun lt!491059 () ListLongMap!15337)

(assert (=> b!1098179 (= lt!491059 (getCurrentListMapNoExtraKeys!4214 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491068 () (_ BitVec 64))

(assert (=> b!1098179 (= lt!491068 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491064 () (_ BitVec 64))

(assert (=> b!1098179 (= lt!491064 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491067 () Unit!35953)

(assert (=> b!1098179 (= lt!491067 (addApplyDifferent!507 lt!491059 lt!491068 minValue!831 lt!491064))))

(assert (=> b!1098179 (= (apply!938 (+!3396 lt!491059 (tuple2!17369 lt!491068 minValue!831)) lt!491064) (apply!938 lt!491059 lt!491064))))

(declare-fun lt!491065 () Unit!35953)

(assert (=> b!1098179 (= lt!491065 lt!491067)))

(declare-fun lt!491079 () ListLongMap!15337)

(assert (=> b!1098179 (= lt!491079 (getCurrentListMapNoExtraKeys!4214 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491077 () (_ BitVec 64))

(assert (=> b!1098179 (= lt!491077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491074 () (_ BitVec 64))

(assert (=> b!1098179 (= lt!491074 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491073 () Unit!35953)

(assert (=> b!1098179 (= lt!491073 (addApplyDifferent!507 lt!491079 lt!491077 zeroValue!831 lt!491074))))

(assert (=> b!1098179 (= (apply!938 (+!3396 lt!491079 (tuple2!17369 lt!491077 zeroValue!831)) lt!491074) (apply!938 lt!491079 lt!491074))))

(declare-fun lt!491063 () Unit!35953)

(assert (=> b!1098179 (= lt!491063 lt!491073)))

(declare-fun lt!491060 () ListLongMap!15337)

(assert (=> b!1098179 (= lt!491060 (getCurrentListMapNoExtraKeys!4214 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491069 () (_ BitVec 64))

(assert (=> b!1098179 (= lt!491069 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491071 () (_ BitVec 64))

(assert (=> b!1098179 (= lt!491071 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1098179 (= lt!491066 (addApplyDifferent!507 lt!491060 lt!491069 minValue!831 lt!491071))))

(assert (=> b!1098179 (= (apply!938 (+!3396 lt!491060 (tuple2!17369 lt!491069 minValue!831)) lt!491071) (apply!938 lt!491060 lt!491071))))

(declare-fun b!1098180 () Bool)

(declare-fun e!626791 () Bool)

(assert (=> b!1098180 (= e!626791 (= (apply!938 lt!491058 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1098181 () Bool)

(declare-fun e!626790 () Bool)

(assert (=> b!1098181 (= e!626790 (validKeyInArray!0 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun call!45866 () ListLongMap!15337)

(declare-fun bm!45860 () Bool)

(assert (=> bm!45860 (= call!45866 (getCurrentListMapNoExtraKeys!4214 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun call!45865 () ListLongMap!15337)

(declare-fun bm!45861 () Bool)

(declare-fun c!108448 () Bool)

(declare-fun call!45869 () ListLongMap!15337)

(assert (=> bm!45861 (= call!45869 (+!3396 (ite c!108449 call!45866 (ite c!108448 call!45865 call!45868)) (ite (or c!108449 c!108448) (tuple2!17369 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17369 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun bm!45862 () Bool)

(declare-fun call!45864 () Bool)

(assert (=> bm!45862 (= call!45864 (contains!6354 lt!491058 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098182 () Bool)

(declare-fun c!108450 () Bool)

(assert (=> b!1098182 (= c!108450 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!626782 () ListLongMap!15337)

(assert (=> b!1098182 (= e!626782 e!626785)))

(declare-fun b!1098183 () Bool)

(declare-fun e!626783 () Bool)

(assert (=> b!1098183 (= e!626783 (not call!45864))))

(declare-fun b!1098184 () Bool)

(assert (=> b!1098184 (= e!626782 call!45863)))

(declare-fun bm!45863 () Bool)

(declare-fun call!45867 () Bool)

(assert (=> bm!45863 (= call!45867 (contains!6354 lt!491058 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098185 () Bool)

(declare-fun Unit!35956 () Unit!35953)

(assert (=> b!1098185 (= e!626787 Unit!35956)))

(declare-fun b!1098186 () Bool)

(declare-fun e!626786 () Bool)

(declare-fun e!626788 () Bool)

(assert (=> b!1098186 (= e!626786 e!626788)))

(declare-fun res!732938 () Bool)

(assert (=> b!1098186 (= res!732938 call!45867)))

(assert (=> b!1098186 (=> (not res!732938) (not e!626788))))

(declare-fun b!1098187 () Bool)

(assert (=> b!1098187 (= e!626792 (+!3396 call!45869 (tuple2!17369 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1098188 () Bool)

(assert (=> b!1098188 (= e!626780 (validKeyInArray!0 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098189 () Bool)

(declare-fun res!732942 () Bool)

(assert (=> b!1098189 (=> (not res!732942) (not e!626781))))

(assert (=> b!1098189 (= res!732942 e!626783)))

(declare-fun c!108451 () Bool)

(assert (=> b!1098189 (= c!108451 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1098190 () Bool)

(declare-fun e!626784 () Bool)

(assert (=> b!1098190 (= e!626784 (= (apply!938 lt!491058 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000)) (get!17614 (select (arr!34214 _values!874) #b00000000000000000000000000000000) (dynLambda!2283 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34752 _values!874)))))

(assert (=> b!1098190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34751 _keys!1070)))))

(declare-fun b!1098191 () Bool)

(assert (=> b!1098191 (= e!626781 e!626786)))

(declare-fun c!108453 () Bool)

(assert (=> b!1098191 (= c!108453 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45864 () Bool)

(assert (=> bm!45864 (= call!45868 call!45865)))

(declare-fun b!1098192 () Bool)

(assert (=> b!1098192 (= e!626788 (= (apply!938 lt!491058 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1098193 () Bool)

(assert (=> b!1098193 (= e!626786 (not call!45867))))

(declare-fun bm!45865 () Bool)

(assert (=> bm!45865 (= call!45865 call!45866)))

(declare-fun b!1098194 () Bool)

(assert (=> b!1098194 (= e!626792 e!626782)))

(assert (=> b!1098194 (= c!108448 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1098195 () Bool)

(declare-fun res!732941 () Bool)

(assert (=> b!1098195 (=> (not res!732941) (not e!626781))))

(declare-fun e!626789 () Bool)

(assert (=> b!1098195 (= res!732941 e!626789)))

(declare-fun res!732943 () Bool)

(assert (=> b!1098195 (=> res!732943 e!626789)))

(assert (=> b!1098195 (= res!732943 (not e!626790))))

(declare-fun res!732944 () Bool)

(assert (=> b!1098195 (=> (not res!732944) (not e!626790))))

(assert (=> b!1098195 (= res!732944 (bvslt #b00000000000000000000000000000000 (size!34751 _keys!1070)))))

(declare-fun bm!45866 () Bool)

(assert (=> bm!45866 (= call!45863 call!45869)))

(declare-fun b!1098196 () Bool)

(assert (=> b!1098196 (= e!626789 e!626784)))

(declare-fun res!732946 () Bool)

(assert (=> b!1098196 (=> (not res!732946) (not e!626784))))

(assert (=> b!1098196 (= res!732946 (contains!6354 lt!491058 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098196 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34751 _keys!1070)))))

(declare-fun b!1098197 () Bool)

(assert (=> b!1098197 (= e!626783 e!626791)))

(declare-fun res!732945 () Bool)

(assert (=> b!1098197 (= res!732945 call!45864)))

(assert (=> b!1098197 (=> (not res!732945) (not e!626791))))

(assert (= (and d!130235 c!108449) b!1098187))

(assert (= (and d!130235 (not c!108449)) b!1098194))

(assert (= (and b!1098194 c!108448) b!1098184))

(assert (= (and b!1098194 (not c!108448)) b!1098182))

(assert (= (and b!1098182 c!108450) b!1098178))

(assert (= (and b!1098182 (not c!108450)) b!1098177))

(assert (= (or b!1098178 b!1098177) bm!45864))

(assert (= (or b!1098184 bm!45864) bm!45865))

(assert (= (or b!1098184 b!1098178) bm!45866))

(assert (= (or b!1098187 bm!45865) bm!45860))

(assert (= (or b!1098187 bm!45866) bm!45861))

(assert (= (and d!130235 res!732939) b!1098188))

(assert (= (and d!130235 c!108452) b!1098179))

(assert (= (and d!130235 (not c!108452)) b!1098185))

(assert (= (and d!130235 res!732940) b!1098195))

(assert (= (and b!1098195 res!732944) b!1098181))

(assert (= (and b!1098195 (not res!732943)) b!1098196))

(assert (= (and b!1098196 res!732946) b!1098190))

(assert (= (and b!1098195 res!732941) b!1098189))

(assert (= (and b!1098189 c!108451) b!1098197))

(assert (= (and b!1098189 (not c!108451)) b!1098183))

(assert (= (and b!1098197 res!732945) b!1098180))

(assert (= (or b!1098197 b!1098183) bm!45862))

(assert (= (and b!1098189 res!732942) b!1098191))

(assert (= (and b!1098191 c!108453) b!1098186))

(assert (= (and b!1098191 (not c!108453)) b!1098193))

(assert (= (and b!1098186 res!732938) b!1098192))

(assert (= (or b!1098186 b!1098193) bm!45863))

(declare-fun b_lambda!17789 () Bool)

(assert (=> (not b_lambda!17789) (not b!1098190)))

(assert (=> b!1098190 t!34079))

(declare-fun b_and!36845 () Bool)

(assert (= b_and!36843 (and (=> t!34079 result!16417) b_and!36845)))

(assert (=> b!1098196 m!1017241))

(assert (=> b!1098196 m!1017241))

(declare-fun m!1017337 () Bool)

(assert (=> b!1098196 m!1017337))

(declare-fun m!1017339 () Bool)

(assert (=> bm!45862 m!1017339))

(assert (=> d!130235 m!1017067))

(assert (=> b!1098188 m!1017241))

(assert (=> b!1098188 m!1017241))

(assert (=> b!1098188 m!1017245))

(declare-fun m!1017341 () Bool)

(assert (=> b!1098187 m!1017341))

(declare-fun m!1017343 () Bool)

(assert (=> bm!45861 m!1017343))

(declare-fun m!1017345 () Bool)

(assert (=> b!1098179 m!1017345))

(declare-fun m!1017347 () Bool)

(assert (=> b!1098179 m!1017347))

(declare-fun m!1017349 () Bool)

(assert (=> b!1098179 m!1017349))

(declare-fun m!1017351 () Bool)

(assert (=> b!1098179 m!1017351))

(declare-fun m!1017353 () Bool)

(assert (=> b!1098179 m!1017353))

(declare-fun m!1017355 () Bool)

(assert (=> b!1098179 m!1017355))

(assert (=> b!1098179 m!1017111))

(declare-fun m!1017357 () Bool)

(assert (=> b!1098179 m!1017357))

(assert (=> b!1098179 m!1017353))

(declare-fun m!1017359 () Bool)

(assert (=> b!1098179 m!1017359))

(declare-fun m!1017361 () Bool)

(assert (=> b!1098179 m!1017361))

(assert (=> b!1098179 m!1017349))

(assert (=> b!1098179 m!1017241))

(declare-fun m!1017363 () Bool)

(assert (=> b!1098179 m!1017363))

(declare-fun m!1017365 () Bool)

(assert (=> b!1098179 m!1017365))

(assert (=> b!1098179 m!1017345))

(declare-fun m!1017367 () Bool)

(assert (=> b!1098179 m!1017367))

(declare-fun m!1017369 () Bool)

(assert (=> b!1098179 m!1017369))

(assert (=> b!1098179 m!1017369))

(declare-fun m!1017371 () Bool)

(assert (=> b!1098179 m!1017371))

(declare-fun m!1017373 () Bool)

(assert (=> b!1098179 m!1017373))

(assert (=> b!1098190 m!1017241))

(declare-fun m!1017375 () Bool)

(assert (=> b!1098190 m!1017375))

(declare-fun m!1017377 () Bool)

(assert (=> b!1098190 m!1017377))

(assert (=> b!1098190 m!1017097))

(assert (=> b!1098190 m!1017241))

(assert (=> b!1098190 m!1017377))

(assert (=> b!1098190 m!1017097))

(declare-fun m!1017379 () Bool)

(assert (=> b!1098190 m!1017379))

(assert (=> b!1098181 m!1017241))

(assert (=> b!1098181 m!1017241))

(assert (=> b!1098181 m!1017245))

(declare-fun m!1017381 () Bool)

(assert (=> b!1098180 m!1017381))

(declare-fun m!1017383 () Bool)

(assert (=> b!1098192 m!1017383))

(assert (=> bm!45860 m!1017111))

(declare-fun m!1017385 () Bool)

(assert (=> bm!45863 m!1017385))

(assert (=> b!1097964 d!130235))

(declare-fun b!1098222 () Bool)

(declare-fun res!732958 () Bool)

(declare-fun e!626810 () Bool)

(assert (=> b!1098222 (=> (not res!732958) (not e!626810))))

(declare-fun lt!491099 () ListLongMap!15337)

(assert (=> b!1098222 (= res!732958 (not (contains!6354 lt!491099 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1098223 () Bool)

(declare-fun e!626808 () Bool)

(declare-fun e!626811 () Bool)

(assert (=> b!1098223 (= e!626808 e!626811)))

(declare-fun c!108463 () Bool)

(assert (=> b!1098223 (= c!108463 (bvslt #b00000000000000000000000000000000 (size!34751 lt!490891)))))

(declare-fun b!1098224 () Bool)

(declare-fun e!626807 () ListLongMap!15337)

(assert (=> b!1098224 (= e!626807 (ListLongMap!15338 Nil!23958))))

(declare-fun b!1098225 () Bool)

(assert (=> b!1098225 (= e!626810 e!626808)))

(declare-fun c!108462 () Bool)

(declare-fun e!626812 () Bool)

(assert (=> b!1098225 (= c!108462 e!626812)))

(declare-fun res!732957 () Bool)

(assert (=> b!1098225 (=> (not res!732957) (not e!626812))))

(assert (=> b!1098225 (= res!732957 (bvslt #b00000000000000000000000000000000 (size!34751 lt!490891)))))

(declare-fun b!1098226 () Bool)

(assert (=> b!1098226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34751 lt!490891)))))

(assert (=> b!1098226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34752 lt!490896)))))

(declare-fun e!626809 () Bool)

(assert (=> b!1098226 (= e!626809 (= (apply!938 lt!491099 (select (arr!34213 lt!490891) #b00000000000000000000000000000000)) (get!17614 (select (arr!34214 lt!490896) #b00000000000000000000000000000000) (dynLambda!2283 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1098227 () Bool)

(declare-fun isEmpty!968 (ListLongMap!15337) Bool)

(assert (=> b!1098227 (= e!626811 (isEmpty!968 lt!491099))))

(declare-fun b!1098228 () Bool)

(declare-fun e!626813 () ListLongMap!15337)

(declare-fun call!45872 () ListLongMap!15337)

(assert (=> b!1098228 (= e!626813 call!45872)))

(declare-fun b!1098229 () Bool)

(assert (=> b!1098229 (= e!626808 e!626809)))

(assert (=> b!1098229 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34751 lt!490891)))))

(declare-fun res!732956 () Bool)

(assert (=> b!1098229 (= res!732956 (contains!6354 lt!491099 (select (arr!34213 lt!490891) #b00000000000000000000000000000000)))))

(assert (=> b!1098229 (=> (not res!732956) (not e!626809))))

(declare-fun b!1098230 () Bool)

(assert (=> b!1098230 (= e!626807 e!626813)))

(declare-fun c!108464 () Bool)

(assert (=> b!1098230 (= c!108464 (validKeyInArray!0 (select (arr!34213 lt!490891) #b00000000000000000000000000000000)))))

(declare-fun b!1098231 () Bool)

(assert (=> b!1098231 (= e!626812 (validKeyInArray!0 (select (arr!34213 lt!490891) #b00000000000000000000000000000000)))))

(assert (=> b!1098231 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!130237 () Bool)

(assert (=> d!130237 e!626810))

(declare-fun res!732955 () Bool)

(assert (=> d!130237 (=> (not res!732955) (not e!626810))))

(assert (=> d!130237 (= res!732955 (not (contains!6354 lt!491099 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130237 (= lt!491099 e!626807)))

(declare-fun c!108465 () Bool)

(assert (=> d!130237 (= c!108465 (bvsge #b00000000000000000000000000000000 (size!34751 lt!490891)))))

(assert (=> d!130237 (validMask!0 mask!1414)))

(assert (=> d!130237 (= (getCurrentListMapNoExtraKeys!4214 lt!490891 lt!490896 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491099)))

(declare-fun b!1098232 () Bool)

(declare-fun lt!491098 () Unit!35953)

(declare-fun lt!491100 () Unit!35953)

(assert (=> b!1098232 (= lt!491098 lt!491100)))

(declare-fun lt!491094 () V!41305)

(declare-fun lt!491095 () (_ BitVec 64))

(declare-fun lt!491097 () (_ BitVec 64))

(declare-fun lt!491096 () ListLongMap!15337)

(assert (=> b!1098232 (not (contains!6354 (+!3396 lt!491096 (tuple2!17369 lt!491097 lt!491094)) lt!491095))))

(declare-fun addStillNotContains!274 (ListLongMap!15337 (_ BitVec 64) V!41305 (_ BitVec 64)) Unit!35953)

(assert (=> b!1098232 (= lt!491100 (addStillNotContains!274 lt!491096 lt!491097 lt!491094 lt!491095))))

(assert (=> b!1098232 (= lt!491095 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1098232 (= lt!491094 (get!17614 (select (arr!34214 lt!490896) #b00000000000000000000000000000000) (dynLambda!2283 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1098232 (= lt!491097 (select (arr!34213 lt!490891) #b00000000000000000000000000000000))))

(assert (=> b!1098232 (= lt!491096 call!45872)))

(assert (=> b!1098232 (= e!626813 (+!3396 call!45872 (tuple2!17369 (select (arr!34213 lt!490891) #b00000000000000000000000000000000) (get!17614 (select (arr!34214 lt!490896) #b00000000000000000000000000000000) (dynLambda!2283 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!45869 () Bool)

(assert (=> bm!45869 (= call!45872 (getCurrentListMapNoExtraKeys!4214 lt!490891 lt!490896 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1098233 () Bool)

(assert (=> b!1098233 (= e!626811 (= lt!491099 (getCurrentListMapNoExtraKeys!4214 lt!490891 lt!490896 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(assert (= (and d!130237 c!108465) b!1098224))

(assert (= (and d!130237 (not c!108465)) b!1098230))

(assert (= (and b!1098230 c!108464) b!1098232))

(assert (= (and b!1098230 (not c!108464)) b!1098228))

(assert (= (or b!1098232 b!1098228) bm!45869))

(assert (= (and d!130237 res!732955) b!1098222))

(assert (= (and b!1098222 res!732958) b!1098225))

(assert (= (and b!1098225 res!732957) b!1098231))

(assert (= (and b!1098225 c!108462) b!1098229))

(assert (= (and b!1098225 (not c!108462)) b!1098223))

(assert (= (and b!1098229 res!732956) b!1098226))

(assert (= (and b!1098223 c!108463) b!1098233))

(assert (= (and b!1098223 (not c!108463)) b!1098227))

(declare-fun b_lambda!17791 () Bool)

(assert (=> (not b_lambda!17791) (not b!1098226)))

(assert (=> b!1098226 t!34079))

(declare-fun b_and!36847 () Bool)

(assert (= b_and!36845 (and (=> t!34079 result!16417) b_and!36847)))

(declare-fun b_lambda!17793 () Bool)

(assert (=> (not b_lambda!17793) (not b!1098232)))

(assert (=> b!1098232 t!34079))

(declare-fun b_and!36849 () Bool)

(assert (= b_and!36847 (and (=> t!34079 result!16417) b_and!36849)))

(declare-fun m!1017387 () Bool)

(assert (=> bm!45869 m!1017387))

(declare-fun m!1017389 () Bool)

(assert (=> b!1098227 m!1017389))

(declare-fun m!1017391 () Bool)

(assert (=> d!130237 m!1017391))

(assert (=> d!130237 m!1017067))

(assert (=> b!1098231 m!1017229))

(assert (=> b!1098231 m!1017229))

(assert (=> b!1098231 m!1017239))

(assert (=> b!1098230 m!1017229))

(assert (=> b!1098230 m!1017229))

(assert (=> b!1098230 m!1017239))

(assert (=> b!1098233 m!1017387))

(assert (=> b!1098229 m!1017229))

(assert (=> b!1098229 m!1017229))

(declare-fun m!1017393 () Bool)

(assert (=> b!1098229 m!1017393))

(declare-fun m!1017395 () Bool)

(assert (=> b!1098232 m!1017395))

(assert (=> b!1098232 m!1017395))

(declare-fun m!1017397 () Bool)

(assert (=> b!1098232 m!1017397))

(assert (=> b!1098232 m!1017229))

(declare-fun m!1017399 () Bool)

(assert (=> b!1098232 m!1017399))

(assert (=> b!1098232 m!1017327))

(assert (=> b!1098232 m!1017097))

(assert (=> b!1098232 m!1017329))

(declare-fun m!1017401 () Bool)

(assert (=> b!1098232 m!1017401))

(assert (=> b!1098232 m!1017097))

(assert (=> b!1098232 m!1017327))

(declare-fun m!1017403 () Bool)

(assert (=> b!1098222 m!1017403))

(assert (=> b!1098226 m!1017229))

(declare-fun m!1017405 () Bool)

(assert (=> b!1098226 m!1017405))

(assert (=> b!1098226 m!1017229))

(assert (=> b!1098226 m!1017327))

(assert (=> b!1098226 m!1017097))

(assert (=> b!1098226 m!1017329))

(assert (=> b!1098226 m!1017097))

(assert (=> b!1098226 m!1017327))

(assert (=> b!1097964 d!130237))

(declare-fun d!130239 () Bool)

(declare-fun lt!491103 () ListLongMap!15337)

(assert (=> d!130239 (not (contains!6354 lt!491103 k0!904))))

(declare-fun removeStrictlySorted!79 (List!23961 (_ BitVec 64)) List!23961)

(assert (=> d!130239 (= lt!491103 (ListLongMap!15338 (removeStrictlySorted!79 (toList!7684 lt!490892) k0!904)))))

(assert (=> d!130239 (= (-!921 lt!490892 k0!904) lt!491103)))

(declare-fun bs!32238 () Bool)

(assert (= bs!32238 d!130239))

(declare-fun m!1017407 () Bool)

(assert (=> bs!32238 m!1017407))

(declare-fun m!1017409 () Bool)

(assert (=> bs!32238 m!1017409))

(assert (=> b!1097964 d!130239))

(declare-fun b!1098240 () Bool)

(declare-fun e!626819 () Bool)

(declare-fun call!45878 () ListLongMap!15337)

(declare-fun call!45877 () ListLongMap!15337)

(assert (=> b!1098240 (= e!626819 (= call!45878 call!45877))))

(assert (=> b!1098240 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34752 _values!874)))))

(declare-fun d!130241 () Bool)

(declare-fun e!626818 () Bool)

(assert (=> d!130241 e!626818))

(declare-fun res!732961 () Bool)

(assert (=> d!130241 (=> (not res!732961) (not e!626818))))

(assert (=> d!130241 (= res!732961 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34751 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34751 _keys!1070))))))))

(declare-fun lt!491106 () Unit!35953)

(declare-fun choose!1771 (array!71086 array!71088 (_ BitVec 32) (_ BitVec 32) V!41305 V!41305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35953)

(assert (=> d!130241 (= lt!491106 (choose!1771 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130241 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34751 _keys!1070)))))

(assert (=> d!130241 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!196 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!491106)))

(declare-fun bm!45874 () Bool)

(assert (=> bm!45874 (= call!45878 (getCurrentListMapNoExtraKeys!4214 (array!71087 (store (arr!34213 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34751 _keys!1070)) (array!71089 (store (arr!34214 _values!874) i!650 (ValueCellFull!12857 (dynLambda!2283 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34752 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1098241 () Bool)

(assert (=> b!1098241 (= e!626819 (= call!45878 (-!921 call!45877 k0!904)))))

(assert (=> b!1098241 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34752 _values!874)))))

(declare-fun b!1098242 () Bool)

(assert (=> b!1098242 (= e!626818 e!626819)))

(declare-fun c!108468 () Bool)

(assert (=> b!1098242 (= c!108468 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun bm!45875 () Bool)

(assert (=> bm!45875 (= call!45877 (getCurrentListMapNoExtraKeys!4214 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (= (and d!130241 res!732961) b!1098242))

(assert (= (and b!1098242 c!108468) b!1098241))

(assert (= (and b!1098242 (not c!108468)) b!1098240))

(assert (= (or b!1098241 b!1098240) bm!45875))

(assert (= (or b!1098241 b!1098240) bm!45874))

(declare-fun b_lambda!17795 () Bool)

(assert (=> (not b_lambda!17795) (not bm!45874)))

(assert (=> bm!45874 t!34079))

(declare-fun b_and!36851 () Bool)

(assert (= b_and!36849 (and (=> t!34079 result!16417) b_and!36851)))

(declare-fun m!1017411 () Bool)

(assert (=> d!130241 m!1017411))

(assert (=> bm!45874 m!1017089))

(assert (=> bm!45874 m!1017097))

(assert (=> bm!45874 m!1017103))

(declare-fun m!1017413 () Bool)

(assert (=> bm!45874 m!1017413))

(declare-fun m!1017415 () Bool)

(assert (=> b!1098241 m!1017415))

(assert (=> bm!45875 m!1017111))

(assert (=> b!1097964 d!130241))

(declare-fun b!1098243 () Bool)

(declare-fun res!732965 () Bool)

(declare-fun e!626823 () Bool)

(assert (=> b!1098243 (=> (not res!732965) (not e!626823))))

(declare-fun lt!491112 () ListLongMap!15337)

(assert (=> b!1098243 (= res!732965 (not (contains!6354 lt!491112 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1098244 () Bool)

(declare-fun e!626821 () Bool)

(declare-fun e!626824 () Bool)

(assert (=> b!1098244 (= e!626821 e!626824)))

(declare-fun c!108470 () Bool)

(assert (=> b!1098244 (= c!108470 (bvslt #b00000000000000000000000000000000 (size!34751 _keys!1070)))))

(declare-fun b!1098245 () Bool)

(declare-fun e!626820 () ListLongMap!15337)

(assert (=> b!1098245 (= e!626820 (ListLongMap!15338 Nil!23958))))

(declare-fun b!1098246 () Bool)

(assert (=> b!1098246 (= e!626823 e!626821)))

(declare-fun c!108469 () Bool)

(declare-fun e!626825 () Bool)

(assert (=> b!1098246 (= c!108469 e!626825)))

(declare-fun res!732964 () Bool)

(assert (=> b!1098246 (=> (not res!732964) (not e!626825))))

(assert (=> b!1098246 (= res!732964 (bvslt #b00000000000000000000000000000000 (size!34751 _keys!1070)))))

(declare-fun b!1098247 () Bool)

(assert (=> b!1098247 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34751 _keys!1070)))))

(assert (=> b!1098247 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34752 _values!874)))))

(declare-fun e!626822 () Bool)

(assert (=> b!1098247 (= e!626822 (= (apply!938 lt!491112 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000)) (get!17614 (select (arr!34214 _values!874) #b00000000000000000000000000000000) (dynLambda!2283 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1098248 () Bool)

(assert (=> b!1098248 (= e!626824 (isEmpty!968 lt!491112))))

(declare-fun b!1098249 () Bool)

(declare-fun e!626826 () ListLongMap!15337)

(declare-fun call!45879 () ListLongMap!15337)

(assert (=> b!1098249 (= e!626826 call!45879)))

(declare-fun b!1098250 () Bool)

(assert (=> b!1098250 (= e!626821 e!626822)))

(assert (=> b!1098250 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34751 _keys!1070)))))

(declare-fun res!732963 () Bool)

(assert (=> b!1098250 (= res!732963 (contains!6354 lt!491112 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098250 (=> (not res!732963) (not e!626822))))

(declare-fun b!1098251 () Bool)

(assert (=> b!1098251 (= e!626820 e!626826)))

(declare-fun c!108471 () Bool)

(assert (=> b!1098251 (= c!108471 (validKeyInArray!0 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098252 () Bool)

(assert (=> b!1098252 (= e!626825 (validKeyInArray!0 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098252 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!130243 () Bool)

(assert (=> d!130243 e!626823))

(declare-fun res!732962 () Bool)

(assert (=> d!130243 (=> (not res!732962) (not e!626823))))

(assert (=> d!130243 (= res!732962 (not (contains!6354 lt!491112 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130243 (= lt!491112 e!626820)))

(declare-fun c!108472 () Bool)

(assert (=> d!130243 (= c!108472 (bvsge #b00000000000000000000000000000000 (size!34751 _keys!1070)))))

(assert (=> d!130243 (validMask!0 mask!1414)))

(assert (=> d!130243 (= (getCurrentListMapNoExtraKeys!4214 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491112)))

(declare-fun b!1098253 () Bool)

(declare-fun lt!491111 () Unit!35953)

(declare-fun lt!491113 () Unit!35953)

(assert (=> b!1098253 (= lt!491111 lt!491113)))

(declare-fun lt!491108 () (_ BitVec 64))

(declare-fun lt!491110 () (_ BitVec 64))

(declare-fun lt!491109 () ListLongMap!15337)

(declare-fun lt!491107 () V!41305)

(assert (=> b!1098253 (not (contains!6354 (+!3396 lt!491109 (tuple2!17369 lt!491110 lt!491107)) lt!491108))))

(assert (=> b!1098253 (= lt!491113 (addStillNotContains!274 lt!491109 lt!491110 lt!491107 lt!491108))))

(assert (=> b!1098253 (= lt!491108 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1098253 (= lt!491107 (get!17614 (select (arr!34214 _values!874) #b00000000000000000000000000000000) (dynLambda!2283 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1098253 (= lt!491110 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1098253 (= lt!491109 call!45879)))

(assert (=> b!1098253 (= e!626826 (+!3396 call!45879 (tuple2!17369 (select (arr!34213 _keys!1070) #b00000000000000000000000000000000) (get!17614 (select (arr!34214 _values!874) #b00000000000000000000000000000000) (dynLambda!2283 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!45876 () Bool)

(assert (=> bm!45876 (= call!45879 (getCurrentListMapNoExtraKeys!4214 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1098254 () Bool)

(assert (=> b!1098254 (= e!626824 (= lt!491112 (getCurrentListMapNoExtraKeys!4214 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(assert (= (and d!130243 c!108472) b!1098245))

(assert (= (and d!130243 (not c!108472)) b!1098251))

(assert (= (and b!1098251 c!108471) b!1098253))

(assert (= (and b!1098251 (not c!108471)) b!1098249))

(assert (= (or b!1098253 b!1098249) bm!45876))

(assert (= (and d!130243 res!732962) b!1098243))

(assert (= (and b!1098243 res!732965) b!1098246))

(assert (= (and b!1098246 res!732964) b!1098252))

(assert (= (and b!1098246 c!108469) b!1098250))

(assert (= (and b!1098246 (not c!108469)) b!1098244))

(assert (= (and b!1098250 res!732963) b!1098247))

(assert (= (and b!1098244 c!108470) b!1098254))

(assert (= (and b!1098244 (not c!108470)) b!1098248))

(declare-fun b_lambda!17797 () Bool)

(assert (=> (not b_lambda!17797) (not b!1098247)))

(assert (=> b!1098247 t!34079))

(declare-fun b_and!36853 () Bool)

(assert (= b_and!36851 (and (=> t!34079 result!16417) b_and!36853)))

(declare-fun b_lambda!17799 () Bool)

(assert (=> (not b_lambda!17799) (not b!1098253)))

(assert (=> b!1098253 t!34079))

(declare-fun b_and!36855 () Bool)

(assert (= b_and!36853 (and (=> t!34079 result!16417) b_and!36855)))

(declare-fun m!1017417 () Bool)

(assert (=> bm!45876 m!1017417))

(declare-fun m!1017419 () Bool)

(assert (=> b!1098248 m!1017419))

(declare-fun m!1017421 () Bool)

(assert (=> d!130243 m!1017421))

(assert (=> d!130243 m!1017067))

(assert (=> b!1098252 m!1017241))

(assert (=> b!1098252 m!1017241))

(assert (=> b!1098252 m!1017245))

(assert (=> b!1098251 m!1017241))

(assert (=> b!1098251 m!1017241))

(assert (=> b!1098251 m!1017245))

(assert (=> b!1098254 m!1017417))

(assert (=> b!1098250 m!1017241))

(assert (=> b!1098250 m!1017241))

(declare-fun m!1017423 () Bool)

(assert (=> b!1098250 m!1017423))

(declare-fun m!1017425 () Bool)

(assert (=> b!1098253 m!1017425))

(assert (=> b!1098253 m!1017425))

(declare-fun m!1017427 () Bool)

(assert (=> b!1098253 m!1017427))

(assert (=> b!1098253 m!1017241))

(declare-fun m!1017429 () Bool)

(assert (=> b!1098253 m!1017429))

(assert (=> b!1098253 m!1017377))

(assert (=> b!1098253 m!1017097))

(assert (=> b!1098253 m!1017379))

(declare-fun m!1017431 () Bool)

(assert (=> b!1098253 m!1017431))

(assert (=> b!1098253 m!1017097))

(assert (=> b!1098253 m!1017377))

(declare-fun m!1017433 () Bool)

(assert (=> b!1098243 m!1017433))

(assert (=> b!1098247 m!1017241))

(declare-fun m!1017435 () Bool)

(assert (=> b!1098247 m!1017435))

(assert (=> b!1098247 m!1017241))

(assert (=> b!1098247 m!1017377))

(assert (=> b!1098247 m!1017097))

(assert (=> b!1098247 m!1017379))

(assert (=> b!1098247 m!1017097))

(assert (=> b!1098247 m!1017377))

(assert (=> b!1097964 d!130243))

(declare-fun d!130245 () Bool)

(assert (=> d!130245 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491116 () Unit!35953)

(declare-fun choose!13 (array!71086 (_ BitVec 64) (_ BitVec 32)) Unit!35953)

(assert (=> d!130245 (= lt!491116 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130245 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130245 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!491116)))

(declare-fun bs!32239 () Bool)

(assert (= bs!32239 d!130245))

(assert (=> bs!32239 m!1017105))

(declare-fun m!1017437 () Bool)

(assert (=> bs!32239 m!1017437))

(assert (=> b!1097964 d!130245))

(declare-fun d!130247 () Bool)

(declare-fun e!626827 () Bool)

(assert (=> d!130247 e!626827))

(declare-fun res!732967 () Bool)

(assert (=> d!130247 (=> (not res!732967) (not e!626827))))

(declare-fun lt!491119 () ListLongMap!15337)

(assert (=> d!130247 (= res!732967 (contains!6354 lt!491119 (_1!8695 lt!490887)))))

(declare-fun lt!491117 () List!23961)

(assert (=> d!130247 (= lt!491119 (ListLongMap!15338 lt!491117))))

(declare-fun lt!491120 () Unit!35953)

(declare-fun lt!491118 () Unit!35953)

(assert (=> d!130247 (= lt!491120 lt!491118)))

(assert (=> d!130247 (= (getValueByKey!622 lt!491117 (_1!8695 lt!490887)) (Some!672 (_2!8695 lt!490887)))))

(assert (=> d!130247 (= lt!491118 (lemmaContainsTupThenGetReturnValue!298 lt!491117 (_1!8695 lt!490887) (_2!8695 lt!490887)))))

(assert (=> d!130247 (= lt!491117 (insertStrictlySorted!391 (toList!7684 (+!3396 lt!490892 lt!490890)) (_1!8695 lt!490887) (_2!8695 lt!490887)))))

(assert (=> d!130247 (= (+!3396 (+!3396 lt!490892 lt!490890) lt!490887) lt!491119)))

(declare-fun b!1098255 () Bool)

(declare-fun res!732966 () Bool)

(assert (=> b!1098255 (=> (not res!732966) (not e!626827))))

(assert (=> b!1098255 (= res!732966 (= (getValueByKey!622 (toList!7684 lt!491119) (_1!8695 lt!490887)) (Some!672 (_2!8695 lt!490887))))))

(declare-fun b!1098256 () Bool)

(assert (=> b!1098256 (= e!626827 (contains!6355 (toList!7684 lt!491119) lt!490887))))

(assert (= (and d!130247 res!732967) b!1098255))

(assert (= (and b!1098255 res!732966) b!1098256))

(declare-fun m!1017439 () Bool)

(assert (=> d!130247 m!1017439))

(declare-fun m!1017441 () Bool)

(assert (=> d!130247 m!1017441))

(declare-fun m!1017443 () Bool)

(assert (=> d!130247 m!1017443))

(declare-fun m!1017445 () Bool)

(assert (=> d!130247 m!1017445))

(declare-fun m!1017447 () Bool)

(assert (=> b!1098255 m!1017447))

(declare-fun m!1017449 () Bool)

(assert (=> b!1098256 m!1017449))

(assert (=> b!1097958 d!130247))

(declare-fun d!130249 () Bool)

(declare-fun e!626828 () Bool)

(assert (=> d!130249 e!626828))

(declare-fun res!732969 () Bool)

(assert (=> d!130249 (=> (not res!732969) (not e!626828))))

(declare-fun lt!491123 () ListLongMap!15337)

(assert (=> d!130249 (= res!732969 (contains!6354 lt!491123 (_1!8695 lt!490890)))))

(declare-fun lt!491121 () List!23961)

(assert (=> d!130249 (= lt!491123 (ListLongMap!15338 lt!491121))))

(declare-fun lt!491124 () Unit!35953)

(declare-fun lt!491122 () Unit!35953)

(assert (=> d!130249 (= lt!491124 lt!491122)))

(assert (=> d!130249 (= (getValueByKey!622 lt!491121 (_1!8695 lt!490890)) (Some!672 (_2!8695 lt!490890)))))

(assert (=> d!130249 (= lt!491122 (lemmaContainsTupThenGetReturnValue!298 lt!491121 (_1!8695 lt!490890) (_2!8695 lt!490890)))))

(assert (=> d!130249 (= lt!491121 (insertStrictlySorted!391 (toList!7684 lt!490892) (_1!8695 lt!490890) (_2!8695 lt!490890)))))

(assert (=> d!130249 (= (+!3396 lt!490892 lt!490890) lt!491123)))

(declare-fun b!1098257 () Bool)

(declare-fun res!732968 () Bool)

(assert (=> b!1098257 (=> (not res!732968) (not e!626828))))

(assert (=> b!1098257 (= res!732968 (= (getValueByKey!622 (toList!7684 lt!491123) (_1!8695 lt!490890)) (Some!672 (_2!8695 lt!490890))))))

(declare-fun b!1098258 () Bool)

(assert (=> b!1098258 (= e!626828 (contains!6355 (toList!7684 lt!491123) lt!490890))))

(assert (= (and d!130249 res!732969) b!1098257))

(assert (= (and b!1098257 res!732968) b!1098258))

(declare-fun m!1017451 () Bool)

(assert (=> d!130249 m!1017451))

(declare-fun m!1017453 () Bool)

(assert (=> d!130249 m!1017453))

(declare-fun m!1017455 () Bool)

(assert (=> d!130249 m!1017455))

(declare-fun m!1017457 () Bool)

(assert (=> d!130249 m!1017457))

(declare-fun m!1017459 () Bool)

(assert (=> b!1098257 m!1017459))

(declare-fun m!1017461 () Bool)

(assert (=> b!1098258 m!1017461))

(assert (=> b!1097958 d!130249))

(declare-fun d!130251 () Bool)

(assert (=> d!130251 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1097963 d!130251))

(declare-fun d!130253 () Bool)

(assert (=> d!130253 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96550 d!130253))

(declare-fun d!130255 () Bool)

(assert (=> d!130255 (= (array_inv!26392 _keys!1070) (bvsge (size!34751 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96550 d!130255))

(declare-fun d!130257 () Bool)

(assert (=> d!130257 (= (array_inv!26393 _values!874) (bvsge (size!34752 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96550 d!130257))

(declare-fun d!130259 () Bool)

(declare-fun e!626829 () Bool)

(assert (=> d!130259 e!626829))

(declare-fun res!732971 () Bool)

(assert (=> d!130259 (=> (not res!732971) (not e!626829))))

(declare-fun lt!491127 () ListLongMap!15337)

(assert (=> d!130259 (= res!732971 (contains!6354 lt!491127 (_1!8695 lt!490887)))))

(declare-fun lt!491125 () List!23961)

(assert (=> d!130259 (= lt!491127 (ListLongMap!15338 lt!491125))))

(declare-fun lt!491128 () Unit!35953)

(declare-fun lt!491126 () Unit!35953)

(assert (=> d!130259 (= lt!491128 lt!491126)))

(assert (=> d!130259 (= (getValueByKey!622 lt!491125 (_1!8695 lt!490887)) (Some!672 (_2!8695 lt!490887)))))

(assert (=> d!130259 (= lt!491126 (lemmaContainsTupThenGetReturnValue!298 lt!491125 (_1!8695 lt!490887) (_2!8695 lt!490887)))))

(assert (=> d!130259 (= lt!491125 (insertStrictlySorted!391 (toList!7684 (+!3396 lt!490894 lt!490890)) (_1!8695 lt!490887) (_2!8695 lt!490887)))))

(assert (=> d!130259 (= (+!3396 (+!3396 lt!490894 lt!490890) lt!490887) lt!491127)))

(declare-fun b!1098259 () Bool)

(declare-fun res!732970 () Bool)

(assert (=> b!1098259 (=> (not res!732970) (not e!626829))))

(assert (=> b!1098259 (= res!732970 (= (getValueByKey!622 (toList!7684 lt!491127) (_1!8695 lt!490887)) (Some!672 (_2!8695 lt!490887))))))

(declare-fun b!1098260 () Bool)

(assert (=> b!1098260 (= e!626829 (contains!6355 (toList!7684 lt!491127) lt!490887))))

(assert (= (and d!130259 res!732971) b!1098259))

(assert (= (and b!1098259 res!732970) b!1098260))

(declare-fun m!1017463 () Bool)

(assert (=> d!130259 m!1017463))

(declare-fun m!1017465 () Bool)

(assert (=> d!130259 m!1017465))

(declare-fun m!1017467 () Bool)

(assert (=> d!130259 m!1017467))

(declare-fun m!1017469 () Bool)

(assert (=> d!130259 m!1017469))

(declare-fun m!1017471 () Bool)

(assert (=> b!1098259 m!1017471))

(declare-fun m!1017473 () Bool)

(assert (=> b!1098260 m!1017473))

(assert (=> b!1097957 d!130259))

(declare-fun d!130261 () Bool)

(declare-fun e!626830 () Bool)

(assert (=> d!130261 e!626830))

(declare-fun res!732973 () Bool)

(assert (=> d!130261 (=> (not res!732973) (not e!626830))))

(declare-fun lt!491131 () ListLongMap!15337)

(assert (=> d!130261 (= res!732973 (contains!6354 lt!491131 (_1!8695 lt!490890)))))

(declare-fun lt!491129 () List!23961)

(assert (=> d!130261 (= lt!491131 (ListLongMap!15338 lt!491129))))

(declare-fun lt!491132 () Unit!35953)

(declare-fun lt!491130 () Unit!35953)

(assert (=> d!130261 (= lt!491132 lt!491130)))

(assert (=> d!130261 (= (getValueByKey!622 lt!491129 (_1!8695 lt!490890)) (Some!672 (_2!8695 lt!490890)))))

(assert (=> d!130261 (= lt!491130 (lemmaContainsTupThenGetReturnValue!298 lt!491129 (_1!8695 lt!490890) (_2!8695 lt!490890)))))

(assert (=> d!130261 (= lt!491129 (insertStrictlySorted!391 (toList!7684 lt!490894) (_1!8695 lt!490890) (_2!8695 lt!490890)))))

(assert (=> d!130261 (= (+!3396 lt!490894 lt!490890) lt!491131)))

(declare-fun b!1098261 () Bool)

(declare-fun res!732972 () Bool)

(assert (=> b!1098261 (=> (not res!732972) (not e!626830))))

(assert (=> b!1098261 (= res!732972 (= (getValueByKey!622 (toList!7684 lt!491131) (_1!8695 lt!490890)) (Some!672 (_2!8695 lt!490890))))))

(declare-fun b!1098262 () Bool)

(assert (=> b!1098262 (= e!626830 (contains!6355 (toList!7684 lt!491131) lt!490890))))

(assert (= (and d!130261 res!732973) b!1098261))

(assert (= (and b!1098261 res!732972) b!1098262))

(declare-fun m!1017475 () Bool)

(assert (=> d!130261 m!1017475))

(declare-fun m!1017477 () Bool)

(assert (=> d!130261 m!1017477))

(declare-fun m!1017479 () Bool)

(assert (=> d!130261 m!1017479))

(declare-fun m!1017481 () Bool)

(assert (=> d!130261 m!1017481))

(declare-fun m!1017483 () Bool)

(assert (=> b!1098261 m!1017483))

(declare-fun m!1017485 () Bool)

(assert (=> b!1098262 m!1017485))

(assert (=> b!1097957 d!130261))

(declare-fun mapNonEmpty!42475 () Bool)

(declare-fun mapRes!42475 () Bool)

(declare-fun tp!81197 () Bool)

(declare-fun e!626835 () Bool)

(assert (=> mapNonEmpty!42475 (= mapRes!42475 (and tp!81197 e!626835))))

(declare-fun mapRest!42475 () (Array (_ BitVec 32) ValueCell!12857))

(declare-fun mapKey!42475 () (_ BitVec 32))

(declare-fun mapValue!42475 () ValueCell!12857)

(assert (=> mapNonEmpty!42475 (= mapRest!42466 (store mapRest!42475 mapKey!42475 mapValue!42475))))

(declare-fun b!1098270 () Bool)

(declare-fun e!626836 () Bool)

(assert (=> b!1098270 (= e!626836 tp_is_empty!27133)))

(declare-fun condMapEmpty!42475 () Bool)

(declare-fun mapDefault!42475 () ValueCell!12857)

(assert (=> mapNonEmpty!42466 (= condMapEmpty!42475 (= mapRest!42466 ((as const (Array (_ BitVec 32) ValueCell!12857)) mapDefault!42475)))))

(assert (=> mapNonEmpty!42466 (= tp!81182 (and e!626836 mapRes!42475))))

(declare-fun b!1098269 () Bool)

(assert (=> b!1098269 (= e!626835 tp_is_empty!27133)))

(declare-fun mapIsEmpty!42475 () Bool)

(assert (=> mapIsEmpty!42475 mapRes!42475))

(assert (= (and mapNonEmpty!42466 condMapEmpty!42475) mapIsEmpty!42475))

(assert (= (and mapNonEmpty!42466 (not condMapEmpty!42475)) mapNonEmpty!42475))

(assert (= (and mapNonEmpty!42475 ((_ is ValueCellFull!12857) mapValue!42475)) b!1098269))

(assert (= (and mapNonEmpty!42466 ((_ is ValueCellFull!12857) mapDefault!42475)) b!1098270))

(declare-fun m!1017487 () Bool)

(assert (=> mapNonEmpty!42475 m!1017487))

(declare-fun b_lambda!17801 () Bool)

(assert (= b_lambda!17793 (or (and start!96550 b_free!23083) b_lambda!17801)))

(declare-fun b_lambda!17803 () Bool)

(assert (= b_lambda!17789 (or (and start!96550 b_free!23083) b_lambda!17803)))

(declare-fun b_lambda!17805 () Bool)

(assert (= b_lambda!17799 (or (and start!96550 b_free!23083) b_lambda!17805)))

(declare-fun b_lambda!17807 () Bool)

(assert (= b_lambda!17787 (or (and start!96550 b_free!23083) b_lambda!17807)))

(declare-fun b_lambda!17809 () Bool)

(assert (= b_lambda!17795 (or (and start!96550 b_free!23083) b_lambda!17809)))

(declare-fun b_lambda!17811 () Bool)

(assert (= b_lambda!17797 (or (and start!96550 b_free!23083) b_lambda!17811)))

(declare-fun b_lambda!17813 () Bool)

(assert (= b_lambda!17791 (or (and start!96550 b_free!23083) b_lambda!17813)))

(check-sat (not bm!45853) (not b!1098222) (not b!1098180) (not b!1098233) (not b!1098104) (not b!1098229) (not b!1098231) (not bm!45854) (not b!1098105) (not b!1098088) (not b!1098113) (not d!130241) (not b!1098107) (not d!130249) (not b!1098167) (not b!1098092) (not d!130233) tp_is_empty!27133 (not b!1098252) (not b!1098181) (not b!1098254) (not b!1098226) (not b!1098158) (not d!130243) (not bm!45874) (not d!130227) (not b!1098250) (not b!1098232) (not b_lambda!17813) (not b!1098247) (not b!1098248) (not bm!45875) (not d!130237) (not b!1098258) (not b_lambda!17807) (not b!1098192) (not bm!45855) (not b!1098094) (not d!130239) (not b!1098262) (not b_lambda!17805) (not b!1098230) (not bm!45862) b_and!36855 (not b!1098251) (not b!1098166) (not b!1098100) (not d!130245) (not b!1098196) (not b!1098090) (not d!130261) (not b!1098102) (not bm!45856) (not b!1098256) (not b!1098261) (not b!1098160) (not b!1098087) (not b!1098243) (not bm!45869) (not bm!45838) (not b_lambda!17801) (not b_next!23083) (not d!130259) (not b!1098190) (not b!1098255) (not d!130235) (not bm!45876) (not bm!45837) (not b!1098227) (not b!1098260) (not mapNonEmpty!42475) (not b!1098253) (not b!1098175) (not b!1098171) (not b!1098159) (not b!1098259) (not bm!45861) (not b!1098179) (not d!130247) (not b!1098241) (not bm!45860) (not b!1098257) (not b_lambda!17803) (not b!1098073) (not b!1098187) (not b_lambda!17811) (not b!1098101) (not d!130225) (not b!1098099) (not b!1098169) (not b!1098188) (not b_lambda!17809) (not bm!45836) (not bm!45863) (not bm!45833) (not b_lambda!17785) (not b!1098075))
(check-sat b_and!36855 (not b_next!23083))
