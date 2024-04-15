; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!560 () Bool)

(assert start!560)

(declare-fun mapNonEmpty!137 () Bool)

(declare-fun mapRes!137 () Bool)

(declare-fun tp!377 () Bool)

(declare-fun e!1595 () Bool)

(assert (=> mapNonEmpty!137 (= mapRes!137 (and tp!377 e!1595))))

(declare-datatypes ((V!339 0))(
  ( (V!340 (val!66 Int)) )
))
(declare-datatypes ((ValueCell!44 0))(
  ( (ValueCellFull!44 (v!1153 V!339)) (EmptyCell!44) )
))
(declare-fun mapValue!137 () ValueCell!44)

(declare-datatypes ((array!173 0))(
  ( (array!174 (arr!80 (Array (_ BitVec 32) ValueCell!44)) (size!142 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!173)

(declare-fun mapRest!137 () (Array (_ BitVec 32) ValueCell!44))

(declare-fun mapKey!137 () (_ BitVec 32))

(assert (=> mapNonEmpty!137 (= (arr!80 _values!1492) (store mapRest!137 mapKey!137 mapValue!137))))

(declare-fun b!3375 () Bool)

(declare-fun tp_is_empty!121 () Bool)

(assert (=> b!3375 (= e!1595 tp_is_empty!121)))

(declare-fun b!3376 () Bool)

(declare-fun e!1594 () Bool)

(assert (=> b!3376 (= e!1594 false)))

(declare-fun lt!465 () Bool)

(declare-datatypes ((array!175 0))(
  ( (array!176 (arr!81 (Array (_ BitVec 32) (_ BitVec 64))) (size!143 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!175)

(declare-datatypes ((List!52 0))(
  ( (Nil!49) (Cons!48 (h!614 (_ BitVec 64)) (t!2179 List!52)) )
))
(declare-fun arrayNoDuplicates!0 (array!175 (_ BitVec 32) List!52) Bool)

(assert (=> b!3376 (= lt!465 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!49))))

(declare-fun b!3377 () Bool)

(declare-fun res!5149 () Bool)

(assert (=> b!3377 (=> (not res!5149) (not e!1594))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3377 (= res!5149 (and (= (size!142 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!143 _keys!1806) (size!142 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3378 () Bool)

(declare-fun res!5148 () Bool)

(assert (=> b!3378 (=> (not res!5148) (not e!1594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!175 (_ BitVec 32)) Bool)

(assert (=> b!3378 (= res!5148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3379 () Bool)

(declare-fun e!1596 () Bool)

(declare-fun e!1598 () Bool)

(assert (=> b!3379 (= e!1596 (and e!1598 mapRes!137))))

(declare-fun condMapEmpty!137 () Bool)

(declare-fun mapDefault!137 () ValueCell!44)

(assert (=> b!3379 (= condMapEmpty!137 (= (arr!80 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!44)) mapDefault!137)))))

(declare-fun b!3380 () Bool)

(assert (=> b!3380 (= e!1598 tp_is_empty!121)))

(declare-fun res!5147 () Bool)

(assert (=> start!560 (=> (not res!5147) (not e!1594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!560 (= res!5147 (validMask!0 mask!2250))))

(assert (=> start!560 e!1594))

(assert (=> start!560 true))

(declare-fun array_inv!51 (array!173) Bool)

(assert (=> start!560 (and (array_inv!51 _values!1492) e!1596)))

(declare-fun array_inv!52 (array!175) Bool)

(assert (=> start!560 (array_inv!52 _keys!1806)))

(declare-fun mapIsEmpty!137 () Bool)

(assert (=> mapIsEmpty!137 mapRes!137))

(assert (= (and start!560 res!5147) b!3377))

(assert (= (and b!3377 res!5149) b!3378))

(assert (= (and b!3378 res!5148) b!3376))

(assert (= (and b!3379 condMapEmpty!137) mapIsEmpty!137))

(assert (= (and b!3379 (not condMapEmpty!137)) mapNonEmpty!137))

(get-info :version)

(assert (= (and mapNonEmpty!137 ((_ is ValueCellFull!44) mapValue!137)) b!3375))

(assert (= (and b!3379 ((_ is ValueCellFull!44) mapDefault!137)) b!3380))

(assert (= start!560 b!3379))

(declare-fun m!1613 () Bool)

(assert (=> mapNonEmpty!137 m!1613))

(declare-fun m!1615 () Bool)

(assert (=> b!3376 m!1615))

(declare-fun m!1617 () Bool)

(assert (=> b!3378 m!1617))

(declare-fun m!1619 () Bool)

(assert (=> start!560 m!1619))

(declare-fun m!1621 () Bool)

(assert (=> start!560 m!1621))

(declare-fun m!1623 () Bool)

(assert (=> start!560 m!1623))

(check-sat (not mapNonEmpty!137) (not b!3376) tp_is_empty!121 (not start!560) (not b!3378))
(check-sat)
