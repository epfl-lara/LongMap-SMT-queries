; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34334 () Bool)

(assert start!34334)

(declare-fun b_free!7309 () Bool)

(declare-fun b_next!7309 () Bool)

(assert (=> start!34334 (= b_free!7309 (not b_next!7309))))

(declare-fun tp!25466 () Bool)

(declare-fun b_and!14513 () Bool)

(assert (=> start!34334 (= tp!25466 b_and!14513)))

(declare-fun b!342803 () Bool)

(declare-datatypes ((Unit!10689 0))(
  ( (Unit!10690) )
))
(declare-fun e!210210 () Unit!10689)

(declare-fun Unit!10691 () Unit!10689)

(assert (=> b!342803 (= e!210210 Unit!10691)))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10659 0))(
  ( (V!10660 (val!3675 Int)) )
))
(declare-fun zeroValue!1467 () V!10659)

(declare-fun lt!162250 () Unit!10689)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3287 0))(
  ( (ValueCellFull!3287 (v!5849 V!10659)) (EmptyCell!3287) )
))
(declare-datatypes ((array!18113 0))(
  ( (array!18114 (arr!8575 (Array (_ BitVec 32) ValueCell!3287)) (size!8927 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18113)

(declare-datatypes ((array!18115 0))(
  ( (array!18116 (arr!8576 (Array (_ BitVec 32) (_ BitVec 64))) (size!8928 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18115)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10659)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun lemmaArrayContainsKeyThenInListMap!307 (array!18115 array!18113 (_ BitVec 32) (_ BitVec 32) V!10659 V!10659 (_ BitVec 64) (_ BitVec 32) Int) Unit!10689)

(declare-fun arrayScanForKey!0 (array!18115 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342803 (= lt!162250 (lemmaArrayContainsKeyThenInListMap!307 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342803 false))

(declare-fun b!342804 () Bool)

(declare-fun e!210206 () Bool)

(declare-fun e!210208 () Bool)

(assert (=> b!342804 (= e!210206 e!210208)))

(declare-fun res!189500 () Bool)

(assert (=> b!342804 (=> (not res!189500) (not e!210208))))

(declare-datatypes ((SeekEntryResult!3308 0))(
  ( (MissingZero!3308 (index!15411 (_ BitVec 32))) (Found!3308 (index!15412 (_ BitVec 32))) (Intermediate!3308 (undefined!4120 Bool) (index!15413 (_ BitVec 32)) (x!34130 (_ BitVec 32))) (Undefined!3308) (MissingVacant!3308 (index!15414 (_ BitVec 32))) )
))
(declare-fun lt!162249 () SeekEntryResult!3308)

(assert (=> b!342804 (= res!189500 (and (not (is-Found!3308 lt!162249)) (not (is-MissingZero!3308 lt!162249)) (is-MissingVacant!3308 lt!162249)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18115 (_ BitVec 32)) SeekEntryResult!3308)

(assert (=> b!342804 (= lt!162249 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!342805 () Bool)

(declare-fun Unit!10692 () Unit!10689)

(assert (=> b!342805 (= e!210210 Unit!10692)))

(declare-fun b!342806 () Bool)

(declare-fun e!210207 () Bool)

(declare-fun tp_is_empty!7261 () Bool)

(assert (=> b!342806 (= e!210207 tp_is_empty!7261)))

(declare-fun b!342807 () Bool)

(declare-fun res!189503 () Bool)

(assert (=> b!342807 (=> (not res!189503) (not e!210206))))

(declare-datatypes ((List!4944 0))(
  ( (Nil!4941) (Cons!4940 (h!5796 (_ BitVec 64)) (t!10056 List!4944)) )
))
(declare-fun arrayNoDuplicates!0 (array!18115 (_ BitVec 32) List!4944) Bool)

(assert (=> b!342807 (= res!189503 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4941))))

(declare-fun b!342808 () Bool)

(declare-fun e!210209 () Bool)

(declare-fun mapRes!12324 () Bool)

(assert (=> b!342808 (= e!210209 (and e!210207 mapRes!12324))))

(declare-fun condMapEmpty!12324 () Bool)

(declare-fun mapDefault!12324 () ValueCell!3287)

