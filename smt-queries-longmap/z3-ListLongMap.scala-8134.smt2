; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99664 () Bool)

(assert start!99664)

(declare-fun b_free!25249 () Bool)

(declare-fun b_next!25249 () Bool)

(assert (=> start!99664 (= b_free!25249 (not b_next!25249))))

(declare-fun tp!88461 () Bool)

(declare-fun b_and!41343 () Bool)

(assert (=> start!99664 (= tp!88461 b_and!41343)))

(declare-fun res!785443 () Bool)

(declare-fun e!671944 () Bool)

(assert (=> start!99664 (=> (not res!785443) (not e!671944))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76292 0))(
  ( (array!76293 (arr!36796 (Array (_ BitVec 32) (_ BitVec 64))) (size!37334 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76292)

(assert (=> start!99664 (= res!785443 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37334 _keys!1208))))))

(assert (=> start!99664 e!671944))

(declare-fun tp_is_empty!29779 () Bool)

(assert (=> start!99664 tp_is_empty!29779))

(declare-fun array_inv!28202 (array!76292) Bool)

(assert (=> start!99664 (array_inv!28202 _keys!1208)))

(assert (=> start!99664 true))

(assert (=> start!99664 tp!88461))

(declare-datatypes ((V!44833 0))(
  ( (V!44834 (val!14946 Int)) )
))
(declare-datatypes ((ValueCell!14180 0))(
  ( (ValueCellFull!14180 (v!17583 V!44833)) (EmptyCell!14180) )
))
(declare-datatypes ((array!76294 0))(
  ( (array!76295 (arr!36797 (Array (_ BitVec 32) ValueCell!14180)) (size!37335 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76294)

(declare-fun e!671942 () Bool)

(declare-fun array_inv!28203 (array!76294) Bool)

(assert (=> start!99664 (and (array_inv!28203 _values!996) e!671942)))

(declare-fun b!1181881 () Bool)

(declare-fun e!671936 () Bool)

(assert (=> b!1181881 (= e!671936 tp_is_empty!29779)))

(declare-fun b!1181882 () Bool)

(declare-fun res!785440 () Bool)

(assert (=> b!1181882 (=> (not res!785440) (not e!671944))))

(declare-datatypes ((List!25966 0))(
  ( (Nil!25963) (Cons!25962 (h!27171 (_ BitVec 64)) (t!38198 List!25966)) )
))
(declare-fun arrayNoDuplicates!0 (array!76292 (_ BitVec 32) List!25966) Bool)

(assert (=> b!1181882 (= res!785440 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25963))))

(declare-fun b!1181883 () Bool)

(declare-fun e!671935 () Bool)

(declare-fun e!671937 () Bool)

(assert (=> b!1181883 (= e!671935 e!671937)))

(declare-fun res!785444 () Bool)

(assert (=> b!1181883 (=> res!785444 e!671937)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181883 (= res!785444 (not (validKeyInArray!0 (select (arr!36796 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19262 0))(
  ( (tuple2!19263 (_1!9642 (_ BitVec 64)) (_2!9642 V!44833)) )
))
(declare-datatypes ((List!25967 0))(
  ( (Nil!25964) (Cons!25963 (h!27172 tuple2!19262) (t!38199 List!25967)) )
))
(declare-datatypes ((ListLongMap!17231 0))(
  ( (ListLongMap!17232 (toList!8631 List!25967)) )
))
(declare-fun lt!534669 () ListLongMap!17231)

(declare-fun lt!534675 () ListLongMap!17231)

(assert (=> b!1181883 (= lt!534669 lt!534675)))

(declare-fun lt!534668 () ListLongMap!17231)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1590 (ListLongMap!17231 (_ BitVec 64)) ListLongMap!17231)

(assert (=> b!1181883 (= lt!534675 (-!1590 lt!534668 k0!934))))

(declare-fun zeroValue!944 () V!44833)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!534665 () array!76294)

(declare-fun lt!534659 () array!76292)

(declare-fun minValue!944 () V!44833)

(declare-fun getCurrentListMapNoExtraKeys!5086 (array!76292 array!76294 (_ BitVec 32) (_ BitVec 32) V!44833 V!44833 (_ BitVec 32) Int) ListLongMap!17231)

(assert (=> b!1181883 (= lt!534669 (getCurrentListMapNoExtraKeys!5086 lt!534659 lt!534665 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181883 (= lt!534668 (getCurrentListMapNoExtraKeys!5086 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38941 0))(
  ( (Unit!38942) )
))
(declare-fun lt!534671 () Unit!38941)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!853 (array!76292 array!76294 (_ BitVec 32) (_ BitVec 32) V!44833 V!44833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38941)

(assert (=> b!1181883 (= lt!534671 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!853 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1181884 () Bool)

(declare-fun res!785442 () Bool)

(assert (=> b!1181884 (=> (not res!785442) (not e!671944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76292 (_ BitVec 32)) Bool)

(assert (=> b!1181884 (= res!785442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181885 () Bool)

(declare-fun e!671939 () Bool)

(assert (=> b!1181885 (= e!671939 e!671935)))

(declare-fun res!785451 () Bool)

(assert (=> b!1181885 (=> res!785451 e!671935)))

(assert (=> b!1181885 (= res!785451 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!534663 () ListLongMap!17231)

(assert (=> b!1181885 (= lt!534663 (getCurrentListMapNoExtraKeys!5086 lt!534659 lt!534665 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534672 () V!44833)

(assert (=> b!1181885 (= lt!534665 (array!76295 (store (arr!36797 _values!996) i!673 (ValueCellFull!14180 lt!534672)) (size!37335 _values!996)))))

(declare-fun dynLambda!2993 (Int (_ BitVec 64)) V!44833)

(assert (=> b!1181885 (= lt!534672 (dynLambda!2993 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534657 () ListLongMap!17231)

(assert (=> b!1181885 (= lt!534657 (getCurrentListMapNoExtraKeys!5086 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181886 () Bool)

(declare-fun e!671940 () Bool)

(assert (=> b!1181886 (= e!671940 tp_is_empty!29779)))

(declare-fun mapIsEmpty!46496 () Bool)

(declare-fun mapRes!46496 () Bool)

(assert (=> mapIsEmpty!46496 mapRes!46496))

(declare-fun b!1181887 () Bool)

(assert (=> b!1181887 (= e!671942 (and e!671936 mapRes!46496))))

(declare-fun condMapEmpty!46496 () Bool)

(declare-fun mapDefault!46496 () ValueCell!14180)

(assert (=> b!1181887 (= condMapEmpty!46496 (= (arr!36797 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14180)) mapDefault!46496)))))

(declare-fun b!1181888 () Bool)

(declare-fun res!785446 () Bool)

(assert (=> b!1181888 (=> (not res!785446) (not e!671944))))

(assert (=> b!1181888 (= res!785446 (and (= (size!37335 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37334 _keys!1208) (size!37335 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181889 () Bool)

(declare-fun e!671938 () Bool)

(assert (=> b!1181889 (= e!671938 (not e!671939))))

(declare-fun res!785449 () Bool)

(assert (=> b!1181889 (=> res!785449 e!671939)))

(assert (=> b!1181889 (= res!785449 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181889 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534664 () Unit!38941)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76292 (_ BitVec 64) (_ BitVec 32)) Unit!38941)

(assert (=> b!1181889 (= lt!534664 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181890 () Bool)

(assert (=> b!1181890 (= e!671944 e!671938)))

(declare-fun res!785439 () Bool)

(assert (=> b!1181890 (=> (not res!785439) (not e!671938))))

(assert (=> b!1181890 (= res!785439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534659 mask!1564))))

(assert (=> b!1181890 (= lt!534659 (array!76293 (store (arr!36796 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37334 _keys!1208)))))

(declare-fun b!1181891 () Bool)

(declare-fun res!785441 () Bool)

(assert (=> b!1181891 (=> (not res!785441) (not e!671944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181891 (= res!785441 (validMask!0 mask!1564))))

(declare-fun b!1181892 () Bool)

(declare-fun res!785450 () Bool)

(assert (=> b!1181892 (=> (not res!785450) (not e!671944))))

(assert (=> b!1181892 (= res!785450 (validKeyInArray!0 k0!934))))

(declare-fun b!1181893 () Bool)

(declare-fun res!785452 () Bool)

(assert (=> b!1181893 (=> (not res!785452) (not e!671944))))

(assert (=> b!1181893 (= res!785452 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37334 _keys!1208))))))

(declare-fun b!1181894 () Bool)

(assert (=> b!1181894 (= e!671937 true)))

(declare-fun lt!534662 () ListLongMap!17231)

(declare-fun lt!534666 () ListLongMap!17231)

(assert (=> b!1181894 (= (-!1590 lt!534662 k0!934) lt!534666)))

(declare-fun lt!534660 () V!44833)

(declare-fun lt!534667 () Unit!38941)

(declare-fun addRemoveCommutativeForDiffKeys!141 (ListLongMap!17231 (_ BitVec 64) V!44833 (_ BitVec 64)) Unit!38941)

(assert (=> b!1181894 (= lt!534667 (addRemoveCommutativeForDiffKeys!141 lt!534668 (select (arr!36796 _keys!1208) from!1455) lt!534660 k0!934))))

(assert (=> b!1181894 (and (= lt!534657 lt!534662) (= lt!534675 lt!534669))))

(declare-fun lt!534661 () tuple2!19262)

(declare-fun +!3927 (ListLongMap!17231 tuple2!19262) ListLongMap!17231)

(assert (=> b!1181894 (= lt!534662 (+!3927 lt!534668 lt!534661))))

(assert (=> b!1181894 (not (= (select (arr!36796 _keys!1208) from!1455) k0!934))))

(declare-fun lt!534658 () Unit!38941)

(declare-fun e!671933 () Unit!38941)

(assert (=> b!1181894 (= lt!534658 e!671933)))

(declare-fun c!116971 () Bool)

(assert (=> b!1181894 (= c!116971 (= (select (arr!36796 _keys!1208) from!1455) k0!934))))

(declare-fun e!671941 () Bool)

(assert (=> b!1181894 e!671941))

(declare-fun res!785447 () Bool)

(assert (=> b!1181894 (=> (not res!785447) (not e!671941))))

(assert (=> b!1181894 (= res!785447 (= lt!534663 lt!534666))))

(assert (=> b!1181894 (= lt!534666 (+!3927 lt!534675 lt!534661))))

(assert (=> b!1181894 (= lt!534661 (tuple2!19263 (select (arr!36796 _keys!1208) from!1455) lt!534660))))

(declare-fun get!18832 (ValueCell!14180 V!44833) V!44833)

(assert (=> b!1181894 (= lt!534660 (get!18832 (select (arr!36797 _values!996) from!1455) lt!534672))))

(declare-fun b!1181895 () Bool)

(declare-fun res!785448 () Bool)

(assert (=> b!1181895 (=> (not res!785448) (not e!671938))))

(assert (=> b!1181895 (= res!785448 (arrayNoDuplicates!0 lt!534659 #b00000000000000000000000000000000 Nil!25963))))

(declare-fun e!671934 () Bool)

(declare-fun b!1181896 () Bool)

(assert (=> b!1181896 (= e!671934 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46496 () Bool)

(declare-fun tp!88460 () Bool)

(assert (=> mapNonEmpty!46496 (= mapRes!46496 (and tp!88460 e!671940))))

(declare-fun mapValue!46496 () ValueCell!14180)

(declare-fun mapRest!46496 () (Array (_ BitVec 32) ValueCell!14180))

(declare-fun mapKey!46496 () (_ BitVec 32))

(assert (=> mapNonEmpty!46496 (= (arr!36797 _values!996) (store mapRest!46496 mapKey!46496 mapValue!46496))))

(declare-fun b!1181897 () Bool)

(assert (=> b!1181897 (= e!671941 e!671934)))

(declare-fun res!785438 () Bool)

(assert (=> b!1181897 (=> res!785438 e!671934)))

(assert (=> b!1181897 (= res!785438 (not (= (select (arr!36796 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1181898 () Bool)

(declare-fun res!785445 () Bool)

(assert (=> b!1181898 (=> (not res!785445) (not e!671944))))

(assert (=> b!1181898 (= res!785445 (= (select (arr!36796 _keys!1208) i!673) k0!934))))

(declare-fun b!1181899 () Bool)

(declare-fun Unit!38943 () Unit!38941)

(assert (=> b!1181899 (= e!671933 Unit!38943)))

(declare-fun lt!534674 () Unit!38941)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76292 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38941)

(assert (=> b!1181899 (= lt!534674 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1181899 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534673 () Unit!38941)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76292 (_ BitVec 32) (_ BitVec 32)) Unit!38941)

(assert (=> b!1181899 (= lt!534673 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1181899 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25963)))

(declare-fun lt!534670 () Unit!38941)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76292 (_ BitVec 64) (_ BitVec 32) List!25966) Unit!38941)

(assert (=> b!1181899 (= lt!534670 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25963))))

(assert (=> b!1181899 false))

(declare-fun b!1181900 () Bool)

(declare-fun Unit!38944 () Unit!38941)

(assert (=> b!1181900 (= e!671933 Unit!38944)))

(assert (= (and start!99664 res!785443) b!1181891))

(assert (= (and b!1181891 res!785441) b!1181888))

(assert (= (and b!1181888 res!785446) b!1181884))

(assert (= (and b!1181884 res!785442) b!1181882))

(assert (= (and b!1181882 res!785440) b!1181893))

(assert (= (and b!1181893 res!785452) b!1181892))

(assert (= (and b!1181892 res!785450) b!1181898))

(assert (= (and b!1181898 res!785445) b!1181890))

(assert (= (and b!1181890 res!785439) b!1181895))

(assert (= (and b!1181895 res!785448) b!1181889))

(assert (= (and b!1181889 (not res!785449)) b!1181885))

(assert (= (and b!1181885 (not res!785451)) b!1181883))

(assert (= (and b!1181883 (not res!785444)) b!1181894))

(assert (= (and b!1181894 res!785447) b!1181897))

(assert (= (and b!1181897 (not res!785438)) b!1181896))

(assert (= (and b!1181894 c!116971) b!1181899))

(assert (= (and b!1181894 (not c!116971)) b!1181900))

(assert (= (and b!1181887 condMapEmpty!46496) mapIsEmpty!46496))

(assert (= (and b!1181887 (not condMapEmpty!46496)) mapNonEmpty!46496))

(get-info :version)

(assert (= (and mapNonEmpty!46496 ((_ is ValueCellFull!14180) mapValue!46496)) b!1181886))

(assert (= (and b!1181887 ((_ is ValueCellFull!14180) mapDefault!46496)) b!1181881))

(assert (= start!99664 b!1181887))

(declare-fun b_lambda!20375 () Bool)

(assert (=> (not b_lambda!20375) (not b!1181885)))

(declare-fun t!38197 () Bool)

(declare-fun tb!10053 () Bool)

(assert (=> (and start!99664 (= defaultEntry!1004 defaultEntry!1004) t!38197) tb!10053))

(declare-fun result!20681 () Bool)

(assert (=> tb!10053 (= result!20681 tp_is_empty!29779)))

(assert (=> b!1181885 t!38197))

(declare-fun b_and!41345 () Bool)

(assert (= b_and!41343 (and (=> t!38197 result!20681) b_and!41345)))

(declare-fun m!1089365 () Bool)

(assert (=> b!1181889 m!1089365))

(declare-fun m!1089367 () Bool)

(assert (=> b!1181889 m!1089367))

(declare-fun m!1089369 () Bool)

(assert (=> b!1181892 m!1089369))

(declare-fun m!1089371 () Bool)

(assert (=> b!1181898 m!1089371))

(declare-fun m!1089373 () Bool)

(assert (=> b!1181891 m!1089373))

(declare-fun m!1089375 () Bool)

(assert (=> mapNonEmpty!46496 m!1089375))

(declare-fun m!1089377 () Bool)

(assert (=> start!99664 m!1089377))

(declare-fun m!1089379 () Bool)

(assert (=> start!99664 m!1089379))

(declare-fun m!1089381 () Bool)

(assert (=> b!1181885 m!1089381))

(declare-fun m!1089383 () Bool)

(assert (=> b!1181885 m!1089383))

(declare-fun m!1089385 () Bool)

(assert (=> b!1181885 m!1089385))

(declare-fun m!1089387 () Bool)

(assert (=> b!1181885 m!1089387))

(declare-fun m!1089389 () Bool)

(assert (=> b!1181897 m!1089389))

(declare-fun m!1089391 () Bool)

(assert (=> b!1181899 m!1089391))

(declare-fun m!1089393 () Bool)

(assert (=> b!1181899 m!1089393))

(declare-fun m!1089395 () Bool)

(assert (=> b!1181899 m!1089395))

(declare-fun m!1089397 () Bool)

(assert (=> b!1181899 m!1089397))

(declare-fun m!1089399 () Bool)

(assert (=> b!1181899 m!1089399))

(declare-fun m!1089401 () Bool)

(assert (=> b!1181894 m!1089401))

(assert (=> b!1181894 m!1089401))

(declare-fun m!1089403 () Bool)

(assert (=> b!1181894 m!1089403))

(declare-fun m!1089405 () Bool)

(assert (=> b!1181894 m!1089405))

(assert (=> b!1181894 m!1089389))

(declare-fun m!1089407 () Bool)

(assert (=> b!1181894 m!1089407))

(assert (=> b!1181894 m!1089389))

(declare-fun m!1089409 () Bool)

(assert (=> b!1181894 m!1089409))

(declare-fun m!1089411 () Bool)

(assert (=> b!1181894 m!1089411))

(declare-fun m!1089413 () Bool)

(assert (=> b!1181896 m!1089413))

(declare-fun m!1089415 () Bool)

(assert (=> b!1181890 m!1089415))

(declare-fun m!1089417 () Bool)

(assert (=> b!1181890 m!1089417))

(declare-fun m!1089419 () Bool)

(assert (=> b!1181895 m!1089419))

(declare-fun m!1089421 () Bool)

(assert (=> b!1181884 m!1089421))

(declare-fun m!1089423 () Bool)

(assert (=> b!1181882 m!1089423))

(declare-fun m!1089425 () Bool)

(assert (=> b!1181883 m!1089425))

(declare-fun m!1089427 () Bool)

(assert (=> b!1181883 m!1089427))

(assert (=> b!1181883 m!1089389))

(declare-fun m!1089429 () Bool)

(assert (=> b!1181883 m!1089429))

(assert (=> b!1181883 m!1089389))

(declare-fun m!1089431 () Bool)

(assert (=> b!1181883 m!1089431))

(declare-fun m!1089433 () Bool)

(assert (=> b!1181883 m!1089433))

(check-sat (not b!1181890) (not b_next!25249) (not b!1181899) (not b!1181896) tp_is_empty!29779 (not start!99664) (not b!1181889) (not mapNonEmpty!46496) b_and!41345 (not b!1181895) (not b!1181891) (not b!1181883) (not b!1181894) (not b_lambda!20375) (not b!1181885) (not b!1181882) (not b!1181892) (not b!1181884))
(check-sat b_and!41345 (not b_next!25249))
