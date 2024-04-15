; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35490 () Bool)

(assert start!35490)

(declare-fun b!355533 () Bool)

(declare-fun res!197277 () Bool)

(declare-fun e!217798 () Bool)

(assert (=> b!355533 (=> (not res!197277) (not e!217798))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19475 0))(
  ( (array!19476 (arr!9231 (Array (_ BitVec 32) (_ BitVec 64))) (size!9584 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19475)

(declare-datatypes ((V!11587 0))(
  ( (V!11588 (val!4023 Int)) )
))
(declare-datatypes ((ValueCell!3635 0))(
  ( (ValueCellFull!3635 (v!6211 V!11587)) (EmptyCell!3635) )
))
(declare-datatypes ((array!19477 0))(
  ( (array!19478 (arr!9232 (Array (_ BitVec 32) ValueCell!3635)) (size!9585 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19477)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355533 (= res!197277 (and (= (size!9585 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9584 _keys!1456) (size!9585 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355534 () Bool)

(declare-fun e!217796 () Bool)

(declare-fun e!217800 () Bool)

(declare-fun mapRes!13443 () Bool)

(assert (=> b!355534 (= e!217796 (and e!217800 mapRes!13443))))

(declare-fun condMapEmpty!13443 () Bool)

(declare-fun mapDefault!13443 () ValueCell!3635)

(assert (=> b!355534 (= condMapEmpty!13443 (= (arr!9232 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3635)) mapDefault!13443)))))

(declare-fun mapIsEmpty!13443 () Bool)

(assert (=> mapIsEmpty!13443 mapRes!13443))

(declare-fun res!197278 () Bool)

(assert (=> start!35490 (=> (not res!197278) (not e!217798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35490 (= res!197278 (validMask!0 mask!1842))))

(assert (=> start!35490 e!217798))

(assert (=> start!35490 true))

(declare-fun array_inv!6828 (array!19477) Bool)

(assert (=> start!35490 (and (array_inv!6828 _values!1208) e!217796)))

(declare-fun array_inv!6829 (array!19475) Bool)

(assert (=> start!35490 (array_inv!6829 _keys!1456)))

(declare-fun b!355535 () Bool)

(declare-fun e!217799 () Bool)

(declare-fun tp_is_empty!7957 () Bool)

(assert (=> b!355535 (= e!217799 tp_is_empty!7957)))

(declare-fun b!355536 () Bool)

(assert (=> b!355536 (= e!217798 false)))

(declare-fun lt!165616 () Bool)

(declare-datatypes ((List!5320 0))(
  ( (Nil!5317) (Cons!5316 (h!6172 (_ BitVec 64)) (t!10461 List!5320)) )
))
(declare-fun arrayNoDuplicates!0 (array!19475 (_ BitVec 32) List!5320) Bool)

(assert (=> b!355536 (= lt!165616 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5317))))

(declare-fun b!355537 () Bool)

(assert (=> b!355537 (= e!217800 tp_is_empty!7957)))

(declare-fun b!355538 () Bool)

(declare-fun res!197276 () Bool)

(assert (=> b!355538 (=> (not res!197276) (not e!217798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19475 (_ BitVec 32)) Bool)

(assert (=> b!355538 (= res!197276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13443 () Bool)

(declare-fun tp!27420 () Bool)

(assert (=> mapNonEmpty!13443 (= mapRes!13443 (and tp!27420 e!217799))))

(declare-fun mapKey!13443 () (_ BitVec 32))

(declare-fun mapValue!13443 () ValueCell!3635)

(declare-fun mapRest!13443 () (Array (_ BitVec 32) ValueCell!3635))

(assert (=> mapNonEmpty!13443 (= (arr!9232 _values!1208) (store mapRest!13443 mapKey!13443 mapValue!13443))))

(assert (= (and start!35490 res!197278) b!355533))

(assert (= (and b!355533 res!197277) b!355538))

(assert (= (and b!355538 res!197276) b!355536))

(assert (= (and b!355534 condMapEmpty!13443) mapIsEmpty!13443))

(assert (= (and b!355534 (not condMapEmpty!13443)) mapNonEmpty!13443))

(get-info :version)

(assert (= (and mapNonEmpty!13443 ((_ is ValueCellFull!3635) mapValue!13443)) b!355535))

(assert (= (and b!355534 ((_ is ValueCellFull!3635) mapDefault!13443)) b!355537))

(assert (= start!35490 b!355534))

(declare-fun m!353691 () Bool)

(assert (=> start!35490 m!353691))

(declare-fun m!353693 () Bool)

(assert (=> start!35490 m!353693))

(declare-fun m!353695 () Bool)

(assert (=> start!35490 m!353695))

(declare-fun m!353697 () Bool)

(assert (=> b!355536 m!353697))

(declare-fun m!353699 () Bool)

(assert (=> b!355538 m!353699))

(declare-fun m!353701 () Bool)

(assert (=> mapNonEmpty!13443 m!353701))

(check-sat tp_is_empty!7957 (not start!35490) (not mapNonEmpty!13443) (not b!355536) (not b!355538))
(check-sat)
