; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37406 () Bool)

(assert start!37406)

(declare-fun b_free!8533 () Bool)

(declare-fun b_next!8533 () Bool)

(assert (=> start!37406 (= b_free!8533 (not b_next!8533))))

(declare-fun tp!30315 () Bool)

(declare-fun b_and!15775 () Bool)

(assert (=> start!37406 (= tp!30315 b_and!15775)))

(declare-fun b!380445 () Bool)

(declare-fun e!231392 () Bool)

(declare-fun tp_is_empty!9181 () Bool)

(assert (=> b!380445 (= e!231392 tp_is_empty!9181)))

(declare-fun b!380446 () Bool)

(declare-fun res!215958 () Bool)

(declare-fun e!231391 () Bool)

(assert (=> b!380446 (=> (not res!215958) (not e!231391))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13347 0))(
  ( (V!13348 (val!4635 Int)) )
))
(declare-datatypes ((ValueCell!4247 0))(
  ( (ValueCellFull!4247 (v!6832 V!13347)) (EmptyCell!4247) )
))
(declare-datatypes ((array!22281 0))(
  ( (array!22282 (arr!10609 (Array (_ BitVec 32) ValueCell!4247)) (size!10961 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22281)

(declare-datatypes ((array!22283 0))(
  ( (array!22284 (arr!10610 (Array (_ BitVec 32) (_ BitVec 64))) (size!10962 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22283)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!380446 (= res!215958 (and (= (size!10961 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10962 _keys!658) (size!10961 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380447 () Bool)

(declare-fun res!215956 () Bool)

(assert (=> b!380447 (=> (not res!215956) (not e!231391))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380447 (= res!215956 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10962 _keys!658))))))

(declare-fun b!380448 () Bool)

(declare-fun res!215953 () Bool)

(declare-fun e!231395 () Bool)

(assert (=> b!380448 (=> (not res!215953) (not e!231395))))

(declare-fun lt!178064 () array!22283)

(declare-datatypes ((List!6049 0))(
  ( (Nil!6046) (Cons!6045 (h!6901 (_ BitVec 64)) (t!11199 List!6049)) )
))
(declare-fun arrayNoDuplicates!0 (array!22283 (_ BitVec 32) List!6049) Bool)

(assert (=> b!380448 (= res!215953 (arrayNoDuplicates!0 lt!178064 #b00000000000000000000000000000000 Nil!6046))))

(declare-fun b!380449 () Bool)

(declare-fun e!231397 () Bool)

(assert (=> b!380449 (= e!231397 tp_is_empty!9181)))

(declare-fun b!380450 () Bool)

(assert (=> b!380450 (= e!231391 e!231395)))

(declare-fun res!215957 () Bool)

(assert (=> b!380450 (=> (not res!215957) (not e!231395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22283 (_ BitVec 32)) Bool)

(assert (=> b!380450 (= res!215957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178064 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!380450 (= lt!178064 (array!22284 (store (arr!10610 _keys!658) i!548 k!778) (size!10962 _keys!658)))))

(declare-fun mapNonEmpty!15336 () Bool)

(declare-fun mapRes!15336 () Bool)

(declare-fun tp!30314 () Bool)

(assert (=> mapNonEmpty!15336 (= mapRes!15336 (and tp!30314 e!231392))))

(declare-fun mapRest!15336 () (Array (_ BitVec 32) ValueCell!4247))

(declare-fun mapValue!15336 () ValueCell!4247)

(declare-fun mapKey!15336 () (_ BitVec 32))

(assert (=> mapNonEmpty!15336 (= (arr!10609 _values!506) (store mapRest!15336 mapKey!15336 mapValue!15336))))

(declare-fun b!380451 () Bool)

(declare-fun res!215952 () Bool)

(assert (=> b!380451 (=> (not res!215952) (not e!231391))))

(assert (=> b!380451 (= res!215952 (or (= (select (arr!10610 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10610 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380452 () Bool)

(declare-fun res!215959 () Bool)

(assert (=> b!380452 (=> (not res!215959) (not e!231391))))

(assert (=> b!380452 (= res!215959 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6046))))

(declare-fun b!380453 () Bool)

(declare-fun e!231394 () Bool)

(assert (=> b!380453 (= e!231395 (not e!231394))))

(declare-fun res!215955 () Bool)

(assert (=> b!380453 (=> res!215955 e!231394)))

(assert (=> b!380453 (= res!215955 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13347)

(declare-datatypes ((tuple2!6214 0))(
  ( (tuple2!6215 (_1!3118 (_ BitVec 64)) (_2!3118 V!13347)) )
))
(declare-datatypes ((List!6050 0))(
  ( (Nil!6047) (Cons!6046 (h!6902 tuple2!6214) (t!11200 List!6050)) )
))
(declare-datatypes ((ListLongMap!5127 0))(
  ( (ListLongMap!5128 (toList!2579 List!6050)) )
))
(declare-fun lt!178068 () ListLongMap!5127)

(declare-fun minValue!472 () V!13347)

(declare-fun getCurrentListMap!1995 (array!22283 array!22281 (_ BitVec 32) (_ BitVec 32) V!13347 V!13347 (_ BitVec 32) Int) ListLongMap!5127)

(assert (=> b!380453 (= lt!178068 (getCurrentListMap!1995 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178056 () ListLongMap!5127)

(declare-fun lt!178060 () array!22281)

(assert (=> b!380453 (= lt!178056 (getCurrentListMap!1995 lt!178064 lt!178060 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178061 () ListLongMap!5127)

(declare-fun lt!178062 () ListLongMap!5127)

(assert (=> b!380453 (and (= lt!178061 lt!178062) (= lt!178062 lt!178061))))

(declare-fun lt!178065 () ListLongMap!5127)

(declare-fun lt!178057 () tuple2!6214)

(declare-fun +!925 (ListLongMap!5127 tuple2!6214) ListLongMap!5127)

(assert (=> b!380453 (= lt!178062 (+!925 lt!178065 lt!178057))))

(declare-fun v!373 () V!13347)

(assert (=> b!380453 (= lt!178057 (tuple2!6215 k!778 v!373))))

(declare-datatypes ((Unit!11744 0))(
  ( (Unit!11745) )
))
(declare-fun lt!178058 () Unit!11744)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!153 (array!22283 array!22281 (_ BitVec 32) (_ BitVec 32) V!13347 V!13347 (_ BitVec 32) (_ BitVec 64) V!13347 (_ BitVec 32) Int) Unit!11744)

(assert (=> b!380453 (= lt!178058 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!153 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!829 (array!22283 array!22281 (_ BitVec 32) (_ BitVec 32) V!13347 V!13347 (_ BitVec 32) Int) ListLongMap!5127)

(assert (=> b!380453 (= lt!178061 (getCurrentListMapNoExtraKeys!829 lt!178064 lt!178060 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380453 (= lt!178060 (array!22282 (store (arr!10609 _values!506) i!548 (ValueCellFull!4247 v!373)) (size!10961 _values!506)))))

(assert (=> b!380453 (= lt!178065 (getCurrentListMapNoExtraKeys!829 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380454 () Bool)

(declare-fun res!215960 () Bool)

(assert (=> b!380454 (=> (not res!215960) (not e!231391))))

(declare-fun arrayContainsKey!0 (array!22283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380454 (= res!215960 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!380455 () Bool)

(declare-fun res!215954 () Bool)

(assert (=> b!380455 (=> (not res!215954) (not e!231391))))

(assert (=> b!380455 (= res!215954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380456 () Bool)

(declare-fun e!231396 () Bool)

(assert (=> b!380456 (= e!231396 true)))

(declare-fun lt!178067 () ListLongMap!5127)

(declare-fun lt!178063 () ListLongMap!5127)

(assert (=> b!380456 (= lt!178067 (+!925 lt!178063 lt!178057))))

(declare-fun lt!178059 () Unit!11744)

(declare-fun addCommutativeForDiffKeys!322 (ListLongMap!5127 (_ BitVec 64) V!13347 (_ BitVec 64) V!13347) Unit!11744)

(assert (=> b!380456 (= lt!178059 (addCommutativeForDiffKeys!322 lt!178065 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380457 () Bool)

(declare-fun res!215962 () Bool)

(assert (=> b!380457 (=> (not res!215962) (not e!231391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380457 (= res!215962 (validKeyInArray!0 k!778))))

(declare-fun b!380458 () Bool)

(declare-fun e!231398 () Bool)

(assert (=> b!380458 (= e!231398 (and e!231397 mapRes!15336))))

(declare-fun condMapEmpty!15336 () Bool)

(declare-fun mapDefault!15336 () ValueCell!4247)

