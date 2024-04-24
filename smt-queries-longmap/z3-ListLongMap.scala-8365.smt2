; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102008 () Bool)

(assert start!102008)

(declare-fun b_free!26461 () Bool)

(declare-fun b_next!26461 () Bool)

(assert (=> start!102008 (= b_free!26461 (not b_next!26461))))

(declare-fun tp!92429 () Bool)

(declare-fun b_and!44185 () Bool)

(assert (=> start!102008 (= tp!92429 b_and!44185)))

(declare-fun b!1226987 () Bool)

(declare-fun e!696975 () Bool)

(declare-fun e!696980 () Bool)

(declare-fun mapRes!48646 () Bool)

(assert (=> b!1226987 (= e!696975 (and e!696980 mapRes!48646))))

(declare-fun condMapEmpty!48646 () Bool)

(declare-datatypes ((V!46681 0))(
  ( (V!46682 (val!15639 Int)) )
))
(declare-datatypes ((ValueCell!14873 0))(
  ( (ValueCellFull!14873 (v!18297 V!46681)) (EmptyCell!14873) )
))
(declare-datatypes ((array!79151 0))(
  ( (array!79152 (arr!38196 (Array (_ BitVec 32) ValueCell!14873)) (size!38733 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79151)

(declare-fun mapDefault!48646 () ValueCell!14873)

(assert (=> b!1226987 (= condMapEmpty!48646 (= (arr!38196 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14873)) mapDefault!48646)))))

(declare-fun b!1226988 () Bool)

(declare-fun tp_is_empty!31165 () Bool)

(assert (=> b!1226988 (= e!696980 tp_is_empty!31165)))

(declare-fun mapNonEmpty!48646 () Bool)

(declare-fun tp!92428 () Bool)

(declare-fun e!696979 () Bool)

(assert (=> mapNonEmpty!48646 (= mapRes!48646 (and tp!92428 e!696979))))

(declare-fun mapValue!48646 () ValueCell!14873)

(declare-fun mapRest!48646 () (Array (_ BitVec 32) ValueCell!14873))

(declare-fun mapKey!48646 () (_ BitVec 32))

(assert (=> mapNonEmpty!48646 (= (arr!38196 _values!996) (store mapRest!48646 mapKey!48646 mapValue!48646))))

(declare-fun b!1226989 () Bool)

(declare-fun e!696977 () Bool)

(declare-fun e!696982 () Bool)

(assert (=> b!1226989 (= e!696977 (not e!696982))))

(declare-fun res!815061 () Bool)

(assert (=> b!1226989 (=> res!815061 e!696982)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1226989 (= res!815061 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!79153 0))(
  ( (array!79154 (arr!38197 (Array (_ BitVec 32) (_ BitVec 64))) (size!38734 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79153)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226989 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40601 0))(
  ( (Unit!40602) )
))
(declare-fun lt!559025 () Unit!40601)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79153 (_ BitVec 64) (_ BitVec 32)) Unit!40601)

(assert (=> b!1226989 (= lt!559025 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48646 () Bool)

(assert (=> mapIsEmpty!48646 mapRes!48646))

(declare-fun b!1226990 () Bool)

(declare-fun res!815068 () Bool)

(declare-fun e!696974 () Bool)

(assert (=> b!1226990 (=> (not res!815068) (not e!696974))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1226990 (= res!815068 (and (= (size!38733 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38734 _keys!1208) (size!38733 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1226991 () Bool)

(declare-fun e!696981 () Bool)

(assert (=> b!1226991 (= e!696981 (bvslt i!673 (size!38733 _values!996)))))

(declare-fun res!815066 () Bool)

(assert (=> start!102008 (=> (not res!815066) (not e!696974))))

(assert (=> start!102008 (= res!815066 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38734 _keys!1208))))))

(assert (=> start!102008 e!696974))

(assert (=> start!102008 tp_is_empty!31165))

(declare-fun array_inv!29142 (array!79153) Bool)

(assert (=> start!102008 (array_inv!29142 _keys!1208)))

(assert (=> start!102008 true))

(assert (=> start!102008 tp!92429))

(declare-fun array_inv!29143 (array!79151) Bool)

(assert (=> start!102008 (and (array_inv!29143 _values!996) e!696975)))

(declare-fun b!1226992 () Bool)

(assert (=> b!1226992 (= e!696974 e!696977)))

(declare-fun res!815069 () Bool)

(assert (=> b!1226992 (=> (not res!815069) (not e!696977))))

(declare-fun lt!559027 () array!79153)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79153 (_ BitVec 32)) Bool)

(assert (=> b!1226992 (= res!815069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!559027 mask!1564))))

(assert (=> b!1226992 (= lt!559027 (array!79154 (store (arr!38197 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38734 _keys!1208)))))

(declare-fun b!1226993 () Bool)

(declare-fun res!815063 () Bool)

(assert (=> b!1226993 (=> (not res!815063) (not e!696974))))

(assert (=> b!1226993 (= res!815063 (= (select (arr!38197 _keys!1208) i!673) k0!934))))

(declare-fun b!1226994 () Bool)

(declare-fun res!815064 () Bool)

(assert (=> b!1226994 (=> (not res!815064) (not e!696974))))

(assert (=> b!1226994 (= res!815064 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38734 _keys!1208))))))

