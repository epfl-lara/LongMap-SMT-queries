; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101504 () Bool)

(assert start!101504)

(declare-fun b_free!26191 () Bool)

(declare-fun b_next!26191 () Bool)

(assert (=> start!101504 (= b_free!26191 (not b_next!26191))))

(declare-fun tp!91594 () Bool)

(declare-fun b_and!43501 () Bool)

(assert (=> start!101504 (= tp!91594 b_and!43501)))

(declare-fun b!1217774 () Bool)

(declare-fun res!808299 () Bool)

(declare-fun e!691481 () Bool)

(assert (=> b!1217774 (=> (not res!808299) (not e!691481))))

(declare-datatypes ((array!78605 0))(
  ( (array!78606 (arr!37931 (Array (_ BitVec 32) (_ BitVec 64))) (size!38468 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78605)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78605 (_ BitVec 32)) Bool)

(assert (=> b!1217774 (= res!808299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217775 () Bool)

(declare-fun res!808305 () Bool)

(assert (=> b!1217775 (=> (not res!808305) (not e!691481))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1217775 (= res!808305 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38468 _keys!1208))))))

(declare-fun b!1217776 () Bool)

(declare-fun res!808304 () Bool)

(assert (=> b!1217776 (=> (not res!808304) (not e!691481))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217776 (= res!808304 (validKeyInArray!0 k0!934))))

(declare-fun b!1217777 () Bool)

(declare-fun res!808302 () Bool)

(declare-fun e!691483 () Bool)

(assert (=> b!1217777 (=> (not res!808302) (not e!691483))))

(declare-fun lt!553402 () array!78605)

(declare-datatypes ((List!26754 0))(
  ( (Nil!26751) (Cons!26750 (h!27968 (_ BitVec 64)) (t!39917 List!26754)) )
))
(declare-fun arrayNoDuplicates!0 (array!78605 (_ BitVec 32) List!26754) Bool)

(assert (=> b!1217777 (= res!808302 (arrayNoDuplicates!0 lt!553402 #b00000000000000000000000000000000 Nil!26751))))

(declare-fun b!1217778 () Bool)

(declare-fun e!691484 () Bool)

(declare-fun tp_is_empty!30895 () Bool)

(assert (=> b!1217778 (= e!691484 tp_is_empty!30895)))

(declare-fun b!1217779 () Bool)

(declare-fun e!691485 () Bool)

(assert (=> b!1217779 (= e!691485 true)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!46321 0))(
  ( (V!46322 (val!15504 Int)) )
))
(declare-datatypes ((ValueCell!14738 0))(
  ( (ValueCellFull!14738 (v!18153 V!46321)) (EmptyCell!14738) )
))
(declare-datatypes ((array!78607 0))(
  ( (array!78608 (arr!37932 (Array (_ BitVec 32) ValueCell!14738)) (size!38469 (_ BitVec 32))) )
))
(declare-fun lt!553400 () array!78607)

(declare-fun _values!996 () array!78607)

(declare-fun minValue!944 () V!46321)

(declare-fun zeroValue!944 () V!46321)

(declare-datatypes ((tuple2!19944 0))(
  ( (tuple2!19945 (_1!9983 (_ BitVec 64)) (_2!9983 V!46321)) )
))
(declare-datatypes ((List!26755 0))(
  ( (Nil!26752) (Cons!26751 (h!27969 tuple2!19944) (t!39918 List!26755)) )
))
(declare-datatypes ((ListLongMap!17921 0))(
  ( (ListLongMap!17922 (toList!8976 List!26755)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5433 (array!78605 array!78607 (_ BitVec 32) (_ BitVec 32) V!46321 V!46321 (_ BitVec 32) Int) ListLongMap!17921)

(declare-fun -!1870 (ListLongMap!17921 (_ BitVec 64)) ListLongMap!17921)

(assert (=> b!1217779 (= (getCurrentListMapNoExtraKeys!5433 lt!553402 lt!553400 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1870 (getCurrentListMapNoExtraKeys!5433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!40312 0))(
  ( (Unit!40313) )
))
(declare-fun lt!553403 () Unit!40312)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1085 (array!78605 array!78607 (_ BitVec 32) (_ BitVec 32) V!46321 V!46321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40312)

(assert (=> b!1217779 (= lt!553403 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1085 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217780 () Bool)

(declare-fun res!808301 () Bool)

(assert (=> b!1217780 (=> (not res!808301) (not e!691481))))

(assert (=> b!1217780 (= res!808301 (= (select (arr!37931 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!48217 () Bool)

(declare-fun mapRes!48217 () Bool)

(declare-fun tp!91595 () Bool)

(declare-fun e!691486 () Bool)

(assert (=> mapNonEmpty!48217 (= mapRes!48217 (and tp!91595 e!691486))))

(declare-fun mapKey!48217 () (_ BitVec 32))

(declare-fun mapRest!48217 () (Array (_ BitVec 32) ValueCell!14738))

(declare-fun mapValue!48217 () ValueCell!14738)

(assert (=> mapNonEmpty!48217 (= (arr!37932 _values!996) (store mapRest!48217 mapKey!48217 mapValue!48217))))

(declare-fun res!808300 () Bool)

(assert (=> start!101504 (=> (not res!808300) (not e!691481))))

(assert (=> start!101504 (= res!808300 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38468 _keys!1208))))))

(assert (=> start!101504 e!691481))

(assert (=> start!101504 tp_is_empty!30895))

(declare-fun array_inv!28944 (array!78605) Bool)

(assert (=> start!101504 (array_inv!28944 _keys!1208)))

(assert (=> start!101504 true))

(assert (=> start!101504 tp!91594))

(declare-fun e!691482 () Bool)

(declare-fun array_inv!28945 (array!78607) Bool)

(assert (=> start!101504 (and (array_inv!28945 _values!996) e!691482)))

(declare-fun b!1217781 () Bool)

(declare-fun e!691479 () Bool)

(assert (=> b!1217781 (= e!691483 (not e!691479))))

(declare-fun res!808306 () Bool)

(assert (=> b!1217781 (=> res!808306 e!691479)))

(assert (=> b!1217781 (= res!808306 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217781 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553401 () Unit!40312)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78605 (_ BitVec 64) (_ BitVec 32)) Unit!40312)

(assert (=> b!1217781 (= lt!553401 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217782 () Bool)

(assert (=> b!1217782 (= e!691482 (and e!691484 mapRes!48217))))

(declare-fun condMapEmpty!48217 () Bool)

(declare-fun mapDefault!48217 () ValueCell!14738)

(assert (=> b!1217782 (= condMapEmpty!48217 (= (arr!37932 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14738)) mapDefault!48217)))))

(declare-fun mapIsEmpty!48217 () Bool)

(assert (=> mapIsEmpty!48217 mapRes!48217))

(declare-fun b!1217783 () Bool)

(declare-fun res!808307 () Bool)

(assert (=> b!1217783 (=> (not res!808307) (not e!691481))))

(assert (=> b!1217783 (= res!808307 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26751))))

(declare-fun b!1217784 () Bool)

(declare-fun res!808303 () Bool)

(assert (=> b!1217784 (=> (not res!808303) (not e!691481))))

(assert (=> b!1217784 (= res!808303 (and (= (size!38469 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38468 _keys!1208) (size!38469 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217785 () Bool)

(declare-fun res!808309 () Bool)

(assert (=> b!1217785 (=> (not res!808309) (not e!691481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217785 (= res!808309 (validMask!0 mask!1564))))

(declare-fun b!1217786 () Bool)

(assert (=> b!1217786 (= e!691486 tp_is_empty!30895)))

(declare-fun b!1217787 () Bool)

(assert (=> b!1217787 (= e!691479 e!691485)))

(declare-fun res!808298 () Bool)

(assert (=> b!1217787 (=> res!808298 e!691485)))

(assert (=> b!1217787 (= res!808298 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!553404 () ListLongMap!17921)

(assert (=> b!1217787 (= lt!553404 (getCurrentListMapNoExtraKeys!5433 lt!553402 lt!553400 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3344 (Int (_ BitVec 64)) V!46321)

(assert (=> b!1217787 (= lt!553400 (array!78608 (store (arr!37932 _values!996) i!673 (ValueCellFull!14738 (dynLambda!3344 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38469 _values!996)))))

(declare-fun lt!553399 () ListLongMap!17921)

(assert (=> b!1217787 (= lt!553399 (getCurrentListMapNoExtraKeys!5433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217788 () Bool)

(assert (=> b!1217788 (= e!691481 e!691483)))

(declare-fun res!808308 () Bool)

(assert (=> b!1217788 (=> (not res!808308) (not e!691483))))

(assert (=> b!1217788 (= res!808308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553402 mask!1564))))

(assert (=> b!1217788 (= lt!553402 (array!78606 (store (arr!37931 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38468 _keys!1208)))))

(assert (= (and start!101504 res!808300) b!1217785))

(assert (= (and b!1217785 res!808309) b!1217784))

(assert (= (and b!1217784 res!808303) b!1217774))

(assert (= (and b!1217774 res!808299) b!1217783))

(assert (= (and b!1217783 res!808307) b!1217775))

(assert (= (and b!1217775 res!808305) b!1217776))

(assert (= (and b!1217776 res!808304) b!1217780))

(assert (= (and b!1217780 res!808301) b!1217788))

(assert (= (and b!1217788 res!808308) b!1217777))

(assert (= (and b!1217777 res!808302) b!1217781))

(assert (= (and b!1217781 (not res!808306)) b!1217787))

(assert (= (and b!1217787 (not res!808298)) b!1217779))

(assert (= (and b!1217782 condMapEmpty!48217) mapIsEmpty!48217))

(assert (= (and b!1217782 (not condMapEmpty!48217)) mapNonEmpty!48217))

(get-info :version)

(assert (= (and mapNonEmpty!48217 ((_ is ValueCellFull!14738) mapValue!48217)) b!1217786))

(assert (= (and b!1217782 ((_ is ValueCellFull!14738) mapDefault!48217)) b!1217778))

(assert (= start!101504 b!1217782))

(declare-fun b_lambda!21861 () Bool)

(assert (=> (not b_lambda!21861) (not b!1217787)))

(declare-fun t!39916 () Bool)

(declare-fun tb!10983 () Bool)

(assert (=> (and start!101504 (= defaultEntry!1004 defaultEntry!1004) t!39916) tb!10983))

(declare-fun result!22571 () Bool)

(assert (=> tb!10983 (= result!22571 tp_is_empty!30895)))

(assert (=> b!1217787 t!39916))

(declare-fun b_and!43503 () Bool)

(assert (= b_and!43501 (and (=> t!39916 result!22571) b_and!43503)))

(declare-fun m!1122825 () Bool)

(assert (=> b!1217785 m!1122825))

(declare-fun m!1122827 () Bool)

(assert (=> b!1217777 m!1122827))

(declare-fun m!1122829 () Bool)

(assert (=> b!1217781 m!1122829))

(declare-fun m!1122831 () Bool)

(assert (=> b!1217781 m!1122831))

(declare-fun m!1122833 () Bool)

(assert (=> b!1217788 m!1122833))

(declare-fun m!1122835 () Bool)

(assert (=> b!1217788 m!1122835))

(declare-fun m!1122837 () Bool)

(assert (=> b!1217776 m!1122837))

(declare-fun m!1122839 () Bool)

(assert (=> b!1217787 m!1122839))

(declare-fun m!1122841 () Bool)

(assert (=> b!1217787 m!1122841))

(declare-fun m!1122843 () Bool)

(assert (=> b!1217787 m!1122843))

(declare-fun m!1122845 () Bool)

(assert (=> b!1217787 m!1122845))

(declare-fun m!1122847 () Bool)

(assert (=> b!1217783 m!1122847))

(declare-fun m!1122849 () Bool)

(assert (=> b!1217774 m!1122849))

(declare-fun m!1122851 () Bool)

(assert (=> mapNonEmpty!48217 m!1122851))

(declare-fun m!1122853 () Bool)

(assert (=> b!1217779 m!1122853))

(declare-fun m!1122855 () Bool)

(assert (=> b!1217779 m!1122855))

(assert (=> b!1217779 m!1122855))

(declare-fun m!1122857 () Bool)

(assert (=> b!1217779 m!1122857))

(declare-fun m!1122859 () Bool)

(assert (=> b!1217779 m!1122859))

(declare-fun m!1122861 () Bool)

(assert (=> b!1217780 m!1122861))

(declare-fun m!1122863 () Bool)

(assert (=> start!101504 m!1122863))

(declare-fun m!1122865 () Bool)

(assert (=> start!101504 m!1122865))

(check-sat (not b!1217781) (not b!1217774) (not b!1217776) (not b!1217785) (not start!101504) (not b!1217788) tp_is_empty!30895 (not b_next!26191) (not mapNonEmpty!48217) (not b!1217787) b_and!43503 (not b!1217779) (not b!1217783) (not b!1217777) (not b_lambda!21861))
(check-sat b_and!43503 (not b_next!26191))
