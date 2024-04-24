; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101598 () Bool)

(assert start!101598)

(declare-fun b_free!26233 () Bool)

(declare-fun b_next!26233 () Bool)

(assert (=> start!101598 (= b_free!26233 (not b_next!26233))))

(declare-fun tp!91727 () Bool)

(declare-fun b_and!43621 () Bool)

(assert (=> start!101598 (= tp!91727 b_and!43621)))

(declare-fun b!1219118 () Bool)

(declare-fun e!692242 () Bool)

(declare-fun tp_is_empty!30937 () Bool)

(assert (=> b!1219118 (= e!692242 tp_is_empty!30937)))

(declare-fun b!1219119 () Bool)

(declare-fun res!809247 () Bool)

(declare-fun e!692247 () Bool)

(assert (=> b!1219119 (=> (not res!809247) (not e!692247))))

(declare-datatypes ((array!78691 0))(
  ( (array!78692 (arr!37972 (Array (_ BitVec 32) (_ BitVec 64))) (size!38509 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78691)

(declare-datatypes ((List!26789 0))(
  ( (Nil!26786) (Cons!26785 (h!28003 (_ BitVec 64)) (t!39994 List!26789)) )
))
(declare-fun arrayNoDuplicates!0 (array!78691 (_ BitVec 32) List!26789) Bool)

(assert (=> b!1219119 (= res!809247 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26786))))

(declare-fun b!1219120 () Bool)

(declare-fun e!692244 () Bool)

(assert (=> b!1219120 (= e!692244 true)))

(declare-fun e!692251 () Bool)

(assert (=> b!1219120 e!692251))

(declare-fun res!809250 () Bool)

(assert (=> b!1219120 (=> (not res!809250) (not e!692251))))

(declare-datatypes ((V!46377 0))(
  ( (V!46378 (val!15525 Int)) )
))
(declare-fun lt!554050 () V!46377)

(declare-datatypes ((tuple2!19980 0))(
  ( (tuple2!19981 (_1!10001 (_ BitVec 64)) (_2!10001 V!46377)) )
))
(declare-datatypes ((List!26790 0))(
  ( (Nil!26787) (Cons!26786 (h!28004 tuple2!19980) (t!39995 List!26790)) )
))
(declare-datatypes ((ListLongMap!17957 0))(
  ( (ListLongMap!17958 (toList!8994 List!26790)) )
))
(declare-fun lt!554049 () ListLongMap!17957)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14759 0))(
  ( (ValueCellFull!14759 (v!18176 V!46377)) (EmptyCell!14759) )
))
(declare-datatypes ((array!78693 0))(
  ( (array!78694 (arr!37973 (Array (_ BitVec 32) ValueCell!14759)) (size!38510 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78693)

(declare-fun lt!554044 () ListLongMap!17957)

(declare-fun +!4106 (ListLongMap!17957 tuple2!19980) ListLongMap!17957)

(declare-fun get!19392 (ValueCell!14759 V!46377) V!46377)

(assert (=> b!1219120 (= res!809250 (= lt!554049 (+!4106 lt!554044 (tuple2!19981 (select (arr!37972 _keys!1208) from!1455) (get!19392 (select (arr!37973 _values!996) from!1455) lt!554050)))))))

(declare-fun res!809249 () Bool)

(assert (=> start!101598 (=> (not res!809249) (not e!692247))))

(assert (=> start!101598 (= res!809249 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38509 _keys!1208))))))

(assert (=> start!101598 e!692247))

(assert (=> start!101598 tp_is_empty!30937))

(declare-fun array_inv!28970 (array!78691) Bool)

(assert (=> start!101598 (array_inv!28970 _keys!1208)))

(assert (=> start!101598 true))

(assert (=> start!101598 tp!91727))

(declare-fun e!692245 () Bool)

(declare-fun array_inv!28971 (array!78693) Bool)

(assert (=> start!101598 (and (array_inv!28971 _values!996) e!692245)))

(declare-fun b!1219121 () Bool)

(declare-fun e!692243 () Bool)

(assert (=> b!1219121 (= e!692243 e!692244)))

(declare-fun res!809244 () Bool)

(assert (=> b!1219121 (=> res!809244 e!692244)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219121 (= res!809244 (not (validKeyInArray!0 (select (arr!37972 _keys!1208) from!1455))))))

(declare-fun lt!554046 () ListLongMap!17957)

(assert (=> b!1219121 (= lt!554046 lt!554044)))

(declare-fun lt!554045 () ListLongMap!17957)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1885 (ListLongMap!17957 (_ BitVec 64)) ListLongMap!17957)

