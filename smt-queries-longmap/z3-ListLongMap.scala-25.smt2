; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!574 () Bool)

(assert start!574)

(declare-fun b!3501 () Bool)

(declare-fun res!5212 () Bool)

(declare-fun e!1702 () Bool)

(assert (=> b!3501 (=> (not res!5212) (not e!1702))))

(declare-datatypes ((array!209 0))(
  ( (array!210 (arr!98 (Array (_ BitVec 32) (_ BitVec 64))) (size!160 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!209)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!209 (_ BitVec 32)) Bool)

(assert (=> b!3501 (= res!5212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!158 () Bool)

(declare-fun mapRes!158 () Bool)

(declare-fun tp!398 () Bool)

(declare-fun e!1703 () Bool)

(assert (=> mapNonEmpty!158 (= mapRes!158 (and tp!398 e!1703))))

(declare-datatypes ((V!357 0))(
  ( (V!358 (val!73 Int)) )
))
(declare-datatypes ((ValueCell!51 0))(
  ( (ValueCellFull!51 (v!1160 V!357)) (EmptyCell!51) )
))
(declare-fun mapRest!158 () (Array (_ BitVec 32) ValueCell!51))

(declare-fun mapKey!158 () (_ BitVec 32))

(declare-datatypes ((array!211 0))(
  ( (array!212 (arr!99 (Array (_ BitVec 32) ValueCell!51)) (size!161 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!211)

(declare-fun mapValue!158 () ValueCell!51)

(assert (=> mapNonEmpty!158 (= (arr!99 _values!1492) (store mapRest!158 mapKey!158 mapValue!158))))

(declare-fun mapIsEmpty!158 () Bool)

(assert (=> mapIsEmpty!158 mapRes!158))

(declare-fun b!3502 () Bool)

(declare-fun tp_is_empty!135 () Bool)

(assert (=> b!3502 (= e!1703 tp_is_empty!135)))

(declare-fun b!3503 () Bool)

(declare-fun e!1701 () Bool)

(assert (=> b!3503 (= e!1701 tp_is_empty!135)))

(declare-fun b!3504 () Bool)

(declare-fun res!5211 () Bool)

(assert (=> b!3504 (=> (not res!5211) (not e!1702))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3504 (= res!5211 (and (= (size!161 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!160 _keys!1806) (size!161 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3506 () Bool)

(declare-fun e!1699 () Bool)

(assert (=> b!3506 (= e!1699 (and e!1701 mapRes!158))))

(declare-fun condMapEmpty!158 () Bool)

(declare-fun mapDefault!158 () ValueCell!51)

(assert (=> b!3506 (= condMapEmpty!158 (= (arr!99 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!51)) mapDefault!158)))))

(declare-fun res!5210 () Bool)

(assert (=> start!574 (=> (not res!5210) (not e!1702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!574 (= res!5210 (validMask!0 mask!2250))))

(assert (=> start!574 e!1702))

(assert (=> start!574 true))

(declare-fun array_inv!73 (array!211) Bool)

(assert (=> start!574 (and (array_inv!73 _values!1492) e!1699)))

(declare-fun array_inv!74 (array!209) Bool)

(assert (=> start!574 (array_inv!74 _keys!1806)))

(declare-fun b!3505 () Bool)

(assert (=> b!3505 (= e!1702 false)))

(declare-fun lt!486 () Bool)

(declare-datatypes ((List!61 0))(
  ( (Nil!58) (Cons!57 (h!623 (_ BitVec 64)) (t!2188 List!61)) )
))
(declare-fun arrayNoDuplicates!0 (array!209 (_ BitVec 32) List!61) Bool)

(assert (=> b!3505 (= lt!486 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!58))))

(assert (= (and start!574 res!5210) b!3504))

(assert (= (and b!3504 res!5211) b!3501))

(assert (= (and b!3501 res!5212) b!3505))

(assert (= (and b!3506 condMapEmpty!158) mapIsEmpty!158))

(assert (= (and b!3506 (not condMapEmpty!158)) mapNonEmpty!158))

(get-info :version)

(assert (= (and mapNonEmpty!158 ((_ is ValueCellFull!51) mapValue!158)) b!3502))

(assert (= (and b!3506 ((_ is ValueCellFull!51) mapDefault!158)) b!3503))

(assert (= start!574 b!3506))

(declare-fun m!1697 () Bool)

(assert (=> b!3501 m!1697))

(declare-fun m!1699 () Bool)

(assert (=> mapNonEmpty!158 m!1699))

(declare-fun m!1701 () Bool)

(assert (=> start!574 m!1701))

(declare-fun m!1703 () Bool)

(assert (=> start!574 m!1703))

(declare-fun m!1705 () Bool)

(assert (=> start!574 m!1705))

(declare-fun m!1707 () Bool)

(assert (=> b!3505 m!1707))

(check-sat (not b!3505) (not start!574) tp_is_empty!135 (not mapNonEmpty!158) (not b!3501))
(check-sat)