; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34500 () Bool)

(assert start!34500)

(declare-fun b_free!7423 () Bool)

(declare-fun b_next!7423 () Bool)

(assert (=> start!34500 (= b_free!7423 (not b_next!7423))))

(declare-fun tp!25814 () Bool)

(declare-fun b_and!14631 () Bool)

(assert (=> start!34500 (= tp!25814 b_and!14631)))

(declare-fun mapNonEmpty!12501 () Bool)

(declare-fun mapRes!12501 () Bool)

(declare-fun tp!25815 () Bool)

(declare-fun e!211325 () Bool)

(assert (=> mapNonEmpty!12501 (= mapRes!12501 (and tp!25815 e!211325))))

(declare-fun mapKey!12501 () (_ BitVec 32))

(declare-datatypes ((V!10811 0))(
  ( (V!10812 (val!3732 Int)) )
))
(declare-datatypes ((ValueCell!3344 0))(
  ( (ValueCellFull!3344 (v!5908 V!10811)) (EmptyCell!3344) )
))
(declare-fun mapRest!12501 () (Array (_ BitVec 32) ValueCell!3344))

(declare-datatypes ((array!18335 0))(
  ( (array!18336 (arr!8684 (Array (_ BitVec 32) ValueCell!3344)) (size!9036 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18335)

(declare-fun mapValue!12501 () ValueCell!3344)

(assert (=> mapNonEmpty!12501 (= (arr!8684 _values!1525) (store mapRest!12501 mapKey!12501 mapValue!12501))))

(declare-fun b!344759 () Bool)

(declare-fun res!190700 () Bool)

(declare-fun e!211327 () Bool)

(assert (=> b!344759 (=> (not res!190700) (not e!211327))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344759 (= res!190700 (validKeyInArray!0 k!1348))))

(declare-fun b!344760 () Bool)

(assert (=> b!344760 (= e!211327 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3347 0))(
  ( (MissingZero!3347 (index!15567 (_ BitVec 32))) (Found!3347 (index!15568 (_ BitVec 32))) (Intermediate!3347 (undefined!4159 Bool) (index!15569 (_ BitVec 32)) (x!34341 (_ BitVec 32))) (Undefined!3347) (MissingVacant!3347 (index!15570 (_ BitVec 32))) )
))
(declare-fun lt!162709 () SeekEntryResult!3347)

(declare-datatypes ((array!18337 0))(
  ( (array!18338 (arr!8685 (Array (_ BitVec 32) (_ BitVec 64))) (size!9037 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18337)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18337 (_ BitVec 32)) SeekEntryResult!3347)

(assert (=> b!344760 (= lt!162709 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!344761 () Bool)

(declare-fun res!190698 () Bool)

(assert (=> b!344761 (=> (not res!190698) (not e!211327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18337 (_ BitVec 32)) Bool)

(assert (=> b!344761 (= res!190698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344762 () Bool)

(declare-fun e!211329 () Bool)

(declare-fun e!211326 () Bool)

(assert (=> b!344762 (= e!211329 (and e!211326 mapRes!12501))))

(declare-fun condMapEmpty!12501 () Bool)

(declare-fun mapDefault!12501 () ValueCell!3344)

