; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97726 () Bool)

(assert start!97726)

(declare-fun mapIsEmpty!43753 () Bool)

(declare-fun mapRes!43753 () Bool)

(assert (=> mapIsEmpty!43753 mapRes!43753))

(declare-fun b!1117395 () Bool)

(declare-fun res!746174 () Bool)

(declare-fun e!636535 () Bool)

(assert (=> b!1117395 (=> (not res!746174) (not e!636535))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117395 (= res!746174 (validMask!0 mask!1564))))

(declare-fun b!1117396 () Bool)

(declare-fun e!636537 () Bool)

(declare-fun tp_is_empty!27957 () Bool)

(assert (=> b!1117396 (= e!636537 tp_is_empty!27957)))

(declare-fun b!1117397 () Bool)

(declare-fun res!746182 () Bool)

(declare-fun e!636532 () Bool)

(assert (=> b!1117397 (=> (not res!746182) (not e!636532))))

(declare-datatypes ((array!72805 0))(
  ( (array!72806 (arr!35055 (Array (_ BitVec 32) (_ BitVec 64))) (size!35591 (_ BitVec 32))) )
))
(declare-fun lt!497281 () array!72805)

(declare-datatypes ((List!24385 0))(
  ( (Nil!24382) (Cons!24381 (h!25590 (_ BitVec 64)) (t!34866 List!24385)) )
))
(declare-fun arrayNoDuplicates!0 (array!72805 (_ BitVec 32) List!24385) Bool)

