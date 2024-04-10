; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34806 () Bool)

(assert start!34806)

(declare-fun b_free!7591 () Bool)

(declare-fun b_next!7591 () Bool)

(assert (=> start!34806 (= b_free!7591 (not b_next!7591))))

(declare-fun tp!26340 () Bool)

(declare-fun b_and!14813 () Bool)

(assert (=> start!34806 (= tp!26340 b_and!14813)))

(declare-fun b!348311 () Bool)

(declare-fun res!192926 () Bool)

(declare-fun e!213412 () Bool)

(assert (=> b!348311 (=> (not res!192926) (not e!213412))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11035 0))(
  ( (V!11036 (val!3816 Int)) )
))
(declare-fun zeroValue!1467 () V!11035)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18673 0))(
  ( (array!18674 (arr!8846 (Array (_ BitVec 32) (_ BitVec 64))) (size!9198 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18673)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11035)

(declare-datatypes ((ValueCell!3428 0))(
  ( (ValueCellFull!3428 (v!5999 V!11035)) (EmptyCell!3428) )
))
(declare-datatypes ((array!18675 0))(
  ( (array!18676 (arr!8847 (Array (_ BitVec 32) ValueCell!3428)) (size!9199 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18675)

(declare-datatypes ((tuple2!5518 0))(
  ( (tuple2!5519 (_1!2770 (_ BitVec 64)) (_2!2770 V!11035)) )
))
(declare-datatypes ((List!5140 0))(
  ( (Nil!5137) (Cons!5136 (h!5992 tuple2!5518) (t!10270 List!5140)) )
))
(declare-datatypes ((ListLongMap!4431 0))(
  ( (ListLongMap!4432 (toList!2231 List!5140)) )
))
(declare-fun contains!2296 (ListLongMap!4431 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1752 (array!18673 array!18675 (_ BitVec 32) (_ BitVec 32) V!11035 V!11035 (_ BitVec 32) Int) ListLongMap!4431)

(assert (=> b!348311 (= res!192926 (not (contains!2296 (getCurrentListMap!1752 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!348312 () Bool)

(declare-fun e!213415 () Bool)

(declare-fun e!213416 () Bool)

(declare-fun mapRes!12774 () Bool)

(assert (=> b!348312 (= e!213415 (and e!213416 mapRes!12774))))

(declare-fun condMapEmpty!12774 () Bool)

(declare-fun mapDefault!12774 () ValueCell!3428)

