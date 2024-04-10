; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!556 () Bool)

(assert start!556)

(declare-fun mapIsEmpty!131 () Bool)

(declare-fun mapRes!131 () Bool)

(assert (=> mapIsEmpty!131 mapRes!131))

(declare-fun b!3339 () Bool)

(declare-fun e!1566 () Bool)

(assert (=> b!3339 (= e!1566 false)))

(declare-fun lt!459 () Bool)

(declare-datatypes ((array!173 0))(
  ( (array!174 (arr!80 (Array (_ BitVec 32) (_ BitVec 64))) (size!142 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!173)

(declare-datatypes ((List!53 0))(
  ( (Nil!50) (Cons!49 (h!615 (_ BitVec 64)) (t!2180 List!53)) )
))
(declare-fun arrayNoDuplicates!0 (array!173 (_ BitVec 32) List!53) Bool)

(assert (=> b!3339 (= lt!459 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!50))))

(declare-fun b!3340 () Bool)

(declare-fun res!5131 () Bool)

(assert (=> b!3340 (=> (not res!5131) (not e!1566))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!173 (_ BitVec 32)) Bool)

(assert (=> b!3340 (= res!5131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!131 () Bool)

(declare-fun tp!371 () Bool)

(declare-fun e!1565 () Bool)

(assert (=> mapNonEmpty!131 (= mapRes!131 (and tp!371 e!1565))))

(declare-fun mapKey!131 () (_ BitVec 32))

(declare-datatypes ((V!333 0))(
  ( (V!334 (val!64 Int)) )
))
(declare-datatypes ((ValueCell!42 0))(
  ( (ValueCellFull!42 (v!1151 V!333)) (EmptyCell!42) )
))
(declare-datatypes ((array!175 0))(
  ( (array!176 (arr!81 (Array (_ BitVec 32) ValueCell!42)) (size!143 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!175)

(declare-fun mapRest!131 () (Array (_ BitVec 32) ValueCell!42))

(declare-fun mapValue!131 () ValueCell!42)

(assert (=> mapNonEmpty!131 (= (arr!81 _values!1492) (store mapRest!131 mapKey!131 mapValue!131))))

(declare-fun b!3341 () Bool)

(declare-fun e!1568 () Bool)

(declare-fun e!1564 () Bool)

(assert (=> b!3341 (= e!1568 (and e!1564 mapRes!131))))

(declare-fun condMapEmpty!131 () Bool)

(declare-fun mapDefault!131 () ValueCell!42)

(assert (=> b!3341 (= condMapEmpty!131 (= (arr!81 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!42)) mapDefault!131)))))

(declare-fun res!5130 () Bool)

(assert (=> start!556 (=> (not res!5130) (not e!1566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!556 (= res!5130 (validMask!0 mask!2250))))

(assert (=> start!556 e!1566))

(assert (=> start!556 true))

(declare-fun array_inv!55 (array!175) Bool)

(assert (=> start!556 (and (array_inv!55 _values!1492) e!1568)))

(declare-fun array_inv!56 (array!173) Bool)

(assert (=> start!556 (array_inv!56 _keys!1806)))

(declare-fun b!3342 () Bool)

(declare-fun tp_is_empty!117 () Bool)

(assert (=> b!3342 (= e!1564 tp_is_empty!117)))

(declare-fun b!3343 () Bool)

(assert (=> b!3343 (= e!1565 tp_is_empty!117)))

(declare-fun b!3344 () Bool)

(declare-fun res!5129 () Bool)

(assert (=> b!3344 (=> (not res!5129) (not e!1566))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3344 (= res!5129 (and (= (size!143 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!142 _keys!1806) (size!143 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(assert (= (and start!556 res!5130) b!3344))

(assert (= (and b!3344 res!5129) b!3340))

(assert (= (and b!3340 res!5131) b!3339))

(assert (= (and b!3341 condMapEmpty!131) mapIsEmpty!131))

(assert (= (and b!3341 (not condMapEmpty!131)) mapNonEmpty!131))

(get-info :version)

(assert (= (and mapNonEmpty!131 ((_ is ValueCellFull!42) mapValue!131)) b!3343))

(assert (= (and b!3341 ((_ is ValueCellFull!42) mapDefault!131)) b!3342))

(assert (= start!556 b!3341))

(declare-fun m!1589 () Bool)

(assert (=> b!3339 m!1589))

(declare-fun m!1591 () Bool)

(assert (=> b!3340 m!1591))

(declare-fun m!1593 () Bool)

(assert (=> mapNonEmpty!131 m!1593))

(declare-fun m!1595 () Bool)

(assert (=> start!556 m!1595))

(declare-fun m!1597 () Bool)

(assert (=> start!556 m!1597))

(declare-fun m!1599 () Bool)

(assert (=> start!556 m!1599))

(check-sat (not mapNonEmpty!131) (not start!556) tp_is_empty!117 (not b!3340) (not b!3339))
(check-sat)
