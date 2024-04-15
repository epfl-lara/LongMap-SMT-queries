; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97616 () Bool)

(assert start!97616)

(declare-fun b!1115238 () Bool)

(declare-fun e!635515 () Bool)

(declare-fun e!635517 () Bool)

(declare-fun mapRes!43597 () Bool)

(assert (=> b!1115238 (= e!635515 (and e!635517 mapRes!43597))))

(declare-fun condMapEmpty!43597 () Bool)

(declare-datatypes ((V!42265 0))(
  ( (V!42266 (val!13983 Int)) )
))
(declare-datatypes ((ValueCell!13217 0))(
  ( (ValueCellFull!13217 (v!16615 V!42265)) (EmptyCell!13217) )
))
(declare-datatypes ((array!72508 0))(
  ( (array!72509 (arr!34907 (Array (_ BitVec 32) ValueCell!13217)) (size!35445 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72508)

(declare-fun mapDefault!43597 () ValueCell!13217)

(assert (=> b!1115238 (= condMapEmpty!43597 (= (arr!34907 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13217)) mapDefault!43597)))))

(declare-fun b!1115239 () Bool)

(declare-fun e!635518 () Bool)

(declare-fun tp_is_empty!27853 () Bool)

(assert (=> b!1115239 (= e!635518 tp_is_empty!27853)))

(declare-fun mapNonEmpty!43597 () Bool)

(declare-fun tp!82841 () Bool)

(assert (=> mapNonEmpty!43597 (= mapRes!43597 (and tp!82841 e!635518))))

(declare-fun mapValue!43597 () ValueCell!13217)

(declare-fun mapRest!43597 () (Array (_ BitVec 32) ValueCell!13217))

(declare-fun mapKey!43597 () (_ BitVec 32))

(assert (=> mapNonEmpty!43597 (= (arr!34907 _values!996) (store mapRest!43597 mapKey!43597 mapValue!43597))))

(declare-fun b!1115241 () Bool)

(declare-fun res!744553 () Bool)

(declare-fun e!635516 () Bool)

(assert (=> b!1115241 (=> (not res!744553) (not e!635516))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72510 0))(
  ( (array!72511 (arr!34908 (Array (_ BitVec 32) (_ BitVec 64))) (size!35446 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72510)

(assert (=> b!1115241 (= res!744553 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35446 _keys!1208))))))

(declare-fun b!1115242 () Bool)

(declare-fun res!744547 () Bool)

(assert (=> b!1115242 (=> (not res!744547) (not e!635516))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1115242 (= res!744547 (= (select (arr!34908 _keys!1208) i!673) k0!934))))

(declare-fun b!1115243 () Bool)

(declare-fun res!744545 () Bool)

(assert (=> b!1115243 (=> (not res!744545) (not e!635516))))

(declare-datatypes ((List!24380 0))(
  ( (Nil!24377) (Cons!24376 (h!25585 (_ BitVec 64)) (t!34852 List!24380)) )
))
(declare-fun arrayNoDuplicates!0 (array!72510 (_ BitVec 32) List!24380) Bool)

(assert (=> b!1115243 (= res!744545 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24377))))

(declare-fun b!1115244 () Bool)

(declare-fun res!744544 () Bool)

(declare-fun e!635520 () Bool)

(assert (=> b!1115244 (=> (not res!744544) (not e!635520))))

(declare-fun lt!496769 () array!72510)

(assert (=> b!1115244 (= res!744544 (arrayNoDuplicates!0 lt!496769 #b00000000000000000000000000000000 Nil!24377))))

(declare-fun b!1115245 () Bool)

(declare-fun res!744551 () Bool)

(assert (=> b!1115245 (=> (not res!744551) (not e!635516))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1115245 (= res!744551 (and (= (size!35445 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35446 _keys!1208) (size!35445 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115246 () Bool)

(assert (=> b!1115246 (= e!635520 (not true))))

(declare-fun arrayContainsKey!0 (array!72510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115246 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36427 0))(
  ( (Unit!36428) )
))
(declare-fun lt!496770 () Unit!36427)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72510 (_ BitVec 64) (_ BitVec 32)) Unit!36427)

(assert (=> b!1115246 (= lt!496770 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115247 () Bool)

(declare-fun res!744552 () Bool)

(assert (=> b!1115247 (=> (not res!744552) (not e!635516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115247 (= res!744552 (validKeyInArray!0 k0!934))))

(declare-fun b!1115248 () Bool)

(declare-fun res!744549 () Bool)

(assert (=> b!1115248 (=> (not res!744549) (not e!635516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72510 (_ BitVec 32)) Bool)

(assert (=> b!1115248 (= res!744549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115249 () Bool)

(assert (=> b!1115249 (= e!635517 tp_is_empty!27853)))

(declare-fun b!1115240 () Bool)

(declare-fun res!744548 () Bool)

(assert (=> b!1115240 (=> (not res!744548) (not e!635516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115240 (= res!744548 (validMask!0 mask!1564))))

(declare-fun res!744550 () Bool)

(assert (=> start!97616 (=> (not res!744550) (not e!635516))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97616 (= res!744550 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35446 _keys!1208))))))

(assert (=> start!97616 e!635516))

(declare-fun array_inv!26902 (array!72510) Bool)

(assert (=> start!97616 (array_inv!26902 _keys!1208)))

(assert (=> start!97616 true))

(declare-fun array_inv!26903 (array!72508) Bool)

(assert (=> start!97616 (and (array_inv!26903 _values!996) e!635515)))

(declare-fun b!1115250 () Bool)

(assert (=> b!1115250 (= e!635516 e!635520)))

(declare-fun res!744546 () Bool)

(assert (=> b!1115250 (=> (not res!744546) (not e!635520))))

(assert (=> b!1115250 (= res!744546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496769 mask!1564))))

(assert (=> b!1115250 (= lt!496769 (array!72511 (store (arr!34908 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35446 _keys!1208)))))

(declare-fun mapIsEmpty!43597 () Bool)

(assert (=> mapIsEmpty!43597 mapRes!43597))

(assert (= (and start!97616 res!744550) b!1115240))

(assert (= (and b!1115240 res!744548) b!1115245))

(assert (= (and b!1115245 res!744551) b!1115248))

(assert (= (and b!1115248 res!744549) b!1115243))

(assert (= (and b!1115243 res!744545) b!1115241))

(assert (= (and b!1115241 res!744553) b!1115247))

(assert (= (and b!1115247 res!744552) b!1115242))

(assert (= (and b!1115242 res!744547) b!1115250))

(assert (= (and b!1115250 res!744546) b!1115244))

(assert (= (and b!1115244 res!744544) b!1115246))

(assert (= (and b!1115238 condMapEmpty!43597) mapIsEmpty!43597))

(assert (= (and b!1115238 (not condMapEmpty!43597)) mapNonEmpty!43597))

(get-info :version)

(assert (= (and mapNonEmpty!43597 ((_ is ValueCellFull!13217) mapValue!43597)) b!1115239))

(assert (= (and b!1115238 ((_ is ValueCellFull!13217) mapDefault!43597)) b!1115249))

(assert (= start!97616 b!1115238))

(declare-fun m!1031307 () Bool)

(assert (=> mapNonEmpty!43597 m!1031307))

(declare-fun m!1031309 () Bool)

(assert (=> b!1115240 m!1031309))

(declare-fun m!1031311 () Bool)

(assert (=> start!97616 m!1031311))

(declare-fun m!1031313 () Bool)

(assert (=> start!97616 m!1031313))

(declare-fun m!1031315 () Bool)

(assert (=> b!1115250 m!1031315))

(declare-fun m!1031317 () Bool)

(assert (=> b!1115250 m!1031317))

(declare-fun m!1031319 () Bool)

(assert (=> b!1115246 m!1031319))

(declare-fun m!1031321 () Bool)

(assert (=> b!1115246 m!1031321))

(declare-fun m!1031323 () Bool)

(assert (=> b!1115248 m!1031323))

(declare-fun m!1031325 () Bool)

(assert (=> b!1115242 m!1031325))

(declare-fun m!1031327 () Bool)

(assert (=> b!1115247 m!1031327))

(declare-fun m!1031329 () Bool)

(assert (=> b!1115243 m!1031329))

(declare-fun m!1031331 () Bool)

(assert (=> b!1115244 m!1031331))

(check-sat (not b!1115244) (not b!1115246) (not b!1115248) (not b!1115250) tp_is_empty!27853 (not start!97616) (not mapNonEmpty!43597) (not b!1115247) (not b!1115240) (not b!1115243))
(check-sat)
