; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37550 () Bool)

(assert start!37550)

(declare-fun b_free!8677 () Bool)

(declare-fun b_next!8677 () Bool)

(assert (=> start!37550 (= b_free!8677 (not b_next!8677))))

(declare-fun tp!30746 () Bool)

(declare-fun b_and!15919 () Bool)

(assert (=> start!37550 (= tp!30746 b_and!15919)))

(declare-fun b!383494 () Bool)

(declare-fun res!218359 () Bool)

(declare-fun e!232928 () Bool)

(assert (=> b!383494 (=> (not res!218359) (not e!232928))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383494 (= res!218359 (validKeyInArray!0 k!778))))

(declare-fun b!383495 () Bool)

(declare-fun e!232934 () Bool)

(assert (=> b!383495 (= e!232934 true)))

(declare-datatypes ((V!13539 0))(
  ( (V!13540 (val!4707 Int)) )
))
(declare-datatypes ((tuple2!6332 0))(
  ( (tuple2!6333 (_1!3177 (_ BitVec 64)) (_2!3177 V!13539)) )
))
(declare-datatypes ((List!6167 0))(
  ( (Nil!6164) (Cons!6163 (h!7019 tuple2!6332) (t!11317 List!6167)) )
))
(declare-datatypes ((ListLongMap!5245 0))(
  ( (ListLongMap!5246 (toList!2638 List!6167)) )
))
(declare-fun lt!180168 () ListLongMap!5245)

(declare-fun lt!180161 () ListLongMap!5245)

(declare-fun lt!180162 () tuple2!6332)

(declare-fun +!973 (ListLongMap!5245 tuple2!6332) ListLongMap!5245)

(assert (=> b!383495 (= lt!180168 (+!973 lt!180161 lt!180162))))

(declare-fun lt!180158 () ListLongMap!5245)

(declare-fun lt!180165 () ListLongMap!5245)

(assert (=> b!383495 (= lt!180158 lt!180165)))

(declare-fun b!383496 () Bool)

(declare-fun res!218363 () Bool)

(assert (=> b!383496 (=> (not res!218363) (not e!232928))))

(declare-datatypes ((array!22557 0))(
  ( (array!22558 (arr!10747 (Array (_ BitVec 32) (_ BitVec 64))) (size!11099 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22557)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22557 (_ BitVec 32)) Bool)

(assert (=> b!383496 (= res!218363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383497 () Bool)

(declare-fun e!232931 () Bool)

(assert (=> b!383497 (= e!232928 e!232931)))

(declare-fun res!218354 () Bool)

(assert (=> b!383497 (=> (not res!218354) (not e!232931))))

(declare-fun lt!180167 () array!22557)

(assert (=> b!383497 (= res!218354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180167 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383497 (= lt!180167 (array!22558 (store (arr!10747 _keys!658) i!548 k!778) (size!11099 _keys!658)))))

(declare-fun b!383498 () Bool)

(assert (=> b!383498 (= e!232931 (not e!232934))))

(declare-fun res!218362 () Bool)

(assert (=> b!383498 (=> res!218362 e!232934)))

(declare-fun lt!180163 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383498 (= res!218362 (or (and (not lt!180163) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180163) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180163)))))

(assert (=> b!383498 (= lt!180163 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13539)

(declare-datatypes ((ValueCell!4319 0))(
  ( (ValueCellFull!4319 (v!6904 V!13539)) (EmptyCell!4319) )
))
(declare-datatypes ((array!22559 0))(
  ( (array!22560 (arr!10748 (Array (_ BitVec 32) ValueCell!4319)) (size!11100 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22559)

(declare-fun minValue!472 () V!13539)

(declare-fun getCurrentListMap!2043 (array!22557 array!22559 (_ BitVec 32) (_ BitVec 32) V!13539 V!13539 (_ BitVec 32) Int) ListLongMap!5245)

(assert (=> b!383498 (= lt!180161 (getCurrentListMap!2043 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180159 () array!22559)

(assert (=> b!383498 (= lt!180158 (getCurrentListMap!2043 lt!180167 lt!180159 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180166 () ListLongMap!5245)

(assert (=> b!383498 (and (= lt!180165 lt!180166) (= lt!180166 lt!180165))))

(declare-fun lt!180160 () ListLongMap!5245)

(assert (=> b!383498 (= lt!180166 (+!973 lt!180160 lt!180162))))

(declare-fun v!373 () V!13539)

(assert (=> b!383498 (= lt!180162 (tuple2!6333 k!778 v!373))))

(declare-datatypes ((Unit!11840 0))(
  ( (Unit!11841) )
))
(declare-fun lt!180164 () Unit!11840)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!201 (array!22557 array!22559 (_ BitVec 32) (_ BitVec 32) V!13539 V!13539 (_ BitVec 32) (_ BitVec 64) V!13539 (_ BitVec 32) Int) Unit!11840)

(assert (=> b!383498 (= lt!180164 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!201 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!877 (array!22557 array!22559 (_ BitVec 32) (_ BitVec 32) V!13539 V!13539 (_ BitVec 32) Int) ListLongMap!5245)

(assert (=> b!383498 (= lt!180165 (getCurrentListMapNoExtraKeys!877 lt!180167 lt!180159 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383498 (= lt!180159 (array!22560 (store (arr!10748 _values!506) i!548 (ValueCellFull!4319 v!373)) (size!11100 _values!506)))))

(assert (=> b!383498 (= lt!180160 (getCurrentListMapNoExtraKeys!877 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383499 () Bool)

(declare-fun e!232932 () Bool)

(declare-fun e!232929 () Bool)

(declare-fun mapRes!15552 () Bool)

(assert (=> b!383499 (= e!232932 (and e!232929 mapRes!15552))))

(declare-fun condMapEmpty!15552 () Bool)

(declare-fun mapDefault!15552 () ValueCell!4319)

