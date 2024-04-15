; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111308 () Bool)

(assert start!111308)

(declare-fun b!1317143 () Bool)

(declare-fun e!751544 () Bool)

(declare-fun tp_is_empty!35785 () Bool)

(assert (=> b!1317143 (= e!751544 tp_is_empty!35785)))

(declare-fun mapIsEmpty!55325 () Bool)

(declare-fun mapRes!55325 () Bool)

(assert (=> mapIsEmpty!55325 mapRes!55325))

(declare-fun mapNonEmpty!55325 () Bool)

(declare-fun tp!105432 () Bool)

(declare-fun e!751545 () Bool)

(assert (=> mapNonEmpty!55325 (= mapRes!55325 (and tp!105432 e!751545))))

(declare-datatypes ((V!52817 0))(
  ( (V!52818 (val!17967 Int)) )
))
(declare-datatypes ((ValueCell!16994 0))(
  ( (ValueCellFull!16994 (v!20596 V!52817)) (EmptyCell!16994) )
))
(declare-fun mapRest!55325 () (Array (_ BitVec 32) ValueCell!16994))

(declare-datatypes ((array!88445 0))(
  ( (array!88446 (arr!42697 (Array (_ BitVec 32) ValueCell!16994)) (size!43249 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88445)

(declare-fun mapKey!55325 () (_ BitVec 32))

(declare-fun mapValue!55325 () ValueCell!16994)

(assert (=> mapNonEmpty!55325 (= (arr!42697 _values!1337) (store mapRest!55325 mapKey!55325 mapValue!55325))))

(declare-fun b!1317144 () Bool)

(assert (=> b!1317144 (= e!751545 tp_is_empty!35785)))

(declare-fun b!1317145 () Bool)

(declare-fun res!874241 () Bool)

(declare-fun e!751546 () Bool)

(assert (=> b!1317145 (=> (not res!874241) (not e!751546))))

(declare-datatypes ((array!88447 0))(
  ( (array!88448 (arr!42698 (Array (_ BitVec 32) (_ BitVec 64))) (size!43250 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88447)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1317145 (= res!874241 (and (= (size!43249 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43250 _keys!1609) (size!43249 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317146 () Bool)

(assert (=> b!1317146 (= e!751546 false)))

(declare-fun lt!586146 () Bool)

(declare-datatypes ((List!30359 0))(
  ( (Nil!30356) (Cons!30355 (h!31564 (_ BitVec 64)) (t!43959 List!30359)) )
))
(declare-fun arrayNoDuplicates!0 (array!88447 (_ BitVec 32) List!30359) Bool)

(assert (=> b!1317146 (= lt!586146 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30356))))

(declare-fun res!874240 () Bool)

(assert (=> start!111308 (=> (not res!874240) (not e!751546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111308 (= res!874240 (validMask!0 mask!2019))))

(assert (=> start!111308 e!751546))

(assert (=> start!111308 true))

(declare-fun e!751542 () Bool)

(declare-fun array_inv!32427 (array!88445) Bool)

(assert (=> start!111308 (and (array_inv!32427 _values!1337) e!751542)))

(declare-fun array_inv!32428 (array!88447) Bool)

(assert (=> start!111308 (array_inv!32428 _keys!1609)))

(declare-fun b!1317147 () Bool)

(declare-fun res!874242 () Bool)

(assert (=> b!1317147 (=> (not res!874242) (not e!751546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88447 (_ BitVec 32)) Bool)

(assert (=> b!1317147 (= res!874242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317148 () Bool)

(assert (=> b!1317148 (= e!751542 (and e!751544 mapRes!55325))))

(declare-fun condMapEmpty!55325 () Bool)

(declare-fun mapDefault!55325 () ValueCell!16994)

(assert (=> b!1317148 (= condMapEmpty!55325 (= (arr!42697 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16994)) mapDefault!55325)))))

(assert (= (and start!111308 res!874240) b!1317145))

(assert (= (and b!1317145 res!874241) b!1317147))

(assert (= (and b!1317147 res!874242) b!1317146))

(assert (= (and b!1317148 condMapEmpty!55325) mapIsEmpty!55325))

(assert (= (and b!1317148 (not condMapEmpty!55325)) mapNonEmpty!55325))

(get-info :version)

(assert (= (and mapNonEmpty!55325 ((_ is ValueCellFull!16994) mapValue!55325)) b!1317144))

(assert (= (and b!1317148 ((_ is ValueCellFull!16994) mapDefault!55325)) b!1317143))

(assert (= start!111308 b!1317148))

(declare-fun m!1204635 () Bool)

(assert (=> mapNonEmpty!55325 m!1204635))

(declare-fun m!1204637 () Bool)

(assert (=> b!1317146 m!1204637))

(declare-fun m!1204639 () Bool)

(assert (=> start!111308 m!1204639))

(declare-fun m!1204641 () Bool)

(assert (=> start!111308 m!1204641))

(declare-fun m!1204643 () Bool)

(assert (=> start!111308 m!1204643))

(declare-fun m!1204645 () Bool)

(assert (=> b!1317147 m!1204645))

(check-sat (not start!111308) (not b!1317146) tp_is_empty!35785 (not mapNonEmpty!55325) (not b!1317147))
(check-sat)
