; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111314 () Bool)

(assert start!111314)

(declare-fun b!1317197 () Bool)

(declare-fun res!874267 () Bool)

(declare-fun e!751589 () Bool)

(assert (=> b!1317197 (=> (not res!874267) (not e!751589))))

(declare-datatypes ((array!88457 0))(
  ( (array!88458 (arr!42703 (Array (_ BitVec 32) (_ BitVec 64))) (size!43255 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88457)

(declare-datatypes ((V!52825 0))(
  ( (V!52826 (val!17970 Int)) )
))
(declare-datatypes ((ValueCell!16997 0))(
  ( (ValueCellFull!16997 (v!20599 V!52825)) (EmptyCell!16997) )
))
(declare-datatypes ((array!88459 0))(
  ( (array!88460 (arr!42704 (Array (_ BitVec 32) ValueCell!16997)) (size!43256 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88459)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317197 (= res!874267 (and (= (size!43256 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43255 _keys!1609) (size!43256 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55334 () Bool)

(declare-fun mapRes!55334 () Bool)

(assert (=> mapIsEmpty!55334 mapRes!55334))

(declare-fun res!874269 () Bool)

(assert (=> start!111314 (=> (not res!874269) (not e!751589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111314 (= res!874269 (validMask!0 mask!2019))))

(assert (=> start!111314 e!751589))

(assert (=> start!111314 true))

(declare-fun e!751591 () Bool)

(declare-fun array_inv!32431 (array!88459) Bool)

(assert (=> start!111314 (and (array_inv!32431 _values!1337) e!751591)))

(declare-fun array_inv!32432 (array!88457) Bool)

(assert (=> start!111314 (array_inv!32432 _keys!1609)))

(declare-fun b!1317198 () Bool)

(declare-fun e!751587 () Bool)

(declare-fun tp_is_empty!35791 () Bool)

(assert (=> b!1317198 (= e!751587 tp_is_empty!35791)))

(declare-fun b!1317199 () Bool)

(declare-fun e!751588 () Bool)

(assert (=> b!1317199 (= e!751588 tp_is_empty!35791)))

(declare-fun b!1317200 () Bool)

(assert (=> b!1317200 (= e!751589 false)))

(declare-fun lt!586155 () Bool)

(declare-datatypes ((List!30360 0))(
  ( (Nil!30357) (Cons!30356 (h!31565 (_ BitVec 64)) (t!43960 List!30360)) )
))
(declare-fun arrayNoDuplicates!0 (array!88457 (_ BitVec 32) List!30360) Bool)

(assert (=> b!1317200 (= lt!586155 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30357))))

(declare-fun b!1317201 () Bool)

(declare-fun res!874268 () Bool)

(assert (=> b!1317201 (=> (not res!874268) (not e!751589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88457 (_ BitVec 32)) Bool)

(assert (=> b!1317201 (= res!874268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55334 () Bool)

(declare-fun tp!105441 () Bool)

(assert (=> mapNonEmpty!55334 (= mapRes!55334 (and tp!105441 e!751587))))

(declare-fun mapRest!55334 () (Array (_ BitVec 32) ValueCell!16997))

(declare-fun mapValue!55334 () ValueCell!16997)

(declare-fun mapKey!55334 () (_ BitVec 32))

(assert (=> mapNonEmpty!55334 (= (arr!42704 _values!1337) (store mapRest!55334 mapKey!55334 mapValue!55334))))

(declare-fun b!1317202 () Bool)

(assert (=> b!1317202 (= e!751591 (and e!751588 mapRes!55334))))

(declare-fun condMapEmpty!55334 () Bool)

(declare-fun mapDefault!55334 () ValueCell!16997)

(assert (=> b!1317202 (= condMapEmpty!55334 (= (arr!42704 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16997)) mapDefault!55334)))))

(assert (= (and start!111314 res!874269) b!1317197))

(assert (= (and b!1317197 res!874267) b!1317201))

(assert (= (and b!1317201 res!874268) b!1317200))

(assert (= (and b!1317202 condMapEmpty!55334) mapIsEmpty!55334))

(assert (= (and b!1317202 (not condMapEmpty!55334)) mapNonEmpty!55334))

(get-info :version)

(assert (= (and mapNonEmpty!55334 ((_ is ValueCellFull!16997) mapValue!55334)) b!1317198))

(assert (= (and b!1317202 ((_ is ValueCellFull!16997) mapDefault!55334)) b!1317199))

(assert (= start!111314 b!1317202))

(declare-fun m!1204671 () Bool)

(assert (=> start!111314 m!1204671))

(declare-fun m!1204673 () Bool)

(assert (=> start!111314 m!1204673))

(declare-fun m!1204675 () Bool)

(assert (=> start!111314 m!1204675))

(declare-fun m!1204677 () Bool)

(assert (=> b!1317200 m!1204677))

(declare-fun m!1204679 () Bool)

(assert (=> b!1317201 m!1204679))

(declare-fun m!1204681 () Bool)

(assert (=> mapNonEmpty!55334 m!1204681))

(check-sat (not mapNonEmpty!55334) tp_is_empty!35791 (not b!1317201) (not start!111314) (not b!1317200))
(check-sat)
