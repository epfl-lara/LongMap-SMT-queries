; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!594 () Bool)

(assert start!594)

(declare-fun b_free!67 () Bool)

(declare-fun b_next!67 () Bool)

(assert (=> start!594 (= b_free!67 (not b_next!67))))

(declare-fun tp!418 () Bool)

(declare-fun b_and!205 () Bool)

(assert (=> start!594 (= tp!418 b_and!205)))

(declare-fun b!3637 () Bool)

(declare-fun e!1804 () Bool)

(declare-fun e!1803 () Bool)

(declare-fun mapRes!176 () Bool)

(assert (=> b!3637 (= e!1804 (and e!1803 mapRes!176))))

(declare-fun condMapEmpty!176 () Bool)

(declare-datatypes ((V!371 0))(
  ( (V!372 (val!78 Int)) )
))
(declare-datatypes ((ValueCell!56 0))(
  ( (ValueCellFull!56 (v!1165 V!371)) (EmptyCell!56) )
))
(declare-datatypes ((array!219 0))(
  ( (array!220 (arr!102 (Array (_ BitVec 32) ValueCell!56)) (size!164 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!219)

(declare-fun mapDefault!176 () ValueCell!56)

(assert (=> b!3637 (= condMapEmpty!176 (= (arr!102 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!56)) mapDefault!176)))))

(declare-fun b!3638 () Bool)

(declare-fun res!5284 () Bool)

(declare-fun e!1802 () Bool)

(assert (=> b!3638 (=> (not res!5284) (not e!1802))))

(declare-datatypes ((array!221 0))(
  ( (array!222 (arr!103 (Array (_ BitVec 32) (_ BitVec 64))) (size!165 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!221)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!221 (_ BitVec 32)) Bool)

(assert (=> b!3638 (= res!5284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!176 () Bool)

(declare-fun tp!419 () Bool)

(declare-fun e!1801 () Bool)

(assert (=> mapNonEmpty!176 (= mapRes!176 (and tp!419 e!1801))))

(declare-fun mapRest!176 () (Array (_ BitVec 32) ValueCell!56))

(declare-fun mapKey!176 () (_ BitVec 32))

(declare-fun mapValue!176 () ValueCell!56)

(assert (=> mapNonEmpty!176 (= (arr!102 _values!1492) (store mapRest!176 mapKey!176 mapValue!176))))

(declare-fun b!3639 () Bool)

(assert (=> b!3639 (= e!1802 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!501 () Bool)

(declare-fun minValue!1434 () V!371)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!371)

(declare-datatypes ((tuple2!54 0))(
  ( (tuple2!55 (_1!27 (_ BitVec 64)) (_2!27 V!371)) )
))
(declare-datatypes ((List!61 0))(
  ( (Nil!58) (Cons!57 (h!623 tuple2!54) (t!2188 List!61)) )
))
(declare-datatypes ((ListLongMap!59 0))(
  ( (ListLongMap!60 (toList!45 List!61)) )
))
(declare-fun contains!15 (ListLongMap!59 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4 (array!221 array!219 (_ BitVec 32) (_ BitVec 32) V!371 V!371 (_ BitVec 32) Int) ListLongMap!59)

(assert (=> b!3639 (= lt!501 (contains!15 (getCurrentListMap!4 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun res!5281 () Bool)

(assert (=> start!594 (=> (not res!5281) (not e!1802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!594 (= res!5281 (validMask!0 mask!2250))))

(assert (=> start!594 e!1802))

(assert (=> start!594 tp!418))

(assert (=> start!594 true))

(declare-fun array_inv!67 (array!219) Bool)

(assert (=> start!594 (and (array_inv!67 _values!1492) e!1804)))

(declare-fun tp_is_empty!145 () Bool)

(assert (=> start!594 tp_is_empty!145))

(declare-fun array_inv!68 (array!221) Bool)

(assert (=> start!594 (array_inv!68 _keys!1806)))

(declare-fun b!3640 () Bool)

(assert (=> b!3640 (= e!1803 tp_is_empty!145)))

(declare-fun b!3641 () Bool)

(declare-fun res!5282 () Bool)

(assert (=> b!3641 (=> (not res!5282) (not e!1802))))

(assert (=> b!3641 (= res!5282 (and (= (size!164 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!165 _keys!1806) (size!164 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3642 () Bool)

(assert (=> b!3642 (= e!1801 tp_is_empty!145)))

(declare-fun mapIsEmpty!176 () Bool)

(assert (=> mapIsEmpty!176 mapRes!176))

(declare-fun b!3643 () Bool)

(declare-fun res!5283 () Bool)

(assert (=> b!3643 (=> (not res!5283) (not e!1802))))

(declare-datatypes ((List!62 0))(
  ( (Nil!59) (Cons!58 (h!624 (_ BitVec 64)) (t!2189 List!62)) )
))
(declare-fun arrayNoDuplicates!0 (array!221 (_ BitVec 32) List!62) Bool)

(assert (=> b!3643 (= res!5283 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!59))))

(assert (= (and start!594 res!5281) b!3641))

(assert (= (and b!3641 res!5282) b!3638))

(assert (= (and b!3638 res!5284) b!3643))

(assert (= (and b!3643 res!5283) b!3639))

(assert (= (and b!3637 condMapEmpty!176) mapIsEmpty!176))

(assert (= (and b!3637 (not condMapEmpty!176)) mapNonEmpty!176))

(get-info :version)

(assert (= (and mapNonEmpty!176 ((_ is ValueCellFull!56) mapValue!176)) b!3642))

(assert (= (and b!3637 ((_ is ValueCellFull!56) mapDefault!176)) b!3640))

(assert (= start!594 b!3637))

(declare-fun m!1775 () Bool)

(assert (=> start!594 m!1775))

(declare-fun m!1777 () Bool)

(assert (=> start!594 m!1777))

(declare-fun m!1779 () Bool)

(assert (=> start!594 m!1779))

(declare-fun m!1781 () Bool)

(assert (=> mapNonEmpty!176 m!1781))

(declare-fun m!1783 () Bool)

(assert (=> b!3643 m!1783))

(declare-fun m!1785 () Bool)

(assert (=> b!3638 m!1785))

(declare-fun m!1787 () Bool)

(assert (=> b!3639 m!1787))

(assert (=> b!3639 m!1787))

(declare-fun m!1789 () Bool)

(assert (=> b!3639 m!1789))

(check-sat tp_is_empty!145 b_and!205 (not b!3638) (not b_next!67) (not b!3643) (not start!594) (not mapNonEmpty!176) (not b!3639))
(check-sat b_and!205 (not b_next!67))
