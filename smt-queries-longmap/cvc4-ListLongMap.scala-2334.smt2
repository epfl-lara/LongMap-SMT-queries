; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37470 () Bool)

(assert start!37470)

(declare-fun b_free!8597 () Bool)

(declare-fun b_next!8597 () Bool)

(assert (=> start!37470 (= b_free!8597 (not b_next!8597))))

(declare-fun tp!30507 () Bool)

(declare-fun b_and!15839 () Bool)

(assert (=> start!37470 (= tp!30507 b_and!15839)))

(declare-fun b!381814 () Bool)

(declare-fun res!217042 () Bool)

(declare-fun e!232094 () Bool)

(assert (=> b!381814 (=> (not res!217042) (not e!232094))))

(declare-datatypes ((array!22403 0))(
  ( (array!22404 (arr!10670 (Array (_ BitVec 32) (_ BitVec 64))) (size!11022 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22403)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381814 (= res!217042 (or (= (select (arr!10670 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10670 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!217043 () Bool)

(assert (=> start!37470 (=> (not res!217043) (not e!232094))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37470 (= res!217043 (validMask!0 mask!970))))

(assert (=> start!37470 e!232094))

(declare-datatypes ((V!13431 0))(
  ( (V!13432 (val!4667 Int)) )
))
(declare-datatypes ((ValueCell!4279 0))(
  ( (ValueCellFull!4279 (v!6864 V!13431)) (EmptyCell!4279) )
))
(declare-datatypes ((array!22405 0))(
  ( (array!22406 (arr!10671 (Array (_ BitVec 32) ValueCell!4279)) (size!11023 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22405)

(declare-fun e!232091 () Bool)

(declare-fun array_inv!7856 (array!22405) Bool)

(assert (=> start!37470 (and (array_inv!7856 _values!506) e!232091)))

(assert (=> start!37470 tp!30507))

(assert (=> start!37470 true))

(declare-fun tp_is_empty!9245 () Bool)

(assert (=> start!37470 tp_is_empty!9245))

(declare-fun array_inv!7857 (array!22403) Bool)

(assert (=> start!37470 (array_inv!7857 _keys!658)))

(declare-fun b!381815 () Bool)

(declare-fun res!217038 () Bool)

(assert (=> b!381815 (=> (not res!217038) (not e!232094))))

(assert (=> b!381815 (= res!217038 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11022 _keys!658))))))

(declare-fun b!381816 () Bool)

(declare-fun e!232090 () Bool)

(assert (=> b!381816 (= e!232090 true)))

(declare-datatypes ((tuple2!6272 0))(
  ( (tuple2!6273 (_1!3147 (_ BitVec 64)) (_2!3147 V!13431)) )
))
(declare-datatypes ((List!6103 0))(
  ( (Nil!6100) (Cons!6099 (h!6955 tuple2!6272) (t!11253 List!6103)) )
))
(declare-datatypes ((ListLongMap!5185 0))(
  ( (ListLongMap!5186 (toList!2608 List!6103)) )
))
(declare-fun lt!179025 () ListLongMap!5185)

(declare-fun lt!179021 () ListLongMap!5185)

(assert (=> b!381816 (= lt!179025 lt!179021)))

(declare-fun b!381817 () Bool)

(declare-fun res!217035 () Bool)

(assert (=> b!381817 (=> (not res!217035) (not e!232094))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381817 (= res!217035 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15432 () Bool)

(declare-fun mapRes!15432 () Bool)

(declare-fun tp!30506 () Bool)

(declare-fun e!232093 () Bool)

(assert (=> mapNonEmpty!15432 (= mapRes!15432 (and tp!30506 e!232093))))

(declare-fun mapKey!15432 () (_ BitVec 32))

(declare-fun mapRest!15432 () (Array (_ BitVec 32) ValueCell!4279))

(declare-fun mapValue!15432 () ValueCell!4279)

(assert (=> mapNonEmpty!15432 (= (arr!10671 _values!506) (store mapRest!15432 mapKey!15432 mapValue!15432))))

(declare-fun b!381818 () Bool)

(declare-fun e!232089 () Bool)

(assert (=> b!381818 (= e!232091 (and e!232089 mapRes!15432))))

(declare-fun condMapEmpty!15432 () Bool)

(declare-fun mapDefault!15432 () ValueCell!4279)

