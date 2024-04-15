; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101214 () Bool)

(assert start!101214)

(declare-fun b_free!26143 () Bool)

(declare-fun b_next!26143 () Bool)

(assert (=> start!101214 (= b_free!26143 (not b_next!26143))))

(declare-fun tp!91450 () Bool)

(declare-fun b_and!43385 () Bool)

(assert (=> start!101214 (= tp!91450 b_and!43385)))

(declare-fun b!1215311 () Bool)

(declare-fun e!690066 () Bool)

(declare-fun e!690067 () Bool)

(assert (=> b!1215311 (= e!690066 (not e!690067))))

(declare-fun res!806929 () Bool)

(assert (=> b!1215311 (=> res!806929 e!690067)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215311 (= res!806929 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78390 0))(
  ( (array!78391 (arr!37830 (Array (_ BitVec 32) (_ BitVec 64))) (size!38368 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78390)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215311 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40159 0))(
  ( (Unit!40160) )
))
(declare-fun lt!552428 () Unit!40159)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78390 (_ BitVec 64) (_ BitVec 32)) Unit!40159)

(assert (=> b!1215311 (= lt!552428 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48145 () Bool)

(declare-fun mapRes!48145 () Bool)

(assert (=> mapIsEmpty!48145 mapRes!48145))

(declare-fun b!1215312 () Bool)

(declare-fun res!806938 () Bool)

(declare-fun e!690068 () Bool)

(assert (=> b!1215312 (=> (not res!806938) (not e!690068))))

(assert (=> b!1215312 (= res!806938 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38368 _keys!1208))))))

(declare-fun b!1215313 () Bool)

(declare-fun res!806932 () Bool)

(assert (=> b!1215313 (=> (not res!806932) (not e!690068))))

(declare-datatypes ((List!26762 0))(
  ( (Nil!26759) (Cons!26758 (h!27967 (_ BitVec 64)) (t!39876 List!26762)) )
))
(declare-fun arrayNoDuplicates!0 (array!78390 (_ BitVec 32) List!26762) Bool)

(assert (=> b!1215313 (= res!806932 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26759))))

(declare-fun b!1215314 () Bool)

(declare-fun e!690065 () Bool)

(declare-fun tp_is_empty!30847 () Bool)

(assert (=> b!1215314 (= e!690065 tp_is_empty!30847)))

(declare-fun b!1215315 () Bool)

(declare-fun e!690064 () Bool)

(assert (=> b!1215315 (= e!690064 tp_is_empty!30847)))

(declare-fun res!806934 () Bool)

(assert (=> start!101214 (=> (not res!806934) (not e!690068))))

(assert (=> start!101214 (= res!806934 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38368 _keys!1208))))))

(assert (=> start!101214 e!690068))

(assert (=> start!101214 tp_is_empty!30847))

(declare-fun array_inv!28920 (array!78390) Bool)

(assert (=> start!101214 (array_inv!28920 _keys!1208)))

(assert (=> start!101214 true))

(assert (=> start!101214 tp!91450))

