; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!566 () Bool)

(assert start!566)

(declare-fun res!5176 () Bool)

(declare-fun e!1641 () Bool)

(assert (=> start!566 (=> (not res!5176) (not e!1641))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!566 (= res!5176 (validMask!0 mask!2250))))

(assert (=> start!566 e!1641))

(assert (=> start!566 true))

(declare-datatypes ((V!347 0))(
  ( (V!348 (val!69 Int)) )
))
(declare-datatypes ((ValueCell!47 0))(
  ( (ValueCellFull!47 (v!1156 V!347)) (EmptyCell!47) )
))
(declare-datatypes ((array!185 0))(
  ( (array!186 (arr!86 (Array (_ BitVec 32) ValueCell!47)) (size!148 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!185)

(declare-fun e!1642 () Bool)

(declare-fun array_inv!53 (array!185) Bool)

(assert (=> start!566 (and (array_inv!53 _values!1492) e!1642)))

(declare-datatypes ((array!187 0))(
  ( (array!188 (arr!87 (Array (_ BitVec 32) (_ BitVec 64))) (size!149 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!187)

(declare-fun array_inv!54 (array!187) Bool)

(assert (=> start!566 (array_inv!54 _keys!1806)))

(declare-fun b!3429 () Bool)

(declare-fun res!5175 () Bool)

(assert (=> b!3429 (=> (not res!5175) (not e!1641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!187 (_ BitVec 32)) Bool)

(assert (=> b!3429 (= res!5175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!146 () Bool)

(declare-fun mapRes!146 () Bool)

(declare-fun tp!386 () Bool)

(declare-fun e!1639 () Bool)

(assert (=> mapNonEmpty!146 (= mapRes!146 (and tp!386 e!1639))))

(declare-fun mapRest!146 () (Array (_ BitVec 32) ValueCell!47))

(declare-fun mapKey!146 () (_ BitVec 32))

(declare-fun mapValue!146 () ValueCell!47)

(assert (=> mapNonEmpty!146 (= (arr!86 _values!1492) (store mapRest!146 mapKey!146 mapValue!146))))

(declare-fun b!3430 () Bool)

(declare-fun res!5174 () Bool)

(assert (=> b!3430 (=> (not res!5174) (not e!1641))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3430 (= res!5174 (and (= (size!148 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!149 _keys!1806) (size!148 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3431 () Bool)

(declare-fun tp_is_empty!127 () Bool)

(assert (=> b!3431 (= e!1639 tp_is_empty!127)))

(declare-fun b!3432 () Bool)

(assert (=> b!3432 (= e!1641 false)))

(declare-fun lt!474 () Bool)

(declare-datatypes ((List!55 0))(
  ( (Nil!52) (Cons!51 (h!617 (_ BitVec 64)) (t!2182 List!55)) )
))
(declare-fun arrayNoDuplicates!0 (array!187 (_ BitVec 32) List!55) Bool)

(assert (=> b!3432 (= lt!474 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!52))))

(declare-fun mapIsEmpty!146 () Bool)

(assert (=> mapIsEmpty!146 mapRes!146))

(declare-fun b!3433 () Bool)

(declare-fun e!1640 () Bool)

(assert (=> b!3433 (= e!1640 tp_is_empty!127)))

(declare-fun b!3434 () Bool)

(assert (=> b!3434 (= e!1642 (and e!1640 mapRes!146))))

(declare-fun condMapEmpty!146 () Bool)

(declare-fun mapDefault!146 () ValueCell!47)

(assert (=> b!3434 (= condMapEmpty!146 (= (arr!86 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!47)) mapDefault!146)))))

(assert (= (and start!566 res!5176) b!3430))

(assert (= (and b!3430 res!5174) b!3429))

(assert (= (and b!3429 res!5175) b!3432))

(assert (= (and b!3434 condMapEmpty!146) mapIsEmpty!146))

(assert (= (and b!3434 (not condMapEmpty!146)) mapNonEmpty!146))

(get-info :version)

(assert (= (and mapNonEmpty!146 ((_ is ValueCellFull!47) mapValue!146)) b!3431))

(assert (= (and b!3434 ((_ is ValueCellFull!47) mapDefault!146)) b!3433))

(assert (= start!566 b!3434))

(declare-fun m!1649 () Bool)

(assert (=> start!566 m!1649))

(declare-fun m!1651 () Bool)

(assert (=> start!566 m!1651))

(declare-fun m!1653 () Bool)

(assert (=> start!566 m!1653))

(declare-fun m!1655 () Bool)

(assert (=> b!3429 m!1655))

(declare-fun m!1657 () Bool)

(assert (=> mapNonEmpty!146 m!1657))

(declare-fun m!1659 () Bool)

(assert (=> b!3432 m!1659))

(check-sat tp_is_empty!127 (not b!3432) (not b!3429) (not mapNonEmpty!146) (not start!566))
(check-sat)
