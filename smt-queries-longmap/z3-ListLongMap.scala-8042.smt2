; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99086 () Bool)

(assert start!99086)

(declare-fun b_free!24697 () Bool)

(declare-fun b_next!24697 () Bool)

(assert (=> start!99086 (= b_free!24697 (not b_next!24697))))

(declare-fun tp!86802 () Bool)

(declare-fun b_and!40221 () Bool)

(assert (=> start!99086 (= tp!86802 b_and!40221)))

(declare-fun b!1165334 () Bool)

(declare-fun res!772883 () Bool)

(declare-fun e!662473 () Bool)

(assert (=> b!1165334 (=> (not res!772883) (not e!662473))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165334 (= res!772883 (validMask!0 mask!1564))))

(declare-fun b!1165335 () Bool)

(declare-fun res!772887 () Bool)

(assert (=> b!1165335 (=> (not res!772887) (not e!662473))))

(declare-datatypes ((array!75208 0))(
  ( (array!75209 (arr!36255 (Array (_ BitVec 32) (_ BitVec 64))) (size!36793 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75208)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44097 0))(
  ( (V!44098 (val!14670 Int)) )
))
(declare-datatypes ((ValueCell!13904 0))(
  ( (ValueCellFull!13904 (v!17306 V!44097)) (EmptyCell!13904) )
))
(declare-datatypes ((array!75210 0))(
  ( (array!75211 (arr!36256 (Array (_ BitVec 32) ValueCell!13904)) (size!36794 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75210)

(assert (=> b!1165335 (= res!772887 (and (= (size!36794 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36793 _keys!1208) (size!36794 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165336 () Bool)

(declare-fun res!772882 () Bool)

(declare-fun e!662471 () Bool)

(assert (=> b!1165336 (=> (not res!772882) (not e!662471))))

(declare-fun lt!524727 () array!75208)

(declare-datatypes ((List!25513 0))(
  ( (Nil!25510) (Cons!25509 (h!26718 (_ BitVec 64)) (t!37193 List!25513)) )
))
(declare-fun arrayNoDuplicates!0 (array!75208 (_ BitVec 32) List!25513) Bool)

(assert (=> b!1165336 (= res!772882 (arrayNoDuplicates!0 lt!524727 #b00000000000000000000000000000000 Nil!25510))))

(declare-fun b!1165337 () Bool)

(assert (=> b!1165337 (= e!662473 e!662471)))

(declare-fun res!772884 () Bool)

(assert (=> b!1165337 (=> (not res!772884) (not e!662471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75208 (_ BitVec 32)) Bool)

(assert (=> b!1165337 (= res!772884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524727 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165337 (= lt!524727 (array!75209 (store (arr!36255 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36793 _keys!1208)))))

(declare-fun res!772889 () Bool)

(assert (=> start!99086 (=> (not res!772889) (not e!662473))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99086 (= res!772889 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36793 _keys!1208))))))

(assert (=> start!99086 e!662473))

(declare-fun tp_is_empty!29227 () Bool)

(assert (=> start!99086 tp_is_empty!29227))

(declare-fun array_inv!27832 (array!75208) Bool)

(assert (=> start!99086 (array_inv!27832 _keys!1208)))

(assert (=> start!99086 true))

(assert (=> start!99086 tp!86802))

(declare-fun e!662472 () Bool)

(declare-fun array_inv!27833 (array!75210) Bool)

(assert (=> start!99086 (and (array_inv!27833 _values!996) e!662472)))

(declare-fun mapIsEmpty!45665 () Bool)

(declare-fun mapRes!45665 () Bool)

(assert (=> mapIsEmpty!45665 mapRes!45665))

(declare-fun b!1165338 () Bool)

(declare-fun res!772886 () Bool)

(assert (=> b!1165338 (=> (not res!772886) (not e!662473))))

(assert (=> b!1165338 (= res!772886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165339 () Bool)

(declare-fun e!662474 () Bool)

(assert (=> b!1165339 (= e!662474 true)))

(declare-fun zeroValue!944 () V!44097)

(declare-datatypes ((tuple2!18794 0))(
  ( (tuple2!18795 (_1!9408 (_ BitVec 64)) (_2!9408 V!44097)) )
))
(declare-datatypes ((List!25514 0))(
  ( (Nil!25511) (Cons!25510 (h!26719 tuple2!18794) (t!37194 List!25514)) )
))
(declare-datatypes ((ListLongMap!16763 0))(
  ( (ListLongMap!16764 (toList!8397 List!25514)) )
))
(declare-fun lt!524724 () ListLongMap!16763)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44097)

(declare-fun getCurrentListMapNoExtraKeys!4873 (array!75208 array!75210 (_ BitVec 32) (_ BitVec 32) V!44097 V!44097 (_ BitVec 32) Int) ListLongMap!16763)

(declare-fun dynLambda!2806 (Int (_ BitVec 64)) V!44097)

(assert (=> b!1165339 (= lt!524724 (getCurrentListMapNoExtraKeys!4873 lt!524727 (array!75211 (store (arr!36256 _values!996) i!673 (ValueCellFull!13904 (dynLambda!2806 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36794 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524726 () ListLongMap!16763)

(assert (=> b!1165339 (= lt!524726 (getCurrentListMapNoExtraKeys!4873 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165340 () Bool)

(declare-fun res!772881 () Bool)

(assert (=> b!1165340 (=> (not res!772881) (not e!662473))))

(assert (=> b!1165340 (= res!772881 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36793 _keys!1208))))))

(declare-fun b!1165341 () Bool)

(declare-fun res!772885 () Bool)

(assert (=> b!1165341 (=> (not res!772885) (not e!662473))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165341 (= res!772885 (validKeyInArray!0 k0!934))))

(declare-fun b!1165342 () Bool)

(declare-fun res!772888 () Bool)

(assert (=> b!1165342 (=> (not res!772888) (not e!662473))))

(assert (=> b!1165342 (= res!772888 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25510))))

(declare-fun b!1165343 () Bool)

(declare-fun e!662475 () Bool)

(assert (=> b!1165343 (= e!662475 tp_is_empty!29227)))

(declare-fun mapNonEmpty!45665 () Bool)

(declare-fun tp!86801 () Bool)

(declare-fun e!662469 () Bool)

(assert (=> mapNonEmpty!45665 (= mapRes!45665 (and tp!86801 e!662469))))

(declare-fun mapValue!45665 () ValueCell!13904)

(declare-fun mapRest!45665 () (Array (_ BitVec 32) ValueCell!13904))

(declare-fun mapKey!45665 () (_ BitVec 32))

(assert (=> mapNonEmpty!45665 (= (arr!36256 _values!996) (store mapRest!45665 mapKey!45665 mapValue!45665))))

(declare-fun b!1165344 () Bool)

(declare-fun res!772880 () Bool)

(assert (=> b!1165344 (=> (not res!772880) (not e!662473))))

(assert (=> b!1165344 (= res!772880 (= (select (arr!36255 _keys!1208) i!673) k0!934))))

(declare-fun b!1165345 () Bool)

(assert (=> b!1165345 (= e!662471 (not e!662474))))

(declare-fun res!772879 () Bool)

(assert (=> b!1165345 (=> res!772879 e!662474)))

(assert (=> b!1165345 (= res!772879 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165345 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38287 0))(
  ( (Unit!38288) )
))
(declare-fun lt!524725 () Unit!38287)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75208 (_ BitVec 64) (_ BitVec 32)) Unit!38287)

(assert (=> b!1165345 (= lt!524725 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165346 () Bool)

(assert (=> b!1165346 (= e!662472 (and e!662475 mapRes!45665))))

(declare-fun condMapEmpty!45665 () Bool)

(declare-fun mapDefault!45665 () ValueCell!13904)

(assert (=> b!1165346 (= condMapEmpty!45665 (= (arr!36256 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13904)) mapDefault!45665)))))

(declare-fun b!1165347 () Bool)

(assert (=> b!1165347 (= e!662469 tp_is_empty!29227)))

(assert (= (and start!99086 res!772889) b!1165334))

(assert (= (and b!1165334 res!772883) b!1165335))

(assert (= (and b!1165335 res!772887) b!1165338))

(assert (= (and b!1165338 res!772886) b!1165342))

(assert (= (and b!1165342 res!772888) b!1165340))

(assert (= (and b!1165340 res!772881) b!1165341))

(assert (= (and b!1165341 res!772885) b!1165344))

(assert (= (and b!1165344 res!772880) b!1165337))

(assert (= (and b!1165337 res!772884) b!1165336))

(assert (= (and b!1165336 res!772882) b!1165345))

(assert (= (and b!1165345 (not res!772879)) b!1165339))

(assert (= (and b!1165346 condMapEmpty!45665) mapIsEmpty!45665))

(assert (= (and b!1165346 (not condMapEmpty!45665)) mapNonEmpty!45665))

(get-info :version)

(assert (= (and mapNonEmpty!45665 ((_ is ValueCellFull!13904) mapValue!45665)) b!1165347))

(assert (= (and b!1165346 ((_ is ValueCellFull!13904) mapDefault!45665)) b!1165343))

(assert (= start!99086 b!1165346))

(declare-fun b_lambda!19785 () Bool)

(assert (=> (not b_lambda!19785) (not b!1165339)))

(declare-fun t!37192 () Bool)

(declare-fun tb!9501 () Bool)

(assert (=> (and start!99086 (= defaultEntry!1004 defaultEntry!1004) t!37192) tb!9501))

(declare-fun result!19575 () Bool)

(assert (=> tb!9501 (= result!19575 tp_is_empty!29227)))

(assert (=> b!1165339 t!37192))

(declare-fun b_and!40223 () Bool)

(assert (= b_and!40221 (and (=> t!37192 result!19575) b_and!40223)))

(declare-fun m!1073041 () Bool)

(assert (=> b!1165337 m!1073041))

(declare-fun m!1073043 () Bool)

(assert (=> b!1165337 m!1073043))

(declare-fun m!1073045 () Bool)

(assert (=> b!1165341 m!1073045))

(declare-fun m!1073047 () Bool)

(assert (=> b!1165339 m!1073047))

(declare-fun m!1073049 () Bool)

(assert (=> b!1165339 m!1073049))

(declare-fun m!1073051 () Bool)

(assert (=> b!1165339 m!1073051))

(declare-fun m!1073053 () Bool)

(assert (=> b!1165339 m!1073053))

(declare-fun m!1073055 () Bool)

(assert (=> b!1165336 m!1073055))

(declare-fun m!1073057 () Bool)

(assert (=> mapNonEmpty!45665 m!1073057))

(declare-fun m!1073059 () Bool)

(assert (=> b!1165345 m!1073059))

(declare-fun m!1073061 () Bool)

(assert (=> b!1165345 m!1073061))

(declare-fun m!1073063 () Bool)

(assert (=> b!1165344 m!1073063))

(declare-fun m!1073065 () Bool)

(assert (=> b!1165334 m!1073065))

(declare-fun m!1073067 () Bool)

(assert (=> start!99086 m!1073067))

(declare-fun m!1073069 () Bool)

(assert (=> start!99086 m!1073069))

(declare-fun m!1073071 () Bool)

(assert (=> b!1165338 m!1073071))

(declare-fun m!1073073 () Bool)

(assert (=> b!1165342 m!1073073))

(check-sat (not b!1165338) (not b!1165334) (not b!1165342) (not b!1165339) (not mapNonEmpty!45665) (not start!99086) (not b!1165345) tp_is_empty!29227 (not b_next!24697) (not b!1165336) (not b!1165337) (not b_lambda!19785) b_and!40223 (not b!1165341))
(check-sat b_and!40223 (not b_next!24697))
