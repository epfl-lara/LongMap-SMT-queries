; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101516 () Bool)

(assert start!101516)

(declare-fun b_free!26203 () Bool)

(declare-fun b_next!26203 () Bool)

(assert (=> start!101516 (= b_free!26203 (not b_next!26203))))

(declare-fun tp!91631 () Bool)

(declare-fun b_and!43525 () Bool)

(assert (=> start!101516 (= tp!91631 b_and!43525)))

(declare-fun b!1218067 () Bool)

(declare-fun res!808534 () Bool)

(declare-fun e!691638 () Bool)

(assert (=> b!1218067 (=> (not res!808534) (not e!691638))))

(declare-datatypes ((array!78629 0))(
  ( (array!78630 (arr!37943 (Array (_ BitVec 32) (_ BitVec 64))) (size!38480 (_ BitVec 32))) )
))
(declare-fun lt!553510 () array!78629)

(declare-datatypes ((List!26764 0))(
  ( (Nil!26761) (Cons!26760 (h!27978 (_ BitVec 64)) (t!39939 List!26764)) )
))
(declare-fun arrayNoDuplicates!0 (array!78629 (_ BitVec 32) List!26764) Bool)

(assert (=> b!1218067 (= res!808534 (arrayNoDuplicates!0 lt!553510 #b00000000000000000000000000000000 Nil!26761))))

(declare-fun b!1218068 () Bool)

(declare-fun res!808525 () Bool)

(declare-fun e!691642 () Bool)

(assert (=> b!1218068 (=> (not res!808525) (not e!691642))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!78629)

(assert (=> b!1218068 (= res!808525 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38480 _keys!1208))))))

(declare-fun b!1218069 () Bool)

(declare-fun e!691634 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218069 (= e!691634 (bvslt from!1455 (size!38480 _keys!1208)))))

(declare-fun b!1218070 () Bool)

(declare-fun e!691639 () Bool)

(assert (=> b!1218070 (= e!691638 (not e!691639))))

(declare-fun res!808528 () Bool)

(assert (=> b!1218070 (=> res!808528 e!691639)))

(assert (=> b!1218070 (= res!808528 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218070 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40322 0))(
  ( (Unit!40323) )
))
(declare-fun lt!553507 () Unit!40322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78629 (_ BitVec 64) (_ BitVec 32)) Unit!40322)

(assert (=> b!1218070 (= lt!553507 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218071 () Bool)

(declare-fun e!691640 () Bool)

(declare-fun tp_is_empty!30907 () Bool)

(assert (=> b!1218071 (= e!691640 tp_is_empty!30907)))

(declare-fun b!1218072 () Bool)

(declare-fun e!691641 () Bool)

(declare-fun e!691636 () Bool)

(declare-fun mapRes!48235 () Bool)

(assert (=> b!1218072 (= e!691641 (and e!691636 mapRes!48235))))

(declare-fun condMapEmpty!48235 () Bool)

(declare-datatypes ((V!46337 0))(
  ( (V!46338 (val!15510 Int)) )
))
(declare-datatypes ((ValueCell!14744 0))(
  ( (ValueCellFull!14744 (v!18159 V!46337)) (EmptyCell!14744) )
))
(declare-datatypes ((array!78631 0))(
  ( (array!78632 (arr!37944 (Array (_ BitVec 32) ValueCell!14744)) (size!38481 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78631)

(declare-fun mapDefault!48235 () ValueCell!14744)

(assert (=> b!1218072 (= condMapEmpty!48235 (= (arr!37944 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14744)) mapDefault!48235)))))

(declare-fun res!808537 () Bool)

(assert (=> start!101516 (=> (not res!808537) (not e!691642))))

(assert (=> start!101516 (= res!808537 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38480 _keys!1208))))))

(assert (=> start!101516 e!691642))

(assert (=> start!101516 tp_is_empty!30907))

(declare-fun array_inv!28954 (array!78629) Bool)

(assert (=> start!101516 (array_inv!28954 _keys!1208)))

(assert (=> start!101516 true))

(assert (=> start!101516 tp!91631))

(declare-fun array_inv!28955 (array!78631) Bool)

(assert (=> start!101516 (and (array_inv!28955 _values!996) e!691641)))

(declare-fun b!1218073 () Bool)

(declare-fun res!808533 () Bool)

(assert (=> b!1218073 (=> (not res!808533) (not e!691642))))

(assert (=> b!1218073 (= res!808533 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26761))))

(declare-fun b!1218074 () Bool)

(declare-fun e!691637 () Bool)

(assert (=> b!1218074 (= e!691637 e!691634)))

(declare-fun res!808530 () Bool)