(assert (=> b!1219121 (= lt!554044 (-!1885 lt!554045 k0!934))))

(declare-fun zeroValue!944 () V!46377)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554048 () array!78693)

(declare-fun minValue!944 () V!46377)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!554043 () array!78691)

(declare-fun getCurrentListMapNoExtraKeys!5451 (array!78691 array!78693 (_ BitVec 32) (_ BitVec 32) V!46377 V!46377 (_ BitVec 32) Int) ListLongMap!17957)

(assert (=> b!1219121 (= lt!554046 (getCurrentListMapNoExtraKeys!5451 lt!554043 lt!554048 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219121 (= lt!554045 (getCurrentListMapNoExtraKeys!5451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40344 0))(
  ( (Unit!40345) )
))
(declare-fun lt!554052 () Unit!40344)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1100 (array!78691 array!78693 (_ BitVec 32) (_ BitVec 32) V!46377 V!46377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40344)

(assert (=> b!1219121 (= lt!554052 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1100 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!692250 () Bool)

(declare-fun b!1219122 () Bool)

(declare-fun arrayContainsKey!0 (array!78691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219122 (= e!692250 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219123 () Bool)

(declare-fun e!692252 () Bool)

(assert (=> b!1219123 (= e!692252 tp_is_empty!30937)))

(declare-fun b!1219124 () Bool)

(declare-fun res!809257 () Bool)

(assert (=> b!1219124 (=> (not res!809257) (not e!692247))))

(assert (=> b!1219124 (= res!809257 (validKeyInArray!0 k0!934))))

(declare-fun b!1219125 () Bool)

(declare-fun res!809251 () Bool)

(assert (=> b!1219125 (=> (not res!809251) (not e!692247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219125 (= res!809251 (validMask!0 mask!1564))))

(declare-fun b!1219126 () Bool)

(declare-fun e!692248 () Bool)

(assert (=> b!1219126 (= e!692247 e!692248)))

(declare-fun res!809246 () Bool)

(assert (=> b!1219126 (=> (not res!809246) (not e!692248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78691 (_ BitVec 32)) Bool)

(assert (=> b!1219126 (= res!809246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554043 mask!1564))))

(assert (=> b!1219126 (= lt!554043 (array!78692 (store (arr!37972 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38509 _keys!1208)))))

(declare-fun b!1219127 () Bool)

(declare-fun res!809254 () Bool)

(assert (=> b!1219127 (=> (not res!809254) (not e!692247))))

(assert (=> b!1219127 (= res!809254 (and (= (size!38510 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38509 _keys!1208) (size!38510 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219128 () Bool)

(declare-fun res!809248 () Bool)

(assert (=> b!1219128 (=> (not res!809248) (not e!692248))))

(assert (=> b!1219128 (= res!809248 (arrayNoDuplicates!0 lt!554043 #b00000000000000000000000000000000 Nil!26786))))

(declare-fun b!1219129 () Bool)

(declare-fun e!692246 () Bool)

(assert (=> b!1219129 (= e!692248 (not e!692246))))

(declare-fun res!809253 () Bool)

(assert (=> b!1219129 (=> res!809253 e!692246)))

(assert (=> b!1219129 (= res!809253 (bvsgt from!1455 i!673))))

(assert (=> b!1219129 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554051 () Unit!40344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78691 (_ BitVec 64) (_ BitVec 32)) Unit!40344)

(assert (=> b!1219129 (= lt!554051 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48286 () Bool)

(declare-fun mapRes!48286 () Bool)

(declare-fun tp!91726 () Bool)

(assert (=> mapNonEmpty!48286 (= mapRes!48286 (and tp!91726 e!692252))))

(declare-fun mapRest!48286 () (Array (_ BitVec 32) ValueCell!14759))

(declare-fun mapKey!48286 () (_ BitVec 32))

(declare-fun mapValue!48286 () ValueCell!14759)

(assert (=> mapNonEmpty!48286 (= (arr!37973 _values!996) (store mapRest!48286 mapKey!48286 mapValue!48286))))

(declare-fun b!1219130 () Bool)

(declare-fun res!809255 () Bool)

(assert (=> b!1219130 (=> (not res!809255) (not e!692247))))

(assert (=> b!1219130 (= res!809255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219131 () Bool)

(declare-fun res!809252 () Bool)

(assert (=> b!1219131 (=> (not res!809252) (not e!692247))))

(assert (=> b!1219131 (= res!809252 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38509 _keys!1208))))))

(declare-fun b!1219132 () Bool)

(assert (=> b!1219132 (= e!692246 e!692243)))

(declare-fun res!809256 () Bool)

(assert (=> b!1219132 (=> res!809256 e!692243)))

(assert (=> b!1219132 (= res!809256 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1219132 (= lt!554049 (getCurrentListMapNoExtraKeys!5451 lt!554043 lt!554048 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1219132 (= lt!554048 (array!78694 (store (arr!37973 _values!996) i!673 (ValueCellFull!14759 lt!554050)) (size!38510 _values!996)))))

(declare-fun dynLambda!3357 (Int (_ BitVec 64)) V!46377)

(assert (=> b!1219132 (= lt!554050 (dynLambda!3357 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554047 () ListLongMap!17957)

(assert (=> b!1219132 (= lt!554047 (getCurrentListMapNoExtraKeys!5451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219133 () Bool)

(assert (=> b!1219133 (= e!692245 (and e!692242 mapRes!48286))))

(declare-fun condMapEmpty!48286 () Bool)

(declare-fun mapDefault!48286 () ValueCell!14759)

(assert (=> b!1219133 (= condMapEmpty!48286 (= (arr!37973 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14759)) mapDefault!48286)))))

(declare-fun b!1219134 () Bool)

(assert (=> b!1219134 (= e!692251 e!692250)))

(declare-fun res!809243 () Bool)

(assert (=> b!1219134 (=> res!809243 e!692250)))

(assert (=> b!1219134 (= res!809243 (not (= (select (arr!37972 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1219135 () Bool)

(declare-fun res!809245 () Bool)

(assert (=> b!1219135 (=> (not res!809245) (not e!692247))))

(assert (=> b!1219135 (= res!809245 (= (select (arr!37972 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!48286 () Bool)

(assert (=> mapIsEmpty!48286 mapRes!48286))

(assert (= (and start!101598 res!809249) b!1219125))

(assert (= (and b!1219125 res!809251) b!1219127))

(assert (= (and b!1219127 res!809254) b!1219130))

(assert (= (and b!1219130 res!809255) b!1219119))

(assert (= (and b!1219119 res!809247) b!1219131))

(assert (= (and b!1219131 res!809252) b!1219124))

(assert (= (and b!1219124 res!809257) b!1219135))

(assert (= (and b!1219135 res!809245) b!1219126))

(assert (= (and b!1219126 res!809246) b!1219128))

(assert (= (and b!1219128 res!809248) b!1219129))

(assert (= (and b!1219129 (not res!809253)) b!1219132))

(assert (= (and b!1219132 (not res!809256)) b!1219121))

(assert (= (and b!1219121 (not res!809244)) b!1219120))

(assert (= (and b!1219120 res!809250) b!1219134))

(assert (= (and b!1219134 (not res!809243)) b!1219122))

(assert (= (and b!1219133 condMapEmpty!48286) mapIsEmpty!48286))

(assert (= (and b!1219133 (not condMapEmpty!48286)) mapNonEmpty!48286))

(get-info :version)

(assert (= (and mapNonEmpty!48286 ((_ is ValueCellFull!14759) mapValue!48286)) b!1219123))

(assert (= (and b!1219133 ((_ is ValueCellFull!14759) mapDefault!48286)) b!1219118))

(assert (= start!101598 b!1219133))

(declare-fun b_lambda!21979 () Bool)

(assert (=> (not b_lambda!21979) (not b!1219132)))

(declare-fun t!39993 () Bool)

(declare-fun tb!11025 () Bool)

(assert (=> (and start!101598 (= defaultEntry!1004 defaultEntry!1004) t!39993) tb!11025))

(declare-fun result!22659 () Bool)

(assert (=> tb!11025 (= result!22659 tp_is_empty!30937)))

(assert (=> b!1219132 t!39993))

(declare-fun b_and!43623 () Bool)

(assert (= b_and!43621 (and (=> t!39993 result!22659) b_and!43623)))

(declare-fun m!1124185 () Bool)

(assert (=> b!1219122 m!1124185))

(declare-fun m!1124187 () Bool)

(assert (=> b!1219132 m!1124187))

(declare-fun m!1124189 () Bool)

(assert (=> b!1219132 m!1124189))

(declare-fun m!1124191 () Bool)

(assert (=> b!1219132 m!1124191))

(declare-fun m!1124193 () Bool)

(assert (=> b!1219132 m!1124193))

(declare-fun m!1124195 () Bool)

(assert (=> b!1219120 m!1124195))

(declare-fun m!1124197 () Bool)

(assert (=> b!1219120 m!1124197))

(assert (=> b!1219120 m!1124197))

(declare-fun m!1124199 () Bool)

(assert (=> b!1219120 m!1124199))

(declare-fun m!1124201 () Bool)

(assert (=> b!1219120 m!1124201))

(declare-fun m!1124203 () Bool)

(assert (=> b!1219128 m!1124203))

(declare-fun m!1124205 () Bool)

(assert (=> b!1219126 m!1124205))

(declare-fun m!1124207 () Bool)

(assert (=> b!1219126 m!1124207))

(declare-fun m!1124209 () Bool)

(assert (=> b!1219121 m!1124209))

(declare-fun m!1124211 () Bool)

(assert (=> b!1219121 m!1124211))

(declare-fun m!1124213 () Bool)

(assert (=> b!1219121 m!1124213))

(assert (=> b!1219121 m!1124195))

(declare-fun m!1124215 () Bool)

(assert (=> b!1219121 m!1124215))

(declare-fun m!1124217 () Bool)

(assert (=> b!1219121 m!1124217))

(assert (=> b!1219121 m!1124195))

(declare-fun m!1124219 () Bool)

(assert (=> b!1219119 m!1124219))

(assert (=> b!1219134 m!1124195))

(declare-fun m!1124221 () Bool)

(assert (=> mapNonEmpty!48286 m!1124221))

(declare-fun m!1124223 () Bool)

(assert (=> start!101598 m!1124223))

(declare-fun m!1124225 () Bool)

(assert (=> start!101598 m!1124225))

(declare-fun m!1124227 () Bool)

(assert (=> b!1219135 m!1124227))

(declare-fun m!1124229 () Bool)

(assert (=> b!1219124 m!1124229))

(declare-fun m!1124231 () Bool)

(assert (=> b!1219125 m!1124231))

(declare-fun m!1124233 () Bool)

(assert (=> b!1219130 m!1124233))

(declare-fun m!1124235 () Bool)

(assert (=> b!1219129 m!1124235))

(declare-fun m!1124237 () Bool)

(assert (=> b!1219129 m!1124237))

(check-sat (not b_lambda!21979) (not b!1219124) b_and!43623 tp_is_empty!30937 (not b!1219126) (not mapNonEmpty!48286) (not b!1219132) (not b!1219130) (not b!1219122) (not b!1219121) (not b!1219125) (not b!1219128) (not b!1219120) (not b_next!26233) (not b!1219129) (not start!101598) (not b!1219119))
(check-sat b_and!43623 (not b_next!26233))
