; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99954 () Bool)

(assert start!99954)

(declare-fun b_free!25533 () Bool)

(declare-fun b_next!25533 () Bool)

(assert (=> start!99954 (= b_free!25533 (not b_next!25533))))

(declare-fun tp!89312 () Bool)

(declare-fun b_and!41933 () Bool)

(assert (=> start!99954 (= tp!89312 b_and!41933)))

(declare-fun b!1190199 () Bool)

(declare-fun res!791530 () Bool)

(declare-fun e!676640 () Bool)

(assert (=> b!1190199 (=> (not res!791530) (not e!676640))))

(declare-datatypes ((array!76917 0))(
  ( (array!76918 (arr!37108 (Array (_ BitVec 32) (_ BitVec 64))) (size!37644 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76917)

(declare-datatypes ((List!26124 0))(
  ( (Nil!26121) (Cons!26120 (h!27329 (_ BitVec 64)) (t!38649 List!26124)) )
))
(declare-fun arrayNoDuplicates!0 (array!76917 (_ BitVec 32) List!26124) Bool)

(assert (=> b!1190199 (= res!791530 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26121))))

(declare-fun b!1190200 () Bool)

(declare-fun res!791536 () Bool)

(assert (=> b!1190200 (=> (not res!791536) (not e!676640))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45211 0))(
  ( (V!45212 (val!15088 Int)) )
))
(declare-datatypes ((ValueCell!14322 0))(
  ( (ValueCellFull!14322 (v!17726 V!45211)) (EmptyCell!14322) )
))
(declare-datatypes ((array!76919 0))(
  ( (array!76920 (arr!37109 (Array (_ BitVec 32) ValueCell!14322)) (size!37645 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76919)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1190200 (= res!791536 (and (= (size!37645 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37644 _keys!1208) (size!37645 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190201 () Bool)

(declare-fun res!791534 () Bool)

(assert (=> b!1190201 (=> (not res!791534) (not e!676640))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190201 (= res!791534 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37644 _keys!1208))))))

(declare-fun b!1190202 () Bool)

(declare-fun res!791533 () Bool)

(assert (=> b!1190202 (=> (not res!791533) (not e!676640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190202 (= res!791533 (validMask!0 mask!1564))))

(declare-fun b!1190203 () Bool)

(declare-fun e!676636 () Bool)

(assert (=> b!1190203 (= e!676640 e!676636)))

(declare-fun res!791528 () Bool)

(assert (=> b!1190203 (=> (not res!791528) (not e!676636))))

(declare-fun lt!541358 () array!76917)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76917 (_ BitVec 32)) Bool)

(assert (=> b!1190203 (= res!791528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541358 mask!1564))))

(assert (=> b!1190203 (= lt!541358 (array!76918 (store (arr!37108 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37644 _keys!1208)))))

(declare-fun b!1190204 () Bool)

(declare-fun e!676641 () Bool)

(declare-fun tp_is_empty!30063 () Bool)

(assert (=> b!1190204 (= e!676641 tp_is_empty!30063)))

(declare-fun mapNonEmpty!46922 () Bool)

(declare-fun mapRes!46922 () Bool)

(declare-fun tp!89313 () Bool)

(assert (=> mapNonEmpty!46922 (= mapRes!46922 (and tp!89313 e!676641))))

(declare-fun mapRest!46922 () (Array (_ BitVec 32) ValueCell!14322))

(declare-fun mapKey!46922 () (_ BitVec 32))

(declare-fun mapValue!46922 () ValueCell!14322)

(assert (=> mapNonEmpty!46922 (= (arr!37109 _values!996) (store mapRest!46922 mapKey!46922 mapValue!46922))))

(declare-fun res!791532 () Bool)

(assert (=> start!99954 (=> (not res!791532) (not e!676640))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99954 (= res!791532 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37644 _keys!1208))))))

(assert (=> start!99954 e!676640))

(assert (=> start!99954 tp_is_empty!30063))

(declare-fun array_inv!28300 (array!76917) Bool)

(assert (=> start!99954 (array_inv!28300 _keys!1208)))

(assert (=> start!99954 true))

(assert (=> start!99954 tp!89312))

(declare-fun e!676639 () Bool)

(declare-fun array_inv!28301 (array!76919) Bool)

(assert (=> start!99954 (and (array_inv!28301 _values!996) e!676639)))

(declare-fun b!1190205 () Bool)

(declare-fun res!791538 () Bool)

(assert (=> b!1190205 (=> (not res!791538) (not e!676640))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1190205 (= res!791538 (= (select (arr!37108 _keys!1208) i!673) k0!934))))

(declare-fun b!1190206 () Bool)

(declare-fun res!791529 () Bool)

(assert (=> b!1190206 (=> (not res!791529) (not e!676640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190206 (= res!791529 (validKeyInArray!0 k0!934))))

(declare-fun b!1190207 () Bool)

(declare-fun e!676635 () Bool)

(assert (=> b!1190207 (= e!676635 true)))

(declare-fun zeroValue!944 () V!45211)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541360 () array!76919)

(declare-fun minValue!944 () V!45211)

(declare-datatypes ((tuple2!19378 0))(
  ( (tuple2!19379 (_1!9700 (_ BitVec 64)) (_2!9700 V!45211)) )
))
(declare-datatypes ((List!26125 0))(
  ( (Nil!26122) (Cons!26121 (h!27330 tuple2!19378) (t!38650 List!26125)) )
))
(declare-datatypes ((ListLongMap!17347 0))(
  ( (ListLongMap!17348 (toList!8689 List!26125)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5130 (array!76917 array!76919 (_ BitVec 32) (_ BitVec 32) V!45211 V!45211 (_ BitVec 32) Int) ListLongMap!17347)

(declare-fun -!1716 (ListLongMap!17347 (_ BitVec 64)) ListLongMap!17347)

(assert (=> b!1190207 (= (getCurrentListMapNoExtraKeys!5130 lt!541358 lt!541360 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1716 (getCurrentListMapNoExtraKeys!5130 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39474 0))(
  ( (Unit!39475) )
))
(declare-fun lt!541357 () Unit!39474)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!925 (array!76917 array!76919 (_ BitVec 32) (_ BitVec 32) V!45211 V!45211 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39474)

(assert (=> b!1190207 (= lt!541357 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!925 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46922 () Bool)

(assert (=> mapIsEmpty!46922 mapRes!46922))

(declare-fun b!1190208 () Bool)

(declare-fun e!676642 () Bool)

(assert (=> b!1190208 (= e!676636 (not e!676642))))

(declare-fun res!791531 () Bool)

(assert (=> b!1190208 (=> res!791531 e!676642)))

(assert (=> b!1190208 (= res!791531 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190208 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541362 () Unit!39474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76917 (_ BitVec 64) (_ BitVec 32)) Unit!39474)

(assert (=> b!1190208 (= lt!541362 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190209 () Bool)

(declare-fun res!791535 () Bool)

(assert (=> b!1190209 (=> (not res!791535) (not e!676636))))

(assert (=> b!1190209 (= res!791535 (arrayNoDuplicates!0 lt!541358 #b00000000000000000000000000000000 Nil!26121))))

(declare-fun b!1190210 () Bool)

(declare-fun e!676637 () Bool)

(assert (=> b!1190210 (= e!676637 tp_is_empty!30063)))

(declare-fun b!1190211 () Bool)

(declare-fun res!791539 () Bool)

(assert (=> b!1190211 (=> (not res!791539) (not e!676640))))

(assert (=> b!1190211 (= res!791539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190212 () Bool)

(assert (=> b!1190212 (= e!676642 e!676635)))

(declare-fun res!791537 () Bool)

(assert (=> b!1190212 (=> res!791537 e!676635)))

(assert (=> b!1190212 (= res!791537 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541361 () ListLongMap!17347)

(assert (=> b!1190212 (= lt!541361 (getCurrentListMapNoExtraKeys!5130 lt!541358 lt!541360 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3071 (Int (_ BitVec 64)) V!45211)

(assert (=> b!1190212 (= lt!541360 (array!76920 (store (arr!37109 _values!996) i!673 (ValueCellFull!14322 (dynLambda!3071 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37645 _values!996)))))

(declare-fun lt!541359 () ListLongMap!17347)

(assert (=> b!1190212 (= lt!541359 (getCurrentListMapNoExtraKeys!5130 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190213 () Bool)

(assert (=> b!1190213 (= e!676639 (and e!676637 mapRes!46922))))

(declare-fun condMapEmpty!46922 () Bool)

(declare-fun mapDefault!46922 () ValueCell!14322)

(assert (=> b!1190213 (= condMapEmpty!46922 (= (arr!37109 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14322)) mapDefault!46922)))))

(assert (= (and start!99954 res!791532) b!1190202))

(assert (= (and b!1190202 res!791533) b!1190200))

(assert (= (and b!1190200 res!791536) b!1190211))

(assert (= (and b!1190211 res!791539) b!1190199))

(assert (= (and b!1190199 res!791530) b!1190201))

(assert (= (and b!1190201 res!791534) b!1190206))

(assert (= (and b!1190206 res!791529) b!1190205))

(assert (= (and b!1190205 res!791538) b!1190203))

(assert (= (and b!1190203 res!791528) b!1190209))

(assert (= (and b!1190209 res!791535) b!1190208))

(assert (= (and b!1190208 (not res!791531)) b!1190212))

(assert (= (and b!1190212 (not res!791537)) b!1190207))

(assert (= (and b!1190213 condMapEmpty!46922) mapIsEmpty!46922))

(assert (= (and b!1190213 (not condMapEmpty!46922)) mapNonEmpty!46922))

(get-info :version)

(assert (= (and mapNonEmpty!46922 ((_ is ValueCellFull!14322) mapValue!46922)) b!1190204))

(assert (= (and b!1190213 ((_ is ValueCellFull!14322) mapDefault!46922)) b!1190210))

(assert (= start!99954 b!1190213))

(declare-fun b_lambda!20677 () Bool)

(assert (=> (not b_lambda!20677) (not b!1190212)))

(declare-fun t!38648 () Bool)

(declare-fun tb!10345 () Bool)

(assert (=> (and start!99954 (= defaultEntry!1004 defaultEntry!1004) t!38648) tb!10345))

(declare-fun result!21257 () Bool)

(assert (=> tb!10345 (= result!21257 tp_is_empty!30063)))

(assert (=> b!1190212 t!38648))

(declare-fun b_and!41935 () Bool)

(assert (= b_and!41933 (and (=> t!38648 result!21257) b_and!41935)))

(declare-fun m!1098795 () Bool)

(assert (=> b!1190202 m!1098795))

(declare-fun m!1098797 () Bool)

(assert (=> b!1190208 m!1098797))

(declare-fun m!1098799 () Bool)

(assert (=> b!1190208 m!1098799))

(declare-fun m!1098801 () Bool)

(assert (=> b!1190209 m!1098801))

(declare-fun m!1098803 () Bool)

(assert (=> mapNonEmpty!46922 m!1098803))

(declare-fun m!1098805 () Bool)

(assert (=> b!1190203 m!1098805))

(declare-fun m!1098807 () Bool)

(assert (=> b!1190203 m!1098807))

(declare-fun m!1098809 () Bool)

(assert (=> start!99954 m!1098809))

(declare-fun m!1098811 () Bool)

(assert (=> start!99954 m!1098811))

(declare-fun m!1098813 () Bool)

(assert (=> b!1190205 m!1098813))

(declare-fun m!1098815 () Bool)

(assert (=> b!1190211 m!1098815))

(declare-fun m!1098817 () Bool)

(assert (=> b!1190207 m!1098817))

(declare-fun m!1098819 () Bool)

(assert (=> b!1190207 m!1098819))

(assert (=> b!1190207 m!1098819))

(declare-fun m!1098821 () Bool)

(assert (=> b!1190207 m!1098821))

(declare-fun m!1098823 () Bool)

(assert (=> b!1190207 m!1098823))

(declare-fun m!1098825 () Bool)

(assert (=> b!1190199 m!1098825))

(declare-fun m!1098827 () Bool)

(assert (=> b!1190212 m!1098827))

(declare-fun m!1098829 () Bool)

(assert (=> b!1190212 m!1098829))

(declare-fun m!1098831 () Bool)

(assert (=> b!1190212 m!1098831))

(declare-fun m!1098833 () Bool)

(assert (=> b!1190212 m!1098833))

(declare-fun m!1098835 () Bool)

(assert (=> b!1190206 m!1098835))

(check-sat (not b_next!25533) (not mapNonEmpty!46922) b_and!41935 (not b!1190208) (not b_lambda!20677) (not start!99954) (not b!1190212) (not b!1190211) (not b!1190203) (not b!1190206) (not b!1190199) tp_is_empty!30063 (not b!1190209) (not b!1190207) (not b!1190202))
(check-sat b_and!41935 (not b_next!25533))
