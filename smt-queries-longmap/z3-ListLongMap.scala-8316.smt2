; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101480 () Bool)

(assert start!101480)

(declare-fun b_free!26167 () Bool)

(declare-fun b_next!26167 () Bool)

(assert (=> start!101480 (= b_free!26167 (not b_next!26167))))

(declare-fun tp!91522 () Bool)

(declare-fun b_and!43453 () Bool)

(assert (=> start!101480 (= tp!91522 b_and!43453)))

(declare-fun b!1217235 () Bool)

(declare-fun res!807900 () Bool)

(declare-fun e!691217 () Bool)

(assert (=> b!1217235 (=> (not res!807900) (not e!691217))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217235 (= res!807900 (validKeyInArray!0 k0!934))))

(declare-fun b!1217236 () Bool)

(declare-fun res!807892 () Bool)

(assert (=> b!1217236 (=> (not res!807892) (not e!691217))))

(declare-datatypes ((array!78557 0))(
  ( (array!78558 (arr!37907 (Array (_ BitVec 32) (_ BitVec 64))) (size!38444 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78557)

(declare-datatypes ((List!26735 0))(
  ( (Nil!26732) (Cons!26731 (h!27949 (_ BitVec 64)) (t!39874 List!26735)) )
))
(declare-fun arrayNoDuplicates!0 (array!78557 (_ BitVec 32) List!26735) Bool)

(assert (=> b!1217236 (= res!807892 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26732))))

(declare-fun b!1217237 () Bool)

(declare-fun e!691222 () Bool)

(declare-fun e!691221 () Bool)

(assert (=> b!1217237 (= e!691222 (not e!691221))))

(declare-fun res!807901 () Bool)

(assert (=> b!1217237 (=> res!807901 e!691221)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1217237 (= res!807901 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217237 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40288 0))(
  ( (Unit!40289) )
))
(declare-fun lt!553233 () Unit!40288)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78557 (_ BitVec 64) (_ BitVec 32)) Unit!40288)

(assert (=> b!1217237 (= lt!553233 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217238 () Bool)

(declare-fun e!691220 () Bool)

(declare-fun tp_is_empty!30871 () Bool)

(assert (=> b!1217238 (= e!691220 tp_is_empty!30871)))

(declare-fun b!1217239 () Bool)

(declare-fun res!807899 () Bool)

(assert (=> b!1217239 (=> (not res!807899) (not e!691217))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78557 (_ BitVec 32)) Bool)

(assert (=> b!1217239 (= res!807899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217241 () Bool)

(declare-fun res!807894 () Bool)

(assert (=> b!1217241 (=> (not res!807894) (not e!691217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217241 (= res!807894 (validMask!0 mask!1564))))

(declare-fun b!1217242 () Bool)

(declare-fun res!807898 () Bool)

(assert (=> b!1217242 (=> (not res!807898) (not e!691217))))

(declare-datatypes ((V!46289 0))(
  ( (V!46290 (val!15492 Int)) )
))
(declare-datatypes ((ValueCell!14726 0))(
  ( (ValueCellFull!14726 (v!18141 V!46289)) (EmptyCell!14726) )
))
(declare-datatypes ((array!78559 0))(
  ( (array!78560 (arr!37908 (Array (_ BitVec 32) ValueCell!14726)) (size!38445 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78559)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1217242 (= res!807898 (and (= (size!38445 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38444 _keys!1208) (size!38445 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217243 () Bool)

(declare-fun res!807893 () Bool)

(assert (=> b!1217243 (=> (not res!807893) (not e!691217))))

(assert (=> b!1217243 (= res!807893 (= (select (arr!37907 _keys!1208) i!673) k0!934))))

(declare-fun b!1217244 () Bool)

(declare-fun e!691218 () Bool)

(declare-fun e!691216 () Bool)

(declare-fun mapRes!48181 () Bool)

(assert (=> b!1217244 (= e!691218 (and e!691216 mapRes!48181))))

(declare-fun condMapEmpty!48181 () Bool)

(declare-fun mapDefault!48181 () ValueCell!14726)

(assert (=> b!1217244 (= condMapEmpty!48181 (= (arr!37908 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14726)) mapDefault!48181)))))

(declare-fun mapIsEmpty!48181 () Bool)

(assert (=> mapIsEmpty!48181 mapRes!48181))

(declare-fun b!1217245 () Bool)

(assert (=> b!1217245 (= e!691216 tp_is_empty!30871)))

(declare-fun b!1217246 () Bool)

(declare-fun res!807897 () Bool)

(assert (=> b!1217246 (=> (not res!807897) (not e!691217))))

(assert (=> b!1217246 (= res!807897 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38444 _keys!1208))))))

(declare-fun b!1217247 () Bool)

(assert (=> b!1217247 (= e!691221 true)))

(declare-fun zeroValue!944 () V!46289)

(declare-fun lt!553234 () array!78557)

(declare-fun minValue!944 () V!46289)

(declare-datatypes ((tuple2!19926 0))(
  ( (tuple2!19927 (_1!9974 (_ BitVec 64)) (_2!9974 V!46289)) )
))
(declare-datatypes ((List!26736 0))(
  ( (Nil!26733) (Cons!26732 (h!27950 tuple2!19926) (t!39875 List!26736)) )
))
(declare-datatypes ((ListLongMap!17903 0))(
  ( (ListLongMap!17904 (toList!8967 List!26736)) )
))
(declare-fun lt!553236 () ListLongMap!17903)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5424 (array!78557 array!78559 (_ BitVec 32) (_ BitVec 32) V!46289 V!46289 (_ BitVec 32) Int) ListLongMap!17903)

(declare-fun dynLambda!3336 (Int (_ BitVec 64)) V!46289)

(assert (=> b!1217247 (= lt!553236 (getCurrentListMapNoExtraKeys!5424 lt!553234 (array!78560 (store (arr!37908 _values!996) i!673 (ValueCellFull!14726 (dynLambda!3336 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38445 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553235 () ListLongMap!17903)

(assert (=> b!1217247 (= lt!553235 (getCurrentListMapNoExtraKeys!5424 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217240 () Bool)

(declare-fun res!807891 () Bool)

(assert (=> b!1217240 (=> (not res!807891) (not e!691222))))

(assert (=> b!1217240 (= res!807891 (arrayNoDuplicates!0 lt!553234 #b00000000000000000000000000000000 Nil!26732))))

(declare-fun res!807896 () Bool)

(assert (=> start!101480 (=> (not res!807896) (not e!691217))))

(assert (=> start!101480 (= res!807896 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38444 _keys!1208))))))

(assert (=> start!101480 e!691217))

(assert (=> start!101480 tp_is_empty!30871))

(declare-fun array_inv!28924 (array!78557) Bool)

(assert (=> start!101480 (array_inv!28924 _keys!1208)))

(assert (=> start!101480 true))

(assert (=> start!101480 tp!91522))

(declare-fun array_inv!28925 (array!78559) Bool)

(assert (=> start!101480 (and (array_inv!28925 _values!996) e!691218)))

(declare-fun b!1217248 () Bool)

(assert (=> b!1217248 (= e!691217 e!691222)))

(declare-fun res!807895 () Bool)

(assert (=> b!1217248 (=> (not res!807895) (not e!691222))))

(assert (=> b!1217248 (= res!807895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553234 mask!1564))))

(assert (=> b!1217248 (= lt!553234 (array!78558 (store (arr!37907 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38444 _keys!1208)))))

(declare-fun mapNonEmpty!48181 () Bool)

(declare-fun tp!91523 () Bool)

(assert (=> mapNonEmpty!48181 (= mapRes!48181 (and tp!91523 e!691220))))

(declare-fun mapKey!48181 () (_ BitVec 32))

(declare-fun mapValue!48181 () ValueCell!14726)

(declare-fun mapRest!48181 () (Array (_ BitVec 32) ValueCell!14726))

(assert (=> mapNonEmpty!48181 (= (arr!37908 _values!996) (store mapRest!48181 mapKey!48181 mapValue!48181))))

(assert (= (and start!101480 res!807896) b!1217241))

(assert (= (and b!1217241 res!807894) b!1217242))

(assert (= (and b!1217242 res!807898) b!1217239))

(assert (= (and b!1217239 res!807899) b!1217236))

(assert (= (and b!1217236 res!807892) b!1217246))

(assert (= (and b!1217246 res!807897) b!1217235))

(assert (= (and b!1217235 res!807900) b!1217243))

(assert (= (and b!1217243 res!807893) b!1217248))

(assert (= (and b!1217248 res!807895) b!1217240))

(assert (= (and b!1217240 res!807891) b!1217237))

(assert (= (and b!1217237 (not res!807901)) b!1217247))

(assert (= (and b!1217244 condMapEmpty!48181) mapIsEmpty!48181))

(assert (= (and b!1217244 (not condMapEmpty!48181)) mapNonEmpty!48181))

(get-info :version)

(assert (= (and mapNonEmpty!48181 ((_ is ValueCellFull!14726) mapValue!48181)) b!1217238))

(assert (= (and b!1217244 ((_ is ValueCellFull!14726) mapDefault!48181)) b!1217245))

(assert (= start!101480 b!1217244))

(declare-fun b_lambda!21837 () Bool)

(assert (=> (not b_lambda!21837) (not b!1217247)))

(declare-fun t!39873 () Bool)

(declare-fun tb!10959 () Bool)

(assert (=> (and start!101480 (= defaultEntry!1004 defaultEntry!1004) t!39873) tb!10959))

(declare-fun result!22523 () Bool)

(assert (=> tb!10959 (= result!22523 tp_is_empty!30871)))

(assert (=> b!1217247 t!39873))

(declare-fun b_and!43455 () Bool)

(assert (= b_and!43453 (and (=> t!39873 result!22523) b_and!43455)))

(declare-fun m!1122393 () Bool)

(assert (=> b!1217243 m!1122393))

(declare-fun m!1122395 () Bool)

(assert (=> b!1217235 m!1122395))

(declare-fun m!1122397 () Bool)

(assert (=> b!1217247 m!1122397))

(declare-fun m!1122399 () Bool)

(assert (=> b!1217247 m!1122399))

(declare-fun m!1122401 () Bool)

(assert (=> b!1217247 m!1122401))

(declare-fun m!1122403 () Bool)

(assert (=> b!1217247 m!1122403))

(declare-fun m!1122405 () Bool)

(assert (=> b!1217240 m!1122405))

(declare-fun m!1122407 () Bool)

(assert (=> b!1217241 m!1122407))

(declare-fun m!1122409 () Bool)

(assert (=> b!1217248 m!1122409))

(declare-fun m!1122411 () Bool)

(assert (=> b!1217248 m!1122411))

(declare-fun m!1122413 () Bool)

(assert (=> mapNonEmpty!48181 m!1122413))

(declare-fun m!1122415 () Bool)

(assert (=> start!101480 m!1122415))

(declare-fun m!1122417 () Bool)

(assert (=> start!101480 m!1122417))

(declare-fun m!1122419 () Bool)

(assert (=> b!1217237 m!1122419))

(declare-fun m!1122421 () Bool)

(assert (=> b!1217237 m!1122421))

(declare-fun m!1122423 () Bool)

(assert (=> b!1217236 m!1122423))

(declare-fun m!1122425 () Bool)

(assert (=> b!1217239 m!1122425))

(check-sat (not b_lambda!21837) (not b!1217241) tp_is_empty!30871 (not b!1217236) (not b!1217247) b_and!43455 (not b!1217237) (not mapNonEmpty!48181) (not b!1217239) (not b!1217235) (not b!1217240) (not start!101480) (not b!1217248) (not b_next!26167))
(check-sat b_and!43455 (not b_next!26167))
