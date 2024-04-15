; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!572 () Bool)

(assert start!572)

(declare-fun b!3483 () Bool)

(declare-fun res!5203 () Bool)

(declare-fun e!1687 () Bool)

(assert (=> b!3483 (=> (not res!5203) (not e!1687))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!355 0))(
  ( (V!356 (val!72 Int)) )
))
(declare-datatypes ((ValueCell!50 0))(
  ( (ValueCellFull!50 (v!1159 V!355)) (EmptyCell!50) )
))
(declare-datatypes ((array!197 0))(
  ( (array!198 (arr!92 (Array (_ BitVec 32) ValueCell!50)) (size!154 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!197)

(declare-datatypes ((array!199 0))(
  ( (array!200 (arr!93 (Array (_ BitVec 32) (_ BitVec 64))) (size!155 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!199)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3483 (= res!5203 (and (= (size!154 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!155 _keys!1806) (size!154 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!155 () Bool)

(declare-fun mapRes!155 () Bool)

(assert (=> mapIsEmpty!155 mapRes!155))

(declare-fun res!5201 () Bool)

(assert (=> start!572 (=> (not res!5201) (not e!1687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!572 (= res!5201 (validMask!0 mask!2250))))

(assert (=> start!572 e!1687))

(assert (=> start!572 true))

(declare-fun e!1686 () Bool)

(declare-fun array_inv!59 (array!197) Bool)

(assert (=> start!572 (and (array_inv!59 _values!1492) e!1686)))

(declare-fun array_inv!60 (array!199) Bool)

(assert (=> start!572 (array_inv!60 _keys!1806)))

(declare-fun b!3484 () Bool)

(declare-fun e!1684 () Bool)

(declare-fun tp_is_empty!133 () Bool)

(assert (=> b!3484 (= e!1684 tp_is_empty!133)))

(declare-fun mapNonEmpty!155 () Bool)

(declare-fun tp!395 () Bool)

(declare-fun e!1688 () Bool)

(assert (=> mapNonEmpty!155 (= mapRes!155 (and tp!395 e!1688))))

(declare-fun mapKey!155 () (_ BitVec 32))

(declare-fun mapRest!155 () (Array (_ BitVec 32) ValueCell!50))

(declare-fun mapValue!155 () ValueCell!50)

(assert (=> mapNonEmpty!155 (= (arr!92 _values!1492) (store mapRest!155 mapKey!155 mapValue!155))))

(declare-fun b!3485 () Bool)

(assert (=> b!3485 (= e!1687 false)))

(declare-fun lt!483 () Bool)

(declare-datatypes ((List!58 0))(
  ( (Nil!55) (Cons!54 (h!620 (_ BitVec 64)) (t!2185 List!58)) )
))
(declare-fun arrayNoDuplicates!0 (array!199 (_ BitVec 32) List!58) Bool)

(assert (=> b!3485 (= lt!483 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!55))))

(declare-fun b!3486 () Bool)

(assert (=> b!3486 (= e!1688 tp_is_empty!133)))

(declare-fun b!3487 () Bool)

(declare-fun res!5202 () Bool)

(assert (=> b!3487 (=> (not res!5202) (not e!1687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!199 (_ BitVec 32)) Bool)

(assert (=> b!3487 (= res!5202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3488 () Bool)

(assert (=> b!3488 (= e!1686 (and e!1684 mapRes!155))))

(declare-fun condMapEmpty!155 () Bool)

(declare-fun mapDefault!155 () ValueCell!50)

(assert (=> b!3488 (= condMapEmpty!155 (= (arr!92 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!50)) mapDefault!155)))))

(assert (= (and start!572 res!5201) b!3483))

(assert (= (and b!3483 res!5203) b!3487))

(assert (= (and b!3487 res!5202) b!3485))

(assert (= (and b!3488 condMapEmpty!155) mapIsEmpty!155))

(assert (= (and b!3488 (not condMapEmpty!155)) mapNonEmpty!155))

(get-info :version)

(assert (= (and mapNonEmpty!155 ((_ is ValueCellFull!50) mapValue!155)) b!3486))

(assert (= (and b!3488 ((_ is ValueCellFull!50) mapDefault!155)) b!3484))

(assert (= start!572 b!3488))

(declare-fun m!1685 () Bool)

(assert (=> start!572 m!1685))

(declare-fun m!1687 () Bool)

(assert (=> start!572 m!1687))

(declare-fun m!1689 () Bool)

(assert (=> start!572 m!1689))

(declare-fun m!1691 () Bool)

(assert (=> mapNonEmpty!155 m!1691))

(declare-fun m!1693 () Bool)

(assert (=> b!3485 m!1693))

(declare-fun m!1695 () Bool)

(assert (=> b!3487 m!1695))

(check-sat tp_is_empty!133 (not start!572) (not mapNonEmpty!155) (not b!3487) (not b!3485))
(check-sat)
