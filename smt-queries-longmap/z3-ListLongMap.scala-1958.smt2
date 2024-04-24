; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34480 () Bool)

(assert start!34480)

(declare-fun b_free!7417 () Bool)

(declare-fun b_next!7417 () Bool)

(assert (=> start!34480 (= b_free!7417 (not b_next!7417))))

(declare-fun tp!25796 () Bool)

(declare-fun b_and!14639 () Bool)

(assert (=> start!34480 (= tp!25796 b_and!14639)))

(declare-fun res!190642 () Bool)

(declare-fun e!211247 () Bool)

(assert (=> start!34480 (=> (not res!190642) (not e!211247))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34480 (= res!190642 (validMask!0 mask!2385))))

(assert (=> start!34480 e!211247))

(assert (=> start!34480 true))

(declare-fun tp_is_empty!7369 () Bool)

(assert (=> start!34480 tp_is_empty!7369))

(assert (=> start!34480 tp!25796))

(declare-datatypes ((V!10803 0))(
  ( (V!10804 (val!3729 Int)) )
))
(declare-datatypes ((ValueCell!3341 0))(
  ( (ValueCellFull!3341 (v!5906 V!10803)) (EmptyCell!3341) )
))
(declare-datatypes ((array!18320 0))(
  ( (array!18321 (arr!8676 (Array (_ BitVec 32) ValueCell!3341)) (size!9028 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18320)

(declare-fun e!211250 () Bool)

(declare-fun array_inv!6408 (array!18320) Bool)

(assert (=> start!34480 (and (array_inv!6408 _values!1525) e!211250)))

(declare-datatypes ((array!18322 0))(
  ( (array!18323 (arr!8677 (Array (_ BitVec 32) (_ BitVec 64))) (size!9029 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18322)

(declare-fun array_inv!6409 (array!18322) Bool)

(assert (=> start!34480 (array_inv!6409 _keys!1895)))

(declare-fun b!344624 () Bool)

(declare-fun e!211246 () Bool)

(assert (=> b!344624 (= e!211246 tp_is_empty!7369)))

(declare-fun b!344625 () Bool)

(declare-fun res!190641 () Bool)

(assert (=> b!344625 (=> (not res!190641) (not e!211247))))

(declare-datatypes ((List!4917 0))(
  ( (Nil!4914) (Cons!4913 (h!5769 (_ BitVec 64)) (t!10025 List!4917)) )
))
(declare-fun arrayNoDuplicates!0 (array!18322 (_ BitVec 32) List!4917) Bool)

(assert (=> b!344625 (= res!190641 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4914))))

(declare-fun b!344626 () Bool)

(assert (=> b!344626 (= e!211247 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3298 0))(
  ( (MissingZero!3298 (index!15371 (_ BitVec 32))) (Found!3298 (index!15372 (_ BitVec 32))) (Intermediate!3298 (undefined!4110 Bool) (index!15373 (_ BitVec 32)) (x!34281 (_ BitVec 32))) (Undefined!3298) (MissingVacant!3298 (index!15374 (_ BitVec 32))) )
))
(declare-fun lt!162718 () SeekEntryResult!3298)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18322 (_ BitVec 32)) SeekEntryResult!3298)

(assert (=> b!344626 (= lt!162718 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344627 () Bool)

(declare-fun e!211248 () Bool)

(declare-fun mapRes!12492 () Bool)

(assert (=> b!344627 (= e!211250 (and e!211248 mapRes!12492))))

(declare-fun condMapEmpty!12492 () Bool)

(declare-fun mapDefault!12492 () ValueCell!3341)

(assert (=> b!344627 (= condMapEmpty!12492 (= (arr!8676 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3341)) mapDefault!12492)))))

(declare-fun mapIsEmpty!12492 () Bool)

(assert (=> mapIsEmpty!12492 mapRes!12492))

(declare-fun b!344628 () Bool)

(declare-fun res!190643 () Bool)

(assert (=> b!344628 (=> (not res!190643) (not e!211247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344628 (= res!190643 (validKeyInArray!0 k0!1348))))

(declare-fun b!344629 () Bool)

(declare-fun res!190645 () Bool)

(assert (=> b!344629 (=> (not res!190645) (not e!211247))))

(declare-fun zeroValue!1467 () V!10803)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10803)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5314 0))(
  ( (tuple2!5315 (_1!2668 (_ BitVec 64)) (_2!2668 V!10803)) )
))
(declare-datatypes ((List!4918 0))(
  ( (Nil!4915) (Cons!4914 (h!5770 tuple2!5314) (t!10026 List!4918)) )
))
(declare-datatypes ((ListLongMap!4229 0))(
  ( (ListLongMap!4230 (toList!2130 List!4918)) )
))
(declare-fun contains!2207 (ListLongMap!4229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1659 (array!18322 array!18320 (_ BitVec 32) (_ BitVec 32) V!10803 V!10803 (_ BitVec 32) Int) ListLongMap!4229)

(assert (=> b!344629 (= res!190645 (not (contains!2207 (getCurrentListMap!1659 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12492 () Bool)

(declare-fun tp!25797 () Bool)

(assert (=> mapNonEmpty!12492 (= mapRes!12492 (and tp!25797 e!211246))))

(declare-fun mapRest!12492 () (Array (_ BitVec 32) ValueCell!3341))

(declare-fun mapValue!12492 () ValueCell!3341)

(declare-fun mapKey!12492 () (_ BitVec 32))

(assert (=> mapNonEmpty!12492 (= (arr!8676 _values!1525) (store mapRest!12492 mapKey!12492 mapValue!12492))))

(declare-fun b!344630 () Bool)

(assert (=> b!344630 (= e!211248 tp_is_empty!7369)))

(declare-fun b!344631 () Bool)

(declare-fun res!190646 () Bool)

(assert (=> b!344631 (=> (not res!190646) (not e!211247))))

(assert (=> b!344631 (= res!190646 (and (= (size!9028 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9029 _keys!1895) (size!9028 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344632 () Bool)

(declare-fun res!190644 () Bool)

(assert (=> b!344632 (=> (not res!190644) (not e!211247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18322 (_ BitVec 32)) Bool)

(assert (=> b!344632 (= res!190644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34480 res!190642) b!344631))

(assert (= (and b!344631 res!190646) b!344632))

(assert (= (and b!344632 res!190644) b!344625))

(assert (= (and b!344625 res!190641) b!344628))

(assert (= (and b!344628 res!190643) b!344629))

(assert (= (and b!344629 res!190645) b!344626))

(assert (= (and b!344627 condMapEmpty!12492) mapIsEmpty!12492))

(assert (= (and b!344627 (not condMapEmpty!12492)) mapNonEmpty!12492))

(get-info :version)

(assert (= (and mapNonEmpty!12492 ((_ is ValueCellFull!3341) mapValue!12492)) b!344624))

(assert (= (and b!344627 ((_ is ValueCellFull!3341) mapDefault!12492)) b!344630))

(assert (= start!34480 b!344627))

(declare-fun m!346461 () Bool)

(assert (=> mapNonEmpty!12492 m!346461))

(declare-fun m!346463 () Bool)

(assert (=> b!344632 m!346463))

(declare-fun m!346465 () Bool)

(assert (=> b!344628 m!346465))

(declare-fun m!346467 () Bool)

(assert (=> b!344626 m!346467))

(declare-fun m!346469 () Bool)

(assert (=> b!344625 m!346469))

(declare-fun m!346471 () Bool)

(assert (=> start!34480 m!346471))

(declare-fun m!346473 () Bool)

(assert (=> start!34480 m!346473))

(declare-fun m!346475 () Bool)

(assert (=> start!34480 m!346475))

(declare-fun m!346477 () Bool)

(assert (=> b!344629 m!346477))

(assert (=> b!344629 m!346477))

(declare-fun m!346479 () Bool)

(assert (=> b!344629 m!346479))

(check-sat (not b!344628) tp_is_empty!7369 (not start!34480) (not b!344626) b_and!14639 (not b!344629) (not b!344625) (not mapNonEmpty!12492) (not b!344632) (not b_next!7417))
(check-sat b_and!14639 (not b_next!7417))
