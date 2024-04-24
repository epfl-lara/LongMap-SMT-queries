; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101426 () Bool)

(assert start!101426)

(declare-fun b_free!26113 () Bool)

(declare-fun b_next!26113 () Bool)

(assert (=> start!101426 (= b_free!26113 (not b_next!26113))))

(declare-fun tp!91361 () Bool)

(declare-fun b_and!43345 () Bool)

(assert (=> start!101426 (= tp!91361 b_and!43345)))

(declare-fun b!1216047 () Bool)

(declare-fun e!690651 () Bool)

(declare-fun e!690650 () Bool)

(assert (=> b!1216047 (= e!690651 (not e!690650))))

(declare-fun res!807003 () Bool)

(assert (=> b!1216047 (=> res!807003 e!690650)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216047 (= res!807003 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78455 0))(
  ( (array!78456 (arr!37856 (Array (_ BitVec 32) (_ BitVec 64))) (size!38393 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78455)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216047 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40256 0))(
  ( (Unit!40257) )
))
(declare-fun lt!552909 () Unit!40256)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78455 (_ BitVec 64) (_ BitVec 32)) Unit!40256)

(assert (=> b!1216047 (= lt!552909 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216048 () Bool)

(declare-fun res!807005 () Bool)

(declare-fun e!690649 () Bool)

(assert (=> b!1216048 (=> (not res!807005) (not e!690649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216048 (= res!807005 (validKeyInArray!0 k0!934))))

(declare-fun b!1216049 () Bool)

(declare-fun res!807008 () Bool)

(assert (=> b!1216049 (=> (not res!807008) (not e!690649))))

(assert (=> b!1216049 (= res!807008 (= (select (arr!37856 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!48100 () Bool)

(declare-fun mapRes!48100 () Bool)

(assert (=> mapIsEmpty!48100 mapRes!48100))

(declare-fun b!1216051 () Bool)

(declare-fun res!807007 () Bool)

(assert (=> b!1216051 (=> (not res!807007) (not e!690649))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216051 (= res!807007 (validMask!0 mask!1564))))

(declare-fun b!1216052 () Bool)

(declare-fun res!807004 () Bool)

(assert (=> b!1216052 (=> (not res!807004) (not e!690649))))

(declare-datatypes ((List!26701 0))(
  ( (Nil!26698) (Cons!26697 (h!27915 (_ BitVec 64)) (t!39786 List!26701)) )
))
(declare-fun arrayNoDuplicates!0 (array!78455 (_ BitVec 32) List!26701) Bool)

(assert (=> b!1216052 (= res!807004 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26698))))

(declare-fun b!1216053 () Bool)

(declare-fun res!807010 () Bool)

(assert (=> b!1216053 (=> (not res!807010) (not e!690649))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46217 0))(
  ( (V!46218 (val!15465 Int)) )
))
(declare-datatypes ((ValueCell!14699 0))(
  ( (ValueCellFull!14699 (v!18114 V!46217)) (EmptyCell!14699) )
))
(declare-datatypes ((array!78457 0))(
  ( (array!78458 (arr!37857 (Array (_ BitVec 32) ValueCell!14699)) (size!38394 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78457)

(assert (=> b!1216053 (= res!807010 (and (= (size!38394 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38393 _keys!1208) (size!38394 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216054 () Bool)

(declare-fun res!807009 () Bool)

(assert (=> b!1216054 (=> (not res!807009) (not e!690651))))

(declare-fun lt!552912 () array!78455)

(assert (=> b!1216054 (= res!807009 (arrayNoDuplicates!0 lt!552912 #b00000000000000000000000000000000 Nil!26698))))

(declare-fun b!1216055 () Bool)

(declare-fun res!807001 () Bool)

(assert (=> b!1216055 (=> (not res!807001) (not e!690649))))

(assert (=> b!1216055 (= res!807001 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38393 _keys!1208))))))

(declare-fun b!1216056 () Bool)

(declare-fun e!690653 () Bool)

(declare-fun tp_is_empty!30817 () Bool)

(assert (=> b!1216056 (= e!690653 tp_is_empty!30817)))

(declare-fun b!1216057 () Bool)

(assert (=> b!1216057 (= e!690650 true)))

(declare-fun zeroValue!944 () V!46217)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19898 0))(
  ( (tuple2!19899 (_1!9960 (_ BitVec 64)) (_2!9960 V!46217)) )
))
(declare-datatypes ((List!26702 0))(
  ( (Nil!26699) (Cons!26698 (h!27916 tuple2!19898) (t!39787 List!26702)) )
))
(declare-datatypes ((ListLongMap!17875 0))(
  ( (ListLongMap!17876 (toList!8953 List!26702)) )
))
(declare-fun lt!552911 () ListLongMap!17875)

(declare-fun minValue!944 () V!46217)

(declare-fun getCurrentListMapNoExtraKeys!5410 (array!78455 array!78457 (_ BitVec 32) (_ BitVec 32) V!46217 V!46217 (_ BitVec 32) Int) ListLongMap!17875)

(declare-fun dynLambda!3322 (Int (_ BitVec 64)) V!46217)

(assert (=> b!1216057 (= lt!552911 (getCurrentListMapNoExtraKeys!5410 lt!552912 (array!78458 (store (arr!37857 _values!996) i!673 (ValueCellFull!14699 (dynLambda!3322 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38394 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552910 () ListLongMap!17875)

(assert (=> b!1216057 (= lt!552910 (getCurrentListMapNoExtraKeys!5410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216058 () Bool)

(assert (=> b!1216058 (= e!690649 e!690651)))

(declare-fun res!807006 () Bool)

(assert (=> b!1216058 (=> (not res!807006) (not e!690651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78455 (_ BitVec 32)) Bool)

(assert (=> b!1216058 (= res!807006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552912 mask!1564))))

(assert (=> b!1216058 (= lt!552912 (array!78456 (store (arr!37856 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38393 _keys!1208)))))

(declare-fun b!1216059 () Bool)

(declare-fun e!690654 () Bool)

(declare-fun e!690655 () Bool)

(assert (=> b!1216059 (= e!690654 (and e!690655 mapRes!48100))))

(declare-fun condMapEmpty!48100 () Bool)

(declare-fun mapDefault!48100 () ValueCell!14699)

(assert (=> b!1216059 (= condMapEmpty!48100 (= (arr!37857 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14699)) mapDefault!48100)))))

(declare-fun b!1216060 () Bool)

(assert (=> b!1216060 (= e!690655 tp_is_empty!30817)))

(declare-fun mapNonEmpty!48100 () Bool)

(declare-fun tp!91360 () Bool)

(assert (=> mapNonEmpty!48100 (= mapRes!48100 (and tp!91360 e!690653))))

(declare-fun mapValue!48100 () ValueCell!14699)

(declare-fun mapKey!48100 () (_ BitVec 32))

(declare-fun mapRest!48100 () (Array (_ BitVec 32) ValueCell!14699))

(assert (=> mapNonEmpty!48100 (= (arr!37857 _values!996) (store mapRest!48100 mapKey!48100 mapValue!48100))))

(declare-fun res!807000 () Bool)

(assert (=> start!101426 (=> (not res!807000) (not e!690649))))

(assert (=> start!101426 (= res!807000 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38393 _keys!1208))))))

(assert (=> start!101426 e!690649))

(assert (=> start!101426 tp_is_empty!30817))

(declare-fun array_inv!28890 (array!78455) Bool)

(assert (=> start!101426 (array_inv!28890 _keys!1208)))

(assert (=> start!101426 true))

(assert (=> start!101426 tp!91361))

(declare-fun array_inv!28891 (array!78457) Bool)

(assert (=> start!101426 (and (array_inv!28891 _values!996) e!690654)))

(declare-fun b!1216050 () Bool)

(declare-fun res!807002 () Bool)

(assert (=> b!1216050 (=> (not res!807002) (not e!690649))))

(assert (=> b!1216050 (= res!807002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!101426 res!807000) b!1216051))

(assert (= (and b!1216051 res!807007) b!1216053))

(assert (= (and b!1216053 res!807010) b!1216050))

(assert (= (and b!1216050 res!807002) b!1216052))

(assert (= (and b!1216052 res!807004) b!1216055))

(assert (= (and b!1216055 res!807001) b!1216048))

(assert (= (and b!1216048 res!807005) b!1216049))

(assert (= (and b!1216049 res!807008) b!1216058))

(assert (= (and b!1216058 res!807006) b!1216054))

(assert (= (and b!1216054 res!807009) b!1216047))

(assert (= (and b!1216047 (not res!807003)) b!1216057))

(assert (= (and b!1216059 condMapEmpty!48100) mapIsEmpty!48100))

(assert (= (and b!1216059 (not condMapEmpty!48100)) mapNonEmpty!48100))

(get-info :version)

(assert (= (and mapNonEmpty!48100 ((_ is ValueCellFull!14699) mapValue!48100)) b!1216056))

(assert (= (and b!1216059 ((_ is ValueCellFull!14699) mapDefault!48100)) b!1216060))

(assert (= start!101426 b!1216059))

(declare-fun b_lambda!21783 () Bool)

(assert (=> (not b_lambda!21783) (not b!1216057)))

(declare-fun t!39785 () Bool)

(declare-fun tb!10905 () Bool)

(assert (=> (and start!101426 (= defaultEntry!1004 defaultEntry!1004) t!39785) tb!10905))

(declare-fun result!22415 () Bool)

(assert (=> tb!10905 (= result!22415 tp_is_empty!30817)))

(assert (=> b!1216057 t!39785))

(declare-fun b_and!43347 () Bool)

(assert (= b_and!43345 (and (=> t!39785 result!22415) b_and!43347)))

(declare-fun m!1121475 () Bool)

(assert (=> mapNonEmpty!48100 m!1121475))

(declare-fun m!1121477 () Bool)

(assert (=> b!1216047 m!1121477))

(declare-fun m!1121479 () Bool)

(assert (=> b!1216047 m!1121479))

(declare-fun m!1121481 () Bool)

(assert (=> b!1216052 m!1121481))

(declare-fun m!1121483 () Bool)

(assert (=> b!1216050 m!1121483))

(declare-fun m!1121485 () Bool)

(assert (=> b!1216058 m!1121485))

(declare-fun m!1121487 () Bool)

(assert (=> b!1216058 m!1121487))

(declare-fun m!1121489 () Bool)

(assert (=> b!1216051 m!1121489))

(declare-fun m!1121491 () Bool)

(assert (=> start!101426 m!1121491))

(declare-fun m!1121493 () Bool)

(assert (=> start!101426 m!1121493))

(declare-fun m!1121495 () Bool)

(assert (=> b!1216057 m!1121495))

(declare-fun m!1121497 () Bool)

(assert (=> b!1216057 m!1121497))

(declare-fun m!1121499 () Bool)

(assert (=> b!1216057 m!1121499))

(declare-fun m!1121501 () Bool)

(assert (=> b!1216057 m!1121501))

(declare-fun m!1121503 () Bool)

(assert (=> b!1216048 m!1121503))

(declare-fun m!1121505 () Bool)

(assert (=> b!1216049 m!1121505))

(declare-fun m!1121507 () Bool)

(assert (=> b!1216054 m!1121507))

(check-sat (not start!101426) (not b!1216051) (not b!1216052) (not b!1216050) tp_is_empty!30817 b_and!43347 (not b!1216054) (not b!1216057) (not mapNonEmpty!48100) (not b!1216058) (not b_lambda!21783) (not b_next!26113) (not b!1216047) (not b!1216048))
(check-sat b_and!43347 (not b_next!26113))
