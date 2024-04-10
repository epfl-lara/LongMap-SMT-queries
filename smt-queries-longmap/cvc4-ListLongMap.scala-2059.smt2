; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35526 () Bool)

(assert start!35526)

(declare-fun b!356006 () Bool)

(declare-fun e!218140 () Bool)

(declare-fun e!218138 () Bool)

(declare-fun mapRes!13476 () Bool)

(assert (=> b!356006 (= e!218140 (and e!218138 mapRes!13476))))

(declare-fun condMapEmpty!13476 () Bool)

(declare-datatypes ((V!11615 0))(
  ( (V!11616 (val!4034 Int)) )
))
(declare-datatypes ((ValueCell!3646 0))(
  ( (ValueCellFull!3646 (v!6228 V!11615)) (EmptyCell!3646) )
))
(declare-datatypes ((array!19533 0))(
  ( (array!19534 (arr!9260 (Array (_ BitVec 32) ValueCell!3646)) (size!9612 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19533)

(declare-fun mapDefault!13476 () ValueCell!3646)

