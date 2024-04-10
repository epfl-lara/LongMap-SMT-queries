; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37734 () Bool)

(assert start!37734)

(declare-fun b_free!8837 () Bool)

(declare-fun b_next!8837 () Bool)

(assert (=> start!37734 (= b_free!8837 (not b_next!8837))))

(declare-fun tp!31262 () Bool)

(declare-fun b_and!16079 () Bool)

(assert (=> start!37734 (= tp!31262 b_and!16079)))

(declare-fun b!387026 () Bool)

(declare-fun res!221063 () Bool)

(declare-fun e!234703 () Bool)

(assert (=> b!387026 (=> (not res!221063) (not e!234703))))

(declare-datatypes ((array!22911 0))(
  ( (array!22912 (arr!10924 (Array (_ BitVec 32) (_ BitVec 64))) (size!11276 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22911)

(declare-datatypes ((List!6301 0))(
  ( (Nil!6298) (Cons!6297 (h!7153 (_ BitVec 64)) (t!11451 List!6301)) )
))
(declare-fun arrayNoDuplicates!0 (array!22911 (_ BitVec 32) List!6301) Bool)

(assert (=> b!387026 (= res!221063 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6298))))

(declare-fun b!387027 () Bool)

(declare-fun e!234702 () Bool)

(assert (=> b!387027 (= e!234702 false)))

(declare-datatypes ((V!13783 0))(
  ( (V!13784 (val!4799 Int)) )
))
(declare-datatypes ((ValueCell!4411 0))(
  ( (ValueCellFull!4411 (v!6996 V!13783)) (EmptyCell!4411) )
))
(declare-datatypes ((array!22913 0))(
  ( (array!22914 (arr!10925 (Array (_ BitVec 32) ValueCell!4411)) (size!11277 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22913)

(declare-fun zeroValue!472 () V!13783)

(declare-datatypes ((tuple2!6452 0))(
  ( (tuple2!6453 (_1!3237 (_ BitVec 64)) (_2!3237 V!13783)) )
))
(declare-datatypes ((List!6302 0))(
  ( (Nil!6299) (Cons!6298 (h!7154 tuple2!6452) (t!11452 List!6302)) )
))
(declare-datatypes ((ListLongMap!5365 0))(
  ( (ListLongMap!5366 (toList!2698 List!6302)) )
))
(declare-fun lt!181944 () ListLongMap!5365)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13783)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!181943 () array!22911)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13783)

(declare-fun getCurrentListMapNoExtraKeys!927 (array!22911 array!22913 (_ BitVec 32) (_ BitVec 32) V!13783 V!13783 (_ BitVec 32) Int) ListLongMap!5365)

(assert (=> b!387027 (= lt!181944 (getCurrentListMapNoExtraKeys!927 lt!181943 (array!22914 (store (arr!10925 _values!506) i!548 (ValueCellFull!4411 v!373)) (size!11277 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181942 () ListLongMap!5365)

(assert (=> b!387027 (= lt!181942 (getCurrentListMapNoExtraKeys!927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387028 () Bool)

(declare-fun res!221065 () Bool)

(assert (=> b!387028 (=> (not res!221065) (not e!234703))))

(assert (=> b!387028 (= res!221065 (and (= (size!11277 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11276 _keys!658) (size!11277 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387029 () Bool)

(declare-fun res!221057 () Bool)

(assert (=> b!387029 (=> (not res!221057) (not e!234703))))

(assert (=> b!387029 (= res!221057 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11276 _keys!658))))))

(declare-fun mapIsEmpty!15828 () Bool)

(declare-fun mapRes!15828 () Bool)

(assert (=> mapIsEmpty!15828 mapRes!15828))

(declare-fun b!387030 () Bool)

(declare-fun res!221059 () Bool)

(assert (=> b!387030 (=> (not res!221059) (not e!234703))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387030 (= res!221059 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun res!221060 () Bool)

(assert (=> start!37734 (=> (not res!221060) (not e!234703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37734 (= res!221060 (validMask!0 mask!970))))

(assert (=> start!37734 e!234703))

(declare-fun e!234700 () Bool)

(declare-fun array_inv!8038 (array!22913) Bool)

(assert (=> start!37734 (and (array_inv!8038 _values!506) e!234700)))

(assert (=> start!37734 tp!31262))

(assert (=> start!37734 true))

(declare-fun tp_is_empty!9509 () Bool)

(assert (=> start!37734 tp_is_empty!9509))

(declare-fun array_inv!8039 (array!22911) Bool)

(assert (=> start!37734 (array_inv!8039 _keys!658)))

(declare-fun b!387031 () Bool)

(declare-fun res!221058 () Bool)

(assert (=> b!387031 (=> (not res!221058) (not e!234703))))

(assert (=> b!387031 (= res!221058 (or (= (select (arr!10924 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10924 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387032 () Bool)

(declare-fun res!221064 () Bool)

(assert (=> b!387032 (=> (not res!221064) (not e!234703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387032 (= res!221064 (validKeyInArray!0 k!778))))

(declare-fun b!387033 () Bool)

(declare-fun e!234704 () Bool)

(assert (=> b!387033 (= e!234700 (and e!234704 mapRes!15828))))

(declare-fun condMapEmpty!15828 () Bool)

(declare-fun mapDefault!15828 () ValueCell!4411)

