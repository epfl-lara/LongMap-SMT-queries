; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101186 () Bool)

(assert start!101186)

(declare-fun b_free!26109 () Bool)

(declare-fun b_next!26109 () Bool)

(assert (=> start!101186 (= b_free!26109 (not b_next!26109))))

(declare-fun tp!91348 () Bool)

(declare-fun b_and!43335 () Bool)

(assert (=> start!101186 (= tp!91348 b_and!43335)))

(declare-fun b!1214672 () Bool)

(declare-fun res!806431 () Bool)

(declare-fun e!689780 () Bool)

(assert (=> b!1214672 (=> (not res!806431) (not e!689780))))

(declare-datatypes ((array!78405 0))(
  ( (array!78406 (arr!37837 (Array (_ BitVec 32) (_ BitVec 64))) (size!38373 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78405)

(declare-datatypes ((List!26675 0))(
  ( (Nil!26672) (Cons!26671 (h!27880 (_ BitVec 64)) (t!39764 List!26675)) )
))
(declare-fun arrayNoDuplicates!0 (array!78405 (_ BitVec 32) List!26675) Bool)

(assert (=> b!1214672 (= res!806431 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26672))))

(declare-fun b!1214673 () Bool)

(declare-fun e!689777 () Bool)

(declare-fun tp_is_empty!30813 () Bool)

(assert (=> b!1214673 (= e!689777 tp_is_empty!30813)))

(declare-fun b!1214674 () Bool)

(declare-fun res!806430 () Bool)

(assert (=> b!1214674 (=> (not res!806430) (not e!689780))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214674 (= res!806430 (validKeyInArray!0 k0!934))))

(declare-fun b!1214675 () Bool)

(declare-fun res!806433 () Bool)

(assert (=> b!1214675 (=> (not res!806433) (not e!689780))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1214675 (= res!806433 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38373 _keys!1208))))))

(declare-fun b!1214677 () Bool)

(declare-fun e!689782 () Bool)

(declare-fun e!689781 () Bool)

(assert (=> b!1214677 (= e!689782 (not e!689781))))

(declare-fun res!806432 () Bool)

(assert (=> b!1214677 (=> res!806432 e!689781)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1214677 (= res!806432 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214677 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40280 0))(
  ( (Unit!40281) )
))
(declare-fun lt!552407 () Unit!40280)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78405 (_ BitVec 64) (_ BitVec 32)) Unit!40280)

