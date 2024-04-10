; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35108 () Bool)

(assert start!35108)

(declare-fun b_free!7753 () Bool)

(declare-fun b_next!7753 () Bool)

(assert (=> start!35108 (= b_free!7753 (not b_next!7753))))

(declare-fun tp!26844 () Bool)

(declare-fun b_and!14987 () Bool)

(assert (=> start!35108 (= tp!26844 b_and!14987)))

(declare-fun b!351968 () Bool)

(declare-fun e!215534 () Bool)

(declare-fun e!215536 () Bool)

(assert (=> b!351968 (= e!215534 e!215536)))

(declare-fun res!195197 () Bool)

(assert (=> b!351968 (=> (not res!195197) (not e!215536))))

(declare-datatypes ((SeekEntryResult!3464 0))(
  ( (MissingZero!3464 (index!16035 (_ BitVec 32))) (Found!3464 (index!16036 (_ BitVec 32))) (Intermediate!3464 (undefined!4276 Bool) (index!16037 (_ BitVec 32)) (x!35028 (_ BitVec 32))) (Undefined!3464) (MissingVacant!3464 (index!16038 (_ BitVec 32))) )
))
(declare-fun lt!165024 () SeekEntryResult!3464)

(assert (=> b!351968 (= res!195197 (and (not (is-Found!3464 lt!165024)) (not (is-MissingZero!3464 lt!165024)) (is-MissingVacant!3464 lt!165024)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18999 0))(
  ( (array!19000 (arr!9003 (Array (_ BitVec 32) (_ BitVec 64))) (size!9355 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18999)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18999 (_ BitVec 32)) SeekEntryResult!3464)

(assert (=> b!351968 (= lt!165024 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!351969 () Bool)

(declare-fun e!215538 () Bool)

(declare-fun e!215532 () Bool)

(declare-fun mapRes!13035 () Bool)

(assert (=> b!351969 (= e!215538 (and e!215532 mapRes!13035))))

(declare-fun condMapEmpty!13035 () Bool)

(declare-datatypes ((V!11251 0))(
  ( (V!11252 (val!3897 Int)) )
))
(declare-datatypes ((ValueCell!3509 0))(
  ( (ValueCellFull!3509 (v!6086 V!11251)) (EmptyCell!3509) )
))
(declare-datatypes ((array!19001 0))(
  ( (array!19002 (arr!9004 (Array (_ BitVec 32) ValueCell!3509)) (size!9356 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19001)

(declare-fun mapDefault!13035 () ValueCell!3509)

