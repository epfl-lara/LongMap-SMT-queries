; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33808 () Bool)

(assert start!33808)

(declare-fun b_free!7007 () Bool)

(declare-fun b_next!7007 () Bool)

(assert (=> start!33808 (= b_free!7007 (not b_next!7007))))

(declare-fun tp!24530 () Bool)

(declare-fun b_and!14191 () Bool)

(assert (=> start!33808 (= tp!24530 b_and!14191)))

(declare-fun b!336320 () Bool)

(declare-fun res!185634 () Bool)

(declare-fun e!206440 () Bool)

(assert (=> b!336320 (=> (not res!185634) (not e!206440))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10255 0))(
  ( (V!10256 (val!3524 Int)) )
))
(declare-fun zeroValue!1467 () V!10255)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3136 0))(
  ( (ValueCellFull!3136 (v!5688 V!10255)) (EmptyCell!3136) )
))
(declare-datatypes ((array!17515 0))(
  ( (array!17516 (arr!8286 (Array (_ BitVec 32) ValueCell!3136)) (size!8638 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17515)

(declare-datatypes ((array!17517 0))(
  ( (array!17518 (arr!8287 (Array (_ BitVec 32) (_ BitVec 64))) (size!8639 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17517)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10255)

(declare-datatypes ((tuple2!5120 0))(
  ( (tuple2!5121 (_1!2571 (_ BitVec 64)) (_2!2571 V!10255)) )
))
(declare-datatypes ((List!4736 0))(
  ( (Nil!4733) (Cons!4732 (h!5588 tuple2!5120) (t!9828 List!4736)) )
))
(declare-datatypes ((ListLongMap!4033 0))(
  ( (ListLongMap!4034 (toList!2032 List!4736)) )
))
(declare-fun contains!2078 (ListLongMap!4033 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1553 (array!17517 array!17515 (_ BitVec 32) (_ BitVec 32) V!10255 V!10255 (_ BitVec 32) Int) ListLongMap!4033)

(assert (=> b!336320 (= res!185634 (not (contains!2078 (getCurrentListMap!1553 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!336321 () Bool)

(declare-fun e!206437 () Bool)

(assert (=> b!336321 (= e!206440 e!206437)))

(declare-fun res!185635 () Bool)

(assert (=> b!336321 (=> (not res!185635) (not e!206437))))

(declare-datatypes ((SeekEntryResult!3202 0))(
  ( (MissingZero!3202 (index!14987 (_ BitVec 32))) (Found!3202 (index!14988 (_ BitVec 32))) (Intermediate!3202 (undefined!4014 Bool) (index!14989 (_ BitVec 32)) (x!33516 (_ BitVec 32))) (Undefined!3202) (MissingVacant!3202 (index!14990 (_ BitVec 32))) )
))
(declare-fun lt!160165 () SeekEntryResult!3202)

(assert (=> b!336321 (= res!185635 (and (not (is-Found!3202 lt!160165)) (is-MissingZero!3202 lt!160165)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17517 (_ BitVec 32)) SeekEntryResult!3202)

(assert (=> b!336321 (= lt!160165 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!336322 () Bool)

(declare-fun res!185637 () Bool)

(assert (=> b!336322 (=> (not res!185637) (not e!206440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336322 (= res!185637 (validKeyInArray!0 k!1348))))

(declare-fun b!336323 () Bool)

(declare-fun e!206439 () Bool)

(declare-fun e!206441 () Bool)

(declare-fun mapRes!11841 () Bool)

(assert (=> b!336323 (= e!206439 (and e!206441 mapRes!11841))))

(declare-fun condMapEmpty!11841 () Bool)

(declare-fun mapDefault!11841 () ValueCell!3136)

