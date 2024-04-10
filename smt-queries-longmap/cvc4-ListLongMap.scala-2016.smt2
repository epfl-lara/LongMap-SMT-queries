; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35150 () Bool)

(assert start!35150)

(declare-fun b_free!7769 () Bool)

(declare-fun b_next!7769 () Bool)

(assert (=> start!35150 (= b_free!7769 (not b_next!7769))))

(declare-fun tp!26894 () Bool)

(declare-fun b_and!15005 () Bool)

(assert (=> start!35150 (= tp!26894 b_and!15005)))

(declare-fun b!352445 () Bool)

(declare-datatypes ((Unit!10903 0))(
  ( (Unit!10904) )
))
(declare-fun e!215830 () Unit!10903)

(declare-fun Unit!10905 () Unit!10903)

(assert (=> b!352445 (= e!215830 Unit!10905)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11271 0))(
  ( (V!11272 (val!3905 Int)) )
))
(declare-fun zeroValue!1467 () V!11271)

(declare-fun lt!165214 () Unit!10903)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3517 0))(
  ( (ValueCellFull!3517 (v!6095 V!11271)) (EmptyCell!3517) )
))
(declare-datatypes ((array!19031 0))(
  ( (array!19032 (arr!9018 (Array (_ BitVec 32) ValueCell!3517)) (size!9370 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19031)

(declare-datatypes ((array!19033 0))(
  ( (array!19034 (arr!9019 (Array (_ BitVec 32) (_ BitVec 64))) (size!9371 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19033)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11271)

(declare-fun lemmaArrayContainsKeyThenInListMap!336 (array!19033 array!19031 (_ BitVec 32) (_ BitVec 32) V!11271 V!11271 (_ BitVec 64) (_ BitVec 32) Int) Unit!10903)

(declare-fun arrayScanForKey!0 (array!19033 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!352445 (= lt!165214 (lemmaArrayContainsKeyThenInListMap!336 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!352445 false))

(declare-fun b!352446 () Bool)

(declare-fun e!215824 () Bool)

(declare-fun e!215832 () Bool)

(declare-fun mapRes!13062 () Bool)

(assert (=> b!352446 (= e!215824 (and e!215832 mapRes!13062))))

(declare-fun condMapEmpty!13062 () Bool)

(declare-fun mapDefault!13062 () ValueCell!3517)

