; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!538 () Bool)

(assert start!538)

(declare-fun mapNonEmpty!104 () Bool)

(declare-fun mapRes!104 () Bool)

(declare-fun tp!344 () Bool)

(declare-fun e!1431 () Bool)

(assert (=> mapNonEmpty!104 (= mapRes!104 (and tp!344 e!1431))))

(declare-datatypes ((V!309 0))(
  ( (V!310 (val!55 Int)) )
))
(declare-datatypes ((ValueCell!33 0))(
  ( (ValueCellFull!33 (v!1142 V!309)) (EmptyCell!33) )
))
(declare-fun mapValue!104 () ValueCell!33)

(declare-fun mapRest!104 () (Array (_ BitVec 32) ValueCell!33))

(declare-fun mapKey!104 () (_ BitVec 32))

(declare-datatypes ((array!137 0))(
  ( (array!138 (arr!62 (Array (_ BitVec 32) ValueCell!33)) (size!124 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!137)

(assert (=> mapNonEmpty!104 (= (arr!62 _values!1492) (store mapRest!104 mapKey!104 mapValue!104))))

(declare-fun b!3177 () Bool)

(declare-fun e!1432 () Bool)

(declare-fun e!1430 () Bool)

(assert (=> b!3177 (= e!1432 (and e!1430 mapRes!104))))

(declare-fun condMapEmpty!104 () Bool)

(declare-fun mapDefault!104 () ValueCell!33)

(assert (=> b!3177 (= condMapEmpty!104 (= (arr!62 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!33)) mapDefault!104)))))

(declare-fun mapIsEmpty!104 () Bool)

(assert (=> mapIsEmpty!104 mapRes!104))

(declare-fun b!3178 () Bool)

(declare-fun tp_is_empty!99 () Bool)

(assert (=> b!3178 (= e!1430 tp_is_empty!99)))

(declare-fun b!3179 () Bool)

(declare-fun res!5050 () Bool)

(declare-fun e!1433 () Bool)

(assert (=> b!3179 (=> (not res!5050) (not e!1433))))

(declare-datatypes ((array!139 0))(
  ( (array!140 (arr!63 (Array (_ BitVec 32) (_ BitVec 64))) (size!125 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!139)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun mask!2250 () (_ BitVec 32))

(assert (=> b!3179 (= res!5050 (and (= (size!124 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!125 _keys!1806) (size!124 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!5049 () Bool)

(assert (=> start!538 (=> (not res!5049) (not e!1433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!538 (= res!5049 (validMask!0 mask!2250))))

(assert (=> start!538 e!1433))

(assert (=> start!538 true))

(declare-fun array_inv!41 (array!137) Bool)

(assert (=> start!538 (and (array_inv!41 _values!1492) e!1432)))

(declare-fun array_inv!42 (array!139) Bool)

(assert (=> start!538 (array_inv!42 _keys!1806)))

(declare-fun b!3180 () Bool)

(assert (=> b!3180 (= e!1433 false)))

(declare-fun lt!432 () Bool)

(declare-datatypes ((List!47 0))(
  ( (Nil!44) (Cons!43 (h!609 (_ BitVec 64)) (t!2174 List!47)) )
))
(declare-fun arrayNoDuplicates!0 (array!139 (_ BitVec 32) List!47) Bool)

(assert (=> b!3180 (= lt!432 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!44))))

(declare-fun b!3181 () Bool)

(declare-fun res!5048 () Bool)

(assert (=> b!3181 (=> (not res!5048) (not e!1433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!139 (_ BitVec 32)) Bool)

(assert (=> b!3181 (= res!5048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3182 () Bool)

(assert (=> b!3182 (= e!1431 tp_is_empty!99)))

(assert (= (and start!538 res!5049) b!3179))

(assert (= (and b!3179 res!5050) b!3181))

(assert (= (and b!3181 res!5048) b!3180))

(assert (= (and b!3177 condMapEmpty!104) mapIsEmpty!104))

(assert (= (and b!3177 (not condMapEmpty!104)) mapNonEmpty!104))

(get-info :version)

(assert (= (and mapNonEmpty!104 ((_ is ValueCellFull!33) mapValue!104)) b!3182))

(assert (= (and b!3177 ((_ is ValueCellFull!33) mapDefault!104)) b!3178))

(assert (= start!538 b!3177))

(declare-fun m!1481 () Bool)

(assert (=> mapNonEmpty!104 m!1481))

(declare-fun m!1483 () Bool)

(assert (=> start!538 m!1483))

(declare-fun m!1485 () Bool)

(assert (=> start!538 m!1485))

(declare-fun m!1487 () Bool)

(assert (=> start!538 m!1487))

(declare-fun m!1489 () Bool)

(assert (=> b!3180 m!1489))

(declare-fun m!1491 () Bool)

(assert (=> b!3181 m!1491))

(check-sat (not b!3181) (not mapNonEmpty!104) (not b!3180) (not start!538) tp_is_empty!99)
(check-sat)
