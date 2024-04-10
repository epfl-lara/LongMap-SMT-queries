; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34062 () Bool)

(assert start!34062)

(declare-fun b_free!7141 () Bool)

(declare-fun b_next!7141 () Bool)

(assert (=> start!34062 (= b_free!7141 (not b_next!7141))))

(declare-fun tp!24948 () Bool)

(declare-fun b_and!14335 () Bool)

(assert (=> start!34062 (= tp!24948 b_and!14335)))

(declare-fun b!339330 () Bool)

(declare-fun e!208194 () Bool)

(declare-fun tp_is_empty!7093 () Bool)

(assert (=> b!339330 (= e!208194 tp_is_empty!7093)))

(declare-fun b!339331 () Bool)

(declare-datatypes ((Unit!10562 0))(
  ( (Unit!10563) )
))
(declare-fun e!208192 () Unit!10562)

(declare-fun Unit!10564 () Unit!10562)

(assert (=> b!339331 (= e!208192 Unit!10564)))

(declare-fun b!339332 () Bool)

(declare-fun res!187427 () Bool)

(declare-fun e!208195 () Bool)

(assert (=> b!339332 (=> (not res!187427) (not e!208195))))

(declare-datatypes ((array!17785 0))(
  ( (array!17786 (arr!8416 (Array (_ BitVec 32) (_ BitVec 64))) (size!8768 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17785)

(declare-datatypes ((List!4830 0))(
  ( (Nil!4827) (Cons!4826 (h!5682 (_ BitVec 64)) (t!9932 List!4830)) )
))
(declare-fun arrayNoDuplicates!0 (array!17785 (_ BitVec 32) List!4830) Bool)

(assert (=> b!339332 (= res!187427 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4827))))

(declare-fun b!339333 () Bool)

(declare-fun res!187425 () Bool)

(assert (=> b!339333 (=> (not res!187425) (not e!208195))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10435 0))(
  ( (V!10436 (val!3591 Int)) )
))
(declare-datatypes ((ValueCell!3203 0))(
  ( (ValueCellFull!3203 (v!5760 V!10435)) (EmptyCell!3203) )
))
(declare-datatypes ((array!17787 0))(
  ( (array!17788 (arr!8417 (Array (_ BitVec 32) ValueCell!3203)) (size!8769 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17787)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339333 (= res!187425 (and (= (size!8769 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8768 _keys!1895) (size!8769 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12057 () Bool)

(declare-fun mapRes!12057 () Bool)

(assert (=> mapIsEmpty!12057 mapRes!12057))

(declare-fun res!187422 () Bool)

(assert (=> start!34062 (=> (not res!187422) (not e!208195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34062 (= res!187422 (validMask!0 mask!2385))))

(assert (=> start!34062 e!208195))

(assert (=> start!34062 true))

(assert (=> start!34062 tp_is_empty!7093))

(assert (=> start!34062 tp!24948))

(declare-fun e!208193 () Bool)

(declare-fun array_inv!6238 (array!17787) Bool)

(assert (=> start!34062 (and (array_inv!6238 _values!1525) e!208193)))

(declare-fun array_inv!6239 (array!17785) Bool)

(assert (=> start!34062 (array_inv!6239 _keys!1895)))

(declare-fun b!339334 () Bool)

(declare-fun e!208196 () Bool)

(assert (=> b!339334 (= e!208195 e!208196)))

(declare-fun res!187426 () Bool)

(assert (=> b!339334 (=> (not res!187426) (not e!208196))))

(declare-datatypes ((SeekEntryResult!3251 0))(
  ( (MissingZero!3251 (index!15183 (_ BitVec 32))) (Found!3251 (index!15184 (_ BitVec 32))) (Intermediate!3251 (undefined!4063 Bool) (index!15185 (_ BitVec 32)) (x!33799 (_ BitVec 32))) (Undefined!3251) (MissingVacant!3251 (index!15186 (_ BitVec 32))) )
))
(declare-fun lt!161181 () SeekEntryResult!3251)

(assert (=> b!339334 (= res!187426 (and (not (is-Found!3251 lt!161181)) (is-MissingZero!3251 lt!161181)))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17785 (_ BitVec 32)) SeekEntryResult!3251)

(assert (=> b!339334 (= lt!161181 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!339335 () Bool)

(declare-fun res!187423 () Bool)

(assert (=> b!339335 (=> (not res!187423) (not e!208195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339335 (= res!187423 (validKeyInArray!0 k!1348))))

(declare-fun b!339336 () Bool)

(declare-fun res!187424 () Bool)

(assert (=> b!339336 (=> (not res!187424) (not e!208195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17785 (_ BitVec 32)) Bool)

(assert (=> b!339336 (= res!187424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339337 () Bool)

(declare-fun res!187421 () Bool)

(assert (=> b!339337 (=> (not res!187421) (not e!208195))))

(declare-fun zeroValue!1467 () V!10435)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10435)

(declare-datatypes ((tuple2!5212 0))(
  ( (tuple2!5213 (_1!2617 (_ BitVec 64)) (_2!2617 V!10435)) )
))
(declare-datatypes ((List!4831 0))(
  ( (Nil!4828) (Cons!4827 (h!5683 tuple2!5212) (t!9933 List!4831)) )
))
(declare-datatypes ((ListLongMap!4125 0))(
  ( (ListLongMap!4126 (toList!2078 List!4831)) )
))
(declare-fun contains!2129 (ListLongMap!4125 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1599 (array!17785 array!17787 (_ BitVec 32) (_ BitVec 32) V!10435 V!10435 (_ BitVec 32) Int) ListLongMap!4125)

(assert (=> b!339337 (= res!187421 (not (contains!2129 (getCurrentListMap!1599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!339338 () Bool)

(assert (=> b!339338 (= e!208193 (and e!208194 mapRes!12057))))

(declare-fun condMapEmpty!12057 () Bool)

(declare-fun mapDefault!12057 () ValueCell!3203)