(declare-fun b!1226995 () Bool)

(declare-fun res!815059 () Bool)

(assert (=> b!1226995 (=> (not res!815059) (not e!696974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1226995 (= res!815059 (validMask!0 mask!1564))))

(declare-fun b!1226996 () Bool)

(declare-fun res!815067 () Bool)

(assert (=> b!1226996 (=> (not res!815067) (not e!696974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226996 (= res!815067 (validKeyInArray!0 k0!934))))

(declare-fun b!1226997 () Bool)

(declare-fun e!696976 () Bool)

(assert (=> b!1226997 (= e!696982 e!696976)))

(declare-fun res!815065 () Bool)

(assert (=> b!1226997 (=> res!815065 e!696976)))

(assert (=> b!1226997 (= res!815065 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46681)

(declare-datatypes ((tuple2!20178 0))(
  ( (tuple2!20179 (_1!10100 (_ BitVec 64)) (_2!10100 V!46681)) )
))
(declare-datatypes ((List!26989 0))(
  ( (Nil!26986) (Cons!26985 (h!28203 tuple2!20178) (t!40422 List!26989)) )
))
(declare-datatypes ((ListLongMap!18155 0))(
  ( (ListLongMap!18156 (toList!9093 List!26989)) )
))
(declare-fun lt!559023 () ListLongMap!18155)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!559024 () array!79151)

(declare-fun minValue!944 () V!46681)

(declare-fun getCurrentListMapNoExtraKeys!5540 (array!79153 array!79151 (_ BitVec 32) (_ BitVec 32) V!46681 V!46681 (_ BitVec 32) Int) ListLongMap!18155)

(assert (=> b!1226997 (= lt!559023 (getCurrentListMapNoExtraKeys!5540 lt!559027 lt!559024 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3434 (Int (_ BitVec 64)) V!46681)

(assert (=> b!1226997 (= lt!559024 (array!79152 (store (arr!38196 _values!996) i!673 (ValueCellFull!14873 (dynLambda!3434 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38733 _values!996)))))

(declare-fun lt!559028 () ListLongMap!18155)

(assert (=> b!1226997 (= lt!559028 (getCurrentListMapNoExtraKeys!5540 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1226998 () Bool)

(declare-fun res!815070 () Bool)

(assert (=> b!1226998 (=> (not res!815070) (not e!696974))))

(declare-datatypes ((List!26990 0))(
  ( (Nil!26987) (Cons!26986 (h!28204 (_ BitVec 64)) (t!40423 List!26990)) )
))
(declare-fun arrayNoDuplicates!0 (array!79153 (_ BitVec 32) List!26990) Bool)

(assert (=> b!1226998 (= res!815070 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26987))))

(declare-fun b!1226999 () Bool)

(declare-fun res!815062 () Bool)

(assert (=> b!1226999 (=> (not res!815062) (not e!696977))))

(assert (=> b!1226999 (= res!815062 (arrayNoDuplicates!0 lt!559027 #b00000000000000000000000000000000 Nil!26987))))

(declare-fun b!1227000 () Bool)

(assert (=> b!1227000 (= e!696976 e!696981)))

(declare-fun res!815060 () Bool)

(assert (=> b!1227000 (=> res!815060 e!696981)))

(assert (=> b!1227000 (= res!815060 (validKeyInArray!0 (select (arr!38197 _keys!1208) from!1455)))))

(declare-fun -!1963 (ListLongMap!18155 (_ BitVec 64)) ListLongMap!18155)

(assert (=> b!1227000 (= (getCurrentListMapNoExtraKeys!5540 lt!559027 lt!559024 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1963 (getCurrentListMapNoExtraKeys!5540 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!559026 () Unit!40601)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1178 (array!79153 array!79151 (_ BitVec 32) (_ BitVec 32) V!46681 V!46681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40601)

(assert (=> b!1227000 (= lt!559026 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1178 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1227001 () Bool)

(declare-fun res!815058 () Bool)

(assert (=> b!1227001 (=> (not res!815058) (not e!696974))))

(assert (=> b!1227001 (= res!815058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1227002 () Bool)

(assert (=> b!1227002 (= e!696979 tp_is_empty!31165)))

(assert (= (and start!102008 res!815066) b!1226995))

(assert (= (and b!1226995 res!815059) b!1226990))

(assert (= (and b!1226990 res!815068) b!1227001))

(assert (= (and b!1227001 res!815058) b!1226998))

(assert (= (and b!1226998 res!815070) b!1226994))

(assert (= (and b!1226994 res!815064) b!1226996))

(assert (= (and b!1226996 res!815067) b!1226993))

(assert (= (and b!1226993 res!815063) b!1226992))

(assert (= (and b!1226992 res!815069) b!1226999))

(assert (= (and b!1226999 res!815062) b!1226989))

(assert (= (and b!1226989 (not res!815061)) b!1226997))

(assert (= (and b!1226997 (not res!815065)) b!1227000))

(assert (= (and b!1227000 (not res!815060)) b!1226991))

(assert (= (and b!1226987 condMapEmpty!48646) mapIsEmpty!48646))

(assert (= (and b!1226987 (not condMapEmpty!48646)) mapNonEmpty!48646))

(get-info :version)

(assert (= (and mapNonEmpty!48646 ((_ is ValueCellFull!14873) mapValue!48646)) b!1227002))

(assert (= (and b!1226987 ((_ is ValueCellFull!14873) mapDefault!48646)) b!1226988))

(assert (= start!102008 b!1226987))

(declare-fun b_lambda!22435 () Bool)

(assert (=> (not b_lambda!22435) (not b!1226997)))

(declare-fun t!40421 () Bool)

(declare-fun tb!11253 () Bool)

(assert (=> (and start!102008 (= defaultEntry!1004 defaultEntry!1004) t!40421) tb!11253))

(declare-fun result!23127 () Bool)

(assert (=> tb!11253 (= result!23127 tp_is_empty!31165)))

(assert (=> b!1226997 t!40421))

(declare-fun b_and!44187 () Bool)

(assert (= b_and!44185 (and (=> t!40421 result!23127) b_and!44187)))

(declare-fun m!1132409 () Bool)

(assert (=> b!1226993 m!1132409))

(declare-fun m!1132411 () Bool)

(assert (=> b!1226997 m!1132411))

(declare-fun m!1132413 () Bool)

(assert (=> b!1226997 m!1132413))

(declare-fun m!1132415 () Bool)

(assert (=> b!1226997 m!1132415))

(declare-fun m!1132417 () Bool)

(assert (=> b!1226997 m!1132417))

(declare-fun m!1132419 () Bool)

(assert (=> start!102008 m!1132419))

(declare-fun m!1132421 () Bool)

(assert (=> start!102008 m!1132421))

(declare-fun m!1132423 () Bool)

(assert (=> b!1226999 m!1132423))

(declare-fun m!1132425 () Bool)

(assert (=> b!1226992 m!1132425))

(declare-fun m!1132427 () Bool)

(assert (=> b!1226992 m!1132427))

(declare-fun m!1132429 () Bool)

(assert (=> b!1226989 m!1132429))

(declare-fun m!1132431 () Bool)

(assert (=> b!1226989 m!1132431))

(declare-fun m!1132433 () Bool)

(assert (=> b!1226998 m!1132433))

(declare-fun m!1132435 () Bool)

(assert (=> b!1227001 m!1132435))

(declare-fun m!1132437 () Bool)

(assert (=> b!1227000 m!1132437))

(declare-fun m!1132439 () Bool)

(assert (=> b!1227000 m!1132439))

(assert (=> b!1227000 m!1132437))

(declare-fun m!1132441 () Bool)

(assert (=> b!1227000 m!1132441))

(declare-fun m!1132443 () Bool)

(assert (=> b!1227000 m!1132443))

(declare-fun m!1132445 () Bool)

(assert (=> b!1227000 m!1132445))

(declare-fun m!1132447 () Bool)

(assert (=> b!1227000 m!1132447))

(assert (=> b!1227000 m!1132443))

(declare-fun m!1132449 () Bool)

(assert (=> mapNonEmpty!48646 m!1132449))

(declare-fun m!1132451 () Bool)

(assert (=> b!1226996 m!1132451))

(declare-fun m!1132453 () Bool)

(assert (=> b!1226995 m!1132453))

(check-sat (not b!1227000) (not b!1226998) (not mapNonEmpty!48646) tp_is_empty!31165 (not b!1226995) b_and!44187 (not b_lambda!22435) (not b!1226996) (not b!1226989) (not start!102008) (not b!1226992) (not b!1227001) (not b_next!26461) (not b!1226999) (not b!1226997))
(check-sat b_and!44187 (not b_next!26461))
