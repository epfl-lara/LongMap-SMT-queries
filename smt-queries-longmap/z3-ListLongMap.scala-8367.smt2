; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101778 () Bool)

(assert start!101778)

(declare-fun b_free!26473 () Bool)

(declare-fun b_next!26473 () Bool)

(assert (=> start!101778 (= b_free!26473 (not b_next!26473))))

(declare-fun tp!92465 () Bool)

(declare-fun b_and!44189 () Bool)

(assert (=> start!101778 (= tp!92465 b_and!44189)))

(declare-fun b!1225881 () Bool)

(declare-fun res!814719 () Bool)

(declare-fun e!696228 () Bool)

(assert (=> b!1225881 (=> (not res!814719) (not e!696228))))

(declare-datatypes ((array!79052 0))(
  ( (array!79053 (arr!38153 (Array (_ BitVec 32) (_ BitVec 64))) (size!38691 (_ BitVec 32))) )
))
(declare-fun lt!558473 () array!79052)

(declare-datatypes ((List!27031 0))(
  ( (Nil!27028) (Cons!27027 (h!28236 (_ BitVec 64)) (t!40475 List!27031)) )
))
(declare-fun arrayNoDuplicates!0 (array!79052 (_ BitVec 32) List!27031) Bool)

(assert (=> b!1225881 (= res!814719 (arrayNoDuplicates!0 lt!558473 #b00000000000000000000000000000000 Nil!27028))))

(declare-fun b!1225882 () Bool)

(declare-fun res!814714 () Bool)

(declare-fun e!696230 () Bool)

(assert (=> b!1225882 (=> (not res!814714) (not e!696230))))

(declare-fun _keys!1208 () array!79052)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79052 (_ BitVec 32)) Bool)

(assert (=> b!1225882 (= res!814714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225883 () Bool)

(declare-fun res!814725 () Bool)

(assert (=> b!1225883 (=> (not res!814725) (not e!696230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225883 (= res!814725 (validMask!0 mask!1564))))

(declare-fun b!1225884 () Bool)

(declare-fun res!814715 () Bool)

(assert (=> b!1225884 (=> (not res!814715) (not e!696230))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46697 0))(
  ( (V!46698 (val!15645 Int)) )
))
(declare-datatypes ((ValueCell!14879 0))(
  ( (ValueCellFull!14879 (v!18306 V!46697)) (EmptyCell!14879) )
))
(declare-datatypes ((array!79054 0))(
  ( (array!79055 (arr!38154 (Array (_ BitVec 32) ValueCell!14879)) (size!38692 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79054)

(assert (=> b!1225884 (= res!814715 (and (= (size!38692 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38691 _keys!1208) (size!38692 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48664 () Bool)

(declare-fun mapRes!48664 () Bool)

(assert (=> mapIsEmpty!48664 mapRes!48664))

(declare-fun b!1225885 () Bool)

(declare-fun e!696226 () Bool)

(declare-fun tp_is_empty!31177 () Bool)

(assert (=> b!1225885 (= e!696226 tp_is_empty!31177)))

(declare-fun b!1225886 () Bool)

(declare-fun res!814720 () Bool)

(assert (=> b!1225886 (=> (not res!814720) (not e!696230))))

(assert (=> b!1225886 (= res!814720 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!27028))))

(declare-fun b!1225887 () Bool)

(declare-fun e!696231 () Bool)

(assert (=> b!1225887 (= e!696228 (not e!696231))))

(declare-fun res!814718 () Bool)

(assert (=> b!1225887 (=> res!814718 e!696231)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225887 (= res!814718 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225887 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40483 0))(
  ( (Unit!40484) )
))
(declare-fun lt!558471 () Unit!40483)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79052 (_ BitVec 64) (_ BitVec 32)) Unit!40483)

(assert (=> b!1225887 (= lt!558471 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225888 () Bool)

(assert (=> b!1225888 (= e!696230 e!696228)))

(declare-fun res!814723 () Bool)

(assert (=> b!1225888 (=> (not res!814723) (not e!696228))))

(assert (=> b!1225888 (= res!814723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558473 mask!1564))))

(assert (=> b!1225888 (= lt!558473 (array!79053 (store (arr!38153 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38691 _keys!1208)))))

(declare-fun b!1225889 () Bool)

(declare-fun e!696227 () Bool)

(assert (=> b!1225889 (= e!696227 true)))

(declare-fun zeroValue!944 () V!46697)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!558472 () array!79054)

(declare-fun minValue!944 () V!46697)

(declare-datatypes ((tuple2!20252 0))(
  ( (tuple2!20253 (_1!10137 (_ BitVec 64)) (_2!10137 V!46697)) )
))
(declare-datatypes ((List!27032 0))(
  ( (Nil!27029) (Cons!27028 (h!28237 tuple2!20252) (t!40476 List!27032)) )
))
(declare-datatypes ((ListLongMap!18221 0))(
  ( (ListLongMap!18222 (toList!9126 List!27032)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5555 (array!79052 array!79054 (_ BitVec 32) (_ BitVec 32) V!46697 V!46697 (_ BitVec 32) Int) ListLongMap!18221)

(declare-fun -!1941 (ListLongMap!18221 (_ BitVec 64)) ListLongMap!18221)

(assert (=> b!1225889 (= (getCurrentListMapNoExtraKeys!5555 lt!558473 lt!558472 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1941 (getCurrentListMapNoExtraKeys!5555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!558470 () Unit!40483)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1172 (array!79052 array!79054 (_ BitVec 32) (_ BitVec 32) V!46697 V!46697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40483)

(assert (=> b!1225889 (= lt!558470 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1172 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!814722 () Bool)

(assert (=> start!101778 (=> (not res!814722) (not e!696230))))

(assert (=> start!101778 (= res!814722 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38691 _keys!1208))))))

(assert (=> start!101778 e!696230))

(assert (=> start!101778 tp_is_empty!31177))

(declare-fun array_inv!29140 (array!79052) Bool)

(assert (=> start!101778 (array_inv!29140 _keys!1208)))

(assert (=> start!101778 true))

(assert (=> start!101778 tp!92465))

(declare-fun e!696229 () Bool)

(declare-fun array_inv!29141 (array!79054) Bool)

(assert (=> start!101778 (and (array_inv!29141 _values!996) e!696229)))

(declare-fun b!1225880 () Bool)

(declare-fun e!696232 () Bool)

(assert (=> b!1225880 (= e!696232 tp_is_empty!31177)))

(declare-fun mapNonEmpty!48664 () Bool)

(declare-fun tp!92464 () Bool)

(assert (=> mapNonEmpty!48664 (= mapRes!48664 (and tp!92464 e!696232))))

(declare-fun mapKey!48664 () (_ BitVec 32))

(declare-fun mapValue!48664 () ValueCell!14879)

(declare-fun mapRest!48664 () (Array (_ BitVec 32) ValueCell!14879))

(assert (=> mapNonEmpty!48664 (= (arr!38154 _values!996) (store mapRest!48664 mapKey!48664 mapValue!48664))))

(declare-fun b!1225890 () Bool)

(declare-fun res!814716 () Bool)

(assert (=> b!1225890 (=> (not res!814716) (not e!696230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225890 (= res!814716 (validKeyInArray!0 k0!934))))

(declare-fun b!1225891 () Bool)

(declare-fun res!814717 () Bool)

(assert (=> b!1225891 (=> (not res!814717) (not e!696230))))

(assert (=> b!1225891 (= res!814717 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38691 _keys!1208))))))

(declare-fun b!1225892 () Bool)

(assert (=> b!1225892 (= e!696231 e!696227)))

(declare-fun res!814721 () Bool)

(assert (=> b!1225892 (=> res!814721 e!696227)))

(assert (=> b!1225892 (= res!814721 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!558475 () ListLongMap!18221)

(assert (=> b!1225892 (= lt!558475 (getCurrentListMapNoExtraKeys!5555 lt!558473 lt!558472 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3399 (Int (_ BitVec 64)) V!46697)

(assert (=> b!1225892 (= lt!558472 (array!79055 (store (arr!38154 _values!996) i!673 (ValueCellFull!14879 (dynLambda!3399 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38692 _values!996)))))

(declare-fun lt!558474 () ListLongMap!18221)

(assert (=> b!1225892 (= lt!558474 (getCurrentListMapNoExtraKeys!5555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225893 () Bool)

(declare-fun res!814724 () Bool)

(assert (=> b!1225893 (=> (not res!814724) (not e!696230))))

(assert (=> b!1225893 (= res!814724 (= (select (arr!38153 _keys!1208) i!673) k0!934))))

(declare-fun b!1225894 () Bool)

(assert (=> b!1225894 (= e!696229 (and e!696226 mapRes!48664))))

(declare-fun condMapEmpty!48664 () Bool)

(declare-fun mapDefault!48664 () ValueCell!14879)

(assert (=> b!1225894 (= condMapEmpty!48664 (= (arr!38154 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14879)) mapDefault!48664)))))

(assert (= (and start!101778 res!814722) b!1225883))

(assert (= (and b!1225883 res!814725) b!1225884))

(assert (= (and b!1225884 res!814715) b!1225882))

(assert (= (and b!1225882 res!814714) b!1225886))

(assert (= (and b!1225886 res!814720) b!1225891))

(assert (= (and b!1225891 res!814717) b!1225890))

(assert (= (and b!1225890 res!814716) b!1225893))

(assert (= (and b!1225893 res!814724) b!1225888))

(assert (= (and b!1225888 res!814723) b!1225881))

(assert (= (and b!1225881 res!814719) b!1225887))

(assert (= (and b!1225887 (not res!814718)) b!1225892))

(assert (= (and b!1225892 (not res!814721)) b!1225889))

(assert (= (and b!1225894 condMapEmpty!48664) mapIsEmpty!48664))

(assert (= (and b!1225894 (not condMapEmpty!48664)) mapNonEmpty!48664))

(get-info :version)

(assert (= (and mapNonEmpty!48664 ((_ is ValueCellFull!14879) mapValue!48664)) b!1225880))

(assert (= (and b!1225894 ((_ is ValueCellFull!14879) mapDefault!48664)) b!1225885))

(assert (= start!101778 b!1225894))

(declare-fun b_lambda!22443 () Bool)

(assert (=> (not b_lambda!22443) (not b!1225892)))

(declare-fun t!40474 () Bool)

(declare-fun tb!11265 () Bool)

(assert (=> (and start!101778 (= defaultEntry!1004 defaultEntry!1004) t!40474) tb!11265))

(declare-fun result!23151 () Bool)

(assert (=> tb!11265 (= result!23151 tp_is_empty!31177)))

(assert (=> b!1225892 t!40474))

(declare-fun b_and!44191 () Bool)

(assert (= b_and!44189 (and (=> t!40474 result!23151) b_and!44191)))

(declare-fun m!1130519 () Bool)

(assert (=> b!1225889 m!1130519))

(declare-fun m!1130521 () Bool)

(assert (=> b!1225889 m!1130521))

(assert (=> b!1225889 m!1130521))

(declare-fun m!1130523 () Bool)

(assert (=> b!1225889 m!1130523))

(declare-fun m!1130525 () Bool)

(assert (=> b!1225889 m!1130525))

(declare-fun m!1130527 () Bool)

(assert (=> b!1225881 m!1130527))

(declare-fun m!1130529 () Bool)

(assert (=> b!1225892 m!1130529))

(declare-fun m!1130531 () Bool)

(assert (=> b!1225892 m!1130531))

(declare-fun m!1130533 () Bool)

(assert (=> b!1225892 m!1130533))

(declare-fun m!1130535 () Bool)

(assert (=> b!1225892 m!1130535))

(declare-fun m!1130537 () Bool)

(assert (=> b!1225882 m!1130537))

(declare-fun m!1130539 () Bool)

(assert (=> b!1225890 m!1130539))

(declare-fun m!1130541 () Bool)

(assert (=> mapNonEmpty!48664 m!1130541))

(declare-fun m!1130543 () Bool)

(assert (=> b!1225886 m!1130543))

(declare-fun m!1130545 () Bool)

(assert (=> b!1225893 m!1130545))

(declare-fun m!1130547 () Bool)

(assert (=> b!1225888 m!1130547))

(declare-fun m!1130549 () Bool)

(assert (=> b!1225888 m!1130549))

(declare-fun m!1130551 () Bool)

(assert (=> b!1225883 m!1130551))

(declare-fun m!1130553 () Bool)

(assert (=> b!1225887 m!1130553))

(declare-fun m!1130555 () Bool)

(assert (=> b!1225887 m!1130555))

(declare-fun m!1130557 () Bool)

(assert (=> start!101778 m!1130557))

(declare-fun m!1130559 () Bool)

(assert (=> start!101778 m!1130559))

(check-sat (not start!101778) (not b!1225883) (not b!1225892) b_and!44191 tp_is_empty!31177 (not b!1225890) (not b!1225888) (not b!1225886) (not b!1225887) (not b!1225882) (not mapNonEmpty!48664) (not b!1225889) (not b_lambda!22443) (not b_next!26473) (not b!1225881))
(check-sat b_and!44191 (not b_next!26473))
