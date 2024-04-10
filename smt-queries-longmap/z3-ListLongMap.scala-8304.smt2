; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101174 () Bool)

(assert start!101174)

(declare-fun b_free!26097 () Bool)

(declare-fun b_next!26097 () Bool)

(assert (=> start!101174 (= b_free!26097 (not b_next!26097))))

(declare-fun tp!91313 () Bool)

(declare-fun b_and!43311 () Bool)

(assert (=> start!101174 (= tp!91313 b_and!43311)))

(declare-fun b!1214408 () Bool)

(declare-fun e!689656 () Bool)

(declare-fun tp_is_empty!30801 () Bool)

(assert (=> b!1214408 (= e!689656 tp_is_empty!30801)))

(declare-fun b!1214409 () Bool)

(declare-fun res!806231 () Bool)

(declare-fun e!689655 () Bool)

(assert (=> b!1214409 (=> (not res!806231) (not e!689655))))

(declare-datatypes ((array!78385 0))(
  ( (array!78386 (arr!37827 (Array (_ BitVec 32) (_ BitVec 64))) (size!38363 (_ BitVec 32))) )
))
(declare-fun lt!552335 () array!78385)

(declare-datatypes ((List!26668 0))(
  ( (Nil!26665) (Cons!26664 (h!27873 (_ BitVec 64)) (t!39745 List!26668)) )
))
(declare-fun arrayNoDuplicates!0 (array!78385 (_ BitVec 32) List!26668) Bool)

(assert (=> b!1214409 (= res!806231 (arrayNoDuplicates!0 lt!552335 #b00000000000000000000000000000000 Nil!26665))))

(declare-fun b!1214410 () Bool)

(declare-fun res!806234 () Bool)

(declare-fun e!689651 () Bool)

(assert (=> b!1214410 (=> (not res!806234) (not e!689651))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214410 (= res!806234 (validKeyInArray!0 k0!934))))

(declare-fun b!1214412 () Bool)

(declare-fun res!806233 () Bool)

(assert (=> b!1214412 (=> (not res!806233) (not e!689651))))

(declare-fun _keys!1208 () array!78385)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1214412 (= res!806233 (= (select (arr!37827 _keys!1208) i!673) k0!934))))

(declare-fun b!1214413 () Bool)

(declare-fun e!689652 () Bool)

(assert (=> b!1214413 (= e!689652 tp_is_empty!30801)))

(declare-fun b!1214414 () Bool)

(declare-fun res!806239 () Bool)

(assert (=> b!1214414 (=> (not res!806239) (not e!689651))))

(assert (=> b!1214414 (= res!806239 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38363 _keys!1208))))))

(declare-fun mapIsEmpty!48076 () Bool)

(declare-fun mapRes!48076 () Bool)

(assert (=> mapIsEmpty!48076 mapRes!48076))

(declare-fun b!1214415 () Bool)

(assert (=> b!1214415 (= e!689651 e!689655)))

(declare-fun res!806237 () Bool)

(assert (=> b!1214415 (=> (not res!806237) (not e!689655))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78385 (_ BitVec 32)) Bool)

(assert (=> b!1214415 (= res!806237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552335 mask!1564))))

(assert (=> b!1214415 (= lt!552335 (array!78386 (store (arr!37827 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38363 _keys!1208)))))

(declare-fun b!1214416 () Bool)

(declare-fun res!806238 () Bool)

(assert (=> b!1214416 (=> (not res!806238) (not e!689651))))

(assert (=> b!1214416 (= res!806238 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26665))))

(declare-fun b!1214417 () Bool)

(declare-fun res!806230 () Bool)

(assert (=> b!1214417 (=> (not res!806230) (not e!689651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214417 (= res!806230 (validMask!0 mask!1564))))

(declare-fun b!1214418 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!689653 () Bool)

(assert (=> b!1214418 (= e!689653 (or (= from!1455 i!673) (bvsge from!1455 i!673) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38363 _keys!1208)))))))

