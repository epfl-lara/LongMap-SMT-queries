; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!568 () Bool)

(assert start!568)

(declare-fun b!3447 () Bool)

(declare-fun e!1655 () Bool)

(assert (=> b!3447 (= e!1655 false)))

(declare-fun lt!477 () Bool)

(declare-datatypes ((array!197 0))(
  ( (array!198 (arr!92 (Array (_ BitVec 32) (_ BitVec 64))) (size!154 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!197)

(declare-datatypes ((List!58 0))(
  ( (Nil!55) (Cons!54 (h!620 (_ BitVec 64)) (t!2185 List!58)) )
))
(declare-fun arrayNoDuplicates!0 (array!197 (_ BitVec 32) List!58) Bool)

(assert (=> b!3447 (= lt!477 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!55))))

(declare-fun b!3448 () Bool)

(declare-fun e!1658 () Bool)

(declare-fun tp_is_empty!129 () Bool)

(assert (=> b!3448 (= e!1658 tp_is_empty!129)))

(declare-fun b!3449 () Bool)

(declare-fun res!5183 () Bool)

(assert (=> b!3449 (=> (not res!5183) (not e!1655))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!349 0))(
  ( (V!350 (val!70 Int)) )
))
(declare-datatypes ((ValueCell!48 0))(
  ( (ValueCellFull!48 (v!1157 V!349)) (EmptyCell!48) )
))
(declare-datatypes ((array!199 0))(
  ( (array!200 (arr!93 (Array (_ BitVec 32) ValueCell!48)) (size!155 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!199)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3449 (= res!5183 (and (= (size!155 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!154 _keys!1806) (size!155 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3450 () Bool)

(declare-fun res!5184 () Bool)

(assert (=> b!3450 (=> (not res!5184) (not e!1655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!197 (_ BitVec 32)) Bool)

(assert (=> b!3450 (= res!5184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3451 () Bool)

(declare-fun e!1654 () Bool)

(assert (=> b!3451 (= e!1654 tp_is_empty!129)))

(declare-fun b!3452 () Bool)

(declare-fun e!1656 () Bool)

(declare-fun mapRes!149 () Bool)

(assert (=> b!3452 (= e!1656 (and e!1658 mapRes!149))))

(declare-fun condMapEmpty!149 () Bool)

(declare-fun mapDefault!149 () ValueCell!48)

(assert (=> b!3452 (= condMapEmpty!149 (= (arr!93 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!48)) mapDefault!149)))))

(declare-fun mapIsEmpty!149 () Bool)

(assert (=> mapIsEmpty!149 mapRes!149))

(declare-fun res!5185 () Bool)

(assert (=> start!568 (=> (not res!5185) (not e!1655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!568 (= res!5185 (validMask!0 mask!2250))))

(assert (=> start!568 e!1655))

(assert (=> start!568 true))

(declare-fun array_inv!67 (array!199) Bool)

(assert (=> start!568 (and (array_inv!67 _values!1492) e!1656)))

(declare-fun array_inv!68 (array!197) Bool)

(assert (=> start!568 (array_inv!68 _keys!1806)))

(declare-fun mapNonEmpty!149 () Bool)

(declare-fun tp!389 () Bool)

(assert (=> mapNonEmpty!149 (= mapRes!149 (and tp!389 e!1654))))

(declare-fun mapRest!149 () (Array (_ BitVec 32) ValueCell!48))

(declare-fun mapValue!149 () ValueCell!48)

(declare-fun mapKey!149 () (_ BitVec 32))

(assert (=> mapNonEmpty!149 (= (arr!93 _values!1492) (store mapRest!149 mapKey!149 mapValue!149))))

(assert (= (and start!568 res!5185) b!3449))

(assert (= (and b!3449 res!5183) b!3450))

(assert (= (and b!3450 res!5184) b!3447))

(assert (= (and b!3452 condMapEmpty!149) mapIsEmpty!149))

(assert (= (and b!3452 (not condMapEmpty!149)) mapNonEmpty!149))

(get-info :version)

(assert (= (and mapNonEmpty!149 ((_ is ValueCellFull!48) mapValue!149)) b!3451))

(assert (= (and b!3452 ((_ is ValueCellFull!48) mapDefault!149)) b!3448))

(assert (= start!568 b!3452))

(declare-fun m!1661 () Bool)

(assert (=> b!3447 m!1661))

(declare-fun m!1663 () Bool)

(assert (=> b!3450 m!1663))

(declare-fun m!1665 () Bool)

(assert (=> start!568 m!1665))

(declare-fun m!1667 () Bool)

(assert (=> start!568 m!1667))

(declare-fun m!1669 () Bool)

(assert (=> start!568 m!1669))

(declare-fun m!1671 () Bool)

(assert (=> mapNonEmpty!149 m!1671))

(check-sat tp_is_empty!129 (not b!3447) (not start!568) (not b!3450) (not mapNonEmpty!149))
(check-sat)
