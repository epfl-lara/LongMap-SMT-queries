; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34694 () Bool)

(assert start!34694)

(declare-fun b_free!7501 () Bool)

(declare-fun b_next!7501 () Bool)

(assert (=> start!34694 (= b_free!7501 (not b_next!7501))))

(declare-fun tp!26066 () Bool)

(declare-fun b_and!14721 () Bool)

(assert (=> start!34694 (= tp!26066 b_and!14721)))

(declare-fun b!346682 () Bool)

(declare-fun res!191779 () Bool)

(declare-fun e!212468 () Bool)

(assert (=> b!346682 (=> (not res!191779) (not e!212468))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3379 0))(
  ( (MissingZero!3379 (index!15695 (_ BitVec 32))) (Found!3379 (index!15696 (_ BitVec 32))) (Intermediate!3379 (undefined!4191 Bool) (index!15697 (_ BitVec 32)) (x!34537 (_ BitVec 32))) (Undefined!3379) (MissingVacant!3379 (index!15698 (_ BitVec 32))) )
))
(declare-fun lt!163414 () SeekEntryResult!3379)

(declare-datatypes ((array!18499 0))(
  ( (array!18500 (arr!8760 (Array (_ BitVec 32) (_ BitVec 64))) (size!9112 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18499)

(declare-fun arrayContainsKey!0 (array!18499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346682 (= res!191779 (arrayContainsKey!0 _keys!1895 k!1348 (index!15696 lt!163414)))))

(declare-fun b!346683 () Bool)

(declare-fun res!191782 () Bool)

(declare-fun e!212467 () Bool)

(assert (=> b!346683 (=> (not res!191782) (not e!212467))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10915 0))(
  ( (V!10916 (val!3771 Int)) )
))
(declare-fun zeroValue!1467 () V!10915)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3383 0))(
  ( (ValueCellFull!3383 (v!5953 V!10915)) (EmptyCell!3383) )
))
(declare-datatypes ((array!18501 0))(
  ( (array!18502 (arr!8761 (Array (_ BitVec 32) ValueCell!3383)) (size!9113 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18501)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10915)

(declare-datatypes ((tuple2!5456 0))(
  ( (tuple2!5457 (_1!2739 (_ BitVec 64)) (_2!2739 V!10915)) )
))
(declare-datatypes ((List!5079 0))(
  ( (Nil!5076) (Cons!5075 (h!5931 tuple2!5456) (t!10207 List!5079)) )
))
(declare-datatypes ((ListLongMap!4369 0))(
  ( (ListLongMap!4370 (toList!2200 List!5079)) )
))
(declare-fun contains!2264 (ListLongMap!4369 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1721 (array!18499 array!18501 (_ BitVec 32) (_ BitVec 32) V!10915 V!10915 (_ BitVec 32) Int) ListLongMap!4369)

(assert (=> b!346683 (= res!191782 (not (contains!2264 (getCurrentListMap!1721 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!346684 () Bool)

(declare-fun e!212470 () Bool)

(declare-fun tp_is_empty!7453 () Bool)

(assert (=> b!346684 (= e!212470 tp_is_empty!7453)))

(declare-fun mapNonEmpty!12636 () Bool)

(declare-fun mapRes!12636 () Bool)

(declare-fun tp!26067 () Bool)

(declare-fun e!212471 () Bool)

(assert (=> mapNonEmpty!12636 (= mapRes!12636 (and tp!26067 e!212471))))

(declare-fun mapKey!12636 () (_ BitVec 32))

(declare-fun mapRest!12636 () (Array (_ BitVec 32) ValueCell!3383))

(declare-fun mapValue!12636 () ValueCell!3383)

(assert (=> mapNonEmpty!12636 (= (arr!8761 _values!1525) (store mapRest!12636 mapKey!12636 mapValue!12636))))

(declare-fun b!346686 () Bool)

(declare-fun res!191780 () Bool)

(assert (=> b!346686 (=> (not res!191780) (not e!212467))))

(assert (=> b!346686 (= res!191780 (and (= (size!9113 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9112 _keys!1895) (size!9113 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12636 () Bool)

(assert (=> mapIsEmpty!12636 mapRes!12636))

(declare-fun b!346687 () Bool)

(declare-fun res!191784 () Bool)

(assert (=> b!346687 (=> (not res!191784) (not e!212467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18499 (_ BitVec 32)) Bool)

(assert (=> b!346687 (= res!191784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346685 () Bool)

(assert (=> b!346685 (= e!212467 e!212468)))

(declare-fun res!191781 () Bool)

(assert (=> b!346685 (=> (not res!191781) (not e!212468))))

(assert (=> b!346685 (= res!191781 (and (is-Found!3379 lt!163414) (= (select (arr!8760 _keys!1895) (index!15696 lt!163414)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18499 (_ BitVec 32)) SeekEntryResult!3379)

(assert (=> b!346685 (= lt!163414 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!191785 () Bool)

(assert (=> start!34694 (=> (not res!191785) (not e!212467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34694 (= res!191785 (validMask!0 mask!2385))))

(assert (=> start!34694 e!212467))

(assert (=> start!34694 true))

(assert (=> start!34694 tp_is_empty!7453))

(assert (=> start!34694 tp!26066))

(declare-fun e!212469 () Bool)

(declare-fun array_inv!6488 (array!18501) Bool)

(assert (=> start!34694 (and (array_inv!6488 _values!1525) e!212469)))

(declare-fun array_inv!6489 (array!18499) Bool)

(assert (=> start!34694 (array_inv!6489 _keys!1895)))

(declare-fun b!346688 () Bool)

(assert (=> b!346688 (= e!212471 tp_is_empty!7453)))

(declare-fun b!346689 () Bool)

(assert (=> b!346689 (= e!212468 (not true))))

(assert (=> b!346689 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10759 0))(
  ( (Unit!10760) )
))
(declare-fun lt!163413 () Unit!10759)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18499 (_ BitVec 64) (_ BitVec 32)) Unit!10759)

(assert (=> b!346689 (= lt!163413 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!15696 lt!163414)))))

(declare-fun b!346690 () Bool)

(declare-fun res!191783 () Bool)

(assert (=> b!346690 (=> (not res!191783) (not e!212467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346690 (= res!191783 (validKeyInArray!0 k!1348))))

(declare-fun b!346691 () Bool)

(assert (=> b!346691 (= e!212469 (and e!212470 mapRes!12636))))

(declare-fun condMapEmpty!12636 () Bool)

(declare-fun mapDefault!12636 () ValueCell!3383)

