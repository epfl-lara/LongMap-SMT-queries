; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34110 () Bool)

(assert start!34110)

(declare-fun b_free!7171 () Bool)

(declare-fun b_next!7171 () Bool)

(assert (=> start!34110 (= b_free!7171 (not b_next!7171))))

(declare-fun tp!25040 () Bool)

(declare-fun b_and!14367 () Bool)

(assert (=> start!34110 (= tp!25040 b_and!14367)))

(declare-fun b!339938 () Bool)

(declare-fun e!208549 () Bool)

(declare-datatypes ((SeekEntryResult!3263 0))(
  ( (MissingZero!3263 (index!15231 (_ BitVec 32))) (Found!3263 (index!15232 (_ BitVec 32))) (Intermediate!3263 (undefined!4075 Bool) (index!15233 (_ BitVec 32)) (x!33861 (_ BitVec 32))) (Undefined!3263) (MissingVacant!3263 (index!15234 (_ BitVec 32))) )
))
(declare-fun lt!161371 () SeekEntryResult!3263)

(declare-datatypes ((array!17847 0))(
  ( (array!17848 (arr!8446 (Array (_ BitVec 32) (_ BitVec 64))) (size!8798 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17847)

(assert (=> b!339938 (= e!208549 (and (not (is-Found!3263 lt!161371)) (not (is-MissingZero!3263 lt!161371)) (is-MissingVacant!3263 lt!161371) (bvslt #b00000000000000000000000000000000 (size!8798 _keys!1895)) (bvsge (size!8798 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17847 (_ BitVec 32)) SeekEntryResult!3263)

(assert (=> b!339938 (= lt!161371 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!339939 () Bool)

(declare-fun e!208550 () Bool)

(declare-fun tp_is_empty!7123 () Bool)

(assert (=> b!339939 (= e!208550 tp_is_empty!7123)))

(declare-fun b!339940 () Bool)

(declare-fun res!187761 () Bool)

(assert (=> b!339940 (=> (not res!187761) (not e!208549))))

(declare-datatypes ((V!10475 0))(
  ( (V!10476 (val!3606 Int)) )
))
(declare-datatypes ((ValueCell!3218 0))(
  ( (ValueCellFull!3218 (v!5776 V!10475)) (EmptyCell!3218) )
))
(declare-datatypes ((array!17849 0))(
  ( (array!17850 (arr!8447 (Array (_ BitVec 32) ValueCell!3218)) (size!8799 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17849)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339940 (= res!187761 (and (= (size!8799 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8798 _keys!1895) (size!8799 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339941 () Bool)

(declare-fun res!187765 () Bool)

(assert (=> b!339941 (=> (not res!187765) (not e!208549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17847 (_ BitVec 32)) Bool)

(assert (=> b!339941 (= res!187765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339942 () Bool)

(declare-fun e!208548 () Bool)

(declare-fun e!208551 () Bool)

(declare-fun mapRes!12105 () Bool)

(assert (=> b!339942 (= e!208548 (and e!208551 mapRes!12105))))

(declare-fun condMapEmpty!12105 () Bool)

(declare-fun mapDefault!12105 () ValueCell!3218)

