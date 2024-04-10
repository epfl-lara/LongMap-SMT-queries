; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82408 () Bool)

(assert start!82408)

(declare-fun mapIsEmpty!34060 () Bool)

(declare-fun mapRes!34060 () Bool)

(assert (=> mapIsEmpty!34060 mapRes!34060))

(declare-fun b!960928 () Bool)

(declare-fun e!541678 () Bool)

(declare-fun tp_is_empty!21387 () Bool)

(assert (=> b!960928 (= e!541678 tp_is_empty!21387)))

(declare-fun b!960929 () Bool)

(declare-fun e!541676 () Bool)

(assert (=> b!960929 (= e!541676 tp_is_empty!21387)))

(declare-fun mapNonEmpty!34060 () Bool)

(declare-fun tp!64989 () Bool)

(assert (=> mapNonEmpty!34060 (= mapRes!34060 (and tp!64989 e!541676))))

(declare-datatypes ((V!33499 0))(
  ( (V!33500 (val!10744 Int)) )
))
(declare-datatypes ((ValueCell!10212 0))(
  ( (ValueCellFull!10212 (v!13301 V!33499)) (EmptyCell!10212) )
))
(declare-datatypes ((array!58863 0))(
  ( (array!58864 (arr!28305 (Array (_ BitVec 32) ValueCell!10212)) (size!28784 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58863)

(declare-fun mapRest!34060 () (Array (_ BitVec 32) ValueCell!10212))

(declare-fun mapValue!34060 () ValueCell!10212)

(declare-fun mapKey!34060 () (_ BitVec 32))

(assert (=> mapNonEmpty!34060 (= (arr!28305 _values!1400) (store mapRest!34060 mapKey!34060 mapValue!34060))))

(declare-fun res!643223 () Bool)

(declare-fun e!541680 () Bool)

(assert (=> start!82408 (=> (not res!643223) (not e!541680))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82408 (= res!643223 (validMask!0 mask!2110))))

(assert (=> start!82408 e!541680))

(assert (=> start!82408 true))

(declare-fun e!541679 () Bool)

(declare-fun array_inv!21931 (array!58863) Bool)

(assert (=> start!82408 (and (array_inv!21931 _values!1400) e!541679)))

(declare-datatypes ((array!58865 0))(
  ( (array!58866 (arr!28306 (Array (_ BitVec 32) (_ BitVec 64))) (size!28785 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58865)

(declare-fun array_inv!21932 (array!58865) Bool)

(assert (=> start!82408 (array_inv!21932 _keys!1686)))

(declare-fun b!960930 () Bool)

(assert (=> b!960930 (= e!541679 (and e!541678 mapRes!34060))))

(declare-fun condMapEmpty!34060 () Bool)

(declare-fun mapDefault!34060 () ValueCell!10212)

(assert (=> b!960930 (= condMapEmpty!34060 (= (arr!28305 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10212)) mapDefault!34060)))))

(declare-fun b!960931 () Bool)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!960931 (= e!541680 (and (= (size!28784 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28785 _keys!1686) (size!28784 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011) (not (= (size!28785 _keys!1686) (bvadd #b00000000000000000000000000000001 mask!2110)))))))

(assert (= (and start!82408 res!643223) b!960931))

(assert (= (and b!960930 condMapEmpty!34060) mapIsEmpty!34060))

(assert (= (and b!960930 (not condMapEmpty!34060)) mapNonEmpty!34060))

(get-info :version)

(assert (= (and mapNonEmpty!34060 ((_ is ValueCellFull!10212) mapValue!34060)) b!960929))

(assert (= (and b!960930 ((_ is ValueCellFull!10212) mapDefault!34060)) b!960928))

(assert (= start!82408 b!960930))

(declare-fun m!891073 () Bool)

(assert (=> mapNonEmpty!34060 m!891073))

(declare-fun m!891075 () Bool)

(assert (=> start!82408 m!891075))

(declare-fun m!891077 () Bool)

(assert (=> start!82408 m!891077))

(declare-fun m!891079 () Bool)

(assert (=> start!82408 m!891079))

(check-sat (not start!82408) (not mapNonEmpty!34060) tp_is_empty!21387)
(check-sat)
