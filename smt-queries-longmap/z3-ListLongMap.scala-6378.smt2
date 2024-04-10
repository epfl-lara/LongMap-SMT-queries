; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82006 () Bool)

(assert start!82006)

(declare-fun b!956437 () Bool)

(declare-fun e!538947 () Bool)

(declare-fun tp_is_empty!21045 () Bool)

(assert (=> b!956437 (= e!538947 tp_is_empty!21045)))

(declare-fun b!956438 () Bool)

(declare-fun res!640400 () Bool)

(declare-fun e!538948 () Bool)

(assert (=> b!956438 (=> (not res!640400) (not e!538948))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58187 0))(
  ( (array!58188 (arr!27973 (Array (_ BitVec 32) (_ BitVec 64))) (size!28452 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58187)

(declare-datatypes ((V!33043 0))(
  ( (V!33044 (val!10573 Int)) )
))
(declare-datatypes ((ValueCell!10041 0))(
  ( (ValueCellFull!10041 (v!13128 V!33043)) (EmptyCell!10041) )
))
(declare-datatypes ((array!58189 0))(
  ( (array!58190 (arr!27974 (Array (_ BitVec 32) ValueCell!10041)) (size!28453 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58189)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!956438 (= res!640400 (and (= (size!28453 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28452 _keys!1441) (size!28453 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33529 () Bool)

(declare-fun mapRes!33529 () Bool)

(assert (=> mapIsEmpty!33529 mapRes!33529))

(declare-fun mapNonEmpty!33529 () Bool)

(declare-fun tp!64107 () Bool)

(assert (=> mapNonEmpty!33529 (= mapRes!33529 (and tp!64107 e!538947))))

(declare-fun mapRest!33529 () (Array (_ BitVec 32) ValueCell!10041))

(declare-fun mapValue!33529 () ValueCell!10041)

(declare-fun mapKey!33529 () (_ BitVec 32))

(assert (=> mapNonEmpty!33529 (= (arr!27974 _values!1197) (store mapRest!33529 mapKey!33529 mapValue!33529))))

(declare-fun b!956439 () Bool)

(declare-fun e!538946 () Bool)

(assert (=> b!956439 (= e!538946 tp_is_empty!21045)))

(declare-fun res!640399 () Bool)

(assert (=> start!82006 (=> (not res!640399) (not e!538948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82006 (= res!640399 (validMask!0 mask!1823))))

(assert (=> start!82006 e!538948))

(assert (=> start!82006 true))

(declare-fun e!538944 () Bool)

(declare-fun array_inv!21703 (array!58189) Bool)

(assert (=> start!82006 (and (array_inv!21703 _values!1197) e!538944)))

(declare-fun array_inv!21704 (array!58187) Bool)

(assert (=> start!82006 (array_inv!21704 _keys!1441)))

(declare-fun b!956440 () Bool)

(assert (=> b!956440 (= e!538948 false)))

(declare-fun lt!430145 () Bool)

(declare-datatypes ((List!19481 0))(
  ( (Nil!19478) (Cons!19477 (h!20639 (_ BitVec 64)) (t!27842 List!19481)) )
))
(declare-fun arrayNoDuplicates!0 (array!58187 (_ BitVec 32) List!19481) Bool)

(assert (=> b!956440 (= lt!430145 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19478))))

(declare-fun b!956441 () Bool)

(declare-fun res!640401 () Bool)

(assert (=> b!956441 (=> (not res!640401) (not e!538948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58187 (_ BitVec 32)) Bool)

(assert (=> b!956441 (= res!640401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956442 () Bool)

(assert (=> b!956442 (= e!538944 (and e!538946 mapRes!33529))))

(declare-fun condMapEmpty!33529 () Bool)

(declare-fun mapDefault!33529 () ValueCell!10041)

(assert (=> b!956442 (= condMapEmpty!33529 (= (arr!27974 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10041)) mapDefault!33529)))))

(assert (= (and start!82006 res!640399) b!956438))

(assert (= (and b!956438 res!640400) b!956441))

(assert (= (and b!956441 res!640401) b!956440))

(assert (= (and b!956442 condMapEmpty!33529) mapIsEmpty!33529))

(assert (= (and b!956442 (not condMapEmpty!33529)) mapNonEmpty!33529))

(get-info :version)

(assert (= (and mapNonEmpty!33529 ((_ is ValueCellFull!10041) mapValue!33529)) b!956437))

(assert (= (and b!956442 ((_ is ValueCellFull!10041) mapDefault!33529)) b!956439))

(assert (= start!82006 b!956442))

(declare-fun m!887717 () Bool)

(assert (=> mapNonEmpty!33529 m!887717))

(declare-fun m!887719 () Bool)

(assert (=> start!82006 m!887719))

(declare-fun m!887721 () Bool)

(assert (=> start!82006 m!887721))

(declare-fun m!887723 () Bool)

(assert (=> start!82006 m!887723))

(declare-fun m!887725 () Bool)

(assert (=> b!956440 m!887725))

(declare-fun m!887727 () Bool)

(assert (=> b!956441 m!887727))

(check-sat tp_is_empty!21045 (not start!82006) (not b!956440) (not mapNonEmpty!33529) (not b!956441))
(check-sat)