(assert (=> b!1117397 (= res!746182 (arrayNoDuplicates!0 lt!497281 #b00000000000000000000000000000000 Nil!24382))))

(declare-fun res!746180 () Bool)

(assert (=> start!97726 (=> (not res!746180) (not e!636535))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!72805)

(assert (=> start!97726 (= res!746180 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35591 _keys!1208))))))

(assert (=> start!97726 e!636535))

(declare-fun array_inv!26936 (array!72805) Bool)

(assert (=> start!97726 (array_inv!26936 _keys!1208)))

(assert (=> start!97726 true))

(declare-datatypes ((V!42403 0))(
  ( (V!42404 (val!14035 Int)) )
))
(declare-datatypes ((ValueCell!13269 0))(
  ( (ValueCellFull!13269 (v!16668 V!42403)) (EmptyCell!13269) )
))
(declare-datatypes ((array!72807 0))(
  ( (array!72808 (arr!35056 (Array (_ BitVec 32) ValueCell!13269)) (size!35592 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72807)

(declare-fun e!636534 () Bool)

(declare-fun array_inv!26937 (array!72807) Bool)

(assert (=> start!97726 (and (array_inv!26937 _values!996) e!636534)))

(declare-fun b!1117398 () Bool)

(declare-fun res!746177 () Bool)

(assert (=> b!1117398 (=> (not res!746177) (not e!636535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72805 (_ BitVec 32)) Bool)

(assert (=> b!1117398 (= res!746177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117399 () Bool)

(declare-fun res!746176 () Bool)

(assert (=> b!1117399 (=> (not res!746176) (not e!636535))))

(assert (=> b!1117399 (= res!746176 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24382))))

(declare-fun b!1117400 () Bool)

(declare-fun e!636536 () Bool)

(assert (=> b!1117400 (= e!636536 tp_is_empty!27957)))

(declare-fun b!1117401 () Bool)

(declare-fun res!746178 () Bool)

(assert (=> b!1117401 (=> (not res!746178) (not e!636535))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1117401 (= res!746178 (= (select (arr!35055 _keys!1208) i!673) k0!934))))

(declare-fun b!1117402 () Bool)

(assert (=> b!1117402 (= e!636534 (and e!636536 mapRes!43753))))

(declare-fun condMapEmpty!43753 () Bool)

(declare-fun mapDefault!43753 () ValueCell!13269)

(assert (=> b!1117402 (= condMapEmpty!43753 (= (arr!35056 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13269)) mapDefault!43753)))))

(declare-fun b!1117403 () Bool)

(assert (=> b!1117403 (= e!636535 e!636532)))

(declare-fun res!746173 () Bool)

(assert (=> b!1117403 (=> (not res!746173) (not e!636532))))

(assert (=> b!1117403 (= res!746173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497281 mask!1564))))

(assert (=> b!1117403 (= lt!497281 (array!72806 (store (arr!35055 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35591 _keys!1208)))))

(declare-fun b!1117404 () Bool)

(declare-fun res!746181 () Bool)

(assert (=> b!1117404 (=> (not res!746181) (not e!636535))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117404 (= res!746181 (and (= (size!35592 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35591 _keys!1208) (size!35592 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117405 () Bool)

(assert (=> b!1117405 (= e!636532 (not true))))

(declare-fun arrayContainsKey!0 (array!72805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117405 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36668 0))(
  ( (Unit!36669) )
))
(declare-fun lt!497282 () Unit!36668)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72805 (_ BitVec 64) (_ BitVec 32)) Unit!36668)

(assert (=> b!1117405 (= lt!497282 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117406 () Bool)

(declare-fun res!746179 () Bool)

(assert (=> b!1117406 (=> (not res!746179) (not e!636535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117406 (= res!746179 (validKeyInArray!0 k0!934))))

(declare-fun b!1117407 () Bool)

(declare-fun res!746175 () Bool)

(assert (=> b!1117407 (=> (not res!746175) (not e!636535))))

(assert (=> b!1117407 (= res!746175 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35591 _keys!1208))))))

(declare-fun mapNonEmpty!43753 () Bool)

(declare-fun tp!82997 () Bool)

(assert (=> mapNonEmpty!43753 (= mapRes!43753 (and tp!82997 e!636537))))

(declare-fun mapRest!43753 () (Array (_ BitVec 32) ValueCell!13269))

(declare-fun mapValue!43753 () ValueCell!13269)

(declare-fun mapKey!43753 () (_ BitVec 32))

(assert (=> mapNonEmpty!43753 (= (arr!35056 _values!996) (store mapRest!43753 mapKey!43753 mapValue!43753))))

(assert (= (and start!97726 res!746180) b!1117395))

(assert (= (and b!1117395 res!746174) b!1117404))

(assert (= (and b!1117404 res!746181) b!1117398))

(assert (= (and b!1117398 res!746177) b!1117399))

(assert (= (and b!1117399 res!746176) b!1117407))

(assert (= (and b!1117407 res!746175) b!1117406))

(assert (= (and b!1117406 res!746179) b!1117401))

(assert (= (and b!1117401 res!746178) b!1117403))

(assert (= (and b!1117403 res!746173) b!1117397))

(assert (= (and b!1117397 res!746182) b!1117405))

(assert (= (and b!1117402 condMapEmpty!43753) mapIsEmpty!43753))

(assert (= (and b!1117402 (not condMapEmpty!43753)) mapNonEmpty!43753))

(get-info :version)

(assert (= (and mapNonEmpty!43753 ((_ is ValueCellFull!13269) mapValue!43753)) b!1117396))

(assert (= (and b!1117402 ((_ is ValueCellFull!13269) mapDefault!43753)) b!1117400))

(assert (= start!97726 b!1117402))

(declare-fun m!1033285 () Bool)

(assert (=> b!1117397 m!1033285))

(declare-fun m!1033287 () Bool)

(assert (=> start!97726 m!1033287))

(declare-fun m!1033289 () Bool)

(assert (=> start!97726 m!1033289))

(declare-fun m!1033291 () Bool)

(assert (=> b!1117406 m!1033291))

(declare-fun m!1033293 () Bool)

(assert (=> b!1117401 m!1033293))

(declare-fun m!1033295 () Bool)

(assert (=> b!1117395 m!1033295))

(declare-fun m!1033297 () Bool)

(assert (=> b!1117399 m!1033297))

(declare-fun m!1033299 () Bool)

(assert (=> mapNonEmpty!43753 m!1033299))

(declare-fun m!1033301 () Bool)

(assert (=> b!1117405 m!1033301))

(declare-fun m!1033303 () Bool)

(assert (=> b!1117405 m!1033303))

(declare-fun m!1033305 () Bool)

(assert (=> b!1117403 m!1033305))

(declare-fun m!1033307 () Bool)

(assert (=> b!1117403 m!1033307))

(declare-fun m!1033309 () Bool)

(assert (=> b!1117398 m!1033309))

(check-sat (not b!1117406) (not b!1117398) tp_is_empty!27957 (not b!1117399) (not start!97726) (not b!1117403) (not b!1117405) (not b!1117397) (not mapNonEmpty!43753) (not b!1117395))
(check-sat)
