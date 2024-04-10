; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34812 () Bool)

(assert start!34812)

(declare-fun b_free!7597 () Bool)

(declare-fun b_next!7597 () Bool)

(assert (=> start!34812 (= b_free!7597 (not b_next!7597))))

(declare-fun tp!26357 () Bool)

(declare-fun b_and!14819 () Bool)

(assert (=> start!34812 (= tp!26357 b_and!14819)))

(declare-fun b!348410 () Bool)

(declare-fun res!192997 () Bool)

(declare-fun e!213467 () Bool)

(assert (=> b!348410 (=> (not res!192997) (not e!213467))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11043 0))(
  ( (V!11044 (val!3819 Int)) )
))
(declare-fun zeroValue!1467 () V!11043)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3431 0))(
  ( (ValueCellFull!3431 (v!6002 V!11043)) (EmptyCell!3431) )
))
(declare-datatypes ((array!18685 0))(
  ( (array!18686 (arr!8852 (Array (_ BitVec 32) ValueCell!3431)) (size!9204 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18685)

(declare-datatypes ((array!18687 0))(
  ( (array!18688 (arr!8853 (Array (_ BitVec 32) (_ BitVec 64))) (size!9205 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18687)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11043)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((tuple2!5522 0))(
  ( (tuple2!5523 (_1!2772 (_ BitVec 64)) (_2!2772 V!11043)) )
))
(declare-datatypes ((List!5143 0))(
  ( (Nil!5140) (Cons!5139 (h!5995 tuple2!5522) (t!10273 List!5143)) )
))
(declare-datatypes ((ListLongMap!4435 0))(
  ( (ListLongMap!4436 (toList!2233 List!5143)) )
))
(declare-fun contains!2298 (ListLongMap!4435 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1754 (array!18687 array!18685 (_ BitVec 32) (_ BitVec 32) V!11043 V!11043 (_ BitVec 32) Int) ListLongMap!4435)

(assert (=> b!348410 (= res!192997 (not (contains!2298 (getCurrentListMap!1754 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!348411 () Bool)

(declare-fun res!192998 () Bool)

(declare-fun e!213470 () Bool)

(assert (=> b!348411 (=> (not res!192998) (not e!213470))))

(declare-fun arrayContainsKey!0 (array!18687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348411 (= res!192998 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348412 () Bool)

(declare-fun res!192995 () Bool)

(assert (=> b!348412 (=> (not res!192995) (not e!213467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348412 (= res!192995 (validKeyInArray!0 k!1348))))

(declare-fun b!348413 () Bool)

(declare-fun e!213466 () Bool)

(declare-fun e!213469 () Bool)

(declare-fun mapRes!12783 () Bool)

(assert (=> b!348413 (= e!213466 (and e!213469 mapRes!12783))))

(declare-fun condMapEmpty!12783 () Bool)

(declare-fun mapDefault!12783 () ValueCell!3431)