(assert (=> b!1214677 (= lt!552407 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1214678 () Bool)

(declare-fun e!689776 () Bool)

(assert (=> b!1214678 (= e!689776 tp_is_empty!30813)))

(declare-fun b!1214679 () Bool)

(declare-fun res!806436 () Bool)

(assert (=> b!1214679 (=> (not res!806436) (not e!689780))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46211 0))(
  ( (V!46212 (val!15463 Int)) )
))
(declare-datatypes ((ValueCell!14697 0))(
  ( (ValueCellFull!14697 (v!18116 V!46211)) (EmptyCell!14697) )
))
(declare-datatypes ((array!78407 0))(
  ( (array!78408 (arr!37838 (Array (_ BitVec 32) ValueCell!14697)) (size!38374 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78407)

(assert (=> b!1214679 (= res!806436 (and (= (size!38374 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38373 _keys!1208) (size!38374 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214680 () Bool)

(declare-fun res!806434 () Bool)

(assert (=> b!1214680 (=> (not res!806434) (not e!689780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78405 (_ BitVec 32)) Bool)

(assert (=> b!1214680 (= res!806434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48094 () Bool)

(declare-fun mapRes!48094 () Bool)

(declare-fun tp!91349 () Bool)

(assert (=> mapNonEmpty!48094 (= mapRes!48094 (and tp!91349 e!689777))))

(declare-fun mapValue!48094 () ValueCell!14697)

(declare-fun mapRest!48094 () (Array (_ BitVec 32) ValueCell!14697))

(declare-fun mapKey!48094 () (_ BitVec 32))

(assert (=> mapNonEmpty!48094 (= (arr!37838 _values!996) (store mapRest!48094 mapKey!48094 mapValue!48094))))

(declare-fun mapIsEmpty!48094 () Bool)

(assert (=> mapIsEmpty!48094 mapRes!48094))

(declare-fun b!1214681 () Bool)

(declare-fun res!806435 () Bool)

(assert (=> b!1214681 (=> (not res!806435) (not e!689780))))

(assert (=> b!1214681 (= res!806435 (= (select (arr!37837 _keys!1208) i!673) k0!934))))

(declare-fun b!1214682 () Bool)

(declare-fun res!806428 () Bool)

(assert (=> b!1214682 (=> (not res!806428) (not e!689780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214682 (= res!806428 (validMask!0 mask!1564))))

(declare-fun b!1214683 () Bool)

(assert (=> b!1214683 (= e!689781 true)))

(declare-fun zeroValue!944 () V!46211)

(declare-datatypes ((tuple2!19876 0))(
  ( (tuple2!19877 (_1!9949 (_ BitVec 64)) (_2!9949 V!46211)) )
))
(declare-datatypes ((List!26676 0))(
  ( (Nil!26673) (Cons!26672 (h!27881 tuple2!19876) (t!39765 List!26676)) )
))
(declare-datatypes ((ListLongMap!17845 0))(
  ( (ListLongMap!17846 (toList!8938 List!26676)) )
))
(declare-fun lt!552405 () ListLongMap!17845)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!552408 () array!78405)

(declare-fun minValue!944 () V!46211)

(declare-fun getCurrentListMapNoExtraKeys!5365 (array!78405 array!78407 (_ BitVec 32) (_ BitVec 32) V!46211 V!46211 (_ BitVec 32) Int) ListLongMap!17845)

(declare-fun dynLambda!3254 (Int (_ BitVec 64)) V!46211)

(assert (=> b!1214683 (= lt!552405 (getCurrentListMapNoExtraKeys!5365 lt!552408 (array!78408 (store (arr!37838 _values!996) i!673 (ValueCellFull!14697 (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38374 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552406 () ListLongMap!17845)

(assert (=> b!1214683 (= lt!552406 (getCurrentListMapNoExtraKeys!5365 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214684 () Bool)

(assert (=> b!1214684 (= e!689780 e!689782)))

(declare-fun res!806437 () Bool)

(assert (=> b!1214684 (=> (not res!806437) (not e!689782))))

(assert (=> b!1214684 (= res!806437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552408 mask!1564))))

(assert (=> b!1214684 (= lt!552408 (array!78406 (store (arr!37837 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38373 _keys!1208)))))

(declare-fun b!1214685 () Bool)

(declare-fun e!689779 () Bool)

(assert (=> b!1214685 (= e!689779 (and e!689776 mapRes!48094))))

(declare-fun condMapEmpty!48094 () Bool)

(declare-fun mapDefault!48094 () ValueCell!14697)

(assert (=> b!1214685 (= condMapEmpty!48094 (= (arr!37838 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14697)) mapDefault!48094)))))

(declare-fun b!1214676 () Bool)

(declare-fun res!806438 () Bool)

(assert (=> b!1214676 (=> (not res!806438) (not e!689782))))

(assert (=> b!1214676 (= res!806438 (arrayNoDuplicates!0 lt!552408 #b00000000000000000000000000000000 Nil!26672))))

(declare-fun res!806429 () Bool)

(assert (=> start!101186 (=> (not res!806429) (not e!689780))))

(assert (=> start!101186 (= res!806429 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38373 _keys!1208))))))

(assert (=> start!101186 e!689780))

(assert (=> start!101186 tp_is_empty!30813))

(declare-fun array_inv!28810 (array!78405) Bool)

(assert (=> start!101186 (array_inv!28810 _keys!1208)))

(assert (=> start!101186 true))

(assert (=> start!101186 tp!91348))

(declare-fun array_inv!28811 (array!78407) Bool)

(assert (=> start!101186 (and (array_inv!28811 _values!996) e!689779)))

(assert (= (and start!101186 res!806429) b!1214682))

(assert (= (and b!1214682 res!806428) b!1214679))

(assert (= (and b!1214679 res!806436) b!1214680))

(assert (= (and b!1214680 res!806434) b!1214672))

(assert (= (and b!1214672 res!806431) b!1214675))

(assert (= (and b!1214675 res!806433) b!1214674))

(assert (= (and b!1214674 res!806430) b!1214681))

(assert (= (and b!1214681 res!806435) b!1214684))

(assert (= (and b!1214684 res!806437) b!1214676))

(assert (= (and b!1214676 res!806438) b!1214677))

(assert (= (and b!1214677 (not res!806432)) b!1214683))

(assert (= (and b!1214685 condMapEmpty!48094) mapIsEmpty!48094))

(assert (= (and b!1214685 (not condMapEmpty!48094)) mapNonEmpty!48094))

(get-info :version)

(assert (= (and mapNonEmpty!48094 ((_ is ValueCellFull!14697) mapValue!48094)) b!1214673))

(assert (= (and b!1214685 ((_ is ValueCellFull!14697) mapDefault!48094)) b!1214678))

(assert (= start!101186 b!1214685))

(declare-fun b_lambda!21785 () Bool)

(assert (=> (not b_lambda!21785) (not b!1214683)))

(declare-fun t!39763 () Bool)

(declare-fun tb!10909 () Bool)

(assert (=> (and start!101186 (= defaultEntry!1004 defaultEntry!1004) t!39763) tb!10909))

(declare-fun result!22415 () Bool)

(assert (=> tb!10909 (= result!22415 tp_is_empty!30813)))

(assert (=> b!1214683 t!39763))

(declare-fun b_and!43337 () Bool)

(assert (= b_and!43335 (and (=> t!39763 result!22415) b_and!43337)))

(declare-fun m!1119817 () Bool)

(assert (=> b!1214674 m!1119817))

(declare-fun m!1119819 () Bool)

(assert (=> b!1214684 m!1119819))

(declare-fun m!1119821 () Bool)

(assert (=> b!1214684 m!1119821))

(declare-fun m!1119823 () Bool)

(assert (=> b!1214683 m!1119823))

(declare-fun m!1119825 () Bool)

(assert (=> b!1214683 m!1119825))

(declare-fun m!1119827 () Bool)

(assert (=> b!1214683 m!1119827))

(declare-fun m!1119829 () Bool)

(assert (=> b!1214683 m!1119829))

(declare-fun m!1119831 () Bool)

(assert (=> b!1214676 m!1119831))

(declare-fun m!1119833 () Bool)

(assert (=> b!1214672 m!1119833))

(declare-fun m!1119835 () Bool)

(assert (=> b!1214682 m!1119835))

(declare-fun m!1119837 () Bool)

(assert (=> mapNonEmpty!48094 m!1119837))

(declare-fun m!1119839 () Bool)

(assert (=> b!1214677 m!1119839))

(declare-fun m!1119841 () Bool)

(assert (=> b!1214677 m!1119841))

(declare-fun m!1119843 () Bool)

(assert (=> b!1214680 m!1119843))

(declare-fun m!1119845 () Bool)

(assert (=> start!101186 m!1119845))

(declare-fun m!1119847 () Bool)

(assert (=> start!101186 m!1119847))

(declare-fun m!1119849 () Bool)

(assert (=> b!1214681 m!1119849))

(check-sat tp_is_empty!30813 (not b!1214677) (not b_next!26109) (not b!1214682) (not b!1214672) (not start!101186) (not b!1214683) (not b!1214684) (not mapNonEmpty!48094) b_and!43337 (not b!1214676) (not b!1214674) (not b_lambda!21785) (not b!1214680))
(check-sat b_and!43337 (not b_next!26109))
