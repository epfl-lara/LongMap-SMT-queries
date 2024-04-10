; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34230 () Bool)

(assert start!34230)

(declare-fun b_free!7253 () Bool)

(declare-fun b_next!7253 () Bool)

(assert (=> start!34230 (= b_free!7253 (not b_next!7253))))

(declare-fun tp!25293 () Bool)

(declare-fun b_and!14453 () Bool)

(assert (=> start!34230 (= tp!25293 b_and!14453)))

(declare-fun b!341518 () Bool)

(declare-fun res!188809 () Bool)

(declare-fun e!209441 () Bool)

(assert (=> b!341518 (=> (not res!188809) (not e!209441))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10583 0))(
  ( (V!10584 (val!3647 Int)) )
))
(declare-fun zeroValue!1467 () V!10583)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3259 0))(
  ( (ValueCellFull!3259 (v!5819 V!10583)) (EmptyCell!3259) )
))
(declare-datatypes ((array!18003 0))(
  ( (array!18004 (arr!8522 (Array (_ BitVec 32) ValueCell!3259)) (size!8874 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18003)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10583)

(declare-datatypes ((array!18005 0))(
  ( (array!18006 (arr!8523 (Array (_ BitVec 32) (_ BitVec 64))) (size!8875 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18005)

(declare-datatypes ((tuple2!5286 0))(
  ( (tuple2!5287 (_1!2654 (_ BitVec 64)) (_2!2654 V!10583)) )
))
(declare-datatypes ((List!4904 0))(
  ( (Nil!4901) (Cons!4900 (h!5756 tuple2!5286) (t!10012 List!4904)) )
))
(declare-datatypes ((ListLongMap!4199 0))(
  ( (ListLongMap!4200 (toList!2115 List!4904)) )
))
(declare-fun contains!2169 (ListLongMap!4199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1636 (array!18005 array!18003 (_ BitVec 32) (_ BitVec 32) V!10583 V!10583 (_ BitVec 32) Int) ListLongMap!4199)

(assert (=> b!341518 (= res!188809 (not (contains!2169 (getCurrentListMap!1636 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapNonEmpty!12234 () Bool)

(declare-fun mapRes!12234 () Bool)

(declare-fun tp!25292 () Bool)

(declare-fun e!209437 () Bool)

(assert (=> mapNonEmpty!12234 (= mapRes!12234 (and tp!25292 e!209437))))

(declare-fun mapValue!12234 () ValueCell!3259)

(declare-fun mapRest!12234 () (Array (_ BitVec 32) ValueCell!3259))

(declare-fun mapKey!12234 () (_ BitVec 32))

(assert (=> mapNonEmpty!12234 (= (arr!8522 _values!1525) (store mapRest!12234 mapKey!12234 mapValue!12234))))

(declare-fun b!341520 () Bool)

(declare-fun res!188812 () Bool)

(assert (=> b!341520 (=> (not res!188812) (not e!209441))))

(assert (=> b!341520 (= res!188812 (and (= (size!8874 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8875 _keys!1895) (size!8874 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341521 () Bool)

(declare-fun res!188814 () Bool)

(assert (=> b!341521 (=> (not res!188814) (not e!209441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341521 (= res!188814 (validKeyInArray!0 k!1348))))

(declare-fun b!341522 () Bool)

(declare-fun res!188811 () Bool)

(assert (=> b!341522 (=> (not res!188811) (not e!209441))))

(declare-datatypes ((List!4905 0))(
  ( (Nil!4902) (Cons!4901 (h!5757 (_ BitVec 64)) (t!10013 List!4905)) )
))
(declare-fun arrayNoDuplicates!0 (array!18005 (_ BitVec 32) List!4905) Bool)

(assert (=> b!341522 (= res!188811 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4902))))

(declare-fun b!341523 () Bool)

(declare-fun e!209439 () Bool)

(assert (=> b!341523 (= e!209441 e!209439)))

(declare-fun res!188813 () Bool)

(assert (=> b!341523 (=> (not res!188813) (not e!209439))))

(declare-datatypes ((SeekEntryResult!3291 0))(
  ( (MissingZero!3291 (index!15343 (_ BitVec 32))) (Found!3291 (index!15344 (_ BitVec 32))) (Intermediate!3291 (undefined!4103 Bool) (index!15345 (_ BitVec 32)) (x!34013 (_ BitVec 32))) (Undefined!3291) (MissingVacant!3291 (index!15346 (_ BitVec 32))) )
))
(declare-fun lt!161785 () SeekEntryResult!3291)

(assert (=> b!341523 (= res!188813 (and (not (is-Found!3291 lt!161785)) (not (is-MissingZero!3291 lt!161785)) (is-MissingVacant!3291 lt!161785)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18005 (_ BitVec 32)) SeekEntryResult!3291)

(assert (=> b!341523 (= lt!161785 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!341524 () Bool)

(declare-fun e!209440 () Bool)

(declare-fun tp_is_empty!7205 () Bool)

(assert (=> b!341524 (= e!209440 tp_is_empty!7205)))

(declare-fun b!341525 () Bool)

(assert (=> b!341525 (= e!209437 tp_is_empty!7205)))

(declare-fun b!341526 () Bool)

(declare-fun res!188816 () Bool)

(assert (=> b!341526 (=> (not res!188816) (not e!209439))))

(declare-fun arrayContainsKey!0 (array!18005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341526 (= res!188816 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!341527 () Bool)

(declare-fun e!209442 () Bool)

(assert (=> b!341527 (= e!209442 (and e!209440 mapRes!12234))))

(declare-fun condMapEmpty!12234 () Bool)

(declare-fun mapDefault!12234 () ValueCell!3259)

