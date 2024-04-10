; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37500 () Bool)

(assert start!37500)

(declare-fun b_free!8627 () Bool)

(declare-fun b_next!8627 () Bool)

(assert (=> start!37500 (= b_free!8627 (not b_next!8627))))

(declare-fun tp!30597 () Bool)

(declare-fun b_and!15869 () Bool)

(assert (=> start!37500 (= tp!30597 b_and!15869)))

(declare-fun b!382444 () Bool)

(declare-fun res!217534 () Bool)

(declare-fun e!232404 () Bool)

(assert (=> b!382444 (=> (not res!217534) (not e!232404))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22459 0))(
  ( (array!22460 (arr!10698 (Array (_ BitVec 32) (_ BitVec 64))) (size!11050 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22459)

(assert (=> b!382444 (= res!217534 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11050 _keys!658))))))

(declare-fun mapIsEmpty!15477 () Bool)

(declare-fun mapRes!15477 () Bool)

(assert (=> mapIsEmpty!15477 mapRes!15477))

(declare-fun res!217536 () Bool)

(assert (=> start!37500 (=> (not res!217536) (not e!232404))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37500 (= res!217536 (validMask!0 mask!970))))

(assert (=> start!37500 e!232404))

(declare-datatypes ((V!13471 0))(
  ( (V!13472 (val!4682 Int)) )
))
(declare-datatypes ((ValueCell!4294 0))(
  ( (ValueCellFull!4294 (v!6879 V!13471)) (EmptyCell!4294) )
))
(declare-datatypes ((array!22461 0))(
  ( (array!22462 (arr!10699 (Array (_ BitVec 32) ValueCell!4294)) (size!11051 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22461)

(declare-fun e!232407 () Bool)

(declare-fun array_inv!7878 (array!22461) Bool)

(assert (=> start!37500 (and (array_inv!7878 _values!506) e!232407)))

(assert (=> start!37500 tp!30597))

(assert (=> start!37500 true))

(declare-fun tp_is_empty!9275 () Bool)

(assert (=> start!37500 tp_is_empty!9275))

(declare-fun array_inv!7879 (array!22459) Bool)

(assert (=> start!37500 (array_inv!7879 _keys!658)))

(declare-fun b!382445 () Bool)

(declare-fun e!232406 () Bool)

(assert (=> b!382445 (= e!232406 tp_is_empty!9275)))

(declare-fun b!382446 () Bool)

(declare-fun res!217537 () Bool)

(assert (=> b!382446 (=> (not res!217537) (not e!232404))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382446 (= res!217537 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!382447 () Bool)

(declare-fun e!232405 () Bool)

(assert (=> b!382447 (= e!232407 (and e!232405 mapRes!15477))))

(declare-fun condMapEmpty!15477 () Bool)

(declare-fun mapDefault!15477 () ValueCell!4294)

