; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100248 () Bool)

(assert start!100248)

(declare-fun b_free!25591 () Bool)

(declare-fun b_next!25591 () Bool)

(assert (=> start!100248 (= b_free!25591 (not b_next!25591))))

(declare-fun tp!89487 () Bool)

(declare-fun b_and!42051 () Bool)

(assert (=> start!100248 (= tp!89487 b_and!42051)))

(declare-fun b!1192851 () Bool)

(declare-fun e!678169 () Bool)

(declare-fun e!678164 () Bool)

(declare-fun mapRes!47009 () Bool)

(assert (=> b!1192851 (= e!678169 (and e!678164 mapRes!47009))))

(declare-fun condMapEmpty!47009 () Bool)

(declare-datatypes ((V!45289 0))(
  ( (V!45290 (val!15117 Int)) )
))
(declare-datatypes ((ValueCell!14351 0))(
  ( (ValueCellFull!14351 (v!17751 V!45289)) (EmptyCell!14351) )
))
(declare-datatypes ((array!77075 0))(
  ( (array!77076 (arr!37181 (Array (_ BitVec 32) ValueCell!14351)) (size!37718 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77075)

(declare-fun mapDefault!47009 () ValueCell!14351)

(assert (=> b!1192851 (= condMapEmpty!47009 (= (arr!37181 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14351)) mapDefault!47009)))))

(declare-fun res!793083 () Bool)

(declare-fun e!678163 () Bool)

(assert (=> start!100248 (=> (not res!793083) (not e!678163))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77077 0))(
  ( (array!77078 (arr!37182 (Array (_ BitVec 32) (_ BitVec 64))) (size!37719 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77077)

(assert (=> start!100248 (= res!793083 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37719 _keys!1208))))))

(assert (=> start!100248 e!678163))

(declare-fun tp_is_empty!30121 () Bool)

(assert (=> start!100248 tp_is_empty!30121))

(declare-fun array_inv!28414 (array!77077) Bool)

(assert (=> start!100248 (array_inv!28414 _keys!1208)))

(assert (=> start!100248 true))

(assert (=> start!100248 tp!89487))

(declare-fun array_inv!28415 (array!77075) Bool)

(assert (=> start!100248 (and (array_inv!28415 _values!996) e!678169)))

(declare-fun b!1192852 () Bool)

(declare-fun res!793087 () Bool)

(assert (=> b!1192852 (=> (not res!793087) (not e!678163))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192852 (= res!793087 (validKeyInArray!0 k0!934))))

(declare-fun b!1192853 () Bool)

(declare-fun e!678165 () Bool)

(declare-fun e!678166 () Bool)

(assert (=> b!1192853 (= e!678165 e!678166)))

(declare-fun res!793081 () Bool)

(assert (=> b!1192853 (=> res!793081 e!678166)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192853 (= res!793081 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!19460 0))(
  ( (tuple2!19461 (_1!9741 (_ BitVec 64)) (_2!9741 V!45289)) )
))
(declare-datatypes ((List!26205 0))(
  ( (Nil!26202) (Cons!26201 (h!27419 tuple2!19460) (t!38780 List!26205)) )
))
(declare-datatypes ((ListLongMap!17437 0))(
  ( (ListLongMap!17438 (toList!8734 List!26205)) )
))
(declare-fun lt!542368 () ListLongMap!17437)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45289)

(declare-fun lt!542367 () array!77075)

(declare-fun lt!542365 () array!77077)

(declare-fun zeroValue!944 () V!45289)

(declare-fun getCurrentListMapNoExtraKeys!5202 (array!77077 array!77075 (_ BitVec 32) (_ BitVec 32) V!45289 V!45289 (_ BitVec 32) Int) ListLongMap!17437)

(assert (=> b!1192853 (= lt!542368 (getCurrentListMapNoExtraKeys!5202 lt!542365 lt!542367 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3156 (Int (_ BitVec 64)) V!45289)

(assert (=> b!1192853 (= lt!542367 (array!77076 (store (arr!37181 _values!996) i!673 (ValueCellFull!14351 (dynLambda!3156 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37718 _values!996)))))

(declare-fun lt!542363 () ListLongMap!17437)

(assert (=> b!1192853 (= lt!542363 (getCurrentListMapNoExtraKeys!5202 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192854 () Bool)

(declare-fun e!678170 () Bool)

(assert (=> b!1192854 (= e!678163 e!678170)))

(declare-fun res!793089 () Bool)

(assert (=> b!1192854 (=> (not res!793089) (not e!678170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77077 (_ BitVec 32)) Bool)

(assert (=> b!1192854 (= res!793089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542365 mask!1564))))

(assert (=> b!1192854 (= lt!542365 (array!77078 (store (arr!37182 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37719 _keys!1208)))))

(declare-fun mapIsEmpty!47009 () Bool)

(assert (=> mapIsEmpty!47009 mapRes!47009))

(declare-fun b!1192855 () Bool)

(declare-fun res!793080 () Bool)

(assert (=> b!1192855 (=> (not res!793080) (not e!678163))))

(declare-datatypes ((List!26206 0))(
  ( (Nil!26203) (Cons!26202 (h!27420 (_ BitVec 64)) (t!38781 List!26206)) )
))
(declare-fun arrayNoDuplicates!0 (array!77077 (_ BitVec 32) List!26206) Bool)

(assert (=> b!1192855 (= res!793080 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26203))))

(declare-fun b!1192856 () Bool)

(assert (=> b!1192856 (= e!678164 tp_is_empty!30121)))

(declare-fun mapNonEmpty!47009 () Bool)

(declare-fun tp!89486 () Bool)

(declare-fun e!678168 () Bool)

(assert (=> mapNonEmpty!47009 (= mapRes!47009 (and tp!89486 e!678168))))

(declare-fun mapValue!47009 () ValueCell!14351)

(declare-fun mapKey!47009 () (_ BitVec 32))

(declare-fun mapRest!47009 () (Array (_ BitVec 32) ValueCell!14351))

(assert (=> mapNonEmpty!47009 (= (arr!37181 _values!996) (store mapRest!47009 mapKey!47009 mapValue!47009))))

(declare-fun b!1192857 () Bool)

(declare-fun res!793086 () Bool)

(assert (=> b!1192857 (=> (not res!793086) (not e!678163))))

(assert (=> b!1192857 (= res!793086 (= (select (arr!37182 _keys!1208) i!673) k0!934))))

(declare-fun b!1192858 () Bool)

(declare-fun res!793085 () Bool)

(assert (=> b!1192858 (=> (not res!793085) (not e!678170))))

(assert (=> b!1192858 (= res!793085 (arrayNoDuplicates!0 lt!542365 #b00000000000000000000000000000000 Nil!26203))))

(declare-fun b!1192859 () Bool)

(declare-fun res!793091 () Bool)

(assert (=> b!1192859 (=> (not res!793091) (not e!678163))))

(assert (=> b!1192859 (= res!793091 (and (= (size!37718 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37719 _keys!1208) (size!37718 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192860 () Bool)

(assert (=> b!1192860 (= e!678166 true)))

(declare-fun -!1741 (ListLongMap!17437 (_ BitVec 64)) ListLongMap!17437)

(assert (=> b!1192860 (= (getCurrentListMapNoExtraKeys!5202 lt!542365 lt!542367 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1741 (getCurrentListMapNoExtraKeys!5202 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39509 0))(
  ( (Unit!39510) )
))
(declare-fun lt!542366 () Unit!39509)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!956 (array!77077 array!77075 (_ BitVec 32) (_ BitVec 32) V!45289 V!45289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39509)

(assert (=> b!1192860 (= lt!542366 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!956 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192861 () Bool)

(assert (=> b!1192861 (= e!678170 (not e!678165))))

(declare-fun res!793090 () Bool)

(assert (=> b!1192861 (=> res!793090 e!678165)))

(assert (=> b!1192861 (= res!793090 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192861 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542364 () Unit!39509)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77077 (_ BitVec 64) (_ BitVec 32)) Unit!39509)

(assert (=> b!1192861 (= lt!542364 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192862 () Bool)

(declare-fun res!793088 () Bool)

(assert (=> b!1192862 (=> (not res!793088) (not e!678163))))

(assert (=> b!1192862 (= res!793088 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37719 _keys!1208))))))

(declare-fun b!1192863 () Bool)

(declare-fun res!793082 () Bool)

(assert (=> b!1192863 (=> (not res!793082) (not e!678163))))

(assert (=> b!1192863 (= res!793082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192864 () Bool)

(assert (=> b!1192864 (= e!678168 tp_is_empty!30121)))

(declare-fun b!1192865 () Bool)

(declare-fun res!793084 () Bool)

(assert (=> b!1192865 (=> (not res!793084) (not e!678163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192865 (= res!793084 (validMask!0 mask!1564))))

(assert (= (and start!100248 res!793083) b!1192865))

(assert (= (and b!1192865 res!793084) b!1192859))

(assert (= (and b!1192859 res!793091) b!1192863))

(assert (= (and b!1192863 res!793082) b!1192855))

(assert (= (and b!1192855 res!793080) b!1192862))

(assert (= (and b!1192862 res!793088) b!1192852))

(assert (= (and b!1192852 res!793087) b!1192857))

(assert (= (and b!1192857 res!793086) b!1192854))

(assert (= (and b!1192854 res!793089) b!1192858))

(assert (= (and b!1192858 res!793085) b!1192861))

(assert (= (and b!1192861 (not res!793090)) b!1192853))

(assert (= (and b!1192853 (not res!793081)) b!1192860))

(assert (= (and b!1192851 condMapEmpty!47009) mapIsEmpty!47009))

(assert (= (and b!1192851 (not condMapEmpty!47009)) mapNonEmpty!47009))

(get-info :version)

(assert (= (and mapNonEmpty!47009 ((_ is ValueCellFull!14351) mapValue!47009)) b!1192864))

(assert (= (and b!1192851 ((_ is ValueCellFull!14351) mapDefault!47009)) b!1192856))

(assert (= start!100248 b!1192851))

(declare-fun b_lambda!20729 () Bool)

(assert (=> (not b_lambda!20729) (not b!1192853)))

(declare-fun t!38779 () Bool)

(declare-fun tb!10395 () Bool)

(assert (=> (and start!100248 (= defaultEntry!1004 defaultEntry!1004) t!38779) tb!10395))

(declare-fun result!21365 () Bool)

(assert (=> tb!10395 (= result!21365 tp_is_empty!30121)))

(assert (=> b!1192853 t!38779))

(declare-fun b_and!42053 () Bool)

(assert (= b_and!42051 (and (=> t!38779 result!21365) b_and!42053)))

(declare-fun m!1101585 () Bool)

(assert (=> start!100248 m!1101585))

(declare-fun m!1101587 () Bool)

(assert (=> start!100248 m!1101587))

(declare-fun m!1101589 () Bool)

(assert (=> b!1192863 m!1101589))

(declare-fun m!1101591 () Bool)

(assert (=> b!1192857 m!1101591))

(declare-fun m!1101593 () Bool)

(assert (=> b!1192854 m!1101593))

(declare-fun m!1101595 () Bool)

(assert (=> b!1192854 m!1101595))

(declare-fun m!1101597 () Bool)

(assert (=> b!1192852 m!1101597))

(declare-fun m!1101599 () Bool)

(assert (=> b!1192855 m!1101599))

(declare-fun m!1101601 () Bool)

(assert (=> b!1192865 m!1101601))

(declare-fun m!1101603 () Bool)

(assert (=> b!1192860 m!1101603))

(declare-fun m!1101605 () Bool)

(assert (=> b!1192860 m!1101605))

(assert (=> b!1192860 m!1101605))

(declare-fun m!1101607 () Bool)

(assert (=> b!1192860 m!1101607))

(declare-fun m!1101609 () Bool)

(assert (=> b!1192860 m!1101609))

(declare-fun m!1101611 () Bool)

(assert (=> b!1192853 m!1101611))

(declare-fun m!1101613 () Bool)

(assert (=> b!1192853 m!1101613))

(declare-fun m!1101615 () Bool)

(assert (=> b!1192853 m!1101615))

(declare-fun m!1101617 () Bool)

(assert (=> b!1192853 m!1101617))

(declare-fun m!1101619 () Bool)

(assert (=> b!1192861 m!1101619))

(declare-fun m!1101621 () Bool)

(assert (=> b!1192861 m!1101621))

(declare-fun m!1101623 () Bool)

(assert (=> b!1192858 m!1101623))

(declare-fun m!1101625 () Bool)

(assert (=> mapNonEmpty!47009 m!1101625))

(check-sat tp_is_empty!30121 (not b!1192855) b_and!42053 (not start!100248) (not b!1192854) (not b!1192865) (not b!1192861) (not b!1192852) (not mapNonEmpty!47009) (not b!1192863) (not b_lambda!20729) (not b!1192853) (not b!1192858) (not b_next!25591) (not b!1192860))
(check-sat b_and!42053 (not b_next!25591))
