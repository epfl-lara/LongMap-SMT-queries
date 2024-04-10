; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97222 () Bool)

(assert start!97222)

(declare-fun b!1106343 () Bool)

(declare-fun res!738294 () Bool)

(declare-fun e!631333 () Bool)

(assert (=> b!1106343 (=> (not res!738294) (not e!631333))))

(declare-datatypes ((array!71823 0))(
  ( (array!71824 (arr!34564 (Array (_ BitVec 32) (_ BitVec 64))) (size!35100 (_ BitVec 32))) )
))
(declare-fun lt!495445 () array!71823)

(declare-datatypes ((List!24094 0))(
  ( (Nil!24091) (Cons!24090 (h!25299 (_ BitVec 64)) (t!34359 List!24094)) )
))
(declare-fun arrayNoDuplicates!0 (array!71823 (_ BitVec 32) List!24094) Bool)

(assert (=> b!1106343 (= res!738294 (arrayNoDuplicates!0 lt!495445 #b00000000000000000000000000000000 Nil!24091))))

(declare-fun b!1106344 () Bool)

(assert (=> b!1106344 (= e!631333 (not true))))

(declare-fun _keys!1208 () array!71823)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106344 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36304 0))(
  ( (Unit!36305) )
))
(declare-fun lt!495446 () Unit!36304)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71823 (_ BitVec 64) (_ BitVec 32)) Unit!36304)

