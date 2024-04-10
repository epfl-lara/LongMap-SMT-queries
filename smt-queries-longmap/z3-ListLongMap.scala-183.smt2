; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3676 () Bool)

(assert start!3676)

(declare-fun res!15358 () Bool)

(declare-fun e!16657 () Bool)

(assert (=> start!3676 (=> (not res!15358) (not e!16657))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3676 (= res!15358 (validMask!0 mask!2294))))

(assert (=> start!3676 e!16657))

(assert (=> start!3676 true))

(declare-datatypes ((V!1213 0))(
  ( (V!1214 (val!547 Int)) )
))
(declare-datatypes ((ValueCell!321 0))(
  ( (ValueCellFull!321 (v!1632 V!1213)) (EmptyCell!321) )
))
(declare-datatypes ((array!1323 0))(
  ( (array!1324 (arr!624 (Array (_ BitVec 32) ValueCell!321)) (size!725 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1323)

(declare-fun e!16659 () Bool)

(declare-fun array_inv!421 (array!1323) Bool)

(assert (=> start!3676 (and (array_inv!421 _values!1501) e!16659)))

(declare-datatypes ((array!1325 0))(
  ( (array!1326 (arr!625 (Array (_ BitVec 32) (_ BitVec 64))) (size!726 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1325)

(declare-fun array_inv!422 (array!1325) Bool)

(assert (=> start!3676 (array_inv!422 _keys!1833)))

(declare-fun mapIsEmpty!1063 () Bool)

(declare-fun mapRes!1063 () Bool)

(assert (=> mapIsEmpty!1063 mapRes!1063))

(declare-fun b!25756 () Bool)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!25756 (= e!16657 (and (= (size!725 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!726 _keys!1833) (size!725 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011) (not (= (size!726 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294)))))))

(declare-fun b!25757 () Bool)

(declare-fun e!16656 () Bool)

(declare-fun tp_is_empty!1041 () Bool)

(assert (=> b!25757 (= e!16656 tp_is_empty!1041)))

(declare-fun mapNonEmpty!1063 () Bool)

(declare-fun tp!3583 () Bool)

(declare-fun e!16655 () Bool)

(assert (=> mapNonEmpty!1063 (= mapRes!1063 (and tp!3583 e!16655))))

(declare-fun mapValue!1063 () ValueCell!321)

(declare-fun mapRest!1063 () (Array (_ BitVec 32) ValueCell!321))

(declare-fun mapKey!1063 () (_ BitVec 32))

(assert (=> mapNonEmpty!1063 (= (arr!624 _values!1501) (store mapRest!1063 mapKey!1063 mapValue!1063))))

(declare-fun b!25758 () Bool)

(assert (=> b!25758 (= e!16655 tp_is_empty!1041)))

(declare-fun b!25759 () Bool)

(assert (=> b!25759 (= e!16659 (and e!16656 mapRes!1063))))

(declare-fun condMapEmpty!1063 () Bool)

(declare-fun mapDefault!1063 () ValueCell!321)

(assert (=> b!25759 (= condMapEmpty!1063 (= (arr!624 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!321)) mapDefault!1063)))))

(assert (= (and start!3676 res!15358) b!25756))

(assert (= (and b!25759 condMapEmpty!1063) mapIsEmpty!1063))

(assert (= (and b!25759 (not condMapEmpty!1063)) mapNonEmpty!1063))

(get-info :version)

(assert (= (and mapNonEmpty!1063 ((_ is ValueCellFull!321) mapValue!1063)) b!25758))

(assert (= (and b!25759 ((_ is ValueCellFull!321) mapDefault!1063)) b!25757))

(assert (= start!3676 b!25759))

(declare-fun m!20781 () Bool)

(assert (=> start!3676 m!20781))

(declare-fun m!20783 () Bool)

(assert (=> start!3676 m!20783))

(declare-fun m!20785 () Bool)

(assert (=> start!3676 m!20785))

(declare-fun m!20787 () Bool)

(assert (=> mapNonEmpty!1063 m!20787))

(check-sat (not start!3676) (not mapNonEmpty!1063) tp_is_empty!1041)
(check-sat)
