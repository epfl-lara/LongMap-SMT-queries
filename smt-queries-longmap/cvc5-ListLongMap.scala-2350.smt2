; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37562 () Bool)

(assert start!37562)

(declare-fun b_free!8689 () Bool)

(declare-fun b_next!8689 () Bool)

(assert (=> start!37562 (= b_free!8689 (not b_next!8689))))

(declare-fun tp!30783 () Bool)

(declare-fun b_and!15931 () Bool)

(assert (=> start!37562 (= tp!30783 b_and!15931)))

(declare-fun b!383746 () Bool)

(declare-fun e!233060 () Bool)

(declare-fun e!233056 () Bool)

(assert (=> b!383746 (= e!233060 e!233056)))

(declare-fun res!218551 () Bool)

(assert (=> b!383746 (=> (not res!218551) (not e!233056))))

(declare-datatypes ((array!22581 0))(
  ( (array!22582 (arr!10759 (Array (_ BitVec 32) (_ BitVec 64))) (size!11111 (_ BitVec 32))) )
))
(declare-fun lt!180363 () array!22581)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22581 (_ BitVec 32)) Bool)

(assert (=> b!383746 (= res!218551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180363 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22581)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383746 (= lt!180363 (array!22582 (store (arr!10759 _keys!658) i!548 k!778) (size!11111 _keys!658)))))

(declare-fun b!383747 () Bool)

(declare-fun e!233059 () Bool)

(declare-fun tp_is_empty!9337 () Bool)

(assert (=> b!383747 (= e!233059 tp_is_empty!9337)))

(declare-fun b!383748 () Bool)

(declare-fun res!218560 () Bool)

(assert (=> b!383748 (=> (not res!218560) (not e!233060))))

(assert (=> b!383748 (= res!218560 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11111 _keys!658))))))

(declare-fun b!383749 () Bool)

(declare-fun res!218557 () Bool)

(assert (=> b!383749 (=> (not res!218557) (not e!233060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383749 (= res!218557 (validKeyInArray!0 k!778))))

(declare-fun mapIsEmpty!15570 () Bool)

(declare-fun mapRes!15570 () Bool)

(assert (=> mapIsEmpty!15570 mapRes!15570))

(declare-fun res!218558 () Bool)

(assert (=> start!37562 (=> (not res!218558) (not e!233060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37562 (= res!218558 (validMask!0 mask!970))))

(assert (=> start!37562 e!233060))

(declare-datatypes ((V!13555 0))(
  ( (V!13556 (val!4713 Int)) )
))
(declare-datatypes ((ValueCell!4325 0))(
  ( (ValueCellFull!4325 (v!6910 V!13555)) (EmptyCell!4325) )
))
(declare-datatypes ((array!22583 0))(
  ( (array!22584 (arr!10760 (Array (_ BitVec 32) ValueCell!4325)) (size!11112 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22583)

(declare-fun e!233057 () Bool)

(declare-fun array_inv!7918 (array!22583) Bool)

(assert (=> start!37562 (and (array_inv!7918 _values!506) e!233057)))

(assert (=> start!37562 tp!30783))

(assert (=> start!37562 true))

(assert (=> start!37562 tp_is_empty!9337))

(declare-fun array_inv!7919 (array!22581) Bool)

(assert (=> start!37562 (array_inv!7919 _keys!658)))

(declare-fun b!383750 () Bool)

(declare-fun e!233055 () Bool)

(assert (=> b!383750 (= e!233055 true)))

(declare-datatypes ((tuple2!6342 0))(
  ( (tuple2!6343 (_1!3182 (_ BitVec 64)) (_2!3182 V!13555)) )
))
(declare-datatypes ((List!6177 0))(
  ( (Nil!6174) (Cons!6173 (h!7029 tuple2!6342) (t!11327 List!6177)) )
))
(declare-datatypes ((ListLongMap!5255 0))(
  ( (ListLongMap!5256 (toList!2643 List!6177)) )
))
(declare-fun lt!180359 () ListLongMap!5255)

(declare-fun lt!180357 () ListLongMap!5255)

(declare-fun lt!180366 () tuple2!6342)

(declare-fun +!978 (ListLongMap!5255 tuple2!6342) ListLongMap!5255)

(assert (=> b!383750 (= lt!180359 (+!978 lt!180357 lt!180366))))

(declare-fun lt!180365 () ListLongMap!5255)

(declare-fun lt!180356 () ListLongMap!5255)

(assert (=> b!383750 (= lt!180365 lt!180356)))

(declare-fun b!383751 () Bool)

(declare-fun res!218555 () Bool)

(assert (=> b!383751 (=> (not res!218555) (not e!233060))))

(declare-datatypes ((List!6178 0))(
  ( (Nil!6175) (Cons!6174 (h!7030 (_ BitVec 64)) (t!11328 List!6178)) )
))
(declare-fun arrayNoDuplicates!0 (array!22581 (_ BitVec 32) List!6178) Bool)

(assert (=> b!383751 (= res!218555 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6175))))

(declare-fun b!383752 () Bool)

(declare-fun res!218559 () Bool)

(assert (=> b!383752 (=> (not res!218559) (not e!233060))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383752 (= res!218559 (and (= (size!11112 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11111 _keys!658) (size!11112 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383753 () Bool)

(declare-fun e!233058 () Bool)

(assert (=> b!383753 (= e!233057 (and e!233058 mapRes!15570))))

(declare-fun condMapEmpty!15570 () Bool)

(declare-fun mapDefault!15570 () ValueCell!4325)

