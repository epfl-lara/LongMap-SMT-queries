; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82512 () Bool)

(assert start!82512)

(declare-fun b!961586 () Bool)

(declare-fun res!643549 () Bool)

(declare-fun e!542224 () Bool)

(assert (=> b!961586 (=> (not res!643549) (not e!542224))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!58991 0))(
  ( (array!58992 (arr!28364 (Array (_ BitVec 32) (_ BitVec 64))) (size!28843 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58991)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-datatypes ((V!33579 0))(
  ( (V!33580 (val!10774 Int)) )
))
(declare-datatypes ((ValueCell!10242 0))(
  ( (ValueCellFull!10242 (v!13332 V!33579)) (EmptyCell!10242) )
))
(declare-datatypes ((array!58993 0))(
  ( (array!58994 (arr!28365 (Array (_ BitVec 32) ValueCell!10242)) (size!28844 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58993)

(assert (=> b!961586 (= res!643549 (and (= (size!28844 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28843 _keys!1686) (size!28844 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961587 () Bool)

(declare-fun e!542223 () Bool)

(declare-fun tp_is_empty!21447 () Bool)

(assert (=> b!961587 (= e!542223 tp_is_empty!21447)))

(declare-fun b!961588 () Bool)

(assert (=> b!961588 (= e!542224 false)))

(declare-fun lt!430780 () Bool)

(declare-datatypes ((List!19695 0))(
  ( (Nil!19692) (Cons!19691 (h!20853 (_ BitVec 64)) (t!28058 List!19695)) )
))
(declare-fun arrayNoDuplicates!0 (array!58991 (_ BitVec 32) List!19695) Bool)

(assert (=> b!961588 (= lt!430780 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19692))))

(declare-fun mapIsEmpty!34165 () Bool)

(declare-fun mapRes!34165 () Bool)

(assert (=> mapIsEmpty!34165 mapRes!34165))

(declare-fun b!961590 () Bool)

(declare-fun e!542221 () Bool)

(assert (=> b!961590 (= e!542221 (and e!542223 mapRes!34165))))

(declare-fun condMapEmpty!34165 () Bool)

(declare-fun mapDefault!34165 () ValueCell!10242)

(assert (=> b!961590 (= condMapEmpty!34165 (= (arr!28365 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10242)) mapDefault!34165)))))

(declare-fun res!643548 () Bool)

(assert (=> start!82512 (=> (not res!643548) (not e!542224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82512 (= res!643548 (validMask!0 mask!2110))))

(assert (=> start!82512 e!542224))

(assert (=> start!82512 true))

(declare-fun array_inv!21981 (array!58993) Bool)

(assert (=> start!82512 (and (array_inv!21981 _values!1400) e!542221)))

(declare-fun array_inv!21982 (array!58991) Bool)

(assert (=> start!82512 (array_inv!21982 _keys!1686)))

(declare-fun b!961589 () Bool)

(declare-fun e!542225 () Bool)

(assert (=> b!961589 (= e!542225 tp_is_empty!21447)))

(declare-fun mapNonEmpty!34165 () Bool)

(declare-fun tp!65094 () Bool)

(assert (=> mapNonEmpty!34165 (= mapRes!34165 (and tp!65094 e!542225))))

(declare-fun mapRest!34165 () (Array (_ BitVec 32) ValueCell!10242))

(declare-fun mapKey!34165 () (_ BitVec 32))

(declare-fun mapValue!34165 () ValueCell!10242)

(assert (=> mapNonEmpty!34165 (= (arr!28365 _values!1400) (store mapRest!34165 mapKey!34165 mapValue!34165))))

(declare-fun b!961591 () Bool)

(declare-fun res!643547 () Bool)

(assert (=> b!961591 (=> (not res!643547) (not e!542224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58991 (_ BitVec 32)) Bool)

(assert (=> b!961591 (= res!643547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!82512 res!643548) b!961586))

(assert (= (and b!961586 res!643549) b!961591))

(assert (= (and b!961591 res!643547) b!961588))

(assert (= (and b!961590 condMapEmpty!34165) mapIsEmpty!34165))

(assert (= (and b!961590 (not condMapEmpty!34165)) mapNonEmpty!34165))

(get-info :version)

(assert (= (and mapNonEmpty!34165 ((_ is ValueCellFull!10242) mapValue!34165)) b!961589))

(assert (= (and b!961590 ((_ is ValueCellFull!10242) mapDefault!34165)) b!961587))

(assert (= start!82512 b!961590))

(declare-fun m!891489 () Bool)

(assert (=> b!961588 m!891489))

(declare-fun m!891491 () Bool)

(assert (=> start!82512 m!891491))

(declare-fun m!891493 () Bool)

(assert (=> start!82512 m!891493))

(declare-fun m!891495 () Bool)

(assert (=> start!82512 m!891495))

(declare-fun m!891497 () Bool)

(assert (=> mapNonEmpty!34165 m!891497))

(declare-fun m!891499 () Bool)

(assert (=> b!961591 m!891499))

(check-sat (not b!961588) tp_is_empty!21447 (not mapNonEmpty!34165) (not b!961591) (not start!82512))
(check-sat)
