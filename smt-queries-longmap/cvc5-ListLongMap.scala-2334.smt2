; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37466 () Bool)

(assert start!37466)

(declare-fun b_free!8593 () Bool)

(declare-fun b_next!8593 () Bool)

(assert (=> start!37466 (= b_free!8593 (not b_next!8593))))

(declare-fun tp!30495 () Bool)

(declare-fun b_and!15835 () Bool)

(assert (=> start!37466 (= tp!30495 b_and!15835)))

(declare-fun mapNonEmpty!15426 () Bool)

(declare-fun mapRes!15426 () Bool)

(declare-fun tp!30494 () Bool)

(declare-fun e!232046 () Bool)

(assert (=> mapNonEmpty!15426 (= mapRes!15426 (and tp!30494 e!232046))))

(declare-datatypes ((V!13427 0))(
  ( (V!13428 (val!4665 Int)) )
))
(declare-datatypes ((ValueCell!4277 0))(
  ( (ValueCellFull!4277 (v!6862 V!13427)) (EmptyCell!4277) )
))
(declare-datatypes ((array!22395 0))(
  ( (array!22396 (arr!10666 (Array (_ BitVec 32) ValueCell!4277)) (size!11018 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22395)

(declare-fun mapValue!15426 () ValueCell!4277)

(declare-fun mapRest!15426 () (Array (_ BitVec 32) ValueCell!4277))

(declare-fun mapKey!15426 () (_ BitVec 32))

(assert (=> mapNonEmpty!15426 (= (arr!10666 _values!506) (store mapRest!15426 mapKey!15426 mapValue!15426))))

(declare-fun res!216975 () Bool)

(declare-fun e!232051 () Bool)

(assert (=> start!37466 (=> (not res!216975) (not e!232051))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37466 (= res!216975 (validMask!0 mask!970))))

(assert (=> start!37466 e!232051))

(declare-fun e!232052 () Bool)

(declare-fun array_inv!7852 (array!22395) Bool)

(assert (=> start!37466 (and (array_inv!7852 _values!506) e!232052)))

(assert (=> start!37466 tp!30495))

(assert (=> start!37466 true))

(declare-fun tp_is_empty!9241 () Bool)

(assert (=> start!37466 tp_is_empty!9241))

(declare-datatypes ((array!22397 0))(
  ( (array!22398 (arr!10667 (Array (_ BitVec 32) (_ BitVec 64))) (size!11019 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22397)

(declare-fun array_inv!7853 (array!22397) Bool)

(assert (=> start!37466 (array_inv!7853 _keys!658)))

(declare-fun b!381730 () Bool)

(declare-fun res!216968 () Bool)

(declare-fun e!232047 () Bool)

(assert (=> b!381730 (=> (not res!216968) (not e!232047))))

(declare-fun lt!178966 () array!22397)

(declare-datatypes ((List!6099 0))(
  ( (Nil!6096) (Cons!6095 (h!6951 (_ BitVec 64)) (t!11249 List!6099)) )
))
(declare-fun arrayNoDuplicates!0 (array!22397 (_ BitVec 32) List!6099) Bool)

(assert (=> b!381730 (= res!216968 (arrayNoDuplicates!0 lt!178966 #b00000000000000000000000000000000 Nil!6096))))

(declare-fun b!381731 () Bool)

(assert (=> b!381731 (= e!232051 e!232047)))

(declare-fun res!216976 () Bool)

(assert (=> b!381731 (=> (not res!216976) (not e!232047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22397 (_ BitVec 32)) Bool)

(assert (=> b!381731 (= res!216976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178966 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381731 (= lt!178966 (array!22398 (store (arr!10667 _keys!658) i!548 k!778) (size!11019 _keys!658)))))

(declare-fun b!381732 () Bool)

(declare-fun e!232049 () Bool)

(assert (=> b!381732 (= e!232049 true)))

(declare-datatypes ((tuple2!6268 0))(
  ( (tuple2!6269 (_1!3145 (_ BitVec 64)) (_2!3145 V!13427)) )
))
(declare-datatypes ((List!6100 0))(
  ( (Nil!6097) (Cons!6096 (h!6952 tuple2!6268) (t!11250 List!6100)) )
))
(declare-datatypes ((ListLongMap!5181 0))(
  ( (ListLongMap!5182 (toList!2606 List!6100)) )
))
(declare-fun lt!178968 () ListLongMap!5181)

(declare-fun lt!178967 () ListLongMap!5181)

(assert (=> b!381732 (= lt!178968 lt!178967)))

(declare-fun b!381733 () Bool)

(assert (=> b!381733 (= e!232046 tp_is_empty!9241)))

(declare-fun b!381734 () Bool)

(declare-fun res!216977 () Bool)

(assert (=> b!381734 (=> (not res!216977) (not e!232051))))

(assert (=> b!381734 (= res!216977 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11019 _keys!658))))))

(declare-fun b!381735 () Bool)

(declare-fun res!216974 () Bool)

(assert (=> b!381735 (=> (not res!216974) (not e!232051))))

(assert (=> b!381735 (= res!216974 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6096))))

(declare-fun b!381736 () Bool)

(declare-fun e!232050 () Bool)

(assert (=> b!381736 (= e!232052 (and e!232050 mapRes!15426))))

(declare-fun condMapEmpty!15426 () Bool)

(declare-fun mapDefault!15426 () ValueCell!4277)

