; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34090 () Bool)

(assert start!34090)

(declare-fun b_free!7169 () Bool)

(declare-fun b_next!7169 () Bool)

(assert (=> start!34090 (= b_free!7169 (not b_next!7169))))

(declare-fun tp!25031 () Bool)

(declare-fun b_and!14363 () Bool)

(assert (=> start!34090 (= tp!25031 b_and!14363)))

(declare-fun mapIsEmpty!12099 () Bool)

(declare-fun mapRes!12099 () Bool)

(assert (=> mapIsEmpty!12099 mapRes!12099))

(declare-fun b!339783 () Bool)

(declare-fun e!208451 () Bool)

(declare-datatypes ((SeekEntryResult!3262 0))(
  ( (MissingZero!3262 (index!15227 (_ BitVec 32))) (Found!3262 (index!15228 (_ BitVec 32))) (Intermediate!3262 (undefined!4074 Bool) (index!15229 (_ BitVec 32)) (x!33842 (_ BitVec 32))) (Undefined!3262) (MissingVacant!3262 (index!15230 (_ BitVec 32))) )
))
(declare-fun lt!161272 () SeekEntryResult!3262)

(declare-datatypes ((array!17841 0))(
  ( (array!17842 (arr!8444 (Array (_ BitVec 32) (_ BitVec 64))) (size!8796 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17841)

(assert (=> b!339783 (= e!208451 (and (not (is-Found!3262 lt!161272)) (not (is-MissingZero!3262 lt!161272)) (is-MissingVacant!3262 lt!161272) (bvsge #b00000000000000000000000000000000 (size!8796 _keys!1895))))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17841 (_ BitVec 32)) SeekEntryResult!3262)

(assert (=> b!339783 (= lt!161272 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12099 () Bool)

(declare-fun tp!25032 () Bool)

(declare-fun e!208455 () Bool)

(assert (=> mapNonEmpty!12099 (= mapRes!12099 (and tp!25032 e!208455))))

(declare-datatypes ((V!10471 0))(
  ( (V!10472 (val!3605 Int)) )
))
(declare-datatypes ((ValueCell!3217 0))(
  ( (ValueCellFull!3217 (v!5774 V!10471)) (EmptyCell!3217) )
))
(declare-fun mapRest!12099 () (Array (_ BitVec 32) ValueCell!3217))

(declare-fun mapKey!12099 () (_ BitVec 32))

(declare-datatypes ((array!17843 0))(
  ( (array!17844 (arr!8445 (Array (_ BitVec 32) ValueCell!3217)) (size!8797 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17843)

(declare-fun mapValue!12099 () ValueCell!3217)

(assert (=> mapNonEmpty!12099 (= (arr!8445 _values!1525) (store mapRest!12099 mapKey!12099 mapValue!12099))))

(declare-fun b!339784 () Bool)

(declare-fun res!187698 () Bool)

(assert (=> b!339784 (=> (not res!187698) (not e!208451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17841 (_ BitVec 32)) Bool)

(assert (=> b!339784 (= res!187698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339785 () Bool)

(declare-fun e!208453 () Bool)

(declare-fun e!208452 () Bool)

(assert (=> b!339785 (= e!208453 (and e!208452 mapRes!12099))))

(declare-fun condMapEmpty!12099 () Bool)

(declare-fun mapDefault!12099 () ValueCell!3217)

