; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101712 () Bool)

(assert start!101712)

(declare-fun b_free!26293 () Bool)

(declare-fun b_next!26293 () Bool)

(assert (=> start!101712 (= b_free!26293 (not b_next!26293))))

(declare-fun tp!91912 () Bool)

(declare-fun b_and!43777 () Bool)

(assert (=> start!101712 (= tp!91912 b_and!43777)))

(declare-fun b!1221128 () Bool)

(declare-fun e!693465 () Bool)

(declare-fun e!693464 () Bool)

(assert (=> b!1221128 (= e!693465 e!693464)))

(declare-fun res!810757 () Bool)

(assert (=> b!1221128 (=> res!810757 e!693464)))

(declare-datatypes ((array!78811 0))(
  ( (array!78812 (arr!38030 (Array (_ BitVec 32) (_ BitVec 64))) (size!38567 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78811)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1221128 (= res!810757 (not (= (select (arr!38030 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1221129 () Bool)

(declare-fun e!693469 () Bool)

(declare-fun e!693466 () Bool)

(assert (=> b!1221129 (= e!693469 e!693466)))

(declare-fun res!810760 () Bool)

(assert (=> b!1221129 (=> res!810760 e!693466)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1221129 (= res!810760 (not (validKeyInArray!0 (select (arr!38030 _keys!1208) from!1455))))))

(declare-datatypes ((V!46457 0))(
  ( (V!46458 (val!15555 Int)) )
))
(declare-datatypes ((tuple2!20032 0))(
  ( (tuple2!20033 (_1!10027 (_ BitVec 64)) (_2!10027 V!46457)) )
))
(declare-datatypes ((List!26842 0))(
  ( (Nil!26839) (Cons!26838 (h!28056 tuple2!20032) (t!40107 List!26842)) )
))
(declare-datatypes ((ListLongMap!18009 0))(
  ( (ListLongMap!18010 (toList!9020 List!26842)) )
))
(declare-fun lt!555144 () ListLongMap!18009)

(declare-fun lt!555137 () ListLongMap!18009)

(assert (=> b!1221129 (= lt!555144 lt!555137)))

(declare-fun lt!555143 () ListLongMap!18009)

(declare-fun -!1906 (ListLongMap!18009 (_ BitVec 64)) ListLongMap!18009)

(assert (=> b!1221129 (= lt!555137 (-!1906 lt!555143 k0!934))))

(declare-fun zeroValue!944 () V!46457)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555134 () array!78811)

(declare-datatypes ((ValueCell!14789 0))(
  ( (ValueCellFull!14789 (v!18208 V!46457)) (EmptyCell!14789) )
))
(declare-datatypes ((array!78813 0))(
  ( (array!78814 (arr!38031 (Array (_ BitVec 32) ValueCell!14789)) (size!38568 (_ BitVec 32))) )
))
(declare-fun lt!555135 () array!78813)

(declare-fun minValue!944 () V!46457)

(declare-fun getCurrentListMapNoExtraKeys!5475 (array!78811 array!78813 (_ BitVec 32) (_ BitVec 32) V!46457 V!46457 (_ BitVec 32) Int) ListLongMap!18009)

(assert (=> b!1221129 (= lt!555144 (getCurrentListMapNoExtraKeys!5475 lt!555134 lt!555135 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78813)

(assert (=> b!1221129 (= lt!555143 (getCurrentListMapNoExtraKeys!5475 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40398 0))(
  ( (Unit!40399) )
))
(declare-fun lt!555141 () Unit!40398)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1121 (array!78811 array!78813 (_ BitVec 32) (_ BitVec 32) V!46457 V!46457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40398)

(assert (=> b!1221129 (= lt!555141 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1121 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221130 () Bool)

(declare-fun e!693467 () Bool)

(declare-fun tp_is_empty!30997 () Bool)

(assert (=> b!1221130 (= e!693467 tp_is_empty!30997)))

(declare-fun b!1221131 () Bool)

(declare-fun res!810766 () Bool)

(declare-fun e!693473 () Bool)

(assert (=> b!1221131 (=> (not res!810766) (not e!693473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1221131 (= res!810766 (validMask!0 mask!1564))))

(declare-fun b!1221132 () Bool)

(declare-fun res!810763 () Bool)

(declare-fun e!693471 () Bool)

(assert (=> b!1221132 (=> (not res!810763) (not e!693471))))

(declare-datatypes ((List!26843 0))(
  ( (Nil!26840) (Cons!26839 (h!28057 (_ BitVec 64)) (t!40108 List!26843)) )
))
(declare-fun arrayNoDuplicates!0 (array!78811 (_ BitVec 32) List!26843) Bool)

(assert (=> b!1221132 (= res!810763 (arrayNoDuplicates!0 lt!555134 #b00000000000000000000000000000000 Nil!26840))))

(declare-fun b!1221133 () Bool)

(declare-fun e!693475 () Bool)

(assert (=> b!1221133 (= e!693475 tp_is_empty!30997)))

(declare-fun b!1221134 () Bool)

(declare-fun res!810767 () Bool)

(assert (=> b!1221134 (=> (not res!810767) (not e!693473))))

(assert (=> b!1221134 (= res!810767 (validKeyInArray!0 k0!934))))

(declare-fun b!1221135 () Bool)

(assert (=> b!1221135 (= e!693473 e!693471)))

(declare-fun res!810768 () Bool)

(assert (=> b!1221135 (=> (not res!810768) (not e!693471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78811 (_ BitVec 32)) Bool)

(assert (=> b!1221135 (= res!810768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555134 mask!1564))))

(assert (=> b!1221135 (= lt!555134 (array!78812 (store (arr!38030 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38567 _keys!1208)))))

(declare-fun b!1221136 () Bool)

(declare-fun e!693472 () Bool)

(assert (=> b!1221136 (= e!693466 e!693472)))

(declare-fun res!810764 () Bool)

(assert (=> b!1221136 (=> res!810764 e!693472)))

(assert (=> b!1221136 (= res!810764 (not (= (select (arr!38030 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1221136 e!693465))

(declare-fun res!810755 () Bool)

(assert (=> b!1221136 (=> (not res!810755) (not e!693465))))

(declare-fun lt!555136 () V!46457)

(declare-fun lt!555138 () ListLongMap!18009)

(declare-fun +!4130 (ListLongMap!18009 tuple2!20032) ListLongMap!18009)

(declare-fun get!19440 (ValueCell!14789 V!46457) V!46457)

(assert (=> b!1221136 (= res!810755 (= lt!555138 (+!4130 lt!555137 (tuple2!20033 (select (arr!38030 _keys!1208) from!1455) (get!19440 (select (arr!38031 _values!996) from!1455) lt!555136)))))))

(declare-fun b!1221137 () Bool)

(declare-fun e!693470 () Bool)

(declare-fun mapRes!48382 () Bool)

(assert (=> b!1221137 (= e!693470 (and e!693475 mapRes!48382))))

(declare-fun condMapEmpty!48382 () Bool)

(declare-fun mapDefault!48382 () ValueCell!14789)

(assert (=> b!1221137 (= condMapEmpty!48382 (= (arr!38031 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14789)) mapDefault!48382)))))

(declare-fun b!1221138 () Bool)

(assert (=> b!1221138 (= e!693472 true)))

(declare-fun arrayContainsKey!0 (array!78811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221138 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555142 () Unit!40398)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78811 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40398)

(assert (=> b!1221138 (= lt!555142 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1221139 () Bool)

(declare-fun res!810770 () Bool)

(assert (=> b!1221139 (=> (not res!810770) (not e!693473))))

(assert (=> b!1221139 (= res!810770 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38567 _keys!1208))))))

(declare-fun b!1221140 () Bool)

(declare-fun e!693474 () Bool)

(assert (=> b!1221140 (= e!693471 (not e!693474))))

(declare-fun res!810756 () Bool)

(assert (=> b!1221140 (=> res!810756 e!693474)))

(assert (=> b!1221140 (= res!810756 (bvsgt from!1455 i!673))))

(assert (=> b!1221140 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555139 () Unit!40398)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78811 (_ BitVec 64) (_ BitVec 32)) Unit!40398)

(assert (=> b!1221140 (= lt!555139 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!810769 () Bool)

(assert (=> start!101712 (=> (not res!810769) (not e!693473))))

(assert (=> start!101712 (= res!810769 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38567 _keys!1208))))))

(assert (=> start!101712 e!693473))

(assert (=> start!101712 tp_is_empty!30997))

(declare-fun array_inv!29016 (array!78811) Bool)

(assert (=> start!101712 (array_inv!29016 _keys!1208)))

(assert (=> start!101712 true))

(assert (=> start!101712 tp!91912))

(declare-fun array_inv!29017 (array!78813) Bool)

(assert (=> start!101712 (and (array_inv!29017 _values!996) e!693470)))

(declare-fun b!1221141 () Bool)

(declare-fun res!810758 () Bool)

(assert (=> b!1221141 (=> (not res!810758) (not e!693473))))

(assert (=> b!1221141 (= res!810758 (and (= (size!38568 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38567 _keys!1208) (size!38568 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1221142 () Bool)

(declare-fun res!810761 () Bool)

(assert (=> b!1221142 (=> (not res!810761) (not e!693473))))

(assert (=> b!1221142 (= res!810761 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26840))))

(declare-fun mapIsEmpty!48382 () Bool)

(assert (=> mapIsEmpty!48382 mapRes!48382))

(declare-fun mapNonEmpty!48382 () Bool)

(declare-fun tp!91913 () Bool)

(assert (=> mapNonEmpty!48382 (= mapRes!48382 (and tp!91913 e!693467))))

(declare-fun mapKey!48382 () (_ BitVec 32))

(declare-fun mapRest!48382 () (Array (_ BitVec 32) ValueCell!14789))

(declare-fun mapValue!48382 () ValueCell!14789)

(assert (=> mapNonEmpty!48382 (= (arr!38031 _values!996) (store mapRest!48382 mapKey!48382 mapValue!48382))))

(declare-fun b!1221143 () Bool)

(declare-fun res!810759 () Bool)

(assert (=> b!1221143 (=> (not res!810759) (not e!693473))))

(assert (=> b!1221143 (= res!810759 (= (select (arr!38030 _keys!1208) i!673) k0!934))))

(declare-fun b!1221144 () Bool)

(assert (=> b!1221144 (= e!693464 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221145 () Bool)

(declare-fun res!810762 () Bool)

(assert (=> b!1221145 (=> (not res!810762) (not e!693473))))

(assert (=> b!1221145 (= res!810762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1221146 () Bool)

(assert (=> b!1221146 (= e!693474 e!693469)))

(declare-fun res!810765 () Bool)

(assert (=> b!1221146 (=> res!810765 e!693469)))

(assert (=> b!1221146 (= res!810765 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1221146 (= lt!555138 (getCurrentListMapNoExtraKeys!5475 lt!555134 lt!555135 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1221146 (= lt!555135 (array!78814 (store (arr!38031 _values!996) i!673 (ValueCellFull!14789 lt!555136)) (size!38568 _values!996)))))

(declare-fun dynLambda!3376 (Int (_ BitVec 64)) V!46457)

(assert (=> b!1221146 (= lt!555136 (dynLambda!3376 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555140 () ListLongMap!18009)

(assert (=> b!1221146 (= lt!555140 (getCurrentListMapNoExtraKeys!5475 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101712 res!810769) b!1221131))

(assert (= (and b!1221131 res!810766) b!1221141))

(assert (= (and b!1221141 res!810758) b!1221145))

(assert (= (and b!1221145 res!810762) b!1221142))

(assert (= (and b!1221142 res!810761) b!1221139))

(assert (= (and b!1221139 res!810770) b!1221134))

(assert (= (and b!1221134 res!810767) b!1221143))

(assert (= (and b!1221143 res!810759) b!1221135))

(assert (= (and b!1221135 res!810768) b!1221132))

(assert (= (and b!1221132 res!810763) b!1221140))

(assert (= (and b!1221140 (not res!810756)) b!1221146))

(assert (= (and b!1221146 (not res!810765)) b!1221129))

(assert (= (and b!1221129 (not res!810760)) b!1221136))

(assert (= (and b!1221136 res!810755) b!1221128))

(assert (= (and b!1221128 (not res!810757)) b!1221144))

(assert (= (and b!1221136 (not res!810764)) b!1221138))

(assert (= (and b!1221137 condMapEmpty!48382) mapIsEmpty!48382))

(assert (= (and b!1221137 (not condMapEmpty!48382)) mapNonEmpty!48382))

(get-info :version)

(assert (= (and mapNonEmpty!48382 ((_ is ValueCellFull!14789) mapValue!48382)) b!1221130))

(assert (= (and b!1221137 ((_ is ValueCellFull!14789) mapDefault!48382)) b!1221133))

(assert (= start!101712 b!1221137))

(declare-fun b_lambda!22115 () Bool)

(assert (=> (not b_lambda!22115) (not b!1221146)))

(declare-fun t!40106 () Bool)

(declare-fun tb!11085 () Bool)

(assert (=> (and start!101712 (= defaultEntry!1004 defaultEntry!1004) t!40106) tb!11085))

(declare-fun result!22783 () Bool)

(assert (=> tb!11085 (= result!22783 tp_is_empty!30997)))

(assert (=> b!1221146 t!40106))

(declare-fun b_and!43779 () Bool)

(assert (= b_and!43777 (and (=> t!40106 result!22783) b_and!43779)))

(declare-fun m!1126205 () Bool)

(assert (=> b!1221138 m!1126205))

(declare-fun m!1126207 () Bool)

(assert (=> b!1221138 m!1126207))

(declare-fun m!1126209 () Bool)

(assert (=> b!1221136 m!1126209))

(declare-fun m!1126211 () Bool)

(assert (=> b!1221136 m!1126211))

(assert (=> b!1221136 m!1126211))

(declare-fun m!1126213 () Bool)

(assert (=> b!1221136 m!1126213))

(declare-fun m!1126215 () Bool)

(assert (=> b!1221136 m!1126215))

(assert (=> b!1221128 m!1126209))

(declare-fun m!1126217 () Bool)

(assert (=> b!1221146 m!1126217))

(declare-fun m!1126219 () Bool)

(assert (=> b!1221146 m!1126219))

(declare-fun m!1126221 () Bool)

(assert (=> b!1221146 m!1126221))

(declare-fun m!1126223 () Bool)

(assert (=> b!1221146 m!1126223))

(declare-fun m!1126225 () Bool)

(assert (=> mapNonEmpty!48382 m!1126225))

(declare-fun m!1126227 () Bool)

(assert (=> b!1221129 m!1126227))

(declare-fun m!1126229 () Bool)

(assert (=> b!1221129 m!1126229))

(assert (=> b!1221129 m!1126209))

(declare-fun m!1126231 () Bool)

(assert (=> b!1221129 m!1126231))

(assert (=> b!1221129 m!1126209))

(declare-fun m!1126233 () Bool)

(assert (=> b!1221129 m!1126233))

(declare-fun m!1126235 () Bool)

(assert (=> b!1221129 m!1126235))

(declare-fun m!1126237 () Bool)

(assert (=> b!1221134 m!1126237))

(declare-fun m!1126239 () Bool)

(assert (=> b!1221145 m!1126239))

(declare-fun m!1126241 () Bool)

(assert (=> b!1221142 m!1126241))

(declare-fun m!1126243 () Bool)

(assert (=> b!1221132 m!1126243))

(declare-fun m!1126245 () Bool)

(assert (=> b!1221140 m!1126245))

(declare-fun m!1126247 () Bool)

(assert (=> b!1221140 m!1126247))

(declare-fun m!1126249 () Bool)

(assert (=> start!101712 m!1126249))

(declare-fun m!1126251 () Bool)

(assert (=> start!101712 m!1126251))

(declare-fun m!1126253 () Bool)

(assert (=> b!1221143 m!1126253))

(declare-fun m!1126255 () Bool)

(assert (=> b!1221131 m!1126255))

(declare-fun m!1126257 () Bool)

(assert (=> b!1221135 m!1126257))

(declare-fun m!1126259 () Bool)

(assert (=> b!1221135 m!1126259))

(declare-fun m!1126261 () Bool)

(assert (=> b!1221144 m!1126261))

(check-sat (not b_next!26293) (not b!1221138) (not b!1221145) (not mapNonEmpty!48382) (not b_lambda!22115) (not b!1221135) (not b!1221142) (not start!101712) (not b!1221132) tp_is_empty!30997 (not b!1221144) b_and!43779 (not b!1221136) (not b!1221129) (not b!1221146) (not b!1221131) (not b!1221134) (not b!1221140))
(check-sat b_and!43779 (not b_next!26293))
