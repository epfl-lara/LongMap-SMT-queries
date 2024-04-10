; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37554 () Bool)

(assert start!37554)

(declare-fun b_free!8681 () Bool)

(declare-fun b_next!8681 () Bool)

(assert (=> start!37554 (= b_free!8681 (not b_next!8681))))

(declare-fun tp!30759 () Bool)

(declare-fun b_and!15923 () Bool)

(assert (=> start!37554 (= tp!30759 b_and!15923)))

(declare-fun b!383578 () Bool)

(declare-fun res!218421 () Bool)

(declare-fun e!232974 () Bool)

(assert (=> b!383578 (=> (not res!218421) (not e!232974))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13543 0))(
  ( (V!13544 (val!4709 Int)) )
))
(declare-datatypes ((ValueCell!4321 0))(
  ( (ValueCellFull!4321 (v!6906 V!13543)) (EmptyCell!4321) )
))
(declare-datatypes ((array!22565 0))(
  ( (array!22566 (arr!10751 (Array (_ BitVec 32) ValueCell!4321)) (size!11103 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22565)

(declare-datatypes ((array!22567 0))(
  ( (array!22568 (arr!10752 (Array (_ BitVec 32) (_ BitVec 64))) (size!11104 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22567)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!383578 (= res!218421 (and (= (size!11103 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11104 _keys!658) (size!11103 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383579 () Bool)

(declare-fun e!232976 () Bool)

(declare-fun tp_is_empty!9329 () Bool)

(assert (=> b!383579 (= e!232976 tp_is_empty!9329)))

(declare-fun mapNonEmpty!15558 () Bool)

(declare-fun mapRes!15558 () Bool)

(declare-fun tp!30758 () Bool)

(declare-fun e!232973 () Bool)

(assert (=> mapNonEmpty!15558 (= mapRes!15558 (and tp!30758 e!232973))))

(declare-fun mapKey!15558 () (_ BitVec 32))

(declare-fun mapValue!15558 () ValueCell!4321)

(declare-fun mapRest!15558 () (Array (_ BitVec 32) ValueCell!4321))

(assert (=> mapNonEmpty!15558 (= (arr!10751 _values!506) (store mapRest!15558 mapKey!15558 mapValue!15558))))

(declare-fun b!383580 () Bool)

(declare-fun res!218420 () Bool)

(assert (=> b!383580 (=> (not res!218420) (not e!232974))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383580 (= res!218420 (validKeyInArray!0 k!778))))

(declare-fun b!383581 () Bool)

(declare-fun e!232971 () Bool)

(assert (=> b!383581 (= e!232974 e!232971)))

(declare-fun res!218419 () Bool)

(assert (=> b!383581 (=> (not res!218419) (not e!232971))))

(declare-fun lt!180227 () array!22567)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22567 (_ BitVec 32)) Bool)

(assert (=> b!383581 (= res!218419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180227 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383581 (= lt!180227 (array!22568 (store (arr!10752 _keys!658) i!548 k!778) (size!11104 _keys!658)))))

(declare-fun b!383582 () Bool)

(declare-fun res!218429 () Bool)

(assert (=> b!383582 (=> (not res!218429) (not e!232974))))

(declare-fun arrayContainsKey!0 (array!22567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383582 (= res!218429 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!383583 () Bool)

(declare-fun res!218425 () Bool)

(assert (=> b!383583 (=> (not res!218425) (not e!232974))))

(declare-datatypes ((List!6170 0))(
  ( (Nil!6167) (Cons!6166 (h!7022 (_ BitVec 64)) (t!11320 List!6170)) )
))
(declare-fun arrayNoDuplicates!0 (array!22567 (_ BitVec 32) List!6170) Bool)

(assert (=> b!383583 (= res!218425 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6167))))

(declare-fun b!383584 () Bool)

(declare-fun res!218428 () Bool)

(assert (=> b!383584 (=> (not res!218428) (not e!232974))))

(assert (=> b!383584 (= res!218428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383585 () Bool)

(declare-fun e!232970 () Bool)

(assert (=> b!383585 (= e!232970 (and e!232976 mapRes!15558))))

(declare-fun condMapEmpty!15558 () Bool)

(declare-fun mapDefault!15558 () ValueCell!4321)