(assert (=> b!1218074 (=> res!808530 e!691634)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218074 (= res!808530 (not (validKeyInArray!0 (select (arr!37943 _keys!1208) from!1455))))))

(declare-fun zeroValue!944 () V!46337)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!553511 () array!78631)

(declare-fun minValue!944 () V!46337)

(declare-datatypes ((tuple2!19954 0))(
  ( (tuple2!19955 (_1!9988 (_ BitVec 64)) (_2!9988 V!46337)) )
))
(declare-datatypes ((List!26765 0))(
  ( (Nil!26762) (Cons!26761 (h!27979 tuple2!19954) (t!39940 List!26765)) )
))
(declare-datatypes ((ListLongMap!17931 0))(
  ( (ListLongMap!17932 (toList!8981 List!26765)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5438 (array!78629 array!78631 (_ BitVec 32) (_ BitVec 32) V!46337 V!46337 (_ BitVec 32) Int) ListLongMap!17931)

(declare-fun -!1874 (ListLongMap!17931 (_ BitVec 64)) ListLongMap!17931)

(assert (=> b!1218074 (= (getCurrentListMapNoExtraKeys!5438 lt!553510 lt!553511 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1874 (getCurrentListMapNoExtraKeys!5438 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!553509 () Unit!40322)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1089 (array!78629 array!78631 (_ BitVec 32) (_ BitVec 32) V!46337 V!46337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40322)

(assert (=> b!1218074 (= lt!553509 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1089 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218075 () Bool)

(declare-fun res!808531 () Bool)

(assert (=> b!1218075 (=> (not res!808531) (not e!691642))))

(assert (=> b!1218075 (= res!808531 (= (select (arr!37943 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!48235 () Bool)

(declare-fun tp!91630 () Bool)

(assert (=> mapNonEmpty!48235 (= mapRes!48235 (and tp!91630 e!691640))))

(declare-fun mapValue!48235 () ValueCell!14744)

(declare-fun mapRest!48235 () (Array (_ BitVec 32) ValueCell!14744))

(declare-fun mapKey!48235 () (_ BitVec 32))

(assert (=> mapNonEmpty!48235 (= (arr!37944 _values!996) (store mapRest!48235 mapKey!48235 mapValue!48235))))

(declare-fun b!1218076 () Bool)

(assert (=> b!1218076 (= e!691642 e!691638)))

(declare-fun res!808535 () Bool)

(assert (=> b!1218076 (=> (not res!808535) (not e!691638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78629 (_ BitVec 32)) Bool)

(assert (=> b!1218076 (= res!808535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553510 mask!1564))))

(assert (=> b!1218076 (= lt!553510 (array!78630 (store (arr!37943 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38480 _keys!1208)))))

(declare-fun b!1218077 () Bool)

(assert (=> b!1218077 (= e!691639 e!691637)))

(declare-fun res!808527 () Bool)

(assert (=> b!1218077 (=> res!808527 e!691637)))

(assert (=> b!1218077 (= res!808527 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!553508 () ListLongMap!17931)

(assert (=> b!1218077 (= lt!553508 (getCurrentListMapNoExtraKeys!5438 lt!553510 lt!553511 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3347 (Int (_ BitVec 64)) V!46337)

(assert (=> b!1218077 (= lt!553511 (array!78632 (store (arr!37944 _values!996) i!673 (ValueCellFull!14744 (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38481 _values!996)))))

(declare-fun lt!553512 () ListLongMap!17931)

(assert (=> b!1218077 (= lt!553512 (getCurrentListMapNoExtraKeys!5438 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218078 () Bool)

(declare-fun res!808536 () Bool)

(assert (=> b!1218078 (=> (not res!808536) (not e!691642))))

(assert (=> b!1218078 (= res!808536 (validKeyInArray!0 k0!934))))

(declare-fun b!1218079 () Bool)

(declare-fun res!808532 () Bool)

(assert (=> b!1218079 (=> (not res!808532) (not e!691642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218079 (= res!808532 (validMask!0 mask!1564))))

(declare-fun b!1218080 () Bool)

(declare-fun res!808526 () Bool)

(assert (=> b!1218080 (=> (not res!808526) (not e!691642))))

(assert (=> b!1218080 (= res!808526 (and (= (size!38481 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38480 _keys!1208) (size!38481 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48235 () Bool)

(assert (=> mapIsEmpty!48235 mapRes!48235))

(declare-fun b!1218081 () Bool)

(declare-fun res!808529 () Bool)

(assert (=> b!1218081 (=> (not res!808529) (not e!691642))))

(assert (=> b!1218081 (= res!808529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218082 () Bool)

(assert (=> b!1218082 (= e!691636 tp_is_empty!30907)))

(assert (= (and start!101516 res!808537) b!1218079))

(assert (= (and b!1218079 res!808532) b!1218080))

(assert (= (and b!1218080 res!808526) b!1218081))

(assert (= (and b!1218081 res!808529) b!1218073))

(assert (= (and b!1218073 res!808533) b!1218068))

(assert (= (and b!1218068 res!808525) b!1218078))

(assert (= (and b!1218078 res!808536) b!1218075))

(assert (= (and b!1218075 res!808531) b!1218076))

(assert (= (and b!1218076 res!808535) b!1218067))

(assert (= (and b!1218067 res!808534) b!1218070))

(assert (= (and b!1218070 (not res!808528)) b!1218077))

(assert (= (and b!1218077 (not res!808527)) b!1218074))

(assert (= (and b!1218074 (not res!808530)) b!1218069))

(assert (= (and b!1218072 condMapEmpty!48235) mapIsEmpty!48235))

(assert (= (and b!1218072 (not condMapEmpty!48235)) mapNonEmpty!48235))

(get-info :version)

(assert (= (and mapNonEmpty!48235 ((_ is ValueCellFull!14744) mapValue!48235)) b!1218071))

(assert (= (and b!1218072 ((_ is ValueCellFull!14744) mapDefault!48235)) b!1218082))

(assert (= start!101516 b!1218072))

(declare-fun b_lambda!21873 () Bool)

(assert (=> (not b_lambda!21873) (not b!1218077)))

(declare-fun t!39938 () Bool)

(declare-fun tb!10995 () Bool)

(assert (=> (and start!101516 (= defaultEntry!1004 defaultEntry!1004) t!39938) tb!10995))

(declare-fun result!22595 () Bool)

(assert (=> tb!10995 (= result!22595 tp_is_empty!30907)))

(assert (=> b!1218077 t!39938))

(declare-fun b_and!43527 () Bool)

(assert (= b_and!43525 (and (=> t!39938 result!22595) b_and!43527)))

(declare-fun m!1123089 () Bool)

(assert (=> b!1218077 m!1123089))

(declare-fun m!1123091 () Bool)

(assert (=> b!1218077 m!1123091))

(declare-fun m!1123093 () Bool)

(assert (=> b!1218077 m!1123093))

(declare-fun m!1123095 () Bool)

(assert (=> b!1218077 m!1123095))

(declare-fun m!1123097 () Bool)

(assert (=> start!101516 m!1123097))

(declare-fun m!1123099 () Bool)

(assert (=> start!101516 m!1123099))

(declare-fun m!1123101 () Bool)

(assert (=> b!1218070 m!1123101))

(declare-fun m!1123103 () Bool)

(assert (=> b!1218070 m!1123103))

(declare-fun m!1123105 () Bool)

(assert (=> b!1218067 m!1123105))

(declare-fun m!1123107 () Bool)

(assert (=> b!1218076 m!1123107))

(declare-fun m!1123109 () Bool)

(assert (=> b!1218076 m!1123109))

(declare-fun m!1123111 () Bool)

(assert (=> b!1218079 m!1123111))

(declare-fun m!1123113 () Bool)

(assert (=> mapNonEmpty!48235 m!1123113))

(declare-fun m!1123115 () Bool)

(assert (=> b!1218081 m!1123115))

(declare-fun m!1123117 () Bool)

(assert (=> b!1218074 m!1123117))

(declare-fun m!1123119 () Bool)

(assert (=> b!1218074 m!1123119))

(declare-fun m!1123121 () Bool)

(assert (=> b!1218074 m!1123121))

(assert (=> b!1218074 m!1123117))

(declare-fun m!1123123 () Bool)

(assert (=> b!1218074 m!1123123))

(declare-fun m!1123125 () Bool)

(assert (=> b!1218074 m!1123125))

(declare-fun m!1123127 () Bool)

(assert (=> b!1218074 m!1123127))

(assert (=> b!1218074 m!1123125))

(declare-fun m!1123129 () Bool)

(assert (=> b!1218078 m!1123129))

(declare-fun m!1123131 () Bool)

(assert (=> b!1218075 m!1123131))

(declare-fun m!1123133 () Bool)

(assert (=> b!1218073 m!1123133))

(check-sat (not b!1218079) tp_is_empty!30907 (not b!1218078) (not b!1218081) b_and!43527 (not start!101516) (not b!1218073) (not b!1218076) (not b!1218070) (not b_next!26203) (not b!1218067) (not b_lambda!21873) (not b!1218077) (not b!1218074) (not mapNonEmpty!48235))
(check-sat b_and!43527 (not b_next!26203))
