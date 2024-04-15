; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35008 () Bool)

(assert start!35008)

(declare-fun b_free!7711 () Bool)

(declare-fun b_next!7711 () Bool)

(assert (=> start!35008 (= b_free!7711 (not b_next!7711))))

(declare-fun tp!26711 () Bool)

(declare-fun b_and!14915 () Bool)

(assert (=> start!35008 (= tp!26711 b_and!14915)))

(declare-fun b!350700 () Bool)

(declare-fun e!214779 () Bool)

(assert (=> b!350700 (= e!214779 false)))

(declare-fun lt!164444 () (_ BitVec 32))

(declare-datatypes ((array!18893 0))(
  ( (array!18894 (arr!8952 (Array (_ BitVec 32) (_ BitVec 64))) (size!9305 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18893)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18893 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350700 (= lt!164444 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12966 () Bool)

(declare-fun mapRes!12966 () Bool)

(assert (=> mapIsEmpty!12966 mapRes!12966))

(declare-fun b!350701 () Bool)

(declare-fun res!194462 () Bool)

(declare-fun e!214778 () Bool)

(assert (=> b!350701 (=> (not res!194462) (not e!214778))))

(declare-datatypes ((List!5181 0))(
  ( (Nil!5178) (Cons!5177 (h!6033 (_ BitVec 64)) (t!10310 List!5181)) )
))
(declare-fun arrayNoDuplicates!0 (array!18893 (_ BitVec 32) List!5181) Bool)

(assert (=> b!350701 (= res!194462 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5178))))

(declare-fun b!350702 () Bool)

(declare-fun res!194461 () Bool)

(assert (=> b!350702 (=> (not res!194461) (not e!214778))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11195 0))(
  ( (V!11196 (val!3876 Int)) )
))
(declare-fun zeroValue!1467 () V!11195)

(declare-datatypes ((ValueCell!3488 0))(
  ( (ValueCellFull!3488 (v!6057 V!11195)) (EmptyCell!3488) )
))
(declare-datatypes ((array!18895 0))(
  ( (array!18896 (arr!8953 (Array (_ BitVec 32) ValueCell!3488)) (size!9306 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18895)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11195)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5566 0))(
  ( (tuple2!5567 (_1!2794 (_ BitVec 64)) (_2!2794 V!11195)) )
))
(declare-datatypes ((List!5182 0))(
  ( (Nil!5179) (Cons!5178 (h!6034 tuple2!5566) (t!10311 List!5182)) )
))
(declare-datatypes ((ListLongMap!4469 0))(
  ( (ListLongMap!4470 (toList!2250 List!5182)) )
))
(declare-fun contains!2330 (ListLongMap!4469 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1755 (array!18893 array!18895 (_ BitVec 32) (_ BitVec 32) V!11195 V!11195 (_ BitVec 32) Int) ListLongMap!4469)

(assert (=> b!350702 (= res!194461 (not (contains!2330 (getCurrentListMap!1755 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350703 () Bool)

(declare-fun res!194456 () Bool)

(assert (=> b!350703 (=> (not res!194456) (not e!214778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18893 (_ BitVec 32)) Bool)

(assert (=> b!350703 (= res!194456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350704 () Bool)

(declare-fun res!194463 () Bool)

(assert (=> b!350704 (=> (not res!194463) (not e!214779))))

(declare-fun arrayContainsKey!0 (array!18893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350704 (= res!194463 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350705 () Bool)

(declare-fun e!214781 () Bool)

(declare-fun tp_is_empty!7663 () Bool)

(assert (=> b!350705 (= e!214781 tp_is_empty!7663)))

(declare-fun b!350706 () Bool)

(declare-fun e!214780 () Bool)

(declare-fun e!214776 () Bool)

(assert (=> b!350706 (= e!214780 (and e!214776 mapRes!12966))))

(declare-fun condMapEmpty!12966 () Bool)

(declare-fun mapDefault!12966 () ValueCell!3488)

(assert (=> b!350706 (= condMapEmpty!12966 (= (arr!8953 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3488)) mapDefault!12966)))))

(declare-fun b!350707 () Bool)

(assert (=> b!350707 (= e!214778 e!214779)))

(declare-fun res!194458 () Bool)

(assert (=> b!350707 (=> (not res!194458) (not e!214779))))

(declare-datatypes ((SeekEntryResult!3449 0))(
  ( (MissingZero!3449 (index!15975 (_ BitVec 32))) (Found!3449 (index!15976 (_ BitVec 32))) (Intermediate!3449 (undefined!4261 Bool) (index!15977 (_ BitVec 32)) (x!34932 (_ BitVec 32))) (Undefined!3449) (MissingVacant!3449 (index!15978 (_ BitVec 32))) )
))
(declare-fun lt!164445 () SeekEntryResult!3449)

(get-info :version)

(assert (=> b!350707 (= res!194458 (and (not ((_ is Found!3449) lt!164445)) (not ((_ is MissingZero!3449) lt!164445)) ((_ is MissingVacant!3449) lt!164445)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18893 (_ BitVec 32)) SeekEntryResult!3449)

(assert (=> b!350707 (= lt!164445 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350708 () Bool)

(declare-fun res!194459 () Bool)

(assert (=> b!350708 (=> (not res!194459) (not e!214778))))

(assert (=> b!350708 (= res!194459 (and (= (size!9306 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9305 _keys!1895) (size!9306 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350709 () Bool)

(declare-fun res!194457 () Bool)

(assert (=> b!350709 (=> (not res!194457) (not e!214778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350709 (= res!194457 (validKeyInArray!0 k0!1348))))

(declare-fun b!350710 () Bool)

(assert (=> b!350710 (= e!214776 tp_is_empty!7663)))

(declare-fun res!194460 () Bool)

(assert (=> start!35008 (=> (not res!194460) (not e!214778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35008 (= res!194460 (validMask!0 mask!2385))))

(assert (=> start!35008 e!214778))

(assert (=> start!35008 true))

(assert (=> start!35008 tp_is_empty!7663))

(assert (=> start!35008 tp!26711))

(declare-fun array_inv!6632 (array!18895) Bool)

(assert (=> start!35008 (and (array_inv!6632 _values!1525) e!214780)))

(declare-fun array_inv!6633 (array!18893) Bool)

(assert (=> start!35008 (array_inv!6633 _keys!1895)))

(declare-fun mapNonEmpty!12966 () Bool)

(declare-fun tp!26712 () Bool)

(assert (=> mapNonEmpty!12966 (= mapRes!12966 (and tp!26712 e!214781))))

(declare-fun mapKey!12966 () (_ BitVec 32))

(declare-fun mapRest!12966 () (Array (_ BitVec 32) ValueCell!3488))

(declare-fun mapValue!12966 () ValueCell!3488)

(assert (=> mapNonEmpty!12966 (= (arr!8953 _values!1525) (store mapRest!12966 mapKey!12966 mapValue!12966))))

(assert (= (and start!35008 res!194460) b!350708))

(assert (= (and b!350708 res!194459) b!350703))

(assert (= (and b!350703 res!194456) b!350701))

(assert (= (and b!350701 res!194462) b!350709))

(assert (= (and b!350709 res!194457) b!350702))

(assert (= (and b!350702 res!194461) b!350707))

(assert (= (and b!350707 res!194458) b!350704))

(assert (= (and b!350704 res!194463) b!350700))

(assert (= (and b!350706 condMapEmpty!12966) mapIsEmpty!12966))

(assert (= (and b!350706 (not condMapEmpty!12966)) mapNonEmpty!12966))

(assert (= (and mapNonEmpty!12966 ((_ is ValueCellFull!3488) mapValue!12966)) b!350705))

(assert (= (and b!350706 ((_ is ValueCellFull!3488) mapDefault!12966)) b!350710))

(assert (= start!35008 b!350706))

(declare-fun m!350295 () Bool)

(assert (=> b!350701 m!350295))

(declare-fun m!350297 () Bool)

(assert (=> mapNonEmpty!12966 m!350297))

(declare-fun m!350299 () Bool)

(assert (=> b!350700 m!350299))

(declare-fun m!350301 () Bool)

(assert (=> b!350709 m!350301))

(declare-fun m!350303 () Bool)

(assert (=> start!35008 m!350303))

(declare-fun m!350305 () Bool)

(assert (=> start!35008 m!350305))

(declare-fun m!350307 () Bool)

(assert (=> start!35008 m!350307))

(declare-fun m!350309 () Bool)

(assert (=> b!350707 m!350309))

(declare-fun m!350311 () Bool)

(assert (=> b!350702 m!350311))

(assert (=> b!350702 m!350311))

(declare-fun m!350313 () Bool)

(assert (=> b!350702 m!350313))

(declare-fun m!350315 () Bool)

(assert (=> b!350704 m!350315))

(declare-fun m!350317 () Bool)

(assert (=> b!350703 m!350317))

(check-sat (not b!350709) (not mapNonEmpty!12966) (not b!350707) (not b!350700) (not start!35008) (not b!350704) (not b!350703) tp_is_empty!7663 (not b_next!7711) b_and!14915 (not b!350701) (not b!350702))
(check-sat b_and!14915 (not b_next!7711))
