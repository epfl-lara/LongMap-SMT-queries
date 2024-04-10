; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101216 () Bool)

(assert start!101216)

(declare-fun b_free!26139 () Bool)

(declare-fun b_next!26139 () Bool)

(assert (=> start!101216 (= b_free!26139 (not b_next!26139))))

(declare-fun tp!91438 () Bool)

(declare-fun b_and!43395 () Bool)

(assert (=> start!101216 (= tp!91438 b_and!43395)))

(declare-fun mapIsEmpty!48139 () Bool)

(declare-fun mapRes!48139 () Bool)

(assert (=> mapIsEmpty!48139 mapRes!48139))

(declare-fun b!1215332 () Bool)

(declare-fun res!806933 () Bool)

(declare-fun e!690091 () Bool)

(assert (=> b!1215332 (=> (not res!806933) (not e!690091))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215332 (= res!806933 (validMask!0 mask!1564))))

(declare-fun b!1215333 () Bool)

(declare-fun res!806931 () Bool)

(assert (=> b!1215333 (=> (not res!806931) (not e!690091))))

(declare-datatypes ((array!78461 0))(
  ( (array!78462 (arr!37865 (Array (_ BitVec 32) (_ BitVec 64))) (size!38401 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78461)

(declare-datatypes ((List!26693 0))(
  ( (Nil!26690) (Cons!26689 (h!27898 (_ BitVec 64)) (t!39812 List!26693)) )
))
(declare-fun arrayNoDuplicates!0 (array!78461 (_ BitVec 32) List!26693) Bool)

(assert (=> b!1215333 (= res!806931 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26690))))

(declare-fun mapNonEmpty!48139 () Bool)

(declare-fun tp!91439 () Bool)

(declare-fun e!690094 () Bool)

(assert (=> mapNonEmpty!48139 (= mapRes!48139 (and tp!91439 e!690094))))

(declare-datatypes ((V!46251 0))(
  ( (V!46252 (val!15478 Int)) )
))
(declare-datatypes ((ValueCell!14712 0))(
  ( (ValueCellFull!14712 (v!18131 V!46251)) (EmptyCell!14712) )
))
(declare-fun mapRest!48139 () (Array (_ BitVec 32) ValueCell!14712))

(declare-fun mapKey!48139 () (_ BitVec 32))

(declare-datatypes ((array!78463 0))(
  ( (array!78464 (arr!37866 (Array (_ BitVec 32) ValueCell!14712)) (size!38402 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78463)

(declare-fun mapValue!48139 () ValueCell!14712)

(assert (=> mapNonEmpty!48139 (= (arr!37866 _values!996) (store mapRest!48139 mapKey!48139 mapValue!48139))))

(declare-fun b!1215335 () Bool)

(declare-fun e!690095 () Bool)

(declare-fun e!690093 () Bool)

(assert (=> b!1215335 (= e!690095 (not e!690093))))

(declare-fun res!806924 () Bool)

(assert (=> b!1215335 (=> res!806924 e!690093)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215335 (= res!806924 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215335 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40296 0))(
  ( (Unit!40297) )
))
(declare-fun lt!552586 () Unit!40296)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78461 (_ BitVec 64) (_ BitVec 32)) Unit!40296)

(assert (=> b!1215335 (= lt!552586 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1215336 () Bool)

(assert (=> b!1215336 (= e!690091 e!690095)))

(declare-fun res!806923 () Bool)

(assert (=> b!1215336 (=> (not res!806923) (not e!690095))))

(declare-fun lt!552585 () array!78461)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78461 (_ BitVec 32)) Bool)

(assert (=> b!1215336 (= res!806923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552585 mask!1564))))

(assert (=> b!1215336 (= lt!552585 (array!78462 (store (arr!37865 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38401 _keys!1208)))))

(declare-fun b!1215337 () Bool)

(declare-fun res!806927 () Bool)

(assert (=> b!1215337 (=> (not res!806927) (not e!690091))))

(assert (=> b!1215337 (= res!806927 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38401 _keys!1208))))))

(declare-fun b!1215338 () Bool)

(declare-fun res!806929 () Bool)

(assert (=> b!1215338 (=> (not res!806929) (not e!690095))))

(assert (=> b!1215338 (= res!806929 (arrayNoDuplicates!0 lt!552585 #b00000000000000000000000000000000 Nil!26690))))

(declare-fun b!1215339 () Bool)

(declare-fun res!806930 () Bool)

(assert (=> b!1215339 (=> (not res!806930) (not e!690091))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1215339 (= res!806930 (and (= (size!38402 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38401 _keys!1208) (size!38402 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215340 () Bool)

(assert (=> b!1215340 (= e!690093 true)))

(declare-fun zeroValue!944 () V!46251)

(declare-datatypes ((tuple2!19892 0))(
  ( (tuple2!19893 (_1!9957 (_ BitVec 64)) (_2!9957 V!46251)) )
))
(declare-datatypes ((List!26694 0))(
  ( (Nil!26691) (Cons!26690 (h!27899 tuple2!19892) (t!39813 List!26694)) )
))
(declare-datatypes ((ListLongMap!17861 0))(
  ( (ListLongMap!17862 (toList!8946 List!26694)) )
))
(declare-fun lt!552588 () ListLongMap!17861)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46251)

(declare-fun getCurrentListMapNoExtraKeys!5373 (array!78461 array!78463 (_ BitVec 32) (_ BitVec 32) V!46251 V!46251 (_ BitVec 32) Int) ListLongMap!17861)

(declare-fun dynLambda!3262 (Int (_ BitVec 64)) V!46251)

(assert (=> b!1215340 (= lt!552588 (getCurrentListMapNoExtraKeys!5373 lt!552585 (array!78464 (store (arr!37866 _values!996) i!673 (ValueCellFull!14712 (dynLambda!3262 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38402 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552587 () ListLongMap!17861)

(assert (=> b!1215340 (= lt!552587 (getCurrentListMapNoExtraKeys!5373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215341 () Bool)

(declare-fun res!806926 () Bool)

(assert (=> b!1215341 (=> (not res!806926) (not e!690091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215341 (= res!806926 (validKeyInArray!0 k0!934))))

(declare-fun b!1215342 () Bool)

(declare-fun e!690092 () Bool)

(declare-fun tp_is_empty!30843 () Bool)

(assert (=> b!1215342 (= e!690092 tp_is_empty!30843)))

(declare-fun b!1215343 () Bool)

(declare-fun res!806928 () Bool)

(assert (=> b!1215343 (=> (not res!806928) (not e!690091))))

(assert (=> b!1215343 (= res!806928 (= (select (arr!37865 _keys!1208) i!673) k0!934))))

(declare-fun b!1215344 () Bool)

(assert (=> b!1215344 (= e!690094 tp_is_empty!30843)))

(declare-fun b!1215345 () Bool)

(declare-fun res!806925 () Bool)

(assert (=> b!1215345 (=> (not res!806925) (not e!690091))))

(assert (=> b!1215345 (= res!806925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215334 () Bool)

(declare-fun e!690097 () Bool)

(assert (=> b!1215334 (= e!690097 (and e!690092 mapRes!48139))))

(declare-fun condMapEmpty!48139 () Bool)

(declare-fun mapDefault!48139 () ValueCell!14712)

(assert (=> b!1215334 (= condMapEmpty!48139 (= (arr!37866 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14712)) mapDefault!48139)))))

(declare-fun res!806932 () Bool)

(assert (=> start!101216 (=> (not res!806932) (not e!690091))))

(assert (=> start!101216 (= res!806932 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38401 _keys!1208))))))

(assert (=> start!101216 e!690091))

(assert (=> start!101216 tp_is_empty!30843))

(declare-fun array_inv!28832 (array!78461) Bool)

(assert (=> start!101216 (array_inv!28832 _keys!1208)))

(assert (=> start!101216 true))

(assert (=> start!101216 tp!91438))

(declare-fun array_inv!28833 (array!78463) Bool)

(assert (=> start!101216 (and (array_inv!28833 _values!996) e!690097)))

(assert (= (and start!101216 res!806932) b!1215332))

(assert (= (and b!1215332 res!806933) b!1215339))

(assert (= (and b!1215339 res!806930) b!1215345))

(assert (= (and b!1215345 res!806925) b!1215333))

(assert (= (and b!1215333 res!806931) b!1215337))

(assert (= (and b!1215337 res!806927) b!1215341))

(assert (= (and b!1215341 res!806926) b!1215343))

(assert (= (and b!1215343 res!806928) b!1215336))

(assert (= (and b!1215336 res!806923) b!1215338))

(assert (= (and b!1215338 res!806929) b!1215335))

(assert (= (and b!1215335 (not res!806924)) b!1215340))

(assert (= (and b!1215334 condMapEmpty!48139) mapIsEmpty!48139))

(assert (= (and b!1215334 (not condMapEmpty!48139)) mapNonEmpty!48139))

(get-info :version)

(assert (= (and mapNonEmpty!48139 ((_ is ValueCellFull!14712) mapValue!48139)) b!1215344))

(assert (= (and b!1215334 ((_ is ValueCellFull!14712) mapDefault!48139)) b!1215342))

(assert (= start!101216 b!1215334))

(declare-fun b_lambda!21815 () Bool)

(assert (=> (not b_lambda!21815) (not b!1215340)))

(declare-fun t!39811 () Bool)

(declare-fun tb!10939 () Bool)

(assert (=> (and start!101216 (= defaultEntry!1004 defaultEntry!1004) t!39811) tb!10939))

(declare-fun result!22475 () Bool)

(assert (=> tb!10939 (= result!22475 tp_is_empty!30843)))

(assert (=> b!1215340 t!39811))

(declare-fun b_and!43397 () Bool)

(assert (= b_and!43395 (and (=> t!39811 result!22475) b_and!43397)))

(declare-fun m!1120327 () Bool)

(assert (=> b!1215340 m!1120327))

(declare-fun m!1120329 () Bool)

(assert (=> b!1215340 m!1120329))

(declare-fun m!1120331 () Bool)

(assert (=> b!1215340 m!1120331))

(declare-fun m!1120333 () Bool)

(assert (=> b!1215340 m!1120333))

(declare-fun m!1120335 () Bool)

(assert (=> b!1215333 m!1120335))

(declare-fun m!1120337 () Bool)

(assert (=> b!1215343 m!1120337))

(declare-fun m!1120339 () Bool)

(assert (=> b!1215338 m!1120339))

(declare-fun m!1120341 () Bool)

(assert (=> b!1215335 m!1120341))

(declare-fun m!1120343 () Bool)

(assert (=> b!1215335 m!1120343))

(declare-fun m!1120345 () Bool)

(assert (=> b!1215345 m!1120345))

(declare-fun m!1120347 () Bool)

(assert (=> b!1215332 m!1120347))

(declare-fun m!1120349 () Bool)

(assert (=> b!1215336 m!1120349))

(declare-fun m!1120351 () Bool)

(assert (=> b!1215336 m!1120351))

(declare-fun m!1120353 () Bool)

(assert (=> b!1215341 m!1120353))

(declare-fun m!1120355 () Bool)

(assert (=> start!101216 m!1120355))

(declare-fun m!1120357 () Bool)

(assert (=> start!101216 m!1120357))

(declare-fun m!1120359 () Bool)

(assert (=> mapNonEmpty!48139 m!1120359))

(check-sat (not b!1215336) (not start!101216) (not b!1215333) (not b_lambda!21815) (not b!1215341) (not b_next!26139) (not b!1215338) (not b!1215340) (not b!1215345) tp_is_empty!30843 b_and!43397 (not b!1215335) (not mapNonEmpty!48139) (not b!1215332))
(check-sat b_and!43397 (not b_next!26139))
