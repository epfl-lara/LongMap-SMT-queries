; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37322 () Bool)

(assert start!37322)

(declare-fun b_free!8449 () Bool)

(declare-fun b_next!8449 () Bool)

(assert (=> start!37322 (= b_free!8449 (not b_next!8449))))

(declare-fun tp!30062 () Bool)

(declare-fun b_and!15691 () Bool)

(assert (=> start!37322 (= tp!30062 b_and!15691)))

(declare-fun b!378555 () Bool)

(declare-fun e!230384 () Bool)

(declare-fun e!230387 () Bool)

(assert (=> b!378555 (= e!230384 e!230387)))

(declare-fun res!214449 () Bool)

(assert (=> b!378555 (=> (not res!214449) (not e!230387))))

(declare-datatypes ((array!22119 0))(
  ( (array!22120 (arr!10528 (Array (_ BitVec 32) (_ BitVec 64))) (size!10880 (_ BitVec 32))) )
))
(declare-fun lt!176429 () array!22119)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22119 (_ BitVec 32)) Bool)

(assert (=> b!378555 (= res!214449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176429 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22119)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378555 (= lt!176429 (array!22120 (store (arr!10528 _keys!658) i!548 k!778) (size!10880 _keys!658)))))

(declare-fun b!378556 () Bool)

(declare-fun res!214442 () Bool)

(assert (=> b!378556 (=> (not res!214442) (not e!230387))))

(declare-datatypes ((List!5973 0))(
  ( (Nil!5970) (Cons!5969 (h!6825 (_ BitVec 64)) (t!11123 List!5973)) )
))
(declare-fun arrayNoDuplicates!0 (array!22119 (_ BitVec 32) List!5973) Bool)

(assert (=> b!378556 (= res!214442 (arrayNoDuplicates!0 lt!176429 #b00000000000000000000000000000000 Nil!5970))))

(declare-fun b!378557 () Bool)

(declare-fun res!214446 () Bool)

(assert (=> b!378557 (=> (not res!214446) (not e!230384))))

(assert (=> b!378557 (= res!214446 (or (= (select (arr!10528 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10528 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378558 () Bool)

(declare-fun e!230390 () Bool)

(assert (=> b!378558 (= e!230390 true)))

(declare-datatypes ((V!13235 0))(
  ( (V!13236 (val!4593 Int)) )
))
(declare-datatypes ((tuple2!6136 0))(
  ( (tuple2!6137 (_1!3079 (_ BitVec 64)) (_2!3079 V!13235)) )
))
(declare-datatypes ((List!5974 0))(
  ( (Nil!5971) (Cons!5970 (h!6826 tuple2!6136) (t!11124 List!5974)) )
))
(declare-datatypes ((ListLongMap!5049 0))(
  ( (ListLongMap!5050 (toList!2540 List!5974)) )
))
(declare-fun lt!176426 () ListLongMap!5049)

(declare-fun lt!176419 () ListLongMap!5049)

(declare-fun lt!176424 () tuple2!6136)

(declare-fun +!886 (ListLongMap!5049 tuple2!6136) ListLongMap!5049)

(assert (=> b!378558 (= lt!176426 (+!886 lt!176419 lt!176424))))

(declare-fun v!373 () V!13235)

(declare-datatypes ((Unit!11672 0))(
  ( (Unit!11673) )
))
(declare-fun lt!176428 () Unit!11672)

(declare-fun lt!176425 () ListLongMap!5049)

(declare-fun minValue!472 () V!13235)

(declare-fun addCommutativeForDiffKeys!288 (ListLongMap!5049 (_ BitVec 64) V!13235 (_ BitVec 64) V!13235) Unit!11672)

(assert (=> b!378558 (= lt!176428 (addCommutativeForDiffKeys!288 lt!176425 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!15210 () Bool)

(declare-fun mapRes!15210 () Bool)

(assert (=> mapIsEmpty!15210 mapRes!15210))

(declare-fun b!378559 () Bool)

(declare-fun res!214444 () Bool)

(assert (=> b!378559 (=> (not res!214444) (not e!230384))))

(declare-fun arrayContainsKey!0 (array!22119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378559 (= res!214444 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!378560 () Bool)

(declare-fun res!214441 () Bool)

(assert (=> b!378560 (=> (not res!214441) (not e!230384))))

(assert (=> b!378560 (= res!214441 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10880 _keys!658))))))

(declare-fun b!378561 () Bool)

(declare-fun res!214448 () Bool)

(assert (=> b!378561 (=> (not res!214448) (not e!230384))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4205 0))(
  ( (ValueCellFull!4205 (v!6790 V!13235)) (EmptyCell!4205) )
))
(declare-datatypes ((array!22121 0))(
  ( (array!22122 (arr!10529 (Array (_ BitVec 32) ValueCell!4205)) (size!10881 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22121)

(assert (=> b!378561 (= res!214448 (and (= (size!10881 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10880 _keys!658) (size!10881 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378562 () Bool)

(declare-fun e!230383 () Bool)

(declare-fun e!230386 () Bool)

(assert (=> b!378562 (= e!230383 (and e!230386 mapRes!15210))))

(declare-fun condMapEmpty!15210 () Bool)

(declare-fun mapDefault!15210 () ValueCell!4205)

