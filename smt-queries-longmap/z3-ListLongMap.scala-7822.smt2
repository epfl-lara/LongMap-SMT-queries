; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97670 () Bool)

(assert start!97670)

(declare-fun mapNonEmpty!43678 () Bool)

(declare-fun mapRes!43678 () Bool)

(declare-fun tp!82922 () Bool)

(declare-fun e!636001 () Bool)

(assert (=> mapNonEmpty!43678 (= mapRes!43678 (and tp!82922 e!636001))))

(declare-fun mapKey!43678 () (_ BitVec 32))

(declare-datatypes ((V!42337 0))(
  ( (V!42338 (val!14010 Int)) )
))
(declare-datatypes ((ValueCell!13244 0))(
  ( (ValueCellFull!13244 (v!16642 V!42337)) (EmptyCell!13244) )
))
(declare-fun mapValue!43678 () ValueCell!13244)

(declare-datatypes ((array!72612 0))(
  ( (array!72613 (arr!34959 (Array (_ BitVec 32) ValueCell!13244)) (size!35497 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72612)

(declare-fun mapRest!43678 () (Array (_ BitVec 32) ValueCell!13244))

(assert (=> mapNonEmpty!43678 (= (arr!34959 _values!996) (store mapRest!43678 mapKey!43678 mapValue!43678))))

(declare-fun b!1116291 () Bool)

(declare-fun res!745354 () Bool)

(declare-fun e!636004 () Bool)

(assert (=> b!1116291 (=> (not res!745354) (not e!636004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72614 0))(
  ( (array!72615 (arr!34960 (Array (_ BitVec 32) (_ BitVec 64))) (size!35498 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72614)

(assert (=> b!1116291 (= res!745354 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35498 _keys!1208))))))

(declare-fun b!1116292 () Bool)

(declare-fun e!636006 () Bool)

(declare-fun e!636002 () Bool)

(assert (=> b!1116292 (= e!636006 (and e!636002 mapRes!43678))))

(declare-fun condMapEmpty!43678 () Bool)

(declare-fun mapDefault!43678 () ValueCell!13244)

(assert (=> b!1116292 (= condMapEmpty!43678 (= (arr!34959 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13244)) mapDefault!43678)))))

(declare-fun b!1116293 () Bool)

(declare-fun res!745359 () Bool)

(assert (=> b!1116293 (=> (not res!745359) (not e!636004))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1116293 (= res!745359 (= (select (arr!34960 _keys!1208) i!673) k0!934))))

(declare-fun b!1116294 () Bool)

(declare-fun res!745358 () Bool)

(assert (=> b!1116294 (=> (not res!745358) (not e!636004))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116294 (= res!745358 (validMask!0 mask!1564))))

(declare-fun b!1116295 () Bool)

(declare-fun res!745357 () Bool)

(assert (=> b!1116295 (=> (not res!745357) (not e!636004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72614 (_ BitVec 32)) Bool)

(assert (=> b!1116295 (= res!745357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116296 () Bool)

(declare-fun res!745360 () Bool)

(assert (=> b!1116296 (=> (not res!745360) (not e!636004))))

(declare-datatypes ((List!24401 0))(
  ( (Nil!24398) (Cons!24397 (h!25606 (_ BitVec 64)) (t!34873 List!24401)) )
))
(declare-fun arrayNoDuplicates!0 (array!72614 (_ BitVec 32) List!24401) Bool)

(assert (=> b!1116296 (= res!745360 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24398))))

(declare-fun b!1116297 () Bool)

(declare-fun tp_is_empty!27907 () Bool)

(assert (=> b!1116297 (= e!636001 tp_is_empty!27907)))

(declare-fun b!1116298 () Bool)

(assert (=> b!1116298 (= e!636002 tp_is_empty!27907)))

(declare-fun b!1116299 () Bool)

(declare-fun res!745356 () Bool)

(declare-fun e!636003 () Bool)

(assert (=> b!1116299 (=> (not res!745356) (not e!636003))))

(declare-fun lt!496931 () array!72614)

(assert (=> b!1116299 (= res!745356 (arrayNoDuplicates!0 lt!496931 #b00000000000000000000000000000000 Nil!24398))))

(declare-fun mapIsEmpty!43678 () Bool)

(assert (=> mapIsEmpty!43678 mapRes!43678))

(declare-fun b!1116300 () Bool)

(declare-fun res!745361 () Bool)

(assert (=> b!1116300 (=> (not res!745361) (not e!636004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116300 (= res!745361 (validKeyInArray!0 k0!934))))

(declare-fun b!1116301 () Bool)

(assert (=> b!1116301 (= e!636003 (not true))))

(declare-fun arrayContainsKey!0 (array!72614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116301 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36461 0))(
  ( (Unit!36462) )
))
(declare-fun lt!496932 () Unit!36461)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72614 (_ BitVec 64) (_ BitVec 32)) Unit!36461)

(assert (=> b!1116301 (= lt!496932 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!745362 () Bool)

(assert (=> start!97670 (=> (not res!745362) (not e!636004))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97670 (= res!745362 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35498 _keys!1208))))))

(assert (=> start!97670 e!636004))

(declare-fun array_inv!26936 (array!72614) Bool)

(assert (=> start!97670 (array_inv!26936 _keys!1208)))

(assert (=> start!97670 true))

(declare-fun array_inv!26937 (array!72612) Bool)

(assert (=> start!97670 (and (array_inv!26937 _values!996) e!636006)))

(declare-fun b!1116302 () Bool)

(assert (=> b!1116302 (= e!636004 e!636003)))

(declare-fun res!745355 () Bool)

(assert (=> b!1116302 (=> (not res!745355) (not e!636003))))

(assert (=> b!1116302 (= res!745355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496931 mask!1564))))

(assert (=> b!1116302 (= lt!496931 (array!72615 (store (arr!34960 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35498 _keys!1208)))))

(declare-fun b!1116303 () Bool)

(declare-fun res!745363 () Bool)

(assert (=> b!1116303 (=> (not res!745363) (not e!636004))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116303 (= res!745363 (and (= (size!35497 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35498 _keys!1208) (size!35497 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97670 res!745362) b!1116294))

(assert (= (and b!1116294 res!745358) b!1116303))

(assert (= (and b!1116303 res!745363) b!1116295))

(assert (= (and b!1116295 res!745357) b!1116296))

(assert (= (and b!1116296 res!745360) b!1116291))

(assert (= (and b!1116291 res!745354) b!1116300))

(assert (= (and b!1116300 res!745361) b!1116293))

(assert (= (and b!1116293 res!745359) b!1116302))

(assert (= (and b!1116302 res!745355) b!1116299))

(assert (= (and b!1116299 res!745356) b!1116301))

(assert (= (and b!1116292 condMapEmpty!43678) mapIsEmpty!43678))

(assert (= (and b!1116292 (not condMapEmpty!43678)) mapNonEmpty!43678))

(get-info :version)

(assert (= (and mapNonEmpty!43678 ((_ is ValueCellFull!13244) mapValue!43678)) b!1116297))

(assert (= (and b!1116292 ((_ is ValueCellFull!13244) mapDefault!43678)) b!1116298))

(assert (= start!97670 b!1116292))

(declare-fun m!1032009 () Bool)

(assert (=> start!97670 m!1032009))

(declare-fun m!1032011 () Bool)

(assert (=> start!97670 m!1032011))

(declare-fun m!1032013 () Bool)

(assert (=> b!1116294 m!1032013))

(declare-fun m!1032015 () Bool)

(assert (=> b!1116299 m!1032015))

(declare-fun m!1032017 () Bool)

(assert (=> b!1116293 m!1032017))

(declare-fun m!1032019 () Bool)

(assert (=> mapNonEmpty!43678 m!1032019))

(declare-fun m!1032021 () Bool)

(assert (=> b!1116300 m!1032021))

(declare-fun m!1032023 () Bool)

(assert (=> b!1116295 m!1032023))

(declare-fun m!1032025 () Bool)

(assert (=> b!1116301 m!1032025))

(declare-fun m!1032027 () Bool)

(assert (=> b!1116301 m!1032027))

(declare-fun m!1032029 () Bool)

(assert (=> b!1116302 m!1032029))

(declare-fun m!1032031 () Bool)

(assert (=> b!1116302 m!1032031))

(declare-fun m!1032033 () Bool)

(assert (=> b!1116296 m!1032033))

(check-sat (not b!1116299) (not b!1116301) (not b!1116296) (not b!1116295) tp_is_empty!27907 (not start!97670) (not b!1116294) (not mapNonEmpty!43678) (not b!1116302) (not b!1116300))
(check-sat)
