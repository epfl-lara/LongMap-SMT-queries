; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37410 () Bool)

(assert start!37410)

(declare-fun b_free!8537 () Bool)

(declare-fun b_next!8537 () Bool)

(assert (=> start!37410 (= b_free!8537 (not b_next!8537))))

(declare-fun tp!30327 () Bool)

(declare-fun b_and!15779 () Bool)

(assert (=> start!37410 (= tp!30327 b_and!15779)))

(declare-fun b!380535 () Bool)

(declare-fun e!231439 () Bool)

(declare-fun tp_is_empty!9185 () Bool)

(assert (=> b!380535 (= e!231439 tp_is_empty!9185)))

(declare-fun b!380536 () Bool)

(declare-fun res!216033 () Bool)

(declare-fun e!231446 () Bool)

(assert (=> b!380536 (=> (not res!216033) (not e!231446))))

(declare-datatypes ((array!22289 0))(
  ( (array!22290 (arr!10613 (Array (_ BitVec 32) (_ BitVec 64))) (size!10965 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22289)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380536 (= res!216033 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!380537 () Bool)

(declare-fun res!216034 () Bool)

(assert (=> b!380537 (=> (not res!216034) (not e!231446))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380537 (= res!216034 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10965 _keys!658))))))

(declare-fun b!380538 () Bool)

(declare-fun e!231441 () Bool)

(declare-fun e!231440 () Bool)

(declare-fun mapRes!15342 () Bool)

(assert (=> b!380538 (= e!231441 (and e!231440 mapRes!15342))))

(declare-fun condMapEmpty!15342 () Bool)

(declare-datatypes ((V!13351 0))(
  ( (V!13352 (val!4637 Int)) )
))
(declare-datatypes ((ValueCell!4249 0))(
  ( (ValueCellFull!4249 (v!6834 V!13351)) (EmptyCell!4249) )
))
(declare-datatypes ((array!22291 0))(
  ( (array!22292 (arr!10614 (Array (_ BitVec 32) ValueCell!4249)) (size!10966 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22291)

(declare-fun mapDefault!15342 () ValueCell!4249)

