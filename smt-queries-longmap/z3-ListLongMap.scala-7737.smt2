; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97168 () Bool)

(assert start!97168)

(declare-fun b!1105290 () Bool)

(declare-fun e!630845 () Bool)

(declare-fun e!630849 () Bool)

(declare-fun mapRes!42916 () Bool)

(assert (=> b!1105290 (= e!630845 (and e!630849 mapRes!42916))))

(declare-fun condMapEmpty!42916 () Bool)

(declare-datatypes ((V!41659 0))(
  ( (V!41660 (val!13756 Int)) )
))
(declare-datatypes ((ValueCell!12990 0))(
  ( (ValueCellFull!12990 (v!16389 V!41659)) (EmptyCell!12990) )
))
(declare-datatypes ((array!71721 0))(
  ( (array!71722 (arr!34513 (Array (_ BitVec 32) ValueCell!12990)) (size!35049 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71721)

(declare-fun mapDefault!42916 () ValueCell!12990)

(assert (=> b!1105290 (= condMapEmpty!42916 (= (arr!34513 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12990)) mapDefault!42916)))))

(declare-fun b!1105291 () Bool)

(declare-fun res!737481 () Bool)

(declare-fun e!630847 () Bool)

(assert (=> b!1105291 (=> (not res!737481) (not e!630847))))

(declare-datatypes ((array!71723 0))(
  ( (array!71724 (arr!34514 (Array (_ BitVec 32) (_ BitVec 64))) (size!35050 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71723)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1105291 (= res!737481 (and (= (size!35049 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35050 _keys!1208) (size!35049 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105292 () Bool)

(declare-fun res!737488 () Bool)

(assert (=> b!1105292 (=> (not res!737488) (not e!630847))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1105292 (= res!737488 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35050 _keys!1208))))))

(declare-fun b!1105293 () Bool)

(declare-fun e!630844 () Bool)

(declare-fun tp_is_empty!27399 () Bool)

(assert (=> b!1105293 (= e!630844 tp_is_empty!27399)))

(declare-fun b!1105294 () Bool)

(declare-fun res!737484 () Bool)

(assert (=> b!1105294 (=> (not res!737484) (not e!630847))))

(declare-datatypes ((List!24072 0))(
  ( (Nil!24069) (Cons!24068 (h!25277 (_ BitVec 64)) (t!34337 List!24072)) )
))
(declare-fun arrayNoDuplicates!0 (array!71723 (_ BitVec 32) List!24072) Bool)

(assert (=> b!1105294 (= res!737484 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24069))))

(declare-fun b!1105295 () Bool)

(declare-fun res!737480 () Bool)

(assert (=> b!1105295 (=> (not res!737480) (not e!630847))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1105295 (= res!737480 (= (select (arr!34514 _keys!1208) i!673) k0!934))))

(declare-fun res!737479 () Bool)

(assert (=> start!97168 (=> (not res!737479) (not e!630847))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97168 (= res!737479 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35050 _keys!1208))))))

(assert (=> start!97168 e!630847))

(declare-fun array_inv!26568 (array!71723) Bool)

(assert (=> start!97168 (array_inv!26568 _keys!1208)))

(assert (=> start!97168 true))

(declare-fun array_inv!26569 (array!71721) Bool)

(assert (=> start!97168 (and (array_inv!26569 _values!996) e!630845)))

(declare-fun b!1105296 () Bool)

(declare-fun res!737482 () Bool)

(assert (=> b!1105296 (=> (not res!737482) (not e!630847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105296 (= res!737482 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!42916 () Bool)

(declare-fun tp!81836 () Bool)

(assert (=> mapNonEmpty!42916 (= mapRes!42916 (and tp!81836 e!630844))))

(declare-fun mapRest!42916 () (Array (_ BitVec 32) ValueCell!12990))

(declare-fun mapKey!42916 () (_ BitVec 32))

(declare-fun mapValue!42916 () ValueCell!12990)

(assert (=> mapNonEmpty!42916 (= (arr!34513 _values!996) (store mapRest!42916 mapKey!42916 mapValue!42916))))

(declare-fun b!1105297 () Bool)

(assert (=> b!1105297 (= e!630849 tp_is_empty!27399)))

(declare-fun mapIsEmpty!42916 () Bool)

(assert (=> mapIsEmpty!42916 mapRes!42916))

(declare-fun b!1105298 () Bool)

(declare-fun res!737485 () Bool)

(declare-fun e!630848 () Bool)

(assert (=> b!1105298 (=> (not res!737485) (not e!630848))))

(declare-fun lt!495284 () array!71723)

(assert (=> b!1105298 (= res!737485 (arrayNoDuplicates!0 lt!495284 #b00000000000000000000000000000000 Nil!24069))))

(declare-fun b!1105299 () Bool)

(assert (=> b!1105299 (= e!630847 e!630848)))

(declare-fun res!737487 () Bool)

(assert (=> b!1105299 (=> (not res!737487) (not e!630848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71723 (_ BitVec 32)) Bool)

(assert (=> b!1105299 (= res!737487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495284 mask!1564))))

(assert (=> b!1105299 (= lt!495284 (array!71724 (store (arr!34514 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35050 _keys!1208)))))

(declare-fun b!1105300 () Bool)

(declare-fun res!737483 () Bool)

(assert (=> b!1105300 (=> (not res!737483) (not e!630847))))

(assert (=> b!1105300 (= res!737483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105301 () Bool)

(assert (=> b!1105301 (= e!630848 (not true))))

(declare-fun arrayContainsKey!0 (array!71723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105301 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36270 0))(
  ( (Unit!36271) )
))
(declare-fun lt!495283 () Unit!36270)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71723 (_ BitVec 64) (_ BitVec 32)) Unit!36270)

(assert (=> b!1105301 (= lt!495283 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1105302 () Bool)

(declare-fun res!737486 () Bool)

(assert (=> b!1105302 (=> (not res!737486) (not e!630847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105302 (= res!737486 (validMask!0 mask!1564))))

(assert (= (and start!97168 res!737479) b!1105302))

(assert (= (and b!1105302 res!737486) b!1105291))

(assert (= (and b!1105291 res!737481) b!1105300))

(assert (= (and b!1105300 res!737483) b!1105294))

(assert (= (and b!1105294 res!737484) b!1105292))

(assert (= (and b!1105292 res!737488) b!1105296))

(assert (= (and b!1105296 res!737482) b!1105295))

(assert (= (and b!1105295 res!737480) b!1105299))

(assert (= (and b!1105299 res!737487) b!1105298))

(assert (= (and b!1105298 res!737485) b!1105301))

(assert (= (and b!1105290 condMapEmpty!42916) mapIsEmpty!42916))

(assert (= (and b!1105290 (not condMapEmpty!42916)) mapNonEmpty!42916))

(get-info :version)

(assert (= (and mapNonEmpty!42916 ((_ is ValueCellFull!12990) mapValue!42916)) b!1105293))

(assert (= (and b!1105290 ((_ is ValueCellFull!12990) mapDefault!42916)) b!1105297))

(assert (= start!97168 b!1105290))

(declare-fun m!1024735 () Bool)

(assert (=> mapNonEmpty!42916 m!1024735))

(declare-fun m!1024737 () Bool)

(assert (=> start!97168 m!1024737))

(declare-fun m!1024739 () Bool)

(assert (=> start!97168 m!1024739))

(declare-fun m!1024741 () Bool)

(assert (=> b!1105302 m!1024741))

(declare-fun m!1024743 () Bool)

(assert (=> b!1105299 m!1024743))

(declare-fun m!1024745 () Bool)

(assert (=> b!1105299 m!1024745))

(declare-fun m!1024747 () Bool)

(assert (=> b!1105298 m!1024747))

(declare-fun m!1024749 () Bool)

(assert (=> b!1105296 m!1024749))

(declare-fun m!1024751 () Bool)

(assert (=> b!1105300 m!1024751))

(declare-fun m!1024753 () Bool)

(assert (=> b!1105295 m!1024753))

(declare-fun m!1024755 () Bool)

(assert (=> b!1105294 m!1024755))

(declare-fun m!1024757 () Bool)

(assert (=> b!1105301 m!1024757))

(declare-fun m!1024759 () Bool)

(assert (=> b!1105301 m!1024759))

(check-sat (not b!1105302) (not b!1105294) (not b!1105296) (not b!1105299) (not mapNonEmpty!42916) (not b!1105301) (not b!1105300) (not start!97168) tp_is_empty!27399 (not b!1105298))
(check-sat)
