; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82178 () Bool)

(assert start!82178)

(declare-fun b!957376 () Bool)

(declare-fun e!539557 () Bool)

(declare-fun tp_is_empty!21049 () Bool)

(assert (=> b!957376 (= e!539557 tp_is_empty!21049)))

(declare-fun res!640761 () Bool)

(declare-fun e!539556 () Bool)

(assert (=> start!82178 (=> (not res!640761) (not e!539556))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82178 (= res!640761 (validMask!0 mask!1823))))

(assert (=> start!82178 e!539556))

(assert (=> start!82178 true))

(declare-datatypes ((V!33049 0))(
  ( (V!33050 (val!10575 Int)) )
))
(declare-datatypes ((ValueCell!10043 0))(
  ( (ValueCellFull!10043 (v!13127 V!33049)) (EmptyCell!10043) )
))
(declare-datatypes ((array!58238 0))(
  ( (array!58239 (arr!27994 (Array (_ BitVec 32) ValueCell!10043)) (size!28474 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58238)

(declare-fun e!539560 () Bool)

(declare-fun array_inv!21795 (array!58238) Bool)

(assert (=> start!82178 (and (array_inv!21795 _values!1197) e!539560)))

(declare-datatypes ((array!58240 0))(
  ( (array!58241 (arr!27995 (Array (_ BitVec 32) (_ BitVec 64))) (size!28475 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58240)

(declare-fun array_inv!21796 (array!58240) Bool)

(assert (=> start!82178 (array_inv!21796 _keys!1441)))

(declare-fun b!957377 () Bool)

(declare-fun res!640762 () Bool)

(assert (=> b!957377 (=> (not res!640762) (not e!539556))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!957377 (= res!640762 (and (= (size!28474 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28475 _keys!1441) (size!28474 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!957378 () Bool)

(assert (=> b!957378 (= e!539556 false)))

(declare-fun lt!430512 () Bool)

(declare-datatypes ((List!19481 0))(
  ( (Nil!19478) (Cons!19477 (h!20645 (_ BitVec 64)) (t!27834 List!19481)) )
))
(declare-fun arrayNoDuplicates!0 (array!58240 (_ BitVec 32) List!19481) Bool)

(assert (=> b!957378 (= lt!430512 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19478))))

(declare-fun mapIsEmpty!33535 () Bool)

(declare-fun mapRes!33535 () Bool)

(assert (=> mapIsEmpty!33535 mapRes!33535))

(declare-fun b!957379 () Bool)

(assert (=> b!957379 (= e!539560 (and e!539557 mapRes!33535))))

(declare-fun condMapEmpty!33535 () Bool)

(declare-fun mapDefault!33535 () ValueCell!10043)

(assert (=> b!957379 (= condMapEmpty!33535 (= (arr!27994 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10043)) mapDefault!33535)))))

(declare-fun mapNonEmpty!33535 () Bool)

(declare-fun tp!64114 () Bool)

(declare-fun e!539558 () Bool)

(assert (=> mapNonEmpty!33535 (= mapRes!33535 (and tp!64114 e!539558))))

(declare-fun mapKey!33535 () (_ BitVec 32))

(declare-fun mapRest!33535 () (Array (_ BitVec 32) ValueCell!10043))

(declare-fun mapValue!33535 () ValueCell!10043)

(assert (=> mapNonEmpty!33535 (= (arr!27994 _values!1197) (store mapRest!33535 mapKey!33535 mapValue!33535))))

(declare-fun b!957380 () Bool)

(assert (=> b!957380 (= e!539558 tp_is_empty!21049)))

(declare-fun b!957381 () Bool)

(declare-fun res!640763 () Bool)

(assert (=> b!957381 (=> (not res!640763) (not e!539556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58240 (_ BitVec 32)) Bool)

(assert (=> b!957381 (= res!640763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(assert (= (and start!82178 res!640761) b!957377))

(assert (= (and b!957377 res!640762) b!957381))

(assert (= (and b!957381 res!640763) b!957378))

(assert (= (and b!957379 condMapEmpty!33535) mapIsEmpty!33535))

(assert (= (and b!957379 (not condMapEmpty!33535)) mapNonEmpty!33535))

(get-info :version)

(assert (= (and mapNonEmpty!33535 ((_ is ValueCellFull!10043) mapValue!33535)) b!957380))

(assert (= (and b!957379 ((_ is ValueCellFull!10043) mapDefault!33535)) b!957376))

(assert (= start!82178 b!957379))

(declare-fun m!889035 () Bool)

(assert (=> start!82178 m!889035))

(declare-fun m!889037 () Bool)

(assert (=> start!82178 m!889037))

(declare-fun m!889039 () Bool)

(assert (=> start!82178 m!889039))

(declare-fun m!889041 () Bool)

(assert (=> b!957378 m!889041))

(declare-fun m!889043 () Bool)

(assert (=> mapNonEmpty!33535 m!889043))

(declare-fun m!889045 () Bool)

(assert (=> b!957381 m!889045))

(check-sat (not mapNonEmpty!33535) (not start!82178) (not b!957378) (not b!957381) tp_is_empty!21049)
(check-sat)
