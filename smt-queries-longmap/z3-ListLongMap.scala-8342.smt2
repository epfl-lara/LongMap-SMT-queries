; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101772 () Bool)

(assert start!101772)

(declare-fun b_free!26323 () Bool)

(declare-fun b_next!26323 () Bool)

(assert (=> start!101772 (= b_free!26323 (not b_next!26323))))

(declare-fun tp!92006 () Bool)

(declare-fun b_and!43855 () Bool)

(assert (=> start!101772 (= tp!92006 b_and!43855)))

(declare-fun b!1222165 () Bool)

(declare-fun e!694106 () Bool)

(declare-fun e!694111 () Bool)

(assert (=> b!1222165 (= e!694106 e!694111)))

(declare-fun res!811541 () Bool)

(assert (=> b!1222165 (=> res!811541 e!694111)))

(declare-datatypes ((array!78871 0))(
  ( (array!78872 (arr!38059 (Array (_ BitVec 32) (_ BitVec 64))) (size!38596 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78871)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1222165 (= res!811541 (not (= (select (arr!38059 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1222166 () Bool)

(declare-fun e!694108 () Bool)

(assert (=> b!1222166 (= e!694108 (or (bvsge (size!38596 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38596 _keys!1208)) (bvslt from!1455 (size!38596 _keys!1208))))))

(declare-datatypes ((List!26870 0))(
  ( (Nil!26867) (Cons!26866 (h!28084 (_ BitVec 64)) (t!40165 List!26870)) )
))
(declare-fun arrayNoDuplicates!0 (array!78871 (_ BitVec 32) List!26870) Bool)

(assert (=> b!1222166 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26867)))

(declare-datatypes ((Unit!40426 0))(
  ( (Unit!40427) )
))
(declare-fun lt!555759 () Unit!40426)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78871 (_ BitVec 32) (_ BitVec 32)) Unit!40426)

(assert (=> b!1222166 (= lt!555759 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!78871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222166 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!555758 () Unit!40426)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78871 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40426)

(assert (=> b!1222166 (= lt!555758 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1222167 () Bool)

(declare-fun e!694116 () Bool)

(declare-fun tp_is_empty!31027 () Bool)

(assert (=> b!1222167 (= e!694116 tp_is_empty!31027)))

(declare-fun mapNonEmpty!48430 () Bool)

(declare-fun mapRes!48430 () Bool)

(declare-fun tp!92005 () Bool)

(assert (=> mapNonEmpty!48430 (= mapRes!48430 (and tp!92005 e!694116))))

(declare-datatypes ((V!46497 0))(
  ( (V!46498 (val!15570 Int)) )
))
(declare-datatypes ((ValueCell!14804 0))(
  ( (ValueCellFull!14804 (v!18224 V!46497)) (EmptyCell!14804) )
))
(declare-fun mapRest!48430 () (Array (_ BitVec 32) ValueCell!14804))

(declare-datatypes ((array!78873 0))(
  ( (array!78874 (arr!38060 (Array (_ BitVec 32) ValueCell!14804)) (size!38597 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78873)

(declare-fun mapKey!48430 () (_ BitVec 32))

(declare-fun mapValue!48430 () ValueCell!14804)

(assert (=> mapNonEmpty!48430 (= (arr!38060 _values!996) (store mapRest!48430 mapKey!48430 mapValue!48430))))

(declare-fun b!1222169 () Bool)

(declare-fun res!811545 () Bool)

(declare-fun e!694110 () Bool)

(assert (=> b!1222169 (=> (not res!811545) (not e!694110))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222169 (= res!811545 (validMask!0 mask!1564))))

(declare-fun b!1222170 () Bool)

(declare-fun e!694115 () Bool)

(declare-fun e!694107 () Bool)

(assert (=> b!1222170 (= e!694115 (not e!694107))))

(declare-fun res!811556 () Bool)

(assert (=> b!1222170 (=> res!811556 e!694107)))

(assert (=> b!1222170 (= res!811556 (bvsgt from!1455 i!673))))

(assert (=> b!1222170 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555752 () Unit!40426)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78871 (_ BitVec 64) (_ BitVec 32)) Unit!40426)

(assert (=> b!1222170 (= lt!555752 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48430 () Bool)

(assert (=> mapIsEmpty!48430 mapRes!48430))

(declare-fun b!1222171 () Bool)

(declare-fun e!694109 () Bool)

(assert (=> b!1222171 (= e!694107 e!694109)))

(declare-fun res!811542 () Bool)

(assert (=> b!1222171 (=> res!811542 e!694109)))

(assert (=> b!1222171 (= res!811542 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46497)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!555749 () array!78873)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555756 () array!78871)

(declare-fun minValue!944 () V!46497)

(declare-datatypes ((tuple2!20060 0))(
  ( (tuple2!20061 (_1!10041 (_ BitVec 64)) (_2!10041 V!46497)) )
))
(declare-datatypes ((List!26871 0))(
  ( (Nil!26868) (Cons!26867 (h!28085 tuple2!20060) (t!40166 List!26871)) )
))
(declare-datatypes ((ListLongMap!18037 0))(
  ( (ListLongMap!18038 (toList!9034 List!26871)) )
))
(declare-fun lt!555755 () ListLongMap!18037)

(declare-fun getCurrentListMapNoExtraKeys!5489 (array!78871 array!78873 (_ BitVec 32) (_ BitVec 32) V!46497 V!46497 (_ BitVec 32) Int) ListLongMap!18037)

(assert (=> b!1222171 (= lt!555755 (getCurrentListMapNoExtraKeys!5489 lt!555756 lt!555749 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555754 () V!46497)

(assert (=> b!1222171 (= lt!555749 (array!78874 (store (arr!38060 _values!996) i!673 (ValueCellFull!14804 lt!555754)) (size!38597 _values!996)))))

(declare-fun dynLambda!3390 (Int (_ BitVec 64)) V!46497)

(assert (=> b!1222171 (= lt!555754 (dynLambda!3390 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555748 () ListLongMap!18037)

(assert (=> b!1222171 (= lt!555748 (getCurrentListMapNoExtraKeys!5489 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222172 () Bool)

(assert (=> b!1222172 (= e!694111 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222173 () Bool)

(declare-fun res!811555 () Bool)

(assert (=> b!1222173 (=> (not res!811555) (not e!694110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78871 (_ BitVec 32)) Bool)

(assert (=> b!1222173 (= res!811555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222174 () Bool)

(declare-fun res!811554 () Bool)

(assert (=> b!1222174 (=> (not res!811554) (not e!694115))))

(assert (=> b!1222174 (= res!811554 (arrayNoDuplicates!0 lt!555756 #b00000000000000000000000000000000 Nil!26867))))

(declare-fun b!1222175 () Bool)

(declare-fun res!811550 () Bool)

(assert (=> b!1222175 (=> (not res!811550) (not e!694110))))

(assert (=> b!1222175 (= res!811550 (= (select (arr!38059 _keys!1208) i!673) k0!934))))

(declare-fun b!1222176 () Bool)

(declare-fun res!811552 () Bool)

(assert (=> b!1222176 (=> (not res!811552) (not e!694110))))

(assert (=> b!1222176 (= res!811552 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26867))))

(declare-fun b!1222177 () Bool)

(assert (=> b!1222177 (= e!694110 e!694115)))

(declare-fun res!811549 () Bool)

(assert (=> b!1222177 (=> (not res!811549) (not e!694115))))

(assert (=> b!1222177 (= res!811549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555756 mask!1564))))

(assert (=> b!1222177 (= lt!555756 (array!78872 (store (arr!38059 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38596 _keys!1208)))))

(declare-fun res!811551 () Bool)

(assert (=> start!101772 (=> (not res!811551) (not e!694110))))

(assert (=> start!101772 (= res!811551 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38596 _keys!1208))))))

(assert (=> start!101772 e!694110))

(assert (=> start!101772 tp_is_empty!31027))

(declare-fun array_inv!29040 (array!78871) Bool)

(assert (=> start!101772 (array_inv!29040 _keys!1208)))

(assert (=> start!101772 true))

(assert (=> start!101772 tp!92006))

(declare-fun e!694114 () Bool)

(declare-fun array_inv!29041 (array!78873) Bool)

(assert (=> start!101772 (and (array_inv!29041 _values!996) e!694114)))

(declare-fun b!1222168 () Bool)

(declare-fun res!811553 () Bool)

(assert (=> b!1222168 (=> (not res!811553) (not e!694110))))

(assert (=> b!1222168 (= res!811553 (and (= (size!38597 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38596 _keys!1208) (size!38597 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222178 () Bool)

(declare-fun e!694113 () Bool)

(assert (=> b!1222178 (= e!694113 tp_is_empty!31027)))

(declare-fun b!1222179 () Bool)

(declare-fun res!811548 () Bool)

(assert (=> b!1222179 (=> (not res!811548) (not e!694110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222179 (= res!811548 (validKeyInArray!0 k0!934))))

(declare-fun b!1222180 () Bool)

(assert (=> b!1222180 (= e!694114 (and e!694113 mapRes!48430))))

(declare-fun condMapEmpty!48430 () Bool)

(declare-fun mapDefault!48430 () ValueCell!14804)

(assert (=> b!1222180 (= condMapEmpty!48430 (= (arr!38060 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14804)) mapDefault!48430)))))

(declare-fun b!1222181 () Bool)

(declare-fun e!694117 () Bool)

(assert (=> b!1222181 (= e!694109 e!694117)))

(declare-fun res!811547 () Bool)

(assert (=> b!1222181 (=> res!811547 e!694117)))

(assert (=> b!1222181 (= res!811547 (not (validKeyInArray!0 (select (arr!38059 _keys!1208) from!1455))))))

(declare-fun lt!555750 () ListLongMap!18037)

(declare-fun lt!555757 () ListLongMap!18037)

(assert (=> b!1222181 (= lt!555750 lt!555757)))

(declare-fun lt!555751 () ListLongMap!18037)

(declare-fun -!1918 (ListLongMap!18037 (_ BitVec 64)) ListLongMap!18037)

(assert (=> b!1222181 (= lt!555757 (-!1918 lt!555751 k0!934))))

(assert (=> b!1222181 (= lt!555750 (getCurrentListMapNoExtraKeys!5489 lt!555756 lt!555749 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222181 (= lt!555751 (getCurrentListMapNoExtraKeys!5489 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555753 () Unit!40426)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1133 (array!78871 array!78873 (_ BitVec 32) (_ BitVec 32) V!46497 V!46497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40426)

(assert (=> b!1222181 (= lt!555753 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1133 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222182 () Bool)

(assert (=> b!1222182 (= e!694117 e!694108)))

(declare-fun res!811544 () Bool)

(assert (=> b!1222182 (=> res!811544 e!694108)))

(assert (=> b!1222182 (= res!811544 (not (= (select (arr!38059 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1222182 e!694106))

(declare-fun res!811543 () Bool)

(assert (=> b!1222182 (=> (not res!811543) (not e!694106))))

(declare-fun +!4139 (ListLongMap!18037 tuple2!20060) ListLongMap!18037)

(declare-fun get!19461 (ValueCell!14804 V!46497) V!46497)

(assert (=> b!1222182 (= res!811543 (= lt!555755 (+!4139 lt!555757 (tuple2!20061 (select (arr!38059 _keys!1208) from!1455) (get!19461 (select (arr!38060 _values!996) from!1455) lt!555754)))))))

(declare-fun b!1222183 () Bool)

(declare-fun res!811546 () Bool)

(assert (=> b!1222183 (=> (not res!811546) (not e!694110))))

(assert (=> b!1222183 (= res!811546 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38596 _keys!1208))))))

(assert (= (and start!101772 res!811551) b!1222169))

(assert (= (and b!1222169 res!811545) b!1222168))

(assert (= (and b!1222168 res!811553) b!1222173))

(assert (= (and b!1222173 res!811555) b!1222176))

(assert (= (and b!1222176 res!811552) b!1222183))

(assert (= (and b!1222183 res!811546) b!1222179))

(assert (= (and b!1222179 res!811548) b!1222175))

(assert (= (and b!1222175 res!811550) b!1222177))

(assert (= (and b!1222177 res!811549) b!1222174))

(assert (= (and b!1222174 res!811554) b!1222170))

(assert (= (and b!1222170 (not res!811556)) b!1222171))

(assert (= (and b!1222171 (not res!811542)) b!1222181))

(assert (= (and b!1222181 (not res!811547)) b!1222182))

(assert (= (and b!1222182 res!811543) b!1222165))

(assert (= (and b!1222165 (not res!811541)) b!1222172))

(assert (= (and b!1222182 (not res!811544)) b!1222166))

(assert (= (and b!1222180 condMapEmpty!48430) mapIsEmpty!48430))

(assert (= (and b!1222180 (not condMapEmpty!48430)) mapNonEmpty!48430))

(get-info :version)

(assert (= (and mapNonEmpty!48430 ((_ is ValueCellFull!14804) mapValue!48430)) b!1222167))

(assert (= (and b!1222180 ((_ is ValueCellFull!14804) mapDefault!48430)) b!1222178))

(assert (= start!101772 b!1222180))

(declare-fun b_lambda!22183 () Bool)

(assert (=> (not b_lambda!22183) (not b!1222171)))

(declare-fun t!40164 () Bool)

(declare-fun tb!11115 () Bool)

(assert (=> (and start!101772 (= defaultEntry!1004 defaultEntry!1004) t!40164) tb!11115))

(declare-fun result!22845 () Bool)

(assert (=> tb!11115 (= result!22845 tp_is_empty!31027)))

(assert (=> b!1222171 t!40164))

(declare-fun b_and!43857 () Bool)

(assert (= b_and!43855 (and (=> t!40164 result!22845) b_and!43857)))

(declare-fun m!1127307 () Bool)

(assert (=> b!1222173 m!1127307))

(declare-fun m!1127309 () Bool)

(assert (=> b!1222179 m!1127309))

(declare-fun m!1127311 () Bool)

(assert (=> mapNonEmpty!48430 m!1127311))

(declare-fun m!1127313 () Bool)

(assert (=> b!1222177 m!1127313))

(declare-fun m!1127315 () Bool)

(assert (=> b!1222177 m!1127315))

(declare-fun m!1127317 () Bool)

(assert (=> b!1222175 m!1127317))

(declare-fun m!1127319 () Bool)

(assert (=> b!1222171 m!1127319))

(declare-fun m!1127321 () Bool)

(assert (=> b!1222171 m!1127321))

(declare-fun m!1127323 () Bool)

(assert (=> b!1222171 m!1127323))

(declare-fun m!1127325 () Bool)

(assert (=> b!1222171 m!1127325))

(declare-fun m!1127327 () Bool)

(assert (=> b!1222165 m!1127327))

(declare-fun m!1127329 () Bool)

(assert (=> b!1222169 m!1127329))

(assert (=> b!1222182 m!1127327))

(declare-fun m!1127331 () Bool)

(assert (=> b!1222182 m!1127331))

(assert (=> b!1222182 m!1127331))

(declare-fun m!1127333 () Bool)

(assert (=> b!1222182 m!1127333))

(declare-fun m!1127335 () Bool)

(assert (=> b!1222182 m!1127335))

(declare-fun m!1127337 () Bool)

(assert (=> b!1222174 m!1127337))

(declare-fun m!1127339 () Bool)

(assert (=> b!1222181 m!1127339))

(declare-fun m!1127341 () Bool)

(assert (=> b!1222181 m!1127341))

(declare-fun m!1127343 () Bool)

(assert (=> b!1222181 m!1127343))

(declare-fun m!1127345 () Bool)

(assert (=> b!1222181 m!1127345))

(assert (=> b!1222181 m!1127327))

(declare-fun m!1127347 () Bool)

(assert (=> b!1222181 m!1127347))

(assert (=> b!1222181 m!1127327))

(declare-fun m!1127349 () Bool)

(assert (=> b!1222170 m!1127349))

(declare-fun m!1127351 () Bool)

(assert (=> b!1222170 m!1127351))

(declare-fun m!1127353 () Bool)

(assert (=> b!1222166 m!1127353))

(declare-fun m!1127355 () Bool)

(assert (=> b!1222166 m!1127355))

(declare-fun m!1127357 () Bool)

(assert (=> b!1222166 m!1127357))

(declare-fun m!1127359 () Bool)

(assert (=> b!1222166 m!1127359))

(declare-fun m!1127361 () Bool)

(assert (=> start!101772 m!1127361))

(declare-fun m!1127363 () Bool)

(assert (=> start!101772 m!1127363))

(declare-fun m!1127365 () Bool)

(assert (=> b!1222172 m!1127365))

(declare-fun m!1127367 () Bool)

(assert (=> b!1222176 m!1127367))

(check-sat (not b!1222177) (not b!1222169) (not b!1222166) (not mapNonEmpty!48430) (not start!101772) (not b!1222170) (not b_next!26323) (not b!1222172) (not b!1222179) tp_is_empty!31027 b_and!43857 (not b!1222181) (not b!1222182) (not b!1222176) (not b!1222171) (not b!1222173) (not b!1222174) (not b_lambda!22183))
(check-sat b_and!43857 (not b_next!26323))
