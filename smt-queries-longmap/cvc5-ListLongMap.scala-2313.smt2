; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37340 () Bool)

(assert start!37340)

(declare-fun b_free!8467 () Bool)

(declare-fun b_next!8467 () Bool)

(assert (=> start!37340 (= b_free!8467 (not b_next!8467))))

(declare-fun tp!30117 () Bool)

(declare-fun b_and!15709 () Bool)

(assert (=> start!37340 (= tp!30117 b_and!15709)))

(declare-fun b!378960 () Bool)

(declare-fun res!214766 () Bool)

(declare-fun e!230599 () Bool)

(assert (=> b!378960 (=> (not res!214766) (not e!230599))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378960 (= res!214766 (validKeyInArray!0 k!778))))

(declare-fun b!378961 () Bool)

(declare-fun e!230603 () Bool)

(declare-fun e!230606 () Bool)

(assert (=> b!378961 (= e!230603 e!230606)))

(declare-fun res!214767 () Bool)

(assert (=> b!378961 (=> res!214767 e!230606)))

(assert (=> b!378961 (= res!214767 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13259 0))(
  ( (V!13260 (val!4602 Int)) )
))
(declare-datatypes ((tuple2!6152 0))(
  ( (tuple2!6153 (_1!3087 (_ BitVec 64)) (_2!3087 V!13259)) )
))
(declare-datatypes ((List!5989 0))(
  ( (Nil!5986) (Cons!5985 (h!6841 tuple2!6152) (t!11139 List!5989)) )
))
(declare-datatypes ((ListLongMap!5065 0))(
  ( (ListLongMap!5066 (toList!2548 List!5989)) )
))
(declare-fun lt!176770 () ListLongMap!5065)

(declare-fun lt!176779 () ListLongMap!5065)

(assert (=> b!378961 (= lt!176770 lt!176779)))

(declare-fun lt!176777 () ListLongMap!5065)

(declare-fun lt!176774 () tuple2!6152)

(declare-fun +!894 (ListLongMap!5065 tuple2!6152) ListLongMap!5065)

(assert (=> b!378961 (= lt!176779 (+!894 lt!176777 lt!176774))))

(declare-fun lt!176772 () ListLongMap!5065)

(declare-fun lt!176781 () ListLongMap!5065)

(assert (=> b!378961 (= lt!176772 lt!176781)))

(declare-fun lt!176776 () ListLongMap!5065)

(assert (=> b!378961 (= lt!176781 (+!894 lt!176776 lt!176774))))

(declare-fun lt!176771 () ListLongMap!5065)

(assert (=> b!378961 (= lt!176772 (+!894 lt!176771 lt!176774))))

(declare-fun minValue!472 () V!13259)

(assert (=> b!378961 (= lt!176774 (tuple2!6153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378962 () Bool)

(declare-fun e!230600 () Bool)

(declare-fun e!230605 () Bool)

(declare-fun mapRes!15237 () Bool)

(assert (=> b!378962 (= e!230600 (and e!230605 mapRes!15237))))

(declare-fun condMapEmpty!15237 () Bool)

(declare-datatypes ((ValueCell!4214 0))(
  ( (ValueCellFull!4214 (v!6799 V!13259)) (EmptyCell!4214) )
))
(declare-datatypes ((array!22155 0))(
  ( (array!22156 (arr!10546 (Array (_ BitVec 32) ValueCell!4214)) (size!10898 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22155)

(declare-fun mapDefault!15237 () ValueCell!4214)