(declare-datatypes ((V!46257 0))(
  ( (V!46258 (val!15480 Int)) )
))
(declare-datatypes ((ValueCell!14714 0))(
  ( (ValueCellFull!14714 (v!18132 V!46257)) (EmptyCell!14714) )
))
(declare-datatypes ((array!78392 0))(
  ( (array!78393 (arr!37831 (Array (_ BitVec 32) ValueCell!14714)) (size!38369 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78392)

(declare-fun e!690070 () Bool)

(declare-fun array_inv!28921 (array!78392) Bool)

(assert (=> start!101214 (and (array_inv!28921 _values!996) e!690070)))

(declare-fun b!1215316 () Bool)

(declare-fun res!806930 () Bool)

(assert (=> b!1215316 (=> (not res!806930) (not e!690068))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78390 (_ BitVec 32)) Bool)

(assert (=> b!1215316 (= res!806930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215317 () Bool)

(declare-fun res!806937 () Bool)

(assert (=> b!1215317 (=> (not res!806937) (not e!690068))))

(assert (=> b!1215317 (= res!806937 (= (select (arr!37830 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!48145 () Bool)

(declare-fun tp!91451 () Bool)

(assert (=> mapNonEmpty!48145 (= mapRes!48145 (and tp!91451 e!690064))))

(declare-fun mapValue!48145 () ValueCell!14714)

(declare-fun mapKey!48145 () (_ BitVec 32))

(declare-fun mapRest!48145 () (Array (_ BitVec 32) ValueCell!14714))

(assert (=> mapNonEmpty!48145 (= (arr!37831 _values!996) (store mapRest!48145 mapKey!48145 mapValue!48145))))

(declare-fun b!1215318 () Bool)

(declare-fun res!806933 () Bool)

(assert (=> b!1215318 (=> (not res!806933) (not e!690068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215318 (= res!806933 (validMask!0 mask!1564))))

(declare-fun b!1215319 () Bool)

(declare-fun res!806935 () Bool)

(assert (=> b!1215319 (=> (not res!806935) (not e!690068))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1215319 (= res!806935 (and (= (size!38369 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38368 _keys!1208) (size!38369 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215320 () Bool)

(declare-fun res!806931 () Bool)

(assert (=> b!1215320 (=> (not res!806931) (not e!690066))))

(declare-fun lt!552431 () array!78390)

(assert (=> b!1215320 (= res!806931 (arrayNoDuplicates!0 lt!552431 #b00000000000000000000000000000000 Nil!26759))))

(declare-fun b!1215321 () Bool)

(assert (=> b!1215321 (= e!690068 e!690066)))

(declare-fun res!806936 () Bool)

(assert (=> b!1215321 (=> (not res!806936) (not e!690066))))

(assert (=> b!1215321 (= res!806936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552431 mask!1564))))

(assert (=> b!1215321 (= lt!552431 (array!78391 (store (arr!37830 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38368 _keys!1208)))))

(declare-fun b!1215322 () Bool)

(assert (=> b!1215322 (= e!690067 true)))

(declare-fun zeroValue!944 () V!46257)

(declare-datatypes ((tuple2!19982 0))(
  ( (tuple2!19983 (_1!10002 (_ BitVec 64)) (_2!10002 V!46257)) )
))
(declare-datatypes ((List!26763 0))(
  ( (Nil!26760) (Cons!26759 (h!27968 tuple2!19982) (t!39877 List!26763)) )
))
(declare-datatypes ((ListLongMap!17951 0))(
  ( (ListLongMap!17952 (toList!8991 List!26763)) )
))
(declare-fun lt!552430 () ListLongMap!17951)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46257)

(declare-fun getCurrentListMapNoExtraKeys!5430 (array!78390 array!78392 (_ BitVec 32) (_ BitVec 32) V!46257 V!46257 (_ BitVec 32) Int) ListLongMap!17951)

(declare-fun dynLambda!3282 (Int (_ BitVec 64)) V!46257)

(assert (=> b!1215322 (= lt!552430 (getCurrentListMapNoExtraKeys!5430 lt!552431 (array!78393 (store (arr!37831 _values!996) i!673 (ValueCellFull!14714 (dynLambda!3282 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38369 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552429 () ListLongMap!17951)

(assert (=> b!1215322 (= lt!552429 (getCurrentListMapNoExtraKeys!5430 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215323 () Bool)

(declare-fun res!806928 () Bool)

(assert (=> b!1215323 (=> (not res!806928) (not e!690068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215323 (= res!806928 (validKeyInArray!0 k0!934))))

(declare-fun b!1215324 () Bool)

(assert (=> b!1215324 (= e!690070 (and e!690065 mapRes!48145))))

(declare-fun condMapEmpty!48145 () Bool)

(declare-fun mapDefault!48145 () ValueCell!14714)

(assert (=> b!1215324 (= condMapEmpty!48145 (= (arr!37831 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14714)) mapDefault!48145)))))

(assert (= (and start!101214 res!806934) b!1215318))

(assert (= (and b!1215318 res!806933) b!1215319))

(assert (= (and b!1215319 res!806935) b!1215316))

(assert (= (and b!1215316 res!806930) b!1215313))

(assert (= (and b!1215313 res!806932) b!1215312))

(assert (= (and b!1215312 res!806938) b!1215323))

(assert (= (and b!1215323 res!806928) b!1215317))

(assert (= (and b!1215317 res!806937) b!1215321))

(assert (= (and b!1215321 res!806936) b!1215320))

(assert (= (and b!1215320 res!806931) b!1215311))

(assert (= (and b!1215311 (not res!806929)) b!1215322))

(assert (= (and b!1215324 condMapEmpty!48145) mapIsEmpty!48145))

(assert (= (and b!1215324 (not condMapEmpty!48145)) mapNonEmpty!48145))

(get-info :version)

(assert (= (and mapNonEmpty!48145 ((_ is ValueCellFull!14714) mapValue!48145)) b!1215315))

(assert (= (and b!1215324 ((_ is ValueCellFull!14714) mapDefault!48145)) b!1215314))

(assert (= start!101214 b!1215324))

(declare-fun b_lambda!21809 () Bool)

(assert (=> (not b_lambda!21809) (not b!1215322)))

(declare-fun t!39875 () Bool)

(declare-fun tb!10935 () Bool)

(assert (=> (and start!101214 (= defaultEntry!1004 defaultEntry!1004) t!39875) tb!10935))

(declare-fun result!22475 () Bool)

(assert (=> tb!10935 (= result!22475 tp_is_empty!30847)))

(assert (=> b!1215322 t!39875))

(declare-fun b_and!43387 () Bool)

(assert (= b_and!43385 (and (=> t!39875 result!22475) b_and!43387)))

(declare-fun m!1119831 () Bool)

(assert (=> b!1215313 m!1119831))

(declare-fun m!1119833 () Bool)

(assert (=> b!1215322 m!1119833))

(declare-fun m!1119835 () Bool)

(assert (=> b!1215322 m!1119835))

(declare-fun m!1119837 () Bool)

(assert (=> b!1215322 m!1119837))

(declare-fun m!1119839 () Bool)

(assert (=> b!1215322 m!1119839))

(declare-fun m!1119841 () Bool)

(assert (=> b!1215321 m!1119841))

(declare-fun m!1119843 () Bool)

(assert (=> b!1215321 m!1119843))

(declare-fun m!1119845 () Bool)

(assert (=> b!1215323 m!1119845))

(declare-fun m!1119847 () Bool)

(assert (=> b!1215316 m!1119847))

(declare-fun m!1119849 () Bool)

(assert (=> mapNonEmpty!48145 m!1119849))

(declare-fun m!1119851 () Bool)

(assert (=> start!101214 m!1119851))

(declare-fun m!1119853 () Bool)

(assert (=> start!101214 m!1119853))

(declare-fun m!1119855 () Bool)

(assert (=> b!1215317 m!1119855))

(declare-fun m!1119857 () Bool)

(assert (=> b!1215320 m!1119857))

(declare-fun m!1119859 () Bool)

(assert (=> b!1215311 m!1119859))

(declare-fun m!1119861 () Bool)

(assert (=> b!1215311 m!1119861))

(declare-fun m!1119863 () Bool)

(assert (=> b!1215318 m!1119863))

(check-sat (not b!1215320) (not b_next!26143) (not b!1215321) tp_is_empty!30847 (not start!101214) (not mapNonEmpty!48145) b_and!43387 (not b!1215322) (not b_lambda!21809) (not b!1215313) (not b!1215323) (not b!1215318) (not b!1215316) (not b!1215311))
(check-sat b_and!43387 (not b_next!26143))
