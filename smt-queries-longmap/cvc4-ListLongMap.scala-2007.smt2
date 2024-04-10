; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35026 () Bool)

(assert start!35026)

(declare-fun b_free!7715 () Bool)

(declare-fun b_next!7715 () Bool)

(assert (=> start!35026 (= b_free!7715 (not b_next!7715))))

(declare-fun tp!26724 () Bool)

(declare-fun b_and!14945 () Bool)

(assert (=> start!35026 (= tp!26724 b_and!14945)))

(declare-fun b!351041 () Bool)

(declare-fun e!214988 () Bool)

(declare-fun e!214991 () Bool)

(assert (=> b!351041 (= e!214988 e!214991)))

(declare-fun res!194636 () Bool)

(assert (=> b!351041 (=> (not res!194636) (not e!214991))))

(declare-datatypes ((SeekEntryResult!3450 0))(
  ( (MissingZero!3450 (index!15979 (_ BitVec 32))) (Found!3450 (index!15980 (_ BitVec 32))) (Intermediate!3450 (undefined!4262 Bool) (index!15981 (_ BitVec 32)) (x!34938 (_ BitVec 32))) (Undefined!3450) (MissingVacant!3450 (index!15982 (_ BitVec 32))) )
))
(declare-fun lt!164691 () SeekEntryResult!3450)

(assert (=> b!351041 (= res!194636 (and (not (is-Found!3450 lt!164691)) (not (is-MissingZero!3450 lt!164691)) (is-MissingVacant!3450 lt!164691)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18921 0))(
  ( (array!18922 (arr!8966 (Array (_ BitVec 32) (_ BitVec 64))) (size!9318 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18921)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18921 (_ BitVec 32)) SeekEntryResult!3450)

(assert (=> b!351041 (= lt!164691 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12972 () Bool)

(declare-fun mapRes!12972 () Bool)

(declare-fun tp!26723 () Bool)

(declare-fun e!214993 () Bool)

(assert (=> mapNonEmpty!12972 (= mapRes!12972 (and tp!26723 e!214993))))

(declare-fun mapKey!12972 () (_ BitVec 32))

(declare-datatypes ((V!11199 0))(
  ( (V!11200 (val!3878 Int)) )
))
(declare-datatypes ((ValueCell!3490 0))(
  ( (ValueCellFull!3490 (v!6065 V!11199)) (EmptyCell!3490) )
))
(declare-fun mapRest!12972 () (Array (_ BitVec 32) ValueCell!3490))

(declare-datatypes ((array!18923 0))(
  ( (array!18924 (arr!8967 (Array (_ BitVec 32) ValueCell!3490)) (size!9319 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18923)

(declare-fun mapValue!12972 () ValueCell!3490)

(assert (=> mapNonEmpty!12972 (= (arr!8967 _values!1525) (store mapRest!12972 mapKey!12972 mapValue!12972))))

(declare-fun b!351042 () Bool)

(declare-fun e!214989 () Bool)

(declare-fun e!214990 () Bool)

(assert (=> b!351042 (= e!214989 (and e!214990 mapRes!12972))))

(declare-fun condMapEmpty!12972 () Bool)

(declare-fun mapDefault!12972 () ValueCell!3490)

