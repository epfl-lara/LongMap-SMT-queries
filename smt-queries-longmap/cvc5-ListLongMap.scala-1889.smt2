; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33804 () Bool)

(assert start!33804)

(declare-fun b_free!7003 () Bool)

(declare-fun b_next!7003 () Bool)

(assert (=> start!33804 (= b_free!7003 (not b_next!7003))))

(declare-fun tp!24518 () Bool)

(declare-fun b_and!14187 () Bool)

(assert (=> start!33804 (= tp!24518 b_and!14187)))

(declare-fun b!336254 () Bool)

(declare-fun res!185585 () Bool)

(declare-fun e!206403 () Bool)

(assert (=> b!336254 (=> (not res!185585) (not e!206403))))

(declare-datatypes ((array!17507 0))(
  ( (array!17508 (arr!8282 (Array (_ BitVec 32) (_ BitVec 64))) (size!8634 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17507)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336254 (= res!185585 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!336255 () Bool)

(declare-fun res!185587 () Bool)

(declare-fun e!206402 () Bool)

(assert (=> b!336255 (=> (not res!185587) (not e!206402))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10251 0))(
  ( (V!10252 (val!3522 Int)) )
))
(declare-fun zeroValue!1467 () V!10251)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3134 0))(
  ( (ValueCellFull!3134 (v!5686 V!10251)) (EmptyCell!3134) )
))
(declare-datatypes ((array!17509 0))(
  ( (array!17510 (arr!8283 (Array (_ BitVec 32) ValueCell!3134)) (size!8635 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17509)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10251)

(declare-datatypes ((tuple2!5116 0))(
  ( (tuple2!5117 (_1!2569 (_ BitVec 64)) (_2!2569 V!10251)) )
))
(declare-datatypes ((List!4733 0))(
  ( (Nil!4730) (Cons!4729 (h!5585 tuple2!5116) (t!9825 List!4733)) )
))
(declare-datatypes ((ListLongMap!4029 0))(
  ( (ListLongMap!4030 (toList!2030 List!4733)) )
))
(declare-fun contains!2076 (ListLongMap!4029 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1551 (array!17507 array!17509 (_ BitVec 32) (_ BitVec 32) V!10251 V!10251 (_ BitVec 32) Int) ListLongMap!4029)

(assert (=> b!336255 (= res!185587 (not (contains!2076 (getCurrentListMap!1551 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapIsEmpty!11835 () Bool)

(declare-fun mapRes!11835 () Bool)

(assert (=> mapIsEmpty!11835 mapRes!11835))

(declare-fun b!336256 () Bool)

(declare-fun e!206404 () Bool)

(declare-fun e!206405 () Bool)

(assert (=> b!336256 (= e!206404 (and e!206405 mapRes!11835))))

(declare-fun condMapEmpty!11835 () Bool)

(declare-fun mapDefault!11835 () ValueCell!3134)

