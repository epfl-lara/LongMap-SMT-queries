; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99918 () Bool)

(assert start!99918)

(declare-fun b_free!25497 () Bool)

(declare-fun b_next!25497 () Bool)

(assert (=> start!99918 (= b_free!25497 (not b_next!25497))))

(declare-fun tp!89204 () Bool)

(declare-fun b_and!41861 () Bool)

(assert (=> start!99918 (= tp!89204 b_and!41861)))

(declare-fun b!1189353 () Bool)

(declare-fun res!790882 () Bool)

(declare-fun e!676205 () Bool)

(assert (=> b!1189353 (=> (not res!790882) (not e!676205))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189353 (= res!790882 (validMask!0 mask!1564))))

(declare-fun b!1189354 () Bool)

(declare-fun e!676210 () Bool)

(declare-fun e!676208 () Bool)

(assert (=> b!1189354 (= e!676210 e!676208)))

(declare-fun res!790887 () Bool)

(assert (=> b!1189354 (=> res!790887 e!676208)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1189354 (= res!790887 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45163 0))(
  ( (V!45164 (val!15070 Int)) )
))
(declare-fun zeroValue!944 () V!45163)

(declare-datatypes ((array!76849 0))(
  ( (array!76850 (arr!37074 (Array (_ BitVec 32) (_ BitVec 64))) (size!37610 (_ BitVec 32))) )
))
(declare-fun lt!541036 () array!76849)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14304 0))(
  ( (ValueCellFull!14304 (v!17708 V!45163)) (EmptyCell!14304) )
))
(declare-datatypes ((array!76851 0))(
  ( (array!76852 (arr!37075 (Array (_ BitVec 32) ValueCell!14304)) (size!37611 (_ BitVec 32))) )
))
(declare-fun lt!541037 () array!76851)

(declare-fun minValue!944 () V!45163)

(declare-datatypes ((tuple2!19356 0))(
  ( (tuple2!19357 (_1!9689 (_ BitVec 64)) (_2!9689 V!45163)) )
))
(declare-datatypes ((List!26100 0))(
  ( (Nil!26097) (Cons!26096 (h!27305 tuple2!19356) (t!38589 List!26100)) )
))
(declare-datatypes ((ListLongMap!17325 0))(
  ( (ListLongMap!17326 (toList!8678 List!26100)) )
))
(declare-fun lt!541035 () ListLongMap!17325)

(declare-fun getCurrentListMapNoExtraKeys!5119 (array!76849 array!76851 (_ BitVec 32) (_ BitVec 32) V!45163 V!45163 (_ BitVec 32) Int) ListLongMap!17325)

