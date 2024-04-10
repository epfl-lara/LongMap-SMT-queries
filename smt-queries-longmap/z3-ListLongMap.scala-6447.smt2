; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82524 () Bool)

(assert start!82524)

(declare-fun mapIsEmpty!34183 () Bool)

(declare-fun mapRes!34183 () Bool)

(assert (=> mapIsEmpty!34183 mapRes!34183))

(declare-fun b!961694 () Bool)

(declare-fun e!542313 () Bool)

(declare-fun tp_is_empty!21459 () Bool)

(assert (=> b!961694 (= e!542313 tp_is_empty!21459)))

(declare-fun b!961695 () Bool)

(declare-fun res!643602 () Bool)

(declare-fun e!542312 () Bool)

(assert (=> b!961695 (=> (not res!643602) (not e!542312))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33595 0))(
  ( (V!33596 (val!10780 Int)) )
))
(declare-datatypes ((ValueCell!10248 0))(
  ( (ValueCellFull!10248 (v!13338 V!33595)) (EmptyCell!10248) )
))
(declare-datatypes ((array!59015 0))(
  ( (array!59016 (arr!28376 (Array (_ BitVec 32) ValueCell!10248)) (size!28855 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59015)

(declare-datatypes ((array!59017 0))(
  ( (array!59018 (arr!28377 (Array (_ BitVec 32) (_ BitVec 64))) (size!28856 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59017)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961695 (= res!643602 (and (= (size!28855 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28856 _keys!1686) (size!28855 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961696 () Bool)

(assert (=> b!961696 (= e!542312 false)))

(declare-fun lt!430798 () Bool)

(declare-datatypes ((List!19699 0))(
  ( (Nil!19696) (Cons!19695 (h!20857 (_ BitVec 64)) (t!28062 List!19699)) )
))
(declare-fun arrayNoDuplicates!0 (array!59017 (_ BitVec 32) List!19699) Bool)

(assert (=> b!961696 (= lt!430798 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19696))))

(declare-fun res!643603 () Bool)

(assert (=> start!82524 (=> (not res!643603) (not e!542312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82524 (= res!643603 (validMask!0 mask!2110))))

(assert (=> start!82524 e!542312))

(assert (=> start!82524 true))

(declare-fun e!542315 () Bool)

(declare-fun array_inv!21991 (array!59015) Bool)

(assert (=> start!82524 (and (array_inv!21991 _values!1400) e!542315)))

(declare-fun array_inv!21992 (array!59017) Bool)

(assert (=> start!82524 (array_inv!21992 _keys!1686)))

(declare-fun b!961697 () Bool)

(declare-fun e!542311 () Bool)

(assert (=> b!961697 (= e!542315 (and e!542311 mapRes!34183))))

(declare-fun condMapEmpty!34183 () Bool)

(declare-fun mapDefault!34183 () ValueCell!10248)

(assert (=> b!961697 (= condMapEmpty!34183 (= (arr!28376 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10248)) mapDefault!34183)))))

(declare-fun mapNonEmpty!34183 () Bool)

(declare-fun tp!65112 () Bool)

(assert (=> mapNonEmpty!34183 (= mapRes!34183 (and tp!65112 e!542313))))

(declare-fun mapValue!34183 () ValueCell!10248)

(declare-fun mapKey!34183 () (_ BitVec 32))

(declare-fun mapRest!34183 () (Array (_ BitVec 32) ValueCell!10248))

(assert (=> mapNonEmpty!34183 (= (arr!28376 _values!1400) (store mapRest!34183 mapKey!34183 mapValue!34183))))

(declare-fun b!961698 () Bool)

(assert (=> b!961698 (= e!542311 tp_is_empty!21459)))

(declare-fun b!961699 () Bool)

(declare-fun res!643601 () Bool)

(assert (=> b!961699 (=> (not res!643601) (not e!542312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59017 (_ BitVec 32)) Bool)

(assert (=> b!961699 (= res!643601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!82524 res!643603) b!961695))

(assert (= (and b!961695 res!643602) b!961699))

(assert (= (and b!961699 res!643601) b!961696))

(assert (= (and b!961697 condMapEmpty!34183) mapIsEmpty!34183))

(assert (= (and b!961697 (not condMapEmpty!34183)) mapNonEmpty!34183))

(get-info :version)

(assert (= (and mapNonEmpty!34183 ((_ is ValueCellFull!10248) mapValue!34183)) b!961694))

(assert (= (and b!961697 ((_ is ValueCellFull!10248) mapDefault!34183)) b!961698))

(assert (= start!82524 b!961697))

(declare-fun m!891561 () Bool)

(assert (=> b!961696 m!891561))

(declare-fun m!891563 () Bool)

(assert (=> start!82524 m!891563))

(declare-fun m!891565 () Bool)

(assert (=> start!82524 m!891565))

(declare-fun m!891567 () Bool)

(assert (=> start!82524 m!891567))

(declare-fun m!891569 () Bool)

(assert (=> mapNonEmpty!34183 m!891569))

(declare-fun m!891571 () Bool)

(assert (=> b!961699 m!891571))

(check-sat (not b!961699) tp_is_empty!21459 (not start!82524) (not mapNonEmpty!34183) (not b!961696))
(check-sat)
