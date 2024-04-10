; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37242 () Bool)

(assert start!37242)

(declare-fun b_free!8369 () Bool)

(declare-fun b_next!8369 () Bool)

(assert (=> start!37242 (= b_free!8369 (not b_next!8369))))

(declare-fun tp!29823 () Bool)

(declare-fun b_and!15611 () Bool)

(assert (=> start!37242 (= tp!29823 b_and!15611)))

(declare-fun b!376746 () Bool)

(declare-fun res!212991 () Bool)

(declare-fun e!229427 () Bool)

(assert (=> b!376746 (=> (not res!212991) (not e!229427))))

(declare-datatypes ((array!21963 0))(
  ( (array!21964 (arr!10450 (Array (_ BitVec 32) (_ BitVec 64))) (size!10802 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21963)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376746 (= res!212991 (or (= (select (arr!10450 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10450 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15090 () Bool)

(declare-fun mapRes!15090 () Bool)

(assert (=> mapIsEmpty!15090 mapRes!15090))

(declare-fun b!376748 () Bool)

(declare-fun e!229430 () Bool)

(declare-fun e!229425 () Bool)

(assert (=> b!376748 (= e!229430 e!229425)))

(declare-fun res!212996 () Bool)

(assert (=> b!376748 (=> res!212996 e!229425)))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!376748 (= res!212996 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13127 0))(
  ( (V!13128 (val!4553 Int)) )
))
(declare-datatypes ((tuple2!6064 0))(
  ( (tuple2!6065 (_1!3043 (_ BitVec 64)) (_2!3043 V!13127)) )
))
(declare-datatypes ((List!5906 0))(
  ( (Nil!5903) (Cons!5902 (h!6758 tuple2!6064) (t!11056 List!5906)) )
))
(declare-datatypes ((ListLongMap!4977 0))(
  ( (ListLongMap!4978 (toList!2504 List!5906)) )
))
(declare-fun lt!174903 () ListLongMap!4977)

(declare-fun lt!174902 () ListLongMap!4977)

(assert (=> b!376748 (= lt!174903 lt!174902)))

(declare-fun lt!174906 () ListLongMap!4977)

(declare-fun lt!174894 () tuple2!6064)

(declare-fun +!850 (ListLongMap!4977 tuple2!6064) ListLongMap!4977)

(assert (=> b!376748 (= lt!174902 (+!850 lt!174906 lt!174894))))

(declare-fun lt!174899 () ListLongMap!4977)

(declare-fun lt!174900 () ListLongMap!4977)

(assert (=> b!376748 (= lt!174899 lt!174900)))

(declare-fun lt!174905 () ListLongMap!4977)

(assert (=> b!376748 (= lt!174900 (+!850 lt!174905 lt!174894))))

(declare-fun lt!174901 () ListLongMap!4977)

(assert (=> b!376748 (= lt!174903 (+!850 lt!174901 lt!174894))))

(declare-fun zeroValue!472 () V!13127)

(assert (=> b!376748 (= lt!174894 (tuple2!6065 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376749 () Bool)

(declare-fun res!213001 () Bool)

(assert (=> b!376749 (=> (not res!213001) (not e!229427))))

(assert (=> b!376749 (= res!213001 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10802 _keys!658))))))

(declare-fun b!376750 () Bool)

(declare-fun e!229423 () Bool)

(declare-fun e!229428 () Bool)

(assert (=> b!376750 (= e!229423 (and e!229428 mapRes!15090))))

(declare-fun condMapEmpty!15090 () Bool)

(declare-datatypes ((ValueCell!4165 0))(
  ( (ValueCellFull!4165 (v!6750 V!13127)) (EmptyCell!4165) )
))
(declare-datatypes ((array!21965 0))(
  ( (array!21966 (arr!10451 (Array (_ BitVec 32) ValueCell!4165)) (size!10803 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21965)

(declare-fun mapDefault!15090 () ValueCell!4165)