(assert (=> b!1189354 (= lt!541035 (getCurrentListMapNoExtraKeys!5119 lt!541036 lt!541037 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76851)

(declare-fun dynLambda!3062 (Int (_ BitVec 64)) V!45163)

(assert (=> b!1189354 (= lt!541037 (array!76852 (store (arr!37075 _values!996) i!673 (ValueCellFull!14304 (dynLambda!3062 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37611 _values!996)))))

(declare-fun lt!541033 () ListLongMap!17325)

(declare-fun _keys!1208 () array!76849)

(assert (=> b!1189354 (= lt!541033 (getCurrentListMapNoExtraKeys!5119 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189355 () Bool)

(declare-fun res!790885 () Bool)

(assert (=> b!1189355 (=> (not res!790885) (not e!676205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76849 (_ BitVec 32)) Bool)

(assert (=> b!1189355 (= res!790885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189356 () Bool)

(declare-fun e!676204 () Bool)

(assert (=> b!1189356 (= e!676204 (not e!676210))))

(declare-fun res!790891 () Bool)

(assert (=> b!1189356 (=> res!790891 e!676210)))

(assert (=> b!1189356 (= res!790891 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189356 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39454 0))(
  ( (Unit!39455) )
))
(declare-fun lt!541038 () Unit!39454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76849 (_ BitVec 64) (_ BitVec 32)) Unit!39454)

(assert (=> b!1189356 (= lt!541038 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!790890 () Bool)

(assert (=> start!99918 (=> (not res!790890) (not e!676205))))

(assert (=> start!99918 (= res!790890 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37610 _keys!1208))))))

(assert (=> start!99918 e!676205))

(declare-fun tp_is_empty!30027 () Bool)

(assert (=> start!99918 tp_is_empty!30027))

(declare-fun array_inv!28278 (array!76849) Bool)

(assert (=> start!99918 (array_inv!28278 _keys!1208)))

(assert (=> start!99918 true))

(assert (=> start!99918 tp!89204))

(declare-fun e!676207 () Bool)

(declare-fun array_inv!28279 (array!76851) Bool)

(assert (=> start!99918 (and (array_inv!28279 _values!996) e!676207)))

(declare-fun b!1189357 () Bool)

(declare-fun res!790884 () Bool)

(assert (=> b!1189357 (=> (not res!790884) (not e!676205))))

(assert (=> b!1189357 (= res!790884 (= (select (arr!37074 _keys!1208) i!673) k0!934))))

(declare-fun b!1189358 () Bool)

(declare-fun e!676203 () Bool)

(assert (=> b!1189358 (= e!676203 tp_is_empty!30027)))

(declare-fun b!1189359 () Bool)

(assert (=> b!1189359 (= e!676208 true)))

(declare-fun -!1707 (ListLongMap!17325 (_ BitVec 64)) ListLongMap!17325)

(assert (=> b!1189359 (= (getCurrentListMapNoExtraKeys!5119 lt!541036 lt!541037 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1707 (getCurrentListMapNoExtraKeys!5119 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541034 () Unit!39454)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!916 (array!76849 array!76851 (_ BitVec 32) (_ BitVec 32) V!45163 V!45163 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39454)

(assert (=> b!1189359 (= lt!541034 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!916 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46868 () Bool)

(declare-fun mapRes!46868 () Bool)

(assert (=> mapIsEmpty!46868 mapRes!46868))

(declare-fun b!1189360 () Bool)

(declare-fun e!676209 () Bool)

(assert (=> b!1189360 (= e!676209 tp_is_empty!30027)))

(declare-fun b!1189361 () Bool)

(declare-fun res!790881 () Bool)

(assert (=> b!1189361 (=> (not res!790881) (not e!676204))))

(declare-datatypes ((List!26101 0))(
  ( (Nil!26098) (Cons!26097 (h!27306 (_ BitVec 64)) (t!38590 List!26101)) )
))
(declare-fun arrayNoDuplicates!0 (array!76849 (_ BitVec 32) List!26101) Bool)

(assert (=> b!1189361 (= res!790881 (arrayNoDuplicates!0 lt!541036 #b00000000000000000000000000000000 Nil!26098))))

(declare-fun b!1189362 () Bool)

(assert (=> b!1189362 (= e!676207 (and e!676203 mapRes!46868))))

(declare-fun condMapEmpty!46868 () Bool)

(declare-fun mapDefault!46868 () ValueCell!14304)

(assert (=> b!1189362 (= condMapEmpty!46868 (= (arr!37075 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14304)) mapDefault!46868)))))

(declare-fun b!1189363 () Bool)

(declare-fun res!790889 () Bool)

(assert (=> b!1189363 (=> (not res!790889) (not e!676205))))

(assert (=> b!1189363 (= res!790889 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26098))))

(declare-fun b!1189364 () Bool)

(declare-fun res!790886 () Bool)

(assert (=> b!1189364 (=> (not res!790886) (not e!676205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189364 (= res!790886 (validKeyInArray!0 k0!934))))

(declare-fun b!1189365 () Bool)

(assert (=> b!1189365 (= e!676205 e!676204)))

(declare-fun res!790880 () Bool)

(assert (=> b!1189365 (=> (not res!790880) (not e!676204))))

(assert (=> b!1189365 (= res!790880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541036 mask!1564))))

(assert (=> b!1189365 (= lt!541036 (array!76850 (store (arr!37074 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37610 _keys!1208)))))

(declare-fun b!1189366 () Bool)

(declare-fun res!790888 () Bool)

(assert (=> b!1189366 (=> (not res!790888) (not e!676205))))

(assert (=> b!1189366 (= res!790888 (and (= (size!37611 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37610 _keys!1208) (size!37611 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189367 () Bool)

(declare-fun res!790883 () Bool)

(assert (=> b!1189367 (=> (not res!790883) (not e!676205))))

(assert (=> b!1189367 (= res!790883 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37610 _keys!1208))))))

(declare-fun mapNonEmpty!46868 () Bool)

(declare-fun tp!89205 () Bool)

(assert (=> mapNonEmpty!46868 (= mapRes!46868 (and tp!89205 e!676209))))

(declare-fun mapKey!46868 () (_ BitVec 32))

(declare-fun mapValue!46868 () ValueCell!14304)

(declare-fun mapRest!46868 () (Array (_ BitVec 32) ValueCell!14304))

(assert (=> mapNonEmpty!46868 (= (arr!37075 _values!996) (store mapRest!46868 mapKey!46868 mapValue!46868))))

(assert (= (and start!99918 res!790890) b!1189353))

(assert (= (and b!1189353 res!790882) b!1189366))

(assert (= (and b!1189366 res!790888) b!1189355))

(assert (= (and b!1189355 res!790885) b!1189363))

(assert (= (and b!1189363 res!790889) b!1189367))

(assert (= (and b!1189367 res!790883) b!1189364))

(assert (= (and b!1189364 res!790886) b!1189357))

(assert (= (and b!1189357 res!790884) b!1189365))

(assert (= (and b!1189365 res!790880) b!1189361))

(assert (= (and b!1189361 res!790881) b!1189356))

(assert (= (and b!1189356 (not res!790891)) b!1189354))

(assert (= (and b!1189354 (not res!790887)) b!1189359))

(assert (= (and b!1189362 condMapEmpty!46868) mapIsEmpty!46868))

(assert (= (and b!1189362 (not condMapEmpty!46868)) mapNonEmpty!46868))

(get-info :version)

(assert (= (and mapNonEmpty!46868 ((_ is ValueCellFull!14304) mapValue!46868)) b!1189360))

(assert (= (and b!1189362 ((_ is ValueCellFull!14304) mapDefault!46868)) b!1189358))

(assert (= start!99918 b!1189362))

(declare-fun b_lambda!20641 () Bool)

(assert (=> (not b_lambda!20641) (not b!1189354)))

(declare-fun t!38588 () Bool)

(declare-fun tb!10309 () Bool)

(assert (=> (and start!99918 (= defaultEntry!1004 defaultEntry!1004) t!38588) tb!10309))

(declare-fun result!21185 () Bool)

(assert (=> tb!10309 (= result!21185 tp_is_empty!30027)))

(assert (=> b!1189354 t!38588))

(declare-fun b_and!41863 () Bool)

(assert (= b_and!41861 (and (=> t!38588 result!21185) b_and!41863)))

(declare-fun m!1098039 () Bool)

(assert (=> b!1189354 m!1098039))

(declare-fun m!1098041 () Bool)

(assert (=> b!1189354 m!1098041))

(declare-fun m!1098043 () Bool)

(assert (=> b!1189354 m!1098043))

(declare-fun m!1098045 () Bool)

(assert (=> b!1189354 m!1098045))

(declare-fun m!1098047 () Bool)

(assert (=> b!1189355 m!1098047))

(declare-fun m!1098049 () Bool)

(assert (=> b!1189364 m!1098049))

(declare-fun m!1098051 () Bool)

(assert (=> b!1189365 m!1098051))

(declare-fun m!1098053 () Bool)

(assert (=> b!1189365 m!1098053))

(declare-fun m!1098055 () Bool)

(assert (=> b!1189361 m!1098055))

(declare-fun m!1098057 () Bool)

(assert (=> b!1189359 m!1098057))

(declare-fun m!1098059 () Bool)

(assert (=> b!1189359 m!1098059))

(assert (=> b!1189359 m!1098059))

(declare-fun m!1098061 () Bool)

(assert (=> b!1189359 m!1098061))

(declare-fun m!1098063 () Bool)

(assert (=> b!1189359 m!1098063))

(declare-fun m!1098065 () Bool)

(assert (=> b!1189353 m!1098065))

(declare-fun m!1098067 () Bool)

(assert (=> b!1189356 m!1098067))

(declare-fun m!1098069 () Bool)

(assert (=> b!1189356 m!1098069))

(declare-fun m!1098071 () Bool)

(assert (=> b!1189363 m!1098071))

(declare-fun m!1098073 () Bool)

(assert (=> mapNonEmpty!46868 m!1098073))

(declare-fun m!1098075 () Bool)

(assert (=> b!1189357 m!1098075))

(declare-fun m!1098077 () Bool)

(assert (=> start!99918 m!1098077))

(declare-fun m!1098079 () Bool)

(assert (=> start!99918 m!1098079))

(check-sat (not b!1189365) b_and!41863 (not b_lambda!20641) (not b!1189354) (not b!1189361) (not b!1189359) tp_is_empty!30027 (not b!1189353) (not b!1189363) (not b_next!25497) (not mapNonEmpty!46868) (not start!99918) (not b!1189356) (not b!1189364) (not b!1189355))
(check-sat b_and!41863 (not b_next!25497))