(assert (=> b!1106344 (= lt!495446 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106345 () Bool)

(declare-fun res!738293 () Bool)

(declare-fun e!631332 () Bool)

(assert (=> b!1106345 (=> (not res!738293) (not e!631332))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41731 0))(
  ( (V!41732 (val!13783 Int)) )
))
(declare-datatypes ((ValueCell!13017 0))(
  ( (ValueCellFull!13017 (v!16416 V!41731)) (EmptyCell!13017) )
))
(declare-datatypes ((array!71825 0))(
  ( (array!71826 (arr!34565 (Array (_ BitVec 32) ValueCell!13017)) (size!35101 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71825)

(assert (=> b!1106345 (= res!738293 (and (= (size!35101 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35100 _keys!1208) (size!35101 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106346 () Bool)

(declare-fun res!738289 () Bool)

(assert (=> b!1106346 (=> (not res!738289) (not e!631332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106346 (= res!738289 (validKeyInArray!0 k0!934))))

(declare-fun b!1106347 () Bool)

(declare-fun e!631334 () Bool)

(declare-fun e!631331 () Bool)

(declare-fun mapRes!42997 () Bool)

(assert (=> b!1106347 (= e!631334 (and e!631331 mapRes!42997))))

(declare-fun condMapEmpty!42997 () Bool)

(declare-fun mapDefault!42997 () ValueCell!13017)

(assert (=> b!1106347 (= condMapEmpty!42997 (= (arr!34565 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13017)) mapDefault!42997)))))

(declare-fun b!1106349 () Bool)

(declare-fun res!738298 () Bool)

(assert (=> b!1106349 (=> (not res!738298) (not e!631332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106349 (= res!738298 (validMask!0 mask!1564))))

(declare-fun b!1106350 () Bool)

(assert (=> b!1106350 (= e!631332 e!631333)))

(declare-fun res!738296 () Bool)

(assert (=> b!1106350 (=> (not res!738296) (not e!631333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71823 (_ BitVec 32)) Bool)

(assert (=> b!1106350 (= res!738296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495445 mask!1564))))

(assert (=> b!1106350 (= lt!495445 (array!71824 (store (arr!34564 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35100 _keys!1208)))))

(declare-fun b!1106351 () Bool)

(declare-fun res!738290 () Bool)

(assert (=> b!1106351 (=> (not res!738290) (not e!631332))))

(assert (=> b!1106351 (= res!738290 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35100 _keys!1208))))))

(declare-fun b!1106352 () Bool)

(declare-fun res!738291 () Bool)

(assert (=> b!1106352 (=> (not res!738291) (not e!631332))))

(assert (=> b!1106352 (= res!738291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106353 () Bool)

(declare-fun tp_is_empty!27453 () Bool)

(assert (=> b!1106353 (= e!631331 tp_is_empty!27453)))

(declare-fun b!1106354 () Bool)

(declare-fun res!738292 () Bool)

(assert (=> b!1106354 (=> (not res!738292) (not e!631332))))

(assert (=> b!1106354 (= res!738292 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24091))))

(declare-fun mapIsEmpty!42997 () Bool)

(assert (=> mapIsEmpty!42997 mapRes!42997))

(declare-fun b!1106348 () Bool)

(declare-fun res!738295 () Bool)

(assert (=> b!1106348 (=> (not res!738295) (not e!631332))))

(assert (=> b!1106348 (= res!738295 (= (select (arr!34564 _keys!1208) i!673) k0!934))))

(declare-fun res!738297 () Bool)

(assert (=> start!97222 (=> (not res!738297) (not e!631332))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97222 (= res!738297 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35100 _keys!1208))))))

(assert (=> start!97222 e!631332))

(declare-fun array_inv!26600 (array!71823) Bool)

(assert (=> start!97222 (array_inv!26600 _keys!1208)))

(assert (=> start!97222 true))

(declare-fun array_inv!26601 (array!71825) Bool)

(assert (=> start!97222 (and (array_inv!26601 _values!996) e!631334)))

(declare-fun b!1106355 () Bool)

(declare-fun e!631330 () Bool)

(assert (=> b!1106355 (= e!631330 tp_is_empty!27453)))

(declare-fun mapNonEmpty!42997 () Bool)

(declare-fun tp!81917 () Bool)

(assert (=> mapNonEmpty!42997 (= mapRes!42997 (and tp!81917 e!631330))))

(declare-fun mapRest!42997 () (Array (_ BitVec 32) ValueCell!13017))

(declare-fun mapKey!42997 () (_ BitVec 32))

(declare-fun mapValue!42997 () ValueCell!13017)

(assert (=> mapNonEmpty!42997 (= (arr!34565 _values!996) (store mapRest!42997 mapKey!42997 mapValue!42997))))

(assert (= (and start!97222 res!738297) b!1106349))

(assert (= (and b!1106349 res!738298) b!1106345))

(assert (= (and b!1106345 res!738293) b!1106352))

(assert (= (and b!1106352 res!738291) b!1106354))

(assert (= (and b!1106354 res!738292) b!1106351))

(assert (= (and b!1106351 res!738290) b!1106346))

(assert (= (and b!1106346 res!738289) b!1106348))

(assert (= (and b!1106348 res!738295) b!1106350))

(assert (= (and b!1106350 res!738296) b!1106343))

(assert (= (and b!1106343 res!738294) b!1106344))

(assert (= (and b!1106347 condMapEmpty!42997) mapIsEmpty!42997))

(assert (= (and b!1106347 (not condMapEmpty!42997)) mapNonEmpty!42997))

(get-info :version)

(assert (= (and mapNonEmpty!42997 ((_ is ValueCellFull!13017) mapValue!42997)) b!1106355))

(assert (= (and b!1106347 ((_ is ValueCellFull!13017) mapDefault!42997)) b!1106353))

(assert (= start!97222 b!1106347))

(declare-fun m!1025437 () Bool)

(assert (=> start!97222 m!1025437))

(declare-fun m!1025439 () Bool)

(assert (=> start!97222 m!1025439))

(declare-fun m!1025441 () Bool)

(assert (=> b!1106350 m!1025441))

(declare-fun m!1025443 () Bool)

(assert (=> b!1106350 m!1025443))

(declare-fun m!1025445 () Bool)

(assert (=> b!1106346 m!1025445))

(declare-fun m!1025447 () Bool)

(assert (=> b!1106349 m!1025447))

(declare-fun m!1025449 () Bool)

(assert (=> b!1106343 m!1025449))

(declare-fun m!1025451 () Bool)

(assert (=> b!1106352 m!1025451))

(declare-fun m!1025453 () Bool)

(assert (=> b!1106348 m!1025453))

(declare-fun m!1025455 () Bool)

(assert (=> b!1106354 m!1025455))

(declare-fun m!1025457 () Bool)

(assert (=> b!1106344 m!1025457))

(declare-fun m!1025459 () Bool)

(assert (=> b!1106344 m!1025459))

(declare-fun m!1025461 () Bool)

(assert (=> mapNonEmpty!42997 m!1025461))

(check-sat (not b!1106350) (not b!1106346) (not start!97222) (not b!1106349) (not b!1106343) (not b!1106352) (not mapNonEmpty!42997) tp_is_empty!27453 (not b!1106344) (not b!1106354))
(check-sat)
