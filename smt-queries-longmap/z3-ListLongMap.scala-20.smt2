; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!544 () Bool)

(assert start!544)

(declare-fun mapIsEmpty!113 () Bool)

(declare-fun mapRes!113 () Bool)

(assert (=> mapIsEmpty!113 mapRes!113))

(declare-fun b!3231 () Bool)

(declare-fun e!1477 () Bool)

(assert (=> b!3231 (= e!1477 false)))

(declare-fun lt!441 () Bool)

(declare-datatypes ((array!149 0))(
  ( (array!150 (arr!68 (Array (_ BitVec 32) (_ BitVec 64))) (size!130 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!149)

(declare-datatypes ((List!49 0))(
  ( (Nil!46) (Cons!45 (h!611 (_ BitVec 64)) (t!2176 List!49)) )
))
(declare-fun arrayNoDuplicates!0 (array!149 (_ BitVec 32) List!49) Bool)

(assert (=> b!3231 (= lt!441 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!46))))

(declare-fun mapNonEmpty!113 () Bool)

(declare-fun tp!353 () Bool)

(declare-fun e!1478 () Bool)

(assert (=> mapNonEmpty!113 (= mapRes!113 (and tp!353 e!1478))))

(declare-fun mapKey!113 () (_ BitVec 32))

(declare-datatypes ((V!317 0))(
  ( (V!318 (val!58 Int)) )
))
(declare-datatypes ((ValueCell!36 0))(
  ( (ValueCellFull!36 (v!1145 V!317)) (EmptyCell!36) )
))
(declare-fun mapValue!113 () ValueCell!36)

(declare-datatypes ((array!151 0))(
  ( (array!152 (arr!69 (Array (_ BitVec 32) ValueCell!36)) (size!131 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!151)

(declare-fun mapRest!113 () (Array (_ BitVec 32) ValueCell!36))

(assert (=> mapNonEmpty!113 (= (arr!69 _values!1492) (store mapRest!113 mapKey!113 mapValue!113))))

(declare-fun b!3232 () Bool)

(declare-fun res!5075 () Bool)

(assert (=> b!3232 (=> (not res!5075) (not e!1477))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun mask!2250 () (_ BitVec 32))

(assert (=> b!3232 (= res!5075 (and (= (size!131 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!130 _keys!1806) (size!131 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!5077 () Bool)

(assert (=> start!544 (=> (not res!5077) (not e!1477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!544 (= res!5077 (validMask!0 mask!2250))))

(assert (=> start!544 e!1477))

(assert (=> start!544 true))

(declare-fun e!1474 () Bool)

(declare-fun array_inv!47 (array!151) Bool)

(assert (=> start!544 (and (array_inv!47 _values!1492) e!1474)))

(declare-fun array_inv!48 (array!149) Bool)

(assert (=> start!544 (array_inv!48 _keys!1806)))

(declare-fun b!3233 () Bool)

(declare-fun res!5076 () Bool)

(assert (=> b!3233 (=> (not res!5076) (not e!1477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!149 (_ BitVec 32)) Bool)

(assert (=> b!3233 (= res!5076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3234 () Bool)

(declare-fun tp_is_empty!105 () Bool)

(assert (=> b!3234 (= e!1478 tp_is_empty!105)))

(declare-fun b!3235 () Bool)

(declare-fun e!1476 () Bool)

(assert (=> b!3235 (= e!1476 tp_is_empty!105)))

(declare-fun b!3236 () Bool)

(assert (=> b!3236 (= e!1474 (and e!1476 mapRes!113))))

(declare-fun condMapEmpty!113 () Bool)

(declare-fun mapDefault!113 () ValueCell!36)

(assert (=> b!3236 (= condMapEmpty!113 (= (arr!69 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!36)) mapDefault!113)))))

(assert (= (and start!544 res!5077) b!3232))

(assert (= (and b!3232 res!5075) b!3233))

(assert (= (and b!3233 res!5076) b!3231))

(assert (= (and b!3236 condMapEmpty!113) mapIsEmpty!113))

(assert (= (and b!3236 (not condMapEmpty!113)) mapNonEmpty!113))

(get-info :version)

(assert (= (and mapNonEmpty!113 ((_ is ValueCellFull!36) mapValue!113)) b!3234))

(assert (= (and b!3236 ((_ is ValueCellFull!36) mapDefault!113)) b!3235))

(assert (= start!544 b!3236))

(declare-fun m!1517 () Bool)

(assert (=> b!3231 m!1517))

(declare-fun m!1519 () Bool)

(assert (=> mapNonEmpty!113 m!1519))

(declare-fun m!1521 () Bool)

(assert (=> start!544 m!1521))

(declare-fun m!1523 () Bool)

(assert (=> start!544 m!1523))

(declare-fun m!1525 () Bool)

(assert (=> start!544 m!1525))

(declare-fun m!1527 () Bool)

(assert (=> b!3233 m!1527))

(check-sat (not start!544) tp_is_empty!105 (not b!3231) (not mapNonEmpty!113) (not b!3233))
(check-sat)
