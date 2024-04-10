; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37370 () Bool)

(assert start!37370)

(declare-fun b_free!8497 () Bool)

(declare-fun b_next!8497 () Bool)

(assert (=> start!37370 (= b_free!8497 (not b_next!8497))))

(declare-fun tp!30207 () Bool)

(declare-fun b_and!15739 () Bool)

(assert (=> start!37370 (= tp!30207 b_and!15739)))

(declare-fun b!379636 () Bool)

(declare-fun res!215307 () Bool)

(declare-fun e!230961 () Bool)

(assert (=> b!379636 (=> (not res!215307) (not e!230961))))

(declare-datatypes ((array!22211 0))(
  ( (array!22212 (arr!10574 (Array (_ BitVec 32) (_ BitVec 64))) (size!10926 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22211)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379636 (= res!215307 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!379637 () Bool)

(declare-fun res!215315 () Bool)

(assert (=> b!379637 (=> (not res!215315) (not e!230961))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379637 (= res!215315 (or (= (select (arr!10574 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10574 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379638 () Bool)

(declare-fun e!230962 () Bool)

(declare-fun e!230964 () Bool)

(assert (=> b!379638 (= e!230962 e!230964)))

(declare-fun res!215304 () Bool)

(assert (=> b!379638 (=> res!215304 e!230964)))

(assert (=> b!379638 (= res!215304 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13299 0))(
  ( (V!13300 (val!4617 Int)) )
))
(declare-datatypes ((tuple2!6180 0))(
  ( (tuple2!6181 (_1!3101 (_ BitVec 64)) (_2!3101 V!13299)) )
))
(declare-datatypes ((List!6016 0))(
  ( (Nil!6013) (Cons!6012 (h!6868 tuple2!6180) (t!11166 List!6016)) )
))
(declare-datatypes ((ListLongMap!5093 0))(
  ( (ListLongMap!5094 (toList!2562 List!6016)) )
))
(declare-fun lt!177360 () ListLongMap!5093)

(declare-fun lt!177365 () ListLongMap!5093)

(assert (=> b!379638 (= lt!177360 lt!177365)))

(declare-fun lt!177361 () ListLongMap!5093)

(declare-fun lt!177357 () tuple2!6180)

(declare-fun +!908 (ListLongMap!5093 tuple2!6180) ListLongMap!5093)

(assert (=> b!379638 (= lt!177365 (+!908 lt!177361 lt!177357))))

(declare-fun lt!177355 () ListLongMap!5093)

(declare-fun lt!177363 () ListLongMap!5093)

(assert (=> b!379638 (= lt!177355 lt!177363)))

(declare-fun lt!177362 () ListLongMap!5093)

(assert (=> b!379638 (= lt!177363 (+!908 lt!177362 lt!177357))))

(declare-fun lt!177356 () ListLongMap!5093)

(assert (=> b!379638 (= lt!177355 (+!908 lt!177356 lt!177357))))

(declare-fun minValue!472 () V!13299)

(assert (=> b!379638 (= lt!177357 (tuple2!6181 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15282 () Bool)

(declare-fun mapRes!15282 () Bool)

(declare-fun tp!30206 () Bool)

(declare-fun e!230965 () Bool)

(assert (=> mapNonEmpty!15282 (= mapRes!15282 (and tp!30206 e!230965))))

(declare-datatypes ((ValueCell!4229 0))(
  ( (ValueCellFull!4229 (v!6814 V!13299)) (EmptyCell!4229) )
))
(declare-datatypes ((array!22213 0))(
  ( (array!22214 (arr!10575 (Array (_ BitVec 32) ValueCell!4229)) (size!10927 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22213)

(declare-fun mapValue!15282 () ValueCell!4229)

(declare-fun mapKey!15282 () (_ BitVec 32))

(declare-fun mapRest!15282 () (Array (_ BitVec 32) ValueCell!4229))

(assert (=> mapNonEmpty!15282 (= (arr!10575 _values!506) (store mapRest!15282 mapKey!15282 mapValue!15282))))

(declare-fun b!379639 () Bool)

(declare-fun res!215310 () Bool)

(assert (=> b!379639 (=> (not res!215310) (not e!230961))))

(assert (=> b!379639 (= res!215310 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10926 _keys!658))))))

(declare-fun b!379640 () Bool)

(declare-fun e!230963 () Bool)

(assert (=> b!379640 (= e!230961 e!230963)))

(declare-fun res!215314 () Bool)

(assert (=> b!379640 (=> (not res!215314) (not e!230963))))

(declare-fun lt!177354 () array!22211)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22211 (_ BitVec 32)) Bool)

(assert (=> b!379640 (= res!215314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177354 mask!970))))

(assert (=> b!379640 (= lt!177354 (array!22212 (store (arr!10574 _keys!658) i!548 k!778) (size!10926 _keys!658)))))

(declare-fun b!379641 () Bool)

(declare-fun e!230960 () Bool)

(declare-fun tp_is_empty!9145 () Bool)

(assert (=> b!379641 (= e!230960 tp_is_empty!9145)))

(declare-fun b!379642 () Bool)

(declare-fun res!215305 () Bool)

(assert (=> b!379642 (=> (not res!215305) (not e!230961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379642 (= res!215305 (validKeyInArray!0 k!778))))

(declare-fun b!379643 () Bool)

(declare-fun e!230966 () Bool)

(assert (=> b!379643 (= e!230966 (and e!230960 mapRes!15282))))

(declare-fun condMapEmpty!15282 () Bool)

(declare-fun mapDefault!15282 () ValueCell!4229)

