; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34668 () Bool)

(assert start!34668)

(declare-fun b_free!7489 () Bool)

(declare-fun b_next!7489 () Bool)

(assert (=> start!34668 (= b_free!7489 (not b_next!7489))))

(declare-fun tp!26031 () Bool)

(declare-fun b_and!14683 () Bool)

(assert (=> start!34668 (= tp!26031 b_and!14683)))

(declare-fun b!346223 () Bool)

(declare-fun res!191523 () Bool)

(declare-fun e!212190 () Bool)

(assert (=> b!346223 (=> (not res!191523) (not e!212190))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346223 (= res!191523 (validKeyInArray!0 k0!1348))))

(declare-fun b!346224 () Bool)

(declare-fun res!191520 () Bool)

(assert (=> b!346224 (=> (not res!191520) (not e!212190))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10899 0))(
  ( (V!10900 (val!3765 Int)) )
))
(declare-fun zeroValue!1467 () V!10899)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3377 0))(
  ( (ValueCellFull!3377 (v!5941 V!10899)) (EmptyCell!3377) )
))
(declare-datatypes ((array!18461 0))(
  ( (array!18462 (arr!8741 (Array (_ BitVec 32) ValueCell!3377)) (size!9094 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18461)

(declare-datatypes ((array!18463 0))(
  ( (array!18464 (arr!8742 (Array (_ BitVec 32) (_ BitVec 64))) (size!9095 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18463)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10899)

(declare-datatypes ((tuple2!5408 0))(
  ( (tuple2!5409 (_1!2715 (_ BitVec 64)) (_2!2715 V!10899)) )
))
(declare-datatypes ((List!5025 0))(
  ( (Nil!5022) (Cons!5021 (h!5877 tuple2!5408) (t!10144 List!5025)) )
))
(declare-datatypes ((ListLongMap!4311 0))(
  ( (ListLongMap!4312 (toList!2171 List!5025)) )
))
(declare-fun contains!2246 (ListLongMap!4311 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1677 (array!18463 array!18461 (_ BitVec 32) (_ BitVec 32) V!10899 V!10899 (_ BitVec 32) Int) ListLongMap!4311)

(assert (=> b!346224 (= res!191520 (not (contains!2246 (getCurrentListMap!1677 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!346225 () Bool)

(declare-fun e!212194 () Bool)

(declare-fun tp_is_empty!7441 () Bool)

(assert (=> b!346225 (= e!212194 tp_is_empty!7441)))

(declare-fun mapIsEmpty!12618 () Bool)

(declare-fun mapRes!12618 () Bool)

(assert (=> mapIsEmpty!12618 mapRes!12618))

(declare-fun b!346226 () Bool)

(assert (=> b!346226 (= e!212190 false)))

(declare-datatypes ((SeekEntryResult!3368 0))(
  ( (MissingZero!3368 (index!15651 (_ BitVec 32))) (Found!3368 (index!15652 (_ BitVec 32))) (Intermediate!3368 (undefined!4180 Bool) (index!15653 (_ BitVec 32)) (x!34505 (_ BitVec 32))) (Undefined!3368) (MissingVacant!3368 (index!15654 (_ BitVec 32))) )
))
(declare-fun lt!163149 () SeekEntryResult!3368)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18463 (_ BitVec 32)) SeekEntryResult!3368)

(assert (=> b!346226 (= lt!163149 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346228 () Bool)

(declare-fun res!191521 () Bool)

(assert (=> b!346228 (=> (not res!191521) (not e!212190))))

(declare-datatypes ((List!5026 0))(
  ( (Nil!5023) (Cons!5022 (h!5878 (_ BitVec 64)) (t!10145 List!5026)) )
))
(declare-fun arrayNoDuplicates!0 (array!18463 (_ BitVec 32) List!5026) Bool)

(assert (=> b!346228 (= res!191521 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5023))))

(declare-fun b!346229 () Bool)

(declare-fun res!191525 () Bool)

(assert (=> b!346229 (=> (not res!191525) (not e!212190))))

(assert (=> b!346229 (= res!191525 (and (= (size!9094 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9095 _keys!1895) (size!9094 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346230 () Bool)

(declare-fun e!212192 () Bool)

(assert (=> b!346230 (= e!212192 (and e!212194 mapRes!12618))))

(declare-fun condMapEmpty!12618 () Bool)

(declare-fun mapDefault!12618 () ValueCell!3377)

(assert (=> b!346230 (= condMapEmpty!12618 (= (arr!8741 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3377)) mapDefault!12618)))))

(declare-fun b!346227 () Bool)

(declare-fun e!212193 () Bool)

(assert (=> b!346227 (= e!212193 tp_is_empty!7441)))

(declare-fun res!191522 () Bool)

(assert (=> start!34668 (=> (not res!191522) (not e!212190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34668 (= res!191522 (validMask!0 mask!2385))))

(assert (=> start!34668 e!212190))

(assert (=> start!34668 true))

(assert (=> start!34668 tp_is_empty!7441))

(assert (=> start!34668 tp!26031))

(declare-fun array_inv!6496 (array!18461) Bool)

(assert (=> start!34668 (and (array_inv!6496 _values!1525) e!212192)))

(declare-fun array_inv!6497 (array!18463) Bool)

(assert (=> start!34668 (array_inv!6497 _keys!1895)))

(declare-fun b!346231 () Bool)

(declare-fun res!191524 () Bool)

(assert (=> b!346231 (=> (not res!191524) (not e!212190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18463 (_ BitVec 32)) Bool)

(assert (=> b!346231 (= res!191524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12618 () Bool)

(declare-fun tp!26030 () Bool)

(assert (=> mapNonEmpty!12618 (= mapRes!12618 (and tp!26030 e!212193))))

(declare-fun mapValue!12618 () ValueCell!3377)

(declare-fun mapRest!12618 () (Array (_ BitVec 32) ValueCell!3377))

(declare-fun mapKey!12618 () (_ BitVec 32))

(assert (=> mapNonEmpty!12618 (= (arr!8741 _values!1525) (store mapRest!12618 mapKey!12618 mapValue!12618))))

(assert (= (and start!34668 res!191522) b!346229))

(assert (= (and b!346229 res!191525) b!346231))

(assert (= (and b!346231 res!191524) b!346228))

(assert (= (and b!346228 res!191521) b!346223))

(assert (= (and b!346223 res!191523) b!346224))

(assert (= (and b!346224 res!191520) b!346226))

(assert (= (and b!346230 condMapEmpty!12618) mapIsEmpty!12618))

(assert (= (and b!346230 (not condMapEmpty!12618)) mapNonEmpty!12618))

(get-info :version)

(assert (= (and mapNonEmpty!12618 ((_ is ValueCellFull!3377) mapValue!12618)) b!346227))

(assert (= (and b!346230 ((_ is ValueCellFull!3377) mapDefault!12618)) b!346225))

(assert (= start!34668 b!346230))

(declare-fun m!346853 () Bool)

(assert (=> b!346226 m!346853))

(declare-fun m!346855 () Bool)

(assert (=> b!346231 m!346855))

(declare-fun m!346857 () Bool)

(assert (=> b!346228 m!346857))

(declare-fun m!346859 () Bool)

(assert (=> b!346224 m!346859))

(assert (=> b!346224 m!346859))

(declare-fun m!346861 () Bool)

(assert (=> b!346224 m!346861))

(declare-fun m!346863 () Bool)

(assert (=> b!346223 m!346863))

(declare-fun m!346865 () Bool)

(assert (=> mapNonEmpty!12618 m!346865))

(declare-fun m!346867 () Bool)

(assert (=> start!34668 m!346867))

(declare-fun m!346869 () Bool)

(assert (=> start!34668 m!346869))

(declare-fun m!346871 () Bool)

(assert (=> start!34668 m!346871))

(check-sat b_and!14683 (not b_next!7489) (not b!346223) (not start!34668) (not b!346224) (not b!346226) (not mapNonEmpty!12618) (not b!346231) (not b!346228) tp_is_empty!7441)
(check-sat b_and!14683 (not b_next!7489))
