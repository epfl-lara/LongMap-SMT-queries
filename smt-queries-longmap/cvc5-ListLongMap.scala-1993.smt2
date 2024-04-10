; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34842 () Bool)

(assert start!34842)

(declare-fun b_free!7627 () Bool)

(declare-fun b_next!7627 () Bool)

(assert (=> start!34842 (= b_free!7627 (not b_next!7627))))

(declare-fun tp!26447 () Bool)

(declare-fun b_and!14849 () Bool)

(assert (=> start!34842 (= tp!26447 b_and!14849)))

(declare-fun b!348905 () Bool)

(declare-fun res!193359 () Bool)

(declare-fun e!213737 () Bool)

(assert (=> b!348905 (=> (not res!193359) (not e!213737))))

(declare-datatypes ((array!18743 0))(
  ( (array!18744 (arr!8881 (Array (_ BitVec 32) (_ BitVec 64))) (size!9233 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18743)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348905 (= res!193359 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348906 () Bool)

(declare-fun e!213735 () Bool)

(declare-fun e!213736 () Bool)

(declare-fun mapRes!12828 () Bool)

(assert (=> b!348906 (= e!213735 (and e!213736 mapRes!12828))))

(declare-fun condMapEmpty!12828 () Bool)

(declare-datatypes ((V!11083 0))(
  ( (V!11084 (val!3834 Int)) )
))
(declare-datatypes ((ValueCell!3446 0))(
  ( (ValueCellFull!3446 (v!6017 V!11083)) (EmptyCell!3446) )
))
(declare-datatypes ((array!18745 0))(
  ( (array!18746 (arr!8882 (Array (_ BitVec 32) ValueCell!3446)) (size!9234 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18745)

(declare-fun mapDefault!12828 () ValueCell!3446)

