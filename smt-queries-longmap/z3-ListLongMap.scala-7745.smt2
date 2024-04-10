; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97216 () Bool)

(assert start!97216)

(declare-fun b!1106226 () Bool)

(declare-fun res!738201 () Bool)

(declare-fun e!631281 () Bool)

(assert (=> b!1106226 (=> (not res!738201) (not e!631281))))

(declare-datatypes ((array!71811 0))(
  ( (array!71812 (arr!34558 (Array (_ BitVec 32) (_ BitVec 64))) (size!35094 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71811)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71811 (_ BitVec 32)) Bool)

(assert (=> b!1106226 (= res!738201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106227 () Bool)

(declare-fun res!738208 () Bool)

(assert (=> b!1106227 (=> (not res!738208) (not e!631281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106227 (= res!738208 (validMask!0 mask!1564))))

(declare-fun b!1106228 () Bool)

(declare-fun e!631276 () Bool)

(declare-fun tp_is_empty!27447 () Bool)

(assert (=> b!1106228 (= e!631276 tp_is_empty!27447)))

(declare-fun mapIsEmpty!42988 () Bool)

(declare-fun mapRes!42988 () Bool)

(assert (=> mapIsEmpty!42988 mapRes!42988))

(declare-fun b!1106229 () Bool)

(declare-fun res!738206 () Bool)

(assert (=> b!1106229 (=> (not res!738206) (not e!631281))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1106229 (= res!738206 (= (select (arr!34558 _keys!1208) i!673) k0!934))))

(declare-fun b!1106230 () Bool)

(declare-fun res!738202 () Bool)

(assert (=> b!1106230 (=> (not res!738202) (not e!631281))))

(declare-datatypes ((List!24091 0))(
  ( (Nil!24088) (Cons!24087 (h!25296 (_ BitVec 64)) (t!34356 List!24091)) )
))
(declare-fun arrayNoDuplicates!0 (array!71811 (_ BitVec 32) List!24091) Bool)

(assert (=> b!1106230 (= res!738202 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24088))))

(declare-fun mapNonEmpty!42988 () Bool)

(declare-fun tp!81908 () Bool)

(assert (=> mapNonEmpty!42988 (= mapRes!42988 (and tp!81908 e!631276))))

(declare-fun mapKey!42988 () (_ BitVec 32))

(declare-datatypes ((V!41723 0))(
  ( (V!41724 (val!13780 Int)) )
))
(declare-datatypes ((ValueCell!13014 0))(
  ( (ValueCellFull!13014 (v!16413 V!41723)) (EmptyCell!13014) )
))
(declare-fun mapValue!42988 () ValueCell!13014)

(declare-fun mapRest!42988 () (Array (_ BitVec 32) ValueCell!13014))

(declare-datatypes ((array!71813 0))(
  ( (array!71814 (arr!34559 (Array (_ BitVec 32) ValueCell!13014)) (size!35095 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71813)

(assert (=> mapNonEmpty!42988 (= (arr!34559 _values!996) (store mapRest!42988 mapKey!42988 mapValue!42988))))

(declare-fun b!1106231 () Bool)

(declare-fun res!738207 () Bool)

(declare-fun e!631279 () Bool)

(assert (=> b!1106231 (=> (not res!738207) (not e!631279))))

(declare-fun lt!495428 () array!71811)

(assert (=> b!1106231 (= res!738207 (arrayNoDuplicates!0 lt!495428 #b00000000000000000000000000000000 Nil!24088))))

(declare-fun b!1106232 () Bool)

(declare-fun res!738199 () Bool)

(assert (=> b!1106232 (=> (not res!738199) (not e!631281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106232 (= res!738199 (validKeyInArray!0 k0!934))))

(declare-fun b!1106233 () Bool)

(assert (=> b!1106233 (= e!631279 (not true))))

(declare-fun arrayContainsKey!0 (array!71811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106233 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36298 0))(
  ( (Unit!36299) )
))
(declare-fun lt!495427 () Unit!36298)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71811 (_ BitVec 64) (_ BitVec 32)) Unit!36298)

(assert (=> b!1106233 (= lt!495427 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106234 () Bool)

(declare-fun e!631280 () Bool)

(declare-fun e!631278 () Bool)

(assert (=> b!1106234 (= e!631280 (and e!631278 mapRes!42988))))

(declare-fun condMapEmpty!42988 () Bool)

(declare-fun mapDefault!42988 () ValueCell!13014)

(assert (=> b!1106234 (= condMapEmpty!42988 (= (arr!34559 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13014)) mapDefault!42988)))))

(declare-fun b!1106235 () Bool)

(assert (=> b!1106235 (= e!631281 e!631279)))

(declare-fun res!738204 () Bool)

(assert (=> b!1106235 (=> (not res!738204) (not e!631279))))

(assert (=> b!1106235 (= res!738204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495428 mask!1564))))

(assert (=> b!1106235 (= lt!495428 (array!71812 (store (arr!34558 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35094 _keys!1208)))))

(declare-fun res!738203 () Bool)

(assert (=> start!97216 (=> (not res!738203) (not e!631281))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97216 (= res!738203 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35094 _keys!1208))))))

(assert (=> start!97216 e!631281))

(declare-fun array_inv!26596 (array!71811) Bool)

(assert (=> start!97216 (array_inv!26596 _keys!1208)))

(assert (=> start!97216 true))

(declare-fun array_inv!26597 (array!71813) Bool)

(assert (=> start!97216 (and (array_inv!26597 _values!996) e!631280)))

(declare-fun b!1106236 () Bool)

(declare-fun res!738200 () Bool)

(assert (=> b!1106236 (=> (not res!738200) (not e!631281))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106236 (= res!738200 (and (= (size!35095 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35094 _keys!1208) (size!35095 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106237 () Bool)

(assert (=> b!1106237 (= e!631278 tp_is_empty!27447)))

(declare-fun b!1106238 () Bool)

(declare-fun res!738205 () Bool)

(assert (=> b!1106238 (=> (not res!738205) (not e!631281))))

(assert (=> b!1106238 (= res!738205 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35094 _keys!1208))))))

(assert (= (and start!97216 res!738203) b!1106227))

(assert (= (and b!1106227 res!738208) b!1106236))

(assert (= (and b!1106236 res!738200) b!1106226))

(assert (= (and b!1106226 res!738201) b!1106230))

(assert (= (and b!1106230 res!738202) b!1106238))

(assert (= (and b!1106238 res!738205) b!1106232))

(assert (= (and b!1106232 res!738199) b!1106229))

(assert (= (and b!1106229 res!738206) b!1106235))

(assert (= (and b!1106235 res!738204) b!1106231))

(assert (= (and b!1106231 res!738207) b!1106233))

(assert (= (and b!1106234 condMapEmpty!42988) mapIsEmpty!42988))

(assert (= (and b!1106234 (not condMapEmpty!42988)) mapNonEmpty!42988))

(get-info :version)

(assert (= (and mapNonEmpty!42988 ((_ is ValueCellFull!13014) mapValue!42988)) b!1106228))

(assert (= (and b!1106234 ((_ is ValueCellFull!13014) mapDefault!42988)) b!1106237))

(assert (= start!97216 b!1106234))

(declare-fun m!1025359 () Bool)

(assert (=> b!1106226 m!1025359))

(declare-fun m!1025361 () Bool)

(assert (=> b!1106230 m!1025361))

(declare-fun m!1025363 () Bool)

(assert (=> b!1106229 m!1025363))

(declare-fun m!1025365 () Bool)

(assert (=> b!1106231 m!1025365))

(declare-fun m!1025367 () Bool)

(assert (=> b!1106233 m!1025367))

(declare-fun m!1025369 () Bool)

(assert (=> b!1106233 m!1025369))

(declare-fun m!1025371 () Bool)

(assert (=> start!97216 m!1025371))

(declare-fun m!1025373 () Bool)

(assert (=> start!97216 m!1025373))

(declare-fun m!1025375 () Bool)

(assert (=> b!1106232 m!1025375))

(declare-fun m!1025377 () Bool)

(assert (=> b!1106235 m!1025377))

(declare-fun m!1025379 () Bool)

(assert (=> b!1106235 m!1025379))

(declare-fun m!1025381 () Bool)

(assert (=> mapNonEmpty!42988 m!1025381))

(declare-fun m!1025383 () Bool)

(assert (=> b!1106227 m!1025383))

(check-sat tp_is_empty!27447 (not start!97216) (not b!1106230) (not b!1106235) (not b!1106227) (not mapNonEmpty!42988) (not b!1106232) (not b!1106231) (not b!1106233) (not b!1106226))
(check-sat)
