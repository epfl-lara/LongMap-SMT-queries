; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82506 () Bool)

(assert start!82506)

(declare-fun b!961532 () Bool)

(declare-fun e!542177 () Bool)

(declare-fun tp_is_empty!21441 () Bool)

(assert (=> b!961532 (= e!542177 tp_is_empty!21441)))

(declare-fun mapIsEmpty!34156 () Bool)

(declare-fun mapRes!34156 () Bool)

(assert (=> mapIsEmpty!34156 mapRes!34156))

(declare-fun res!643520 () Bool)

(declare-fun e!542178 () Bool)

(assert (=> start!82506 (=> (not res!643520) (not e!542178))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82506 (= res!643520 (validMask!0 mask!2110))))

(assert (=> start!82506 e!542178))

(assert (=> start!82506 true))

(declare-datatypes ((V!33571 0))(
  ( (V!33572 (val!10771 Int)) )
))
(declare-datatypes ((ValueCell!10239 0))(
  ( (ValueCellFull!10239 (v!13329 V!33571)) (EmptyCell!10239) )
))
(declare-datatypes ((array!58979 0))(
  ( (array!58980 (arr!28358 (Array (_ BitVec 32) ValueCell!10239)) (size!28837 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58979)

(declare-fun e!542180 () Bool)

(declare-fun array_inv!21975 (array!58979) Bool)

(assert (=> start!82506 (and (array_inv!21975 _values!1400) e!542180)))

(declare-datatypes ((array!58981 0))(
  ( (array!58982 (arr!28359 (Array (_ BitVec 32) (_ BitVec 64))) (size!28838 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58981)

(declare-fun array_inv!21976 (array!58981) Bool)

(assert (=> start!82506 (array_inv!21976 _keys!1686)))

(declare-fun b!961533 () Bool)

(assert (=> b!961533 (= e!542180 (and e!542177 mapRes!34156))))

(declare-fun condMapEmpty!34156 () Bool)

(declare-fun mapDefault!34156 () ValueCell!10239)

(assert (=> b!961533 (= condMapEmpty!34156 (= (arr!28358 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10239)) mapDefault!34156)))))

(declare-fun b!961534 () Bool)

(assert (=> b!961534 (= e!542178 false)))

(declare-fun lt!430771 () Bool)

(declare-datatypes ((List!19693 0))(
  ( (Nil!19690) (Cons!19689 (h!20851 (_ BitVec 64)) (t!28056 List!19693)) )
))
(declare-fun arrayNoDuplicates!0 (array!58981 (_ BitVec 32) List!19693) Bool)

(assert (=> b!961534 (= lt!430771 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19690))))

(declare-fun mapNonEmpty!34156 () Bool)

(declare-fun tp!65085 () Bool)

(declare-fun e!542179 () Bool)

(assert (=> mapNonEmpty!34156 (= mapRes!34156 (and tp!65085 e!542179))))

(declare-fun mapRest!34156 () (Array (_ BitVec 32) ValueCell!10239))

(declare-fun mapValue!34156 () ValueCell!10239)

(declare-fun mapKey!34156 () (_ BitVec 32))

(assert (=> mapNonEmpty!34156 (= (arr!28358 _values!1400) (store mapRest!34156 mapKey!34156 mapValue!34156))))

(declare-fun b!961535 () Bool)

(assert (=> b!961535 (= e!542179 tp_is_empty!21441)))

(declare-fun b!961536 () Bool)

(declare-fun res!643522 () Bool)

(assert (=> b!961536 (=> (not res!643522) (not e!542178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58981 (_ BitVec 32)) Bool)

(assert (=> b!961536 (= res!643522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961537 () Bool)

(declare-fun res!643521 () Bool)

(assert (=> b!961537 (=> (not res!643521) (not e!542178))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961537 (= res!643521 (and (= (size!28837 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28838 _keys!1686) (size!28837 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82506 res!643520) b!961537))

(assert (= (and b!961537 res!643521) b!961536))

(assert (= (and b!961536 res!643522) b!961534))

(assert (= (and b!961533 condMapEmpty!34156) mapIsEmpty!34156))

(assert (= (and b!961533 (not condMapEmpty!34156)) mapNonEmpty!34156))

(get-info :version)

(assert (= (and mapNonEmpty!34156 ((_ is ValueCellFull!10239) mapValue!34156)) b!961535))

(assert (= (and b!961533 ((_ is ValueCellFull!10239) mapDefault!34156)) b!961532))

(assert (= start!82506 b!961533))

(declare-fun m!891453 () Bool)

(assert (=> start!82506 m!891453))

(declare-fun m!891455 () Bool)

(assert (=> start!82506 m!891455))

(declare-fun m!891457 () Bool)

(assert (=> start!82506 m!891457))

(declare-fun m!891459 () Bool)

(assert (=> b!961534 m!891459))

(declare-fun m!891461 () Bool)

(assert (=> mapNonEmpty!34156 m!891461))

(declare-fun m!891463 () Bool)

(assert (=> b!961536 m!891463))

(check-sat tp_is_empty!21441 (not b!961534) (not start!82506) (not b!961536) (not mapNonEmpty!34156))
(check-sat)
