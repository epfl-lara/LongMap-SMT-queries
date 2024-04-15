; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82474 () Bool)

(assert start!82474)

(declare-fun b!961167 () Bool)

(declare-fun res!643347 () Bool)

(declare-fun e!541927 () Bool)

(assert (=> b!961167 (=> (not res!643347) (not e!541927))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33553 0))(
  ( (V!33554 (val!10764 Int)) )
))
(declare-datatypes ((ValueCell!10232 0))(
  ( (ValueCellFull!10232 (v!13321 V!33553)) (EmptyCell!10232) )
))
(declare-datatypes ((array!58886 0))(
  ( (array!58887 (arr!28312 (Array (_ BitVec 32) ValueCell!10232)) (size!28793 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58886)

(declare-datatypes ((array!58888 0))(
  ( (array!58889 (arr!28313 (Array (_ BitVec 32) (_ BitVec 64))) (size!28794 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58888)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961167 (= res!643347 (and (= (size!28793 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28794 _keys!1686) (size!28793 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961168 () Bool)

(declare-fun res!643348 () Bool)

(assert (=> b!961168 (=> (not res!643348) (not e!541927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58888 (_ BitVec 32)) Bool)

(assert (=> b!961168 (= res!643348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961170 () Bool)

(declare-fun e!541925 () Bool)

(declare-fun e!541926 () Bool)

(declare-fun mapRes!34135 () Bool)

(assert (=> b!961170 (= e!541925 (and e!541926 mapRes!34135))))

(declare-fun condMapEmpty!34135 () Bool)

(declare-fun mapDefault!34135 () ValueCell!10232)

(assert (=> b!961170 (= condMapEmpty!34135 (= (arr!28312 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10232)) mapDefault!34135)))))

(declare-fun mapNonEmpty!34135 () Bool)

(declare-fun tp!65065 () Bool)

(declare-fun e!541923 () Bool)

(assert (=> mapNonEmpty!34135 (= mapRes!34135 (and tp!65065 e!541923))))

(declare-fun mapRest!34135 () (Array (_ BitVec 32) ValueCell!10232))

(declare-fun mapValue!34135 () ValueCell!10232)

(declare-fun mapKey!34135 () (_ BitVec 32))

(assert (=> mapNonEmpty!34135 (= (arr!28312 _values!1400) (store mapRest!34135 mapKey!34135 mapValue!34135))))

(declare-fun b!961171 () Bool)

(assert (=> b!961171 (= e!541927 false)))

(declare-fun lt!430514 () Bool)

(declare-datatypes ((List!19703 0))(
  ( (Nil!19700) (Cons!19699 (h!20861 (_ BitVec 64)) (t!28057 List!19703)) )
))
(declare-fun arrayNoDuplicates!0 (array!58888 (_ BitVec 32) List!19703) Bool)

(assert (=> b!961171 (= lt!430514 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19700))))

(declare-fun b!961172 () Bool)

(declare-fun tp_is_empty!21427 () Bool)

(assert (=> b!961172 (= e!541923 tp_is_empty!21427)))

(declare-fun mapIsEmpty!34135 () Bool)

(assert (=> mapIsEmpty!34135 mapRes!34135))

(declare-fun b!961169 () Bool)

(assert (=> b!961169 (= e!541926 tp_is_empty!21427)))

(declare-fun res!643349 () Bool)

(assert (=> start!82474 (=> (not res!643349) (not e!541927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82474 (= res!643349 (validMask!0 mask!2110))))

(assert (=> start!82474 e!541927))

(assert (=> start!82474 true))

(declare-fun array_inv!21995 (array!58886) Bool)

(assert (=> start!82474 (and (array_inv!21995 _values!1400) e!541925)))

(declare-fun array_inv!21996 (array!58888) Bool)

(assert (=> start!82474 (array_inv!21996 _keys!1686)))

(assert (= (and start!82474 res!643349) b!961167))

(assert (= (and b!961167 res!643347) b!961168))

(assert (= (and b!961168 res!643348) b!961171))

(assert (= (and b!961170 condMapEmpty!34135) mapIsEmpty!34135))

(assert (= (and b!961170 (not condMapEmpty!34135)) mapNonEmpty!34135))

(get-info :version)

(assert (= (and mapNonEmpty!34135 ((_ is ValueCellFull!10232) mapValue!34135)) b!961172))

(assert (= (and b!961170 ((_ is ValueCellFull!10232) mapDefault!34135)) b!961169))

(assert (= start!82474 b!961170))

(declare-fun m!890611 () Bool)

(assert (=> b!961168 m!890611))

(declare-fun m!890613 () Bool)

(assert (=> mapNonEmpty!34135 m!890613))

(declare-fun m!890615 () Bool)

(assert (=> b!961171 m!890615))

(declare-fun m!890617 () Bool)

(assert (=> start!82474 m!890617))

(declare-fun m!890619 () Bool)

(assert (=> start!82474 m!890619))

(declare-fun m!890621 () Bool)

(assert (=> start!82474 m!890621))

(check-sat (not mapNonEmpty!34135) (not b!961171) tp_is_empty!21427 (not b!961168) (not start!82474))
(check-sat)
