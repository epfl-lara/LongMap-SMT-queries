; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35506 () Bool)

(assert start!35506)

(declare-fun b!355826 () Bool)

(declare-fun e!217989 () Bool)

(declare-fun tp_is_empty!7959 () Bool)

(assert (=> b!355826 (= e!217989 tp_is_empty!7959)))

(declare-fun res!197414 () Bool)

(declare-fun e!217990 () Bool)

(assert (=> start!35506 (=> (not res!197414) (not e!217990))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35506 (= res!197414 (validMask!0 mask!1842))))

(assert (=> start!35506 e!217990))

(assert (=> start!35506 true))

(declare-datatypes ((V!11589 0))(
  ( (V!11590 (val!4024 Int)) )
))
(declare-datatypes ((ValueCell!3636 0))(
  ( (ValueCellFull!3636 (v!6218 V!11589)) (EmptyCell!3636) )
))
(declare-datatypes ((array!19495 0))(
  ( (array!19496 (arr!9241 (Array (_ BitVec 32) ValueCell!3636)) (size!9593 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19495)

(declare-fun e!217987 () Bool)

(declare-fun array_inv!6794 (array!19495) Bool)

(assert (=> start!35506 (and (array_inv!6794 _values!1208) e!217987)))

(declare-datatypes ((array!19497 0))(
  ( (array!19498 (arr!9242 (Array (_ BitVec 32) (_ BitVec 64))) (size!9594 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19497)

(declare-fun array_inv!6795 (array!19497) Bool)

(assert (=> start!35506 (array_inv!6795 _keys!1456)))

(declare-fun b!355827 () Bool)

(declare-fun res!197416 () Bool)

(assert (=> b!355827 (=> (not res!197416) (not e!217990))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355827 (= res!197416 (and (= (size!9593 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9594 _keys!1456) (size!9593 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13446 () Bool)

(declare-fun mapRes!13446 () Bool)

(assert (=> mapIsEmpty!13446 mapRes!13446))

(declare-fun b!355828 () Bool)

(declare-fun res!197415 () Bool)

(assert (=> b!355828 (=> (not res!197415) (not e!217990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19497 (_ BitVec 32)) Bool)

(assert (=> b!355828 (= res!197415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13446 () Bool)

(declare-fun tp!27423 () Bool)

(declare-fun e!217988 () Bool)

(assert (=> mapNonEmpty!13446 (= mapRes!13446 (and tp!27423 e!217988))))

(declare-fun mapValue!13446 () ValueCell!3636)

(declare-fun mapRest!13446 () (Array (_ BitVec 32) ValueCell!3636))

(declare-fun mapKey!13446 () (_ BitVec 32))

(assert (=> mapNonEmpty!13446 (= (arr!9241 _values!1208) (store mapRest!13446 mapKey!13446 mapValue!13446))))

(declare-fun b!355829 () Bool)

(assert (=> b!355829 (= e!217987 (and e!217989 mapRes!13446))))

(declare-fun condMapEmpty!13446 () Bool)

(declare-fun mapDefault!13446 () ValueCell!3636)

(assert (=> b!355829 (= condMapEmpty!13446 (= (arr!9241 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3636)) mapDefault!13446)))))

(declare-fun b!355830 () Bool)

(assert (=> b!355830 (= e!217988 tp_is_empty!7959)))

(declare-fun b!355831 () Bool)

(assert (=> b!355831 (= e!217990 false)))

(declare-fun lt!165854 () Bool)

(declare-datatypes ((List!5349 0))(
  ( (Nil!5346) (Cons!5345 (h!6201 (_ BitVec 64)) (t!10499 List!5349)) )
))
(declare-fun arrayNoDuplicates!0 (array!19497 (_ BitVec 32) List!5349) Bool)

(assert (=> b!355831 (= lt!165854 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5346))))

(assert (= (and start!35506 res!197414) b!355827))

(assert (= (and b!355827 res!197416) b!355828))

(assert (= (and b!355828 res!197415) b!355831))

(assert (= (and b!355829 condMapEmpty!13446) mapIsEmpty!13446))

(assert (= (and b!355829 (not condMapEmpty!13446)) mapNonEmpty!13446))

(get-info :version)

(assert (= (and mapNonEmpty!13446 ((_ is ValueCellFull!3636) mapValue!13446)) b!355830))

(assert (= (and b!355829 ((_ is ValueCellFull!3636) mapDefault!13446)) b!355826))

(assert (= start!35506 b!355829))

(declare-fun m!354433 () Bool)

(assert (=> start!35506 m!354433))

(declare-fun m!354435 () Bool)

(assert (=> start!35506 m!354435))

(declare-fun m!354437 () Bool)

(assert (=> start!35506 m!354437))

(declare-fun m!354439 () Bool)

(assert (=> b!355828 m!354439))

(declare-fun m!354441 () Bool)

(assert (=> mapNonEmpty!13446 m!354441))

(declare-fun m!354443 () Bool)

(assert (=> b!355831 m!354443))

(check-sat (not mapNonEmpty!13446) (not start!35506) tp_is_empty!7959 (not b!355828) (not b!355831))
(check-sat)
