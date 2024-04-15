; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82388 () Bool)

(assert start!82388)

(declare-fun b!960677 () Bool)

(declare-fun e!541513 () Bool)

(declare-fun tp_is_empty!21385 () Bool)

(assert (=> b!960677 (= e!541513 tp_is_empty!21385)))

(declare-fun mapNonEmpty!34057 () Bool)

(declare-fun mapRes!34057 () Bool)

(declare-fun tp!64987 () Bool)

(assert (=> mapNonEmpty!34057 (= mapRes!34057 (and tp!64987 e!541513))))

(declare-fun mapKey!34057 () (_ BitVec 32))

(declare-datatypes ((V!33497 0))(
  ( (V!33498 (val!10743 Int)) )
))
(declare-datatypes ((ValueCell!10211 0))(
  ( (ValueCellFull!10211 (v!13299 V!33497)) (EmptyCell!10211) )
))
(declare-fun mapValue!34057 () ValueCell!10211)

(declare-fun mapRest!34057 () (Array (_ BitVec 32) ValueCell!10211))

(declare-datatypes ((array!58796 0))(
  ( (array!58797 (arr!28272 (Array (_ BitVec 32) ValueCell!10211)) (size!28753 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58796)

(assert (=> mapNonEmpty!34057 (= (arr!28272 _values!1400) (store mapRest!34057 mapKey!34057 mapValue!34057))))

(declare-fun res!643110 () Bool)

(declare-fun e!541516 () Bool)

(assert (=> start!82388 (=> (not res!643110) (not e!541516))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82388 (= res!643110 (validMask!0 mask!2110))))

(assert (=> start!82388 e!541516))

(assert (=> start!82388 true))

(declare-fun e!541514 () Bool)

(declare-fun array_inv!21963 (array!58796) Bool)

(assert (=> start!82388 (and (array_inv!21963 _values!1400) e!541514)))

(declare-datatypes ((array!58798 0))(
  ( (array!58799 (arr!28273 (Array (_ BitVec 32) (_ BitVec 64))) (size!28754 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58798)

(declare-fun array_inv!21964 (array!58798) Bool)

(assert (=> start!82388 (array_inv!21964 _keys!1686)))

(declare-fun b!960678 () Bool)

(declare-fun e!541517 () Bool)

(assert (=> b!960678 (= e!541517 tp_is_empty!21385)))

(declare-fun mapIsEmpty!34057 () Bool)

(assert (=> mapIsEmpty!34057 mapRes!34057))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun b!960679 () Bool)

(assert (=> b!960679 (= e!541516 (and (= (size!28753 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28754 _keys!1686) (size!28753 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011) (not (= (size!28754 _keys!1686) (bvadd #b00000000000000000000000000000001 mask!2110)))))))

(declare-fun b!960680 () Bool)

(assert (=> b!960680 (= e!541514 (and e!541517 mapRes!34057))))

(declare-fun condMapEmpty!34057 () Bool)

(declare-fun mapDefault!34057 () ValueCell!10211)

(assert (=> b!960680 (= condMapEmpty!34057 (= (arr!28272 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10211)) mapDefault!34057)))))

(assert (= (and start!82388 res!643110) b!960679))

(assert (= (and b!960680 condMapEmpty!34057) mapIsEmpty!34057))

(assert (= (and b!960680 (not condMapEmpty!34057)) mapNonEmpty!34057))

(get-info :version)

(assert (= (and mapNonEmpty!34057 ((_ is ValueCellFull!10211) mapValue!34057)) b!960677))

(assert (= (and b!960680 ((_ is ValueCellFull!10211) mapDefault!34057)) b!960678))

(assert (= start!82388 b!960680))

(declare-fun m!890307 () Bool)

(assert (=> mapNonEmpty!34057 m!890307))

(declare-fun m!890309 () Bool)

(assert (=> start!82388 m!890309))

(declare-fun m!890311 () Bool)

(assert (=> start!82388 m!890311))

(declare-fun m!890313 () Bool)

(assert (=> start!82388 m!890313))

(check-sat (not start!82388) (not mapNonEmpty!34057) tp_is_empty!21385)
(check-sat)
