; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34426 () Bool)

(assert start!34426)

(declare-fun b_free!7363 () Bool)

(declare-fun b_next!7363 () Bool)

(assert (=> start!34426 (= b_free!7363 (not b_next!7363))))

(declare-fun tp!25634 () Bool)

(declare-fun b_and!14545 () Bool)

(assert (=> start!34426 (= tp!25634 b_and!14545)))

(declare-fun b!343673 () Bool)

(declare-fun e!210699 () Bool)

(declare-fun tp_is_empty!7315 () Bool)

(assert (=> b!343673 (= e!210699 tp_is_empty!7315)))

(declare-fun b!343674 () Bool)

(declare-fun res!190032 () Bool)

(declare-fun e!210702 () Bool)

(assert (=> b!343674 (=> (not res!190032) (not e!210702))))

(declare-datatypes ((array!18213 0))(
  ( (array!18214 (arr!8623 (Array (_ BitVec 32) (_ BitVec 64))) (size!8976 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18213)

(declare-datatypes ((List!4936 0))(
  ( (Nil!4933) (Cons!4932 (h!5788 (_ BitVec 64)) (t!10043 List!4936)) )
))
(declare-fun arrayNoDuplicates!0 (array!18213 (_ BitVec 32) List!4936) Bool)

(assert (=> b!343674 (= res!190032 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4933))))

(declare-fun b!343675 () Bool)

(declare-fun res!190034 () Bool)

(assert (=> b!343675 (=> (not res!190034) (not e!210702))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343675 (= res!190034 (validKeyInArray!0 k0!1348))))

(declare-fun b!343676 () Bool)

(declare-fun res!190030 () Bool)

(assert (=> b!343676 (=> (not res!190030) (not e!210702))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18213 (_ BitVec 32)) Bool)

(assert (=> b!343676 (= res!190030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12411 () Bool)

(declare-fun mapRes!12411 () Bool)

(declare-fun tp!25635 () Bool)

(declare-fun e!210701 () Bool)

(assert (=> mapNonEmpty!12411 (= mapRes!12411 (and tp!25635 e!210701))))

(declare-datatypes ((V!10731 0))(
  ( (V!10732 (val!3702 Int)) )
))
(declare-datatypes ((ValueCell!3314 0))(
  ( (ValueCellFull!3314 (v!5872 V!10731)) (EmptyCell!3314) )
))
(declare-fun mapValue!12411 () ValueCell!3314)

(declare-datatypes ((array!18215 0))(
  ( (array!18216 (arr!8624 (Array (_ BitVec 32) ValueCell!3314)) (size!8977 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18215)

(declare-fun mapRest!12411 () (Array (_ BitVec 32) ValueCell!3314))

(declare-fun mapKey!12411 () (_ BitVec 32))

(assert (=> mapNonEmpty!12411 (= (arr!8624 _values!1525) (store mapRest!12411 mapKey!12411 mapValue!12411))))

(declare-fun mapIsEmpty!12411 () Bool)

(assert (=> mapIsEmpty!12411 mapRes!12411))

(declare-fun res!190031 () Bool)

(assert (=> start!34426 (=> (not res!190031) (not e!210702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34426 (= res!190031 (validMask!0 mask!2385))))

(assert (=> start!34426 e!210702))

(assert (=> start!34426 true))

(assert (=> start!34426 tp_is_empty!7315))

(assert (=> start!34426 tp!25634))

(declare-fun e!210700 () Bool)

(declare-fun array_inv!6408 (array!18215) Bool)

(assert (=> start!34426 (and (array_inv!6408 _values!1525) e!210700)))

(declare-fun array_inv!6409 (array!18213) Bool)

(assert (=> start!34426 (array_inv!6409 _keys!1895)))

(declare-fun b!343677 () Bool)

(assert (=> b!343677 (= e!210701 tp_is_empty!7315)))

(declare-fun b!343678 () Bool)

(assert (=> b!343678 (= e!210702 false)))

(declare-datatypes ((SeekEntryResult!3324 0))(
  ( (MissingZero!3324 (index!15475 (_ BitVec 32))) (Found!3324 (index!15476 (_ BitVec 32))) (Intermediate!3324 (undefined!4136 Bool) (index!15477 (_ BitVec 32)) (x!34233 (_ BitVec 32))) (Undefined!3324) (MissingVacant!3324 (index!15478 (_ BitVec 32))) )
))
(declare-fun lt!162384 () SeekEntryResult!3324)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18213 (_ BitVec 32)) SeekEntryResult!3324)

(assert (=> b!343678 (= lt!162384 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343679 () Bool)

(assert (=> b!343679 (= e!210700 (and e!210699 mapRes!12411))))

(declare-fun condMapEmpty!12411 () Bool)

(declare-fun mapDefault!12411 () ValueCell!3314)

(assert (=> b!343679 (= condMapEmpty!12411 (= (arr!8624 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3314)) mapDefault!12411)))))

(declare-fun b!343680 () Bool)

(declare-fun res!190029 () Bool)

(assert (=> b!343680 (=> (not res!190029) (not e!210702))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343680 (= res!190029 (and (= (size!8977 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8976 _keys!1895) (size!8977 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343681 () Bool)

(declare-fun res!190033 () Bool)

(assert (=> b!343681 (=> (not res!190033) (not e!210702))))

(declare-fun zeroValue!1467 () V!10731)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10731)

(declare-datatypes ((tuple2!5312 0))(
  ( (tuple2!5313 (_1!2667 (_ BitVec 64)) (_2!2667 V!10731)) )
))
(declare-datatypes ((List!4937 0))(
  ( (Nil!4934) (Cons!4933 (h!5789 tuple2!5312) (t!10044 List!4937)) )
))
(declare-datatypes ((ListLongMap!4215 0))(
  ( (ListLongMap!4216 (toList!2123 List!4937)) )
))
(declare-fun contains!2192 (ListLongMap!4215 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1629 (array!18213 array!18215 (_ BitVec 32) (_ BitVec 32) V!10731 V!10731 (_ BitVec 32) Int) ListLongMap!4215)

(assert (=> b!343681 (= res!190033 (not (contains!2192 (getCurrentListMap!1629 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34426 res!190031) b!343680))

(assert (= (and b!343680 res!190029) b!343676))

(assert (= (and b!343676 res!190030) b!343674))

(assert (= (and b!343674 res!190032) b!343675))

(assert (= (and b!343675 res!190034) b!343681))

(assert (= (and b!343681 res!190033) b!343678))

(assert (= (and b!343679 condMapEmpty!12411) mapIsEmpty!12411))

(assert (= (and b!343679 (not condMapEmpty!12411)) mapNonEmpty!12411))

(get-info :version)

(assert (= (and mapNonEmpty!12411 ((_ is ValueCellFull!3314) mapValue!12411)) b!343677))

(assert (= (and b!343679 ((_ is ValueCellFull!3314) mapDefault!12411)) b!343673))

(assert (= start!34426 b!343679))

(declare-fun m!344967 () Bool)

(assert (=> start!34426 m!344967))

(declare-fun m!344969 () Bool)

(assert (=> start!34426 m!344969))

(declare-fun m!344971 () Bool)

(assert (=> start!34426 m!344971))

(declare-fun m!344973 () Bool)

(assert (=> b!343676 m!344973))

(declare-fun m!344975 () Bool)

(assert (=> b!343681 m!344975))

(assert (=> b!343681 m!344975))

(declare-fun m!344977 () Bool)

(assert (=> b!343681 m!344977))

(declare-fun m!344979 () Bool)

(assert (=> b!343675 m!344979))

(declare-fun m!344981 () Bool)

(assert (=> b!343674 m!344981))

(declare-fun m!344983 () Bool)

(assert (=> mapNonEmpty!12411 m!344983))

(declare-fun m!344985 () Bool)

(assert (=> b!343678 m!344985))

(check-sat (not b!343678) (not b!343674) (not b!343681) (not start!34426) b_and!14545 tp_is_empty!7315 (not mapNonEmpty!12411) (not b!343675) (not b!343676) (not b_next!7363))
(check-sat b_and!14545 (not b_next!7363))
