; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101178 () Bool)

(assert start!101178)

(declare-fun b_free!26107 () Bool)

(declare-fun b_next!26107 () Bool)

(assert (=> start!101178 (= b_free!26107 (not b_next!26107))))

(declare-fun tp!91343 () Bool)

(declare-fun b_and!43313 () Bool)

(assert (=> start!101178 (= tp!91343 b_and!43313)))

(declare-fun b!1214519 () Bool)

(declare-fun res!806344 () Bool)

(declare-fun e!689689 () Bool)

(assert (=> b!1214519 (=> (not res!806344) (not e!689689))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78320 0))(
  ( (array!78321 (arr!37795 (Array (_ BitVec 32) (_ BitVec 64))) (size!38333 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78320)

(assert (=> b!1214519 (= res!806344 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38333 _keys!1208))))))

(declare-fun b!1214520 () Bool)

(declare-fun e!689691 () Bool)

(declare-fun e!689686 () Bool)

(declare-fun mapRes!48091 () Bool)

(assert (=> b!1214520 (= e!689691 (and e!689686 mapRes!48091))))

(declare-fun condMapEmpty!48091 () Bool)

(declare-datatypes ((V!46209 0))(
  ( (V!46210 (val!15462 Int)) )
))
(declare-datatypes ((ValueCell!14696 0))(
  ( (ValueCellFull!14696 (v!18114 V!46209)) (EmptyCell!14696) )
))
(declare-datatypes ((array!78322 0))(
  ( (array!78323 (arr!37796 (Array (_ BitVec 32) ValueCell!14696)) (size!38334 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78322)

(declare-fun mapDefault!48091 () ValueCell!14696)

(assert (=> b!1214520 (= condMapEmpty!48091 (= (arr!37796 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14696)) mapDefault!48091)))))

(declare-fun b!1214521 () Bool)

(declare-fun res!806338 () Bool)

(assert (=> b!1214521 (=> (not res!806338) (not e!689689))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214521 (= res!806338 (validKeyInArray!0 k0!934))))

(declare-fun b!1214522 () Bool)

(declare-fun res!806335 () Bool)

(declare-fun e!689688 () Bool)

(assert (=> b!1214522 (=> (not res!806335) (not e!689688))))

(declare-fun lt!552215 () array!78320)

(declare-datatypes ((List!26731 0))(
  ( (Nil!26728) (Cons!26727 (h!27936 (_ BitVec 64)) (t!39809 List!26731)) )
))
(declare-fun arrayNoDuplicates!0 (array!78320 (_ BitVec 32) List!26731) Bool)

(assert (=> b!1214522 (= res!806335 (arrayNoDuplicates!0 lt!552215 #b00000000000000000000000000000000 Nil!26728))))

(declare-fun mapNonEmpty!48091 () Bool)

(declare-fun tp!91342 () Bool)

(declare-fun e!689690 () Bool)

(assert (=> mapNonEmpty!48091 (= mapRes!48091 (and tp!91342 e!689690))))

(declare-fun mapRest!48091 () (Array (_ BitVec 32) ValueCell!14696))

(declare-fun mapValue!48091 () ValueCell!14696)

(declare-fun mapKey!48091 () (_ BitVec 32))

(assert (=> mapNonEmpty!48091 (= (arr!37796 _values!996) (store mapRest!48091 mapKey!48091 mapValue!48091))))

(declare-fun b!1214523 () Bool)

(declare-fun e!689687 () Bool)

(assert (=> b!1214523 (= e!689688 (not e!689687))))

(declare-fun res!806342 () Bool)

(assert (=> b!1214523 (=> res!806342 e!689687)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1214523 (= res!806342 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214523 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40129 0))(
  ( (Unit!40130) )
))
(declare-fun lt!552212 () Unit!40129)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78320 (_ BitVec 64) (_ BitVec 32)) Unit!40129)

(assert (=> b!1214523 (= lt!552212 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1214524 () Bool)

(declare-fun tp_is_empty!30811 () Bool)

(assert (=> b!1214524 (= e!689690 tp_is_empty!30811)))

(declare-fun mapIsEmpty!48091 () Bool)

(assert (=> mapIsEmpty!48091 mapRes!48091))

(declare-fun b!1214526 () Bool)

(declare-fun res!806341 () Bool)

(assert (=> b!1214526 (=> (not res!806341) (not e!689689))))

(assert (=> b!1214526 (= res!806341 (= (select (arr!37795 _keys!1208) i!673) k0!934))))

(declare-fun b!1214527 () Bool)

(declare-fun res!806340 () Bool)

(assert (=> b!1214527 (=> (not res!806340) (not e!689689))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1214527 (= res!806340 (and (= (size!38334 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38333 _keys!1208) (size!38334 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214528 () Bool)

(assert (=> b!1214528 (= e!689687 true)))

(declare-fun zeroValue!944 () V!46209)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19954 0))(
  ( (tuple2!19955 (_1!9988 (_ BitVec 64)) (_2!9988 V!46209)) )
))
(declare-datatypes ((List!26732 0))(
  ( (Nil!26729) (Cons!26728 (h!27937 tuple2!19954) (t!39810 List!26732)) )
))
(declare-datatypes ((ListLongMap!17923 0))(
  ( (ListLongMap!17924 (toList!8977 List!26732)) )
))
(declare-fun lt!552213 () ListLongMap!17923)

(declare-fun minValue!944 () V!46209)

(declare-fun getCurrentListMapNoExtraKeys!5416 (array!78320 array!78322 (_ BitVec 32) (_ BitVec 32) V!46209 V!46209 (_ BitVec 32) Int) ListLongMap!17923)

(declare-fun dynLambda!3268 (Int (_ BitVec 64)) V!46209)

(assert (=> b!1214528 (= lt!552213 (getCurrentListMapNoExtraKeys!5416 lt!552215 (array!78323 (store (arr!37796 _values!996) i!673 (ValueCellFull!14696 (dynLambda!3268 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38334 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552214 () ListLongMap!17923)

(assert (=> b!1214528 (= lt!552214 (getCurrentListMapNoExtraKeys!5416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214525 () Bool)

(declare-fun res!806343 () Bool)

(assert (=> b!1214525 (=> (not res!806343) (not e!689689))))

(assert (=> b!1214525 (= res!806343 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26728))))

(declare-fun res!806337 () Bool)

(assert (=> start!101178 (=> (not res!806337) (not e!689689))))

(assert (=> start!101178 (= res!806337 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38333 _keys!1208))))))

(assert (=> start!101178 e!689689))

(assert (=> start!101178 tp_is_empty!30811))

(declare-fun array_inv!28892 (array!78320) Bool)

(assert (=> start!101178 (array_inv!28892 _keys!1208)))

(assert (=> start!101178 true))

(assert (=> start!101178 tp!91343))

(declare-fun array_inv!28893 (array!78322) Bool)

(assert (=> start!101178 (and (array_inv!28893 _values!996) e!689691)))

(declare-fun b!1214529 () Bool)

(assert (=> b!1214529 (= e!689689 e!689688)))

(declare-fun res!806339 () Bool)

(assert (=> b!1214529 (=> (not res!806339) (not e!689688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78320 (_ BitVec 32)) Bool)

(assert (=> b!1214529 (= res!806339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552215 mask!1564))))

(assert (=> b!1214529 (= lt!552215 (array!78321 (store (arr!37795 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38333 _keys!1208)))))

(declare-fun b!1214530 () Bool)

(assert (=> b!1214530 (= e!689686 tp_is_empty!30811)))

(declare-fun b!1214531 () Bool)

(declare-fun res!806336 () Bool)

(assert (=> b!1214531 (=> (not res!806336) (not e!689689))))

(assert (=> b!1214531 (= res!806336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214532 () Bool)

(declare-fun res!806334 () Bool)

(assert (=> b!1214532 (=> (not res!806334) (not e!689689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214532 (= res!806334 (validMask!0 mask!1564))))

(assert (= (and start!101178 res!806337) b!1214532))

(assert (= (and b!1214532 res!806334) b!1214527))

(assert (= (and b!1214527 res!806340) b!1214531))

(assert (= (and b!1214531 res!806336) b!1214525))

(assert (= (and b!1214525 res!806343) b!1214519))

(assert (= (and b!1214519 res!806344) b!1214521))

(assert (= (and b!1214521 res!806338) b!1214526))

(assert (= (and b!1214526 res!806341) b!1214529))

(assert (= (and b!1214529 res!806339) b!1214522))

(assert (= (and b!1214522 res!806335) b!1214523))

(assert (= (and b!1214523 (not res!806342)) b!1214528))

(assert (= (and b!1214520 condMapEmpty!48091) mapIsEmpty!48091))

(assert (= (and b!1214520 (not condMapEmpty!48091)) mapNonEmpty!48091))

(get-info :version)

(assert (= (and mapNonEmpty!48091 ((_ is ValueCellFull!14696) mapValue!48091)) b!1214524))

(assert (= (and b!1214520 ((_ is ValueCellFull!14696) mapDefault!48091)) b!1214530))

(assert (= start!101178 b!1214520))

(declare-fun b_lambda!21773 () Bool)

(assert (=> (not b_lambda!21773) (not b!1214528)))

(declare-fun t!39808 () Bool)

(declare-fun tb!10899 () Bool)

(assert (=> (and start!101178 (= defaultEntry!1004 defaultEntry!1004) t!39808) tb!10899))

(declare-fun result!22403 () Bool)

(assert (=> tb!10899 (= result!22403 tp_is_empty!30811)))

(assert (=> b!1214528 t!39808))

(declare-fun b_and!43315 () Bool)

(assert (= b_and!43313 (and (=> t!39808 result!22403) b_and!43315)))

(declare-fun m!1119219 () Bool)

(assert (=> mapNonEmpty!48091 m!1119219))

(declare-fun m!1119221 () Bool)

(assert (=> b!1214521 m!1119221))

(declare-fun m!1119223 () Bool)

(assert (=> b!1214529 m!1119223))

(declare-fun m!1119225 () Bool)

(assert (=> b!1214529 m!1119225))

(declare-fun m!1119227 () Bool)

(assert (=> b!1214522 m!1119227))

(declare-fun m!1119229 () Bool)

(assert (=> b!1214531 m!1119229))

(declare-fun m!1119231 () Bool)

(assert (=> b!1214528 m!1119231))

(declare-fun m!1119233 () Bool)

(assert (=> b!1214528 m!1119233))

(declare-fun m!1119235 () Bool)

(assert (=> b!1214528 m!1119235))

(declare-fun m!1119237 () Bool)

(assert (=> b!1214528 m!1119237))

(declare-fun m!1119239 () Bool)

(assert (=> start!101178 m!1119239))

(declare-fun m!1119241 () Bool)

(assert (=> start!101178 m!1119241))

(declare-fun m!1119243 () Bool)

(assert (=> b!1214526 m!1119243))

(declare-fun m!1119245 () Bool)

(assert (=> b!1214525 m!1119245))

(declare-fun m!1119247 () Bool)

(assert (=> b!1214523 m!1119247))

(declare-fun m!1119249 () Bool)

(assert (=> b!1214523 m!1119249))

(declare-fun m!1119251 () Bool)

(assert (=> b!1214532 m!1119251))

(check-sat (not b!1214528) (not b!1214521) b_and!43315 (not b!1214525) (not b!1214532) (not b!1214523) (not b!1214531) (not b!1214529) (not b!1214522) (not b_next!26107) (not b_lambda!21773) (not mapNonEmpty!48091) tp_is_empty!30811 (not start!101178))
(check-sat b_and!43315 (not b_next!26107))
