; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34490 () Bool)

(assert start!34490)

(declare-fun b_free!7413 () Bool)

(declare-fun b_next!7413 () Bool)

(assert (=> start!34490 (= b_free!7413 (not b_next!7413))))

(declare-fun tp!25785 () Bool)

(declare-fun b_and!14621 () Bool)

(assert (=> start!34490 (= tp!25785 b_and!14621)))

(declare-fun b!344623 () Bool)

(declare-fun res!190611 () Bool)

(declare-fun e!211251 () Bool)

(assert (=> b!344623 (=> (not res!190611) (not e!211251))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10797 0))(
  ( (V!10798 (val!3727 Int)) )
))
(declare-fun zeroValue!1467 () V!10797)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18317 0))(
  ( (array!18318 (arr!8675 (Array (_ BitVec 32) (_ BitVec 64))) (size!9027 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18317)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10797)

(declare-datatypes ((ValueCell!3339 0))(
  ( (ValueCellFull!3339 (v!5903 V!10797)) (EmptyCell!3339) )
))
(declare-datatypes ((array!18319 0))(
  ( (array!18320 (arr!8676 (Array (_ BitVec 32) ValueCell!3339)) (size!9028 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18319)

(declare-datatypes ((tuple2!5396 0))(
  ( (tuple2!5397 (_1!2709 (_ BitVec 64)) (_2!2709 V!10797)) )
))
(declare-datatypes ((List!5017 0))(
  ( (Nil!5014) (Cons!5013 (h!5869 tuple2!5396) (t!10133 List!5017)) )
))
(declare-datatypes ((ListLongMap!4309 0))(
  ( (ListLongMap!4310 (toList!2170 List!5017)) )
))
(declare-fun contains!2228 (ListLongMap!4309 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1691 (array!18317 array!18319 (_ BitVec 32) (_ BitVec 32) V!10797 V!10797 (_ BitVec 32) Int) ListLongMap!4309)

(assert (=> b!344623 (= res!190611 (not (contains!2228 (getCurrentListMap!1691 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344624 () Bool)

(declare-fun res!190608 () Bool)

(assert (=> b!344624 (=> (not res!190608) (not e!211251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344624 (= res!190608 (validKeyInArray!0 k0!1348))))

(declare-fun b!344625 () Bool)

(declare-fun e!211254 () Bool)

(declare-fun tp_is_empty!7365 () Bool)

(assert (=> b!344625 (= e!211254 tp_is_empty!7365)))

(declare-fun mapNonEmpty!12486 () Bool)

(declare-fun mapRes!12486 () Bool)

(declare-fun tp!25784 () Bool)

(assert (=> mapNonEmpty!12486 (= mapRes!12486 (and tp!25784 e!211254))))

(declare-fun mapValue!12486 () ValueCell!3339)

(declare-fun mapKey!12486 () (_ BitVec 32))

(declare-fun mapRest!12486 () (Array (_ BitVec 32) ValueCell!3339))

(assert (=> mapNonEmpty!12486 (= (arr!8676 _values!1525) (store mapRest!12486 mapKey!12486 mapValue!12486))))

(declare-fun b!344626 () Bool)

(declare-fun res!190612 () Bool)

(assert (=> b!344626 (=> (not res!190612) (not e!211251))))

(assert (=> b!344626 (= res!190612 (and (= (size!9028 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9027 _keys!1895) (size!9028 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344627 () Bool)

(declare-fun e!211250 () Bool)

(assert (=> b!344627 (= e!211250 tp_is_empty!7365)))

(declare-fun b!344628 () Bool)

(assert (=> b!344628 (= e!211251 false)))

(declare-datatypes ((SeekEntryResult!3344 0))(
  ( (MissingZero!3344 (index!15555 (_ BitVec 32))) (Found!3344 (index!15556 (_ BitVec 32))) (Intermediate!3344 (undefined!4156 Bool) (index!15557 (_ BitVec 32)) (x!34322 (_ BitVec 32))) (Undefined!3344) (MissingVacant!3344 (index!15558 (_ BitVec 32))) )
))
(declare-fun lt!162694 () SeekEntryResult!3344)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18317 (_ BitVec 32)) SeekEntryResult!3344)

(assert (=> b!344628 (= lt!162694 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!190610 () Bool)

(assert (=> start!34490 (=> (not res!190610) (not e!211251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34490 (= res!190610 (validMask!0 mask!2385))))

(assert (=> start!34490 e!211251))

(assert (=> start!34490 true))

(assert (=> start!34490 tp_is_empty!7365))

(assert (=> start!34490 tp!25785))

(declare-fun e!211252 () Bool)

(declare-fun array_inv!6424 (array!18319) Bool)

(assert (=> start!34490 (and (array_inv!6424 _values!1525) e!211252)))

(declare-fun array_inv!6425 (array!18317) Bool)

(assert (=> start!34490 (array_inv!6425 _keys!1895)))

(declare-fun b!344629 () Bool)

(declare-fun res!190609 () Bool)

(assert (=> b!344629 (=> (not res!190609) (not e!211251))))

(declare-datatypes ((List!5018 0))(
  ( (Nil!5015) (Cons!5014 (h!5870 (_ BitVec 64)) (t!10134 List!5018)) )
))
(declare-fun arrayNoDuplicates!0 (array!18317 (_ BitVec 32) List!5018) Bool)

(assert (=> b!344629 (= res!190609 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5015))))

(declare-fun b!344630 () Bool)

(assert (=> b!344630 (= e!211252 (and e!211250 mapRes!12486))))

(declare-fun condMapEmpty!12486 () Bool)

(declare-fun mapDefault!12486 () ValueCell!3339)

(assert (=> b!344630 (= condMapEmpty!12486 (= (arr!8676 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3339)) mapDefault!12486)))))

(declare-fun mapIsEmpty!12486 () Bool)

(assert (=> mapIsEmpty!12486 mapRes!12486))

(declare-fun b!344631 () Bool)

(declare-fun res!190613 () Bool)

(assert (=> b!344631 (=> (not res!190613) (not e!211251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18317 (_ BitVec 32)) Bool)

(assert (=> b!344631 (= res!190613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34490 res!190610) b!344626))

(assert (= (and b!344626 res!190612) b!344631))

(assert (= (and b!344631 res!190613) b!344629))

(assert (= (and b!344629 res!190609) b!344624))

(assert (= (and b!344624 res!190608) b!344623))

(assert (= (and b!344623 res!190611) b!344628))

(assert (= (and b!344630 condMapEmpty!12486) mapIsEmpty!12486))

(assert (= (and b!344630 (not condMapEmpty!12486)) mapNonEmpty!12486))

(get-info :version)

(assert (= (and mapNonEmpty!12486 ((_ is ValueCellFull!3339) mapValue!12486)) b!344625))

(assert (= (and b!344630 ((_ is ValueCellFull!3339) mapDefault!12486)) b!344627))

(assert (= start!34490 b!344630))

(declare-fun m!346197 () Bool)

(assert (=> b!344631 m!346197))

(declare-fun m!346199 () Bool)

(assert (=> b!344629 m!346199))

(declare-fun m!346201 () Bool)

(assert (=> start!34490 m!346201))

(declare-fun m!346203 () Bool)

(assert (=> start!34490 m!346203))

(declare-fun m!346205 () Bool)

(assert (=> start!34490 m!346205))

(declare-fun m!346207 () Bool)

(assert (=> mapNonEmpty!12486 m!346207))

(declare-fun m!346209 () Bool)

(assert (=> b!344628 m!346209))

(declare-fun m!346211 () Bool)

(assert (=> b!344623 m!346211))

(assert (=> b!344623 m!346211))

(declare-fun m!346213 () Bool)

(assert (=> b!344623 m!346213))

(declare-fun m!346215 () Bool)

(assert (=> b!344624 m!346215))

(check-sat (not b!344624) (not start!34490) (not b_next!7413) (not b!344628) (not mapNonEmpty!12486) b_and!14621 tp_is_empty!7365 (not b!344623) (not b!344631) (not b!344629))
(check-sat b_and!14621 (not b_next!7413))
