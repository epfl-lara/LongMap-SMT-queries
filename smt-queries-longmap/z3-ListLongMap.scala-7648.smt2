; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96444 () Bool)

(assert start!96444)

(declare-fun b_free!22861 () Bool)

(declare-fun b_next!22861 () Bool)

(assert (=> start!96444 (= b_free!22861 (not b_next!22861))))

(declare-fun tp!80432 () Bool)

(declare-fun b_and!36407 () Bool)

(assert (=> start!96444 (= tp!80432 b_and!36407)))

(declare-fun b!1093960 () Bool)

(declare-fun res!729606 () Bool)

(declare-fun e!624818 () Bool)

(assert (=> b!1093960 (=> (not res!729606) (not e!624818))))

(declare-datatypes ((array!70673 0))(
  ( (array!70674 (arr!34004 (Array (_ BitVec 32) (_ BitVec 64))) (size!34541 (_ BitVec 32))) )
))
(declare-fun lt!488931 () array!70673)

(declare-datatypes ((List!23755 0))(
  ( (Nil!23752) (Cons!23751 (h!24969 (_ BitVec 64)) (t!33666 List!23755)) )
))
(declare-fun arrayNoDuplicates!0 (array!70673 (_ BitVec 32) List!23755) Bool)

(assert (=> b!1093960 (= res!729606 (arrayNoDuplicates!0 lt!488931 #b00000000000000000000000000000000 Nil!23752))))

(declare-fun b!1093961 () Bool)

(declare-fun e!624816 () Bool)

(declare-fun tp_is_empty!26863 () Bool)

(assert (=> b!1093961 (= e!624816 tp_is_empty!26863)))

(declare-fun b!1093962 () Bool)

(declare-fun res!729612 () Bool)

(declare-fun e!624821 () Bool)

(assert (=> b!1093962 (=> (not res!729612) (not e!624821))))

(declare-fun _keys!1070 () array!70673)

(assert (=> b!1093962 (= res!729612 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23752))))

(declare-fun res!729604 () Bool)

(assert (=> start!96444 (=> (not res!729604) (not e!624821))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96444 (= res!729604 (validMask!0 mask!1414))))

(assert (=> start!96444 e!624821))

(assert (=> start!96444 tp!80432))

(assert (=> start!96444 true))

(assert (=> start!96444 tp_is_empty!26863))

(declare-fun array_inv!26250 (array!70673) Bool)

(assert (=> start!96444 (array_inv!26250 _keys!1070)))

(declare-datatypes ((V!40945 0))(
  ( (V!40946 (val!13488 Int)) )
))
(declare-datatypes ((ValueCell!12722 0))(
  ( (ValueCellFull!12722 (v!16105 V!40945)) (EmptyCell!12722) )
))
(declare-datatypes ((array!70675 0))(
  ( (array!70676 (arr!34005 (Array (_ BitVec 32) ValueCell!12722)) (size!34542 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70675)

(declare-fun e!624819 () Bool)

(declare-fun array_inv!26251 (array!70675) Bool)

(assert (=> start!96444 (and (array_inv!26251 _values!874) e!624819)))

(declare-fun b!1093963 () Bool)

(declare-fun res!729605 () Bool)

(assert (=> b!1093963 (=> (not res!729605) (not e!624821))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093963 (= res!729605 (validKeyInArray!0 k0!904))))

(declare-fun b!1093964 () Bool)

(declare-fun res!729607 () Bool)

(assert (=> b!1093964 (=> (not res!729607) (not e!624821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70673 (_ BitVec 32)) Bool)

(assert (=> b!1093964 (= res!729607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093965 () Bool)

(assert (=> b!1093965 (= e!624821 e!624818)))

(declare-fun res!729608 () Bool)

(assert (=> b!1093965 (=> (not res!729608) (not e!624818))))

(assert (=> b!1093965 (= res!729608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488931 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093965 (= lt!488931 (array!70674 (store (arr!34004 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34541 _keys!1070)))))

(declare-fun b!1093966 () Bool)

(declare-fun res!729611 () Bool)

(assert (=> b!1093966 (=> (not res!729611) (not e!624821))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093966 (= res!729611 (and (= (size!34542 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34541 _keys!1070) (size!34542 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093967 () Bool)

(declare-fun res!729610 () Bool)

(assert (=> b!1093967 (=> (not res!729610) (not e!624821))))

(assert (=> b!1093967 (= res!729610 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34541 _keys!1070))))))

(declare-fun mapNonEmpty!42049 () Bool)

(declare-fun mapRes!42049 () Bool)

(declare-fun tp!80431 () Bool)

(declare-fun e!624817 () Bool)

(assert (=> mapNonEmpty!42049 (= mapRes!42049 (and tp!80431 e!624817))))

(declare-fun mapRest!42049 () (Array (_ BitVec 32) ValueCell!12722))

(declare-fun mapValue!42049 () ValueCell!12722)

(declare-fun mapKey!42049 () (_ BitVec 32))

(assert (=> mapNonEmpty!42049 (= (arr!34005 _values!874) (store mapRest!42049 mapKey!42049 mapValue!42049))))

(declare-fun b!1093968 () Bool)

(assert (=> b!1093968 (= e!624819 (and e!624816 mapRes!42049))))

(declare-fun condMapEmpty!42049 () Bool)

(declare-fun mapDefault!42049 () ValueCell!12722)

(assert (=> b!1093968 (= condMapEmpty!42049 (= (arr!34005 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12722)) mapDefault!42049)))))

(declare-fun b!1093969 () Bool)

(assert (=> b!1093969 (= e!624817 tp_is_empty!26863)))

(declare-fun b!1093970 () Bool)

(assert (=> b!1093970 (= e!624818 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!17164 0))(
  ( (tuple2!17165 (_1!8593 (_ BitVec 64)) (_2!8593 V!40945)) )
))
(declare-datatypes ((List!23756 0))(
  ( (Nil!23753) (Cons!23752 (h!24970 tuple2!17164) (t!33667 List!23756)) )
))
(declare-datatypes ((ListLongMap!15141 0))(
  ( (ListLongMap!15142 (toList!7586 List!23756)) )
))
(declare-fun lt!488937 () ListLongMap!15141)

(declare-fun minValue!831 () V!40945)

(declare-fun zeroValue!831 () V!40945)

(declare-fun getCurrentListMap!4334 (array!70673 array!70675 (_ BitVec 32) (_ BitVec 32) V!40945 V!40945 (_ BitVec 32) Int) ListLongMap!15141)

(assert (=> b!1093970 (= lt!488937 (getCurrentListMap!4334 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488935 () array!70675)

(declare-fun lt!488934 () ListLongMap!15141)

(assert (=> b!1093970 (= lt!488934 (getCurrentListMap!4334 lt!488931 lt!488935 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488929 () ListLongMap!15141)

(declare-fun lt!488936 () ListLongMap!15141)

(assert (=> b!1093970 (and (= lt!488929 lt!488936) (= lt!488936 lt!488929))))

(declare-fun lt!488930 () ListLongMap!15141)

(declare-fun -!891 (ListLongMap!15141 (_ BitVec 64)) ListLongMap!15141)

(assert (=> b!1093970 (= lt!488936 (-!891 lt!488930 k0!904))))

(declare-datatypes ((Unit!35949 0))(
  ( (Unit!35950) )
))
(declare-fun lt!488932 () Unit!35949)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!163 (array!70673 array!70675 (_ BitVec 32) (_ BitVec 32) V!40945 V!40945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35949)

(assert (=> b!1093970 (= lt!488932 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!163 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4139 (array!70673 array!70675 (_ BitVec 32) (_ BitVec 32) V!40945 V!40945 (_ BitVec 32) Int) ListLongMap!15141)

(assert (=> b!1093970 (= lt!488929 (getCurrentListMapNoExtraKeys!4139 lt!488931 lt!488935 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2260 (Int (_ BitVec 64)) V!40945)

(assert (=> b!1093970 (= lt!488935 (array!70676 (store (arr!34005 _values!874) i!650 (ValueCellFull!12722 (dynLambda!2260 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34542 _values!874)))))

(assert (=> b!1093970 (= lt!488930 (getCurrentListMapNoExtraKeys!4139 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093970 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488933 () Unit!35949)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70673 (_ BitVec 64) (_ BitVec 32)) Unit!35949)

(assert (=> b!1093970 (= lt!488933 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42049 () Bool)

(assert (=> mapIsEmpty!42049 mapRes!42049))

(declare-fun b!1093971 () Bool)

(declare-fun res!729609 () Bool)

(assert (=> b!1093971 (=> (not res!729609) (not e!624821))))

(assert (=> b!1093971 (= res!729609 (= (select (arr!34004 _keys!1070) i!650) k0!904))))

(assert (= (and start!96444 res!729604) b!1093966))

(assert (= (and b!1093966 res!729611) b!1093964))

(assert (= (and b!1093964 res!729607) b!1093962))

(assert (= (and b!1093962 res!729612) b!1093967))

(assert (= (and b!1093967 res!729610) b!1093963))

(assert (= (and b!1093963 res!729605) b!1093971))

(assert (= (and b!1093971 res!729609) b!1093965))

(assert (= (and b!1093965 res!729608) b!1093960))

(assert (= (and b!1093960 res!729606) b!1093970))

(assert (= (and b!1093968 condMapEmpty!42049) mapIsEmpty!42049))

(assert (= (and b!1093968 (not condMapEmpty!42049)) mapNonEmpty!42049))

(get-info :version)

(assert (= (and mapNonEmpty!42049 ((_ is ValueCellFull!12722) mapValue!42049)) b!1093969))

(assert (= (and b!1093968 ((_ is ValueCellFull!12722) mapDefault!42049)) b!1093961))

(assert (= start!96444 b!1093968))

(declare-fun b_lambda!17541 () Bool)

(assert (=> (not b_lambda!17541) (not b!1093970)))

(declare-fun t!33665 () Bool)

(declare-fun tb!7731 () Bool)

(assert (=> (and start!96444 (= defaultEntry!882 defaultEntry!882) t!33665) tb!7731))

(declare-fun result!15989 () Bool)

(assert (=> tb!7731 (= result!15989 tp_is_empty!26863)))

(assert (=> b!1093970 t!33665))

(declare-fun b_and!36409 () Bool)

(assert (= b_and!36407 (and (=> t!33665 result!15989) b_and!36409)))

(declare-fun m!1014089 () Bool)

(assert (=> b!1093962 m!1014089))

(declare-fun m!1014091 () Bool)

(assert (=> b!1093963 m!1014091))

(declare-fun m!1014093 () Bool)

(assert (=> b!1093960 m!1014093))

(declare-fun m!1014095 () Bool)

(assert (=> b!1093971 m!1014095))

(declare-fun m!1014097 () Bool)

(assert (=> start!96444 m!1014097))

(declare-fun m!1014099 () Bool)

(assert (=> start!96444 m!1014099))

(declare-fun m!1014101 () Bool)

(assert (=> start!96444 m!1014101))

(declare-fun m!1014103 () Bool)

(assert (=> b!1093965 m!1014103))

(declare-fun m!1014105 () Bool)

(assert (=> b!1093965 m!1014105))

(declare-fun m!1014107 () Bool)

(assert (=> b!1093964 m!1014107))

(declare-fun m!1014109 () Bool)

(assert (=> b!1093970 m!1014109))

(declare-fun m!1014111 () Bool)

(assert (=> b!1093970 m!1014111))

(declare-fun m!1014113 () Bool)

(assert (=> b!1093970 m!1014113))

(declare-fun m!1014115 () Bool)

(assert (=> b!1093970 m!1014115))

(declare-fun m!1014117 () Bool)

(assert (=> b!1093970 m!1014117))

(declare-fun m!1014119 () Bool)

(assert (=> b!1093970 m!1014119))

(declare-fun m!1014121 () Bool)

(assert (=> b!1093970 m!1014121))

(declare-fun m!1014123 () Bool)

(assert (=> b!1093970 m!1014123))

(declare-fun m!1014125 () Bool)

(assert (=> b!1093970 m!1014125))

(declare-fun m!1014127 () Bool)

(assert (=> b!1093970 m!1014127))

(declare-fun m!1014129 () Bool)

(assert (=> mapNonEmpty!42049 m!1014129))

(check-sat (not b!1093965) (not start!96444) (not b_lambda!17541) (not b_next!22861) b_and!36409 (not b!1093962) (not b!1093970) (not b!1093964) (not b!1093960) (not b!1093963) (not mapNonEmpty!42049) tp_is_empty!26863)
(check-sat b_and!36409 (not b_next!22861))
