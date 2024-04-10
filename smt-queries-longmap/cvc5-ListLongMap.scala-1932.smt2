; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34238 () Bool)

(assert start!34238)

(declare-fun b_free!7261 () Bool)

(declare-fun b_next!7261 () Bool)

(assert (=> start!34238 (= b_free!7261 (not b_next!7261))))

(declare-fun tp!25317 () Bool)

(declare-fun b_and!14461 () Bool)

(assert (=> start!34238 (= tp!25317 b_and!14461)))

(declare-fun b!341661 () Bool)

(declare-fun res!188900 () Bool)

(declare-fun e!209526 () Bool)

(assert (=> b!341661 (=> (not res!188900) (not e!209526))))

(declare-datatypes ((array!18019 0))(
  ( (array!18020 (arr!8530 (Array (_ BitVec 32) (_ BitVec 64))) (size!8882 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18019)

(declare-datatypes ((List!4908 0))(
  ( (Nil!4905) (Cons!4904 (h!5760 (_ BitVec 64)) (t!10016 List!4908)) )
))
(declare-fun arrayNoDuplicates!0 (array!18019 (_ BitVec 32) List!4908) Bool)

(assert (=> b!341661 (= res!188900 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4905))))

(declare-fun b!341662 () Bool)

(declare-fun e!209524 () Bool)

(declare-fun e!209521 () Bool)

(declare-fun mapRes!12246 () Bool)

(assert (=> b!341662 (= e!209524 (and e!209521 mapRes!12246))))

(declare-fun condMapEmpty!12246 () Bool)

(declare-datatypes ((V!10595 0))(
  ( (V!10596 (val!3651 Int)) )
))
(declare-datatypes ((ValueCell!3263 0))(
  ( (ValueCellFull!3263 (v!5823 V!10595)) (EmptyCell!3263) )
))
(declare-datatypes ((array!18021 0))(
  ( (array!18022 (arr!8531 (Array (_ BitVec 32) ValueCell!3263)) (size!8883 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18021)

(declare-fun mapDefault!12246 () ValueCell!3263)