(declare-datatypes ((V!46195 0))(
  ( (V!46196 (val!15457 Int)) )
))
(declare-fun zeroValue!944 () V!46195)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19870 0))(
  ( (tuple2!19871 (_1!9946 (_ BitVec 64)) (_2!9946 V!46195)) )
))
(declare-datatypes ((List!26669 0))(
  ( (Nil!26666) (Cons!26665 (h!27874 tuple2!19870) (t!39746 List!26669)) )
))
(declare-datatypes ((ListLongMap!17839 0))(
  ( (ListLongMap!17840 (toList!8935 List!26669)) )
))
(declare-fun lt!552336 () ListLongMap!17839)

(declare-datatypes ((ValueCell!14691 0))(
  ( (ValueCellFull!14691 (v!18110 V!46195)) (EmptyCell!14691) )
))
(declare-datatypes ((array!78387 0))(
  ( (array!78388 (arr!37828 (Array (_ BitVec 32) ValueCell!14691)) (size!38364 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78387)

(declare-fun minValue!944 () V!46195)

(declare-fun getCurrentListMapNoExtraKeys!5362 (array!78385 array!78387 (_ BitVec 32) (_ BitVec 32) V!46195 V!46195 (_ BitVec 32) Int) ListLongMap!17839)

(declare-fun dynLambda!3251 (Int (_ BitVec 64)) V!46195)

(assert (=> b!1214418 (= lt!552336 (getCurrentListMapNoExtraKeys!5362 lt!552335 (array!78388 (store (arr!37828 _values!996) i!673 (ValueCellFull!14691 (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38364 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552334 () ListLongMap!17839)

(assert (=> b!1214418 (= lt!552334 (getCurrentListMapNoExtraKeys!5362 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214419 () Bool)

(declare-fun res!806235 () Bool)

(assert (=> b!1214419 (=> (not res!806235) (not e!689651))))

(assert (=> b!1214419 (= res!806235 (and (= (size!38364 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38363 _keys!1208) (size!38364 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214420 () Bool)

(declare-fun res!806232 () Bool)

(assert (=> b!1214420 (=> (not res!806232) (not e!689651))))

(assert (=> b!1214420 (= res!806232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214411 () Bool)

(declare-fun e!689654 () Bool)

(assert (=> b!1214411 (= e!689654 (and e!689652 mapRes!48076))))

(declare-fun condMapEmpty!48076 () Bool)

(declare-fun mapDefault!48076 () ValueCell!14691)

(assert (=> b!1214411 (= condMapEmpty!48076 (= (arr!37828 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14691)) mapDefault!48076)))))

(declare-fun res!806240 () Bool)

(assert (=> start!101174 (=> (not res!806240) (not e!689651))))

(assert (=> start!101174 (= res!806240 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38363 _keys!1208))))))

(assert (=> start!101174 e!689651))

(assert (=> start!101174 tp_is_empty!30801))

(declare-fun array_inv!28804 (array!78385) Bool)

(assert (=> start!101174 (array_inv!28804 _keys!1208)))

(assert (=> start!101174 true))

(assert (=> start!101174 tp!91313))

(declare-fun array_inv!28805 (array!78387) Bool)

(assert (=> start!101174 (and (array_inv!28805 _values!996) e!689654)))

(declare-fun mapNonEmpty!48076 () Bool)

(declare-fun tp!91312 () Bool)

(assert (=> mapNonEmpty!48076 (= mapRes!48076 (and tp!91312 e!689656))))

(declare-fun mapKey!48076 () (_ BitVec 32))

(declare-fun mapValue!48076 () ValueCell!14691)

(declare-fun mapRest!48076 () (Array (_ BitVec 32) ValueCell!14691))

(assert (=> mapNonEmpty!48076 (= (arr!37828 _values!996) (store mapRest!48076 mapKey!48076 mapValue!48076))))

(declare-fun b!1214421 () Bool)

(assert (=> b!1214421 (= e!689655 (not e!689653))))

(declare-fun res!806236 () Bool)

(assert (=> b!1214421 (=> res!806236 e!689653)))

(assert (=> b!1214421 (= res!806236 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214421 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40276 0))(
  ( (Unit!40277) )
))
(declare-fun lt!552333 () Unit!40276)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78385 (_ BitVec 64) (_ BitVec 32)) Unit!40276)

(assert (=> b!1214421 (= lt!552333 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!101174 res!806240) b!1214417))

(assert (= (and b!1214417 res!806230) b!1214419))

(assert (= (and b!1214419 res!806235) b!1214420))

(assert (= (and b!1214420 res!806232) b!1214416))

(assert (= (and b!1214416 res!806238) b!1214414))

(assert (= (and b!1214414 res!806239) b!1214410))

(assert (= (and b!1214410 res!806234) b!1214412))

(assert (= (and b!1214412 res!806233) b!1214415))

(assert (= (and b!1214415 res!806237) b!1214409))

(assert (= (and b!1214409 res!806231) b!1214421))

(assert (= (and b!1214421 (not res!806236)) b!1214418))

(assert (= (and b!1214411 condMapEmpty!48076) mapIsEmpty!48076))

(assert (= (and b!1214411 (not condMapEmpty!48076)) mapNonEmpty!48076))

(get-info :version)

(assert (= (and mapNonEmpty!48076 ((_ is ValueCellFull!14691) mapValue!48076)) b!1214408))

(assert (= (and b!1214411 ((_ is ValueCellFull!14691) mapDefault!48076)) b!1214413))

(assert (= start!101174 b!1214411))

(declare-fun b_lambda!21773 () Bool)

(assert (=> (not b_lambda!21773) (not b!1214418)))

(declare-fun t!39744 () Bool)

(declare-fun tb!10897 () Bool)

(assert (=> (and start!101174 (= defaultEntry!1004 defaultEntry!1004) t!39744) tb!10897))

(declare-fun result!22391 () Bool)

(assert (=> tb!10897 (= result!22391 tp_is_empty!30801)))

(assert (=> b!1214418 t!39744))

(declare-fun b_and!43313 () Bool)

(assert (= b_and!43311 (and (=> t!39744 result!22391) b_and!43313)))

(declare-fun m!1119613 () Bool)

(assert (=> b!1214418 m!1119613))

(declare-fun m!1119615 () Bool)

(assert (=> b!1214418 m!1119615))

(declare-fun m!1119617 () Bool)

(assert (=> b!1214418 m!1119617))

(declare-fun m!1119619 () Bool)

(assert (=> b!1214418 m!1119619))

(declare-fun m!1119621 () Bool)

(assert (=> b!1214412 m!1119621))

(declare-fun m!1119623 () Bool)

(assert (=> b!1214415 m!1119623))

(declare-fun m!1119625 () Bool)

(assert (=> b!1214415 m!1119625))

(declare-fun m!1119627 () Bool)

(assert (=> b!1214410 m!1119627))

(declare-fun m!1119629 () Bool)

(assert (=> b!1214417 m!1119629))

(declare-fun m!1119631 () Bool)

(assert (=> b!1214420 m!1119631))

(declare-fun m!1119633 () Bool)

(assert (=> start!101174 m!1119633))

(declare-fun m!1119635 () Bool)

(assert (=> start!101174 m!1119635))

(declare-fun m!1119637 () Bool)

(assert (=> b!1214421 m!1119637))

(declare-fun m!1119639 () Bool)

(assert (=> b!1214421 m!1119639))

(declare-fun m!1119641 () Bool)

(assert (=> b!1214409 m!1119641))

(declare-fun m!1119643 () Bool)

(assert (=> mapNonEmpty!48076 m!1119643))

(declare-fun m!1119645 () Bool)

(assert (=> b!1214416 m!1119645))

(check-sat (not b!1214410) (not b!1214420) (not b!1214415) (not b!1214416) (not b!1214418) (not b!1214421) (not b_lambda!21773) (not mapNonEmpty!48076) (not b!1214409) b_and!43313 (not b_next!26097) (not start!101174) tp_is_empty!30801 (not b!1214417))
(check-sat b_and!43313 (not b_next!26097))
