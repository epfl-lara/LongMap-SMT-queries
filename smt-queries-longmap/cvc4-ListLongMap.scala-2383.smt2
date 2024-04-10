; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37764 () Bool)

(assert start!37764)

(declare-fun b_free!8867 () Bool)

(declare-fun b_next!8867 () Bool)

(assert (=> start!37764 (= b_free!8867 (not b_next!8867))))

(declare-fun tp!31352 () Bool)

(declare-fun b_and!16109 () Bool)

(assert (=> start!37764 (= tp!31352 b_and!16109)))

(declare-fun b!387611 () Bool)

(declare-fun e!234974 () Bool)

(declare-fun e!234970 () Bool)

(assert (=> b!387611 (= e!234974 e!234970)))

(declare-fun res!221508 () Bool)

(assert (=> b!387611 (=> (not res!221508) (not e!234970))))

(declare-datatypes ((array!22969 0))(
  ( (array!22970 (arr!10953 (Array (_ BitVec 32) (_ BitVec 64))) (size!11305 (_ BitVec 32))) )
))
(declare-fun lt!182078 () array!22969)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22969 (_ BitVec 32)) Bool)

(assert (=> b!387611 (= res!221508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182078 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!22969)

(assert (=> b!387611 (= lt!182078 (array!22970 (store (arr!10953 _keys!658) i!548 k!778) (size!11305 _keys!658)))))

(declare-fun b!387612 () Bool)

(declare-fun e!234972 () Bool)

(declare-fun tp_is_empty!9539 () Bool)

(assert (=> b!387612 (= e!234972 tp_is_empty!9539)))

(declare-fun b!387613 () Bool)

(declare-fun res!221511 () Bool)

(assert (=> b!387613 (=> (not res!221511) (not e!234974))))

(assert (=> b!387613 (= res!221511 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11305 _keys!658))))))

(declare-fun b!387614 () Bool)

(declare-fun e!234969 () Bool)

(declare-fun mapRes!15873 () Bool)

(assert (=> b!387614 (= e!234969 (and e!234972 mapRes!15873))))

(declare-fun condMapEmpty!15873 () Bool)

(declare-datatypes ((V!13823 0))(
  ( (V!13824 (val!4814 Int)) )
))
(declare-datatypes ((ValueCell!4426 0))(
  ( (ValueCellFull!4426 (v!7011 V!13823)) (EmptyCell!4426) )
))
(declare-datatypes ((array!22971 0))(
  ( (array!22972 (arr!10954 (Array (_ BitVec 32) ValueCell!4426)) (size!11306 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22971)

(declare-fun mapDefault!15873 () ValueCell!4426)

