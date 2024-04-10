; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40926 () Bool)

(assert start!40926)

(declare-fun b_free!10861 () Bool)

(declare-fun b_next!10861 () Bool)

(assert (=> start!40926 (= b_free!10861 (not b_next!10861))))

(declare-fun tp!38409 () Bool)

(declare-fun b_and!19003 () Bool)

(assert (=> start!40926 (= tp!38409 b_and!19003)))

(declare-fun b!454997 () Bool)

(declare-fun res!271212 () Bool)

(declare-fun e!266106 () Bool)

(assert (=> b!454997 (=> (not res!271212) (not e!266106))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454997 (= res!271212 (validMask!0 mask!1025))))

(declare-fun b!454998 () Bool)

(declare-fun res!271223 () Bool)

(assert (=> b!454998 (=> (not res!271223) (not e!266106))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28201 0))(
  ( (array!28202 (arr!13544 (Array (_ BitVec 32) (_ BitVec 64))) (size!13896 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28201)

(assert (=> b!454998 (= res!271223 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13896 _keys!709))))))

(declare-fun b!454999 () Bool)

(declare-fun res!271222 () Bool)

(declare-fun e!266105 () Bool)

(assert (=> b!454999 (=> (not res!271222) (not e!266105))))

(declare-fun lt!206248 () array!28201)

(declare-datatypes ((List!8158 0))(
  ( (Nil!8155) (Cons!8154 (h!9010 (_ BitVec 64)) (t!13986 List!8158)) )
))
(declare-fun arrayNoDuplicates!0 (array!28201 (_ BitVec 32) List!8158) Bool)

(assert (=> b!454999 (= res!271222 (arrayNoDuplicates!0 lt!206248 #b00000000000000000000000000000000 Nil!8155))))

(declare-fun mapNonEmpty!19939 () Bool)

(declare-fun mapRes!19939 () Bool)

(declare-fun tp!38410 () Bool)

(declare-fun e!266107 () Bool)

(assert (=> mapNonEmpty!19939 (= mapRes!19939 (and tp!38410 e!266107))))

(declare-datatypes ((V!17371 0))(
  ( (V!17372 (val!6144 Int)) )
))
(declare-datatypes ((ValueCell!5756 0))(
  ( (ValueCellFull!5756 (v!8410 V!17371)) (EmptyCell!5756) )
))
(declare-fun mapRest!19939 () (Array (_ BitVec 32) ValueCell!5756))

(declare-fun mapKey!19939 () (_ BitVec 32))

(declare-datatypes ((array!28203 0))(
  ( (array!28204 (arr!13545 (Array (_ BitVec 32) ValueCell!5756)) (size!13897 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28203)

(declare-fun mapValue!19939 () ValueCell!5756)

(assert (=> mapNonEmpty!19939 (= (arr!13545 _values!549) (store mapRest!19939 mapKey!19939 mapValue!19939))))

(declare-fun b!455000 () Bool)

(declare-fun e!266104 () Bool)

(declare-fun e!266103 () Bool)

(assert (=> b!455000 (= e!266104 (and e!266103 mapRes!19939))))

(declare-fun condMapEmpty!19939 () Bool)

(declare-fun mapDefault!19939 () ValueCell!5756)

