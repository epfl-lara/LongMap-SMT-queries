; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37320 () Bool)

(assert start!37320)

(declare-fun b_free!8447 () Bool)

(declare-fun b_next!8447 () Bool)

(assert (=> start!37320 (= b_free!8447 (not b_next!8447))))

(declare-fun tp!30057 () Bool)

(declare-fun b_and!15689 () Bool)

(assert (=> start!37320 (= tp!30057 b_and!15689)))

(declare-fun b!378510 () Bool)

(declare-fun res!214404 () Bool)

(declare-fun e!230363 () Bool)

(assert (=> b!378510 (=> (not res!214404) (not e!230363))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!22115 0))(
  ( (array!22116 (arr!10526 (Array (_ BitVec 32) (_ BitVec 64))) (size!10878 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22115)

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((V!13231 0))(
  ( (V!13232 (val!4592 Int)) )
))
(declare-datatypes ((ValueCell!4204 0))(
  ( (ValueCellFull!4204 (v!6789 V!13231)) (EmptyCell!4204) )
))
(declare-datatypes ((array!22117 0))(
  ( (array!22118 (arr!10527 (Array (_ BitVec 32) ValueCell!4204)) (size!10879 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22117)

(assert (=> b!378510 (= res!214404 (and (= (size!10879 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10878 _keys!658) (size!10879 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378511 () Bool)

(declare-fun e!230359 () Bool)

(declare-fun tp_is_empty!9095 () Bool)

(assert (=> b!378511 (= e!230359 tp_is_empty!9095)))

(declare-fun b!378512 () Bool)

(declare-fun res!214409 () Bool)

(assert (=> b!378512 (=> (not res!214409) (not e!230363))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378512 (= res!214409 (or (= (select (arr!10526 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10526 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378513 () Bool)

(declare-fun res!214408 () Bool)

(assert (=> b!378513 (=> (not res!214408) (not e!230363))))

(assert (=> b!378513 (= res!214408 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10878 _keys!658))))))

(declare-fun b!378514 () Bool)

(declare-fun e!230365 () Bool)

(declare-fun e!230360 () Bool)

(assert (=> b!378514 (= e!230365 (not e!230360))))

(declare-fun res!214406 () Bool)

(assert (=> b!378514 (=> res!214406 e!230360)))

(assert (=> b!378514 (= res!214406 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6134 0))(
  ( (tuple2!6135 (_1!3078 (_ BitVec 64)) (_2!3078 V!13231)) )
))
(declare-datatypes ((List!5972 0))(
  ( (Nil!5969) (Cons!5968 (h!6824 tuple2!6134) (t!11122 List!5972)) )
))
(declare-datatypes ((ListLongMap!5047 0))(
  ( (ListLongMap!5048 (toList!2539 List!5972)) )
))
(declare-fun lt!176382 () ListLongMap!5047)

(declare-fun zeroValue!472 () V!13231)

(declare-fun minValue!472 () V!13231)

(declare-fun getCurrentListMap!1965 (array!22115 array!22117 (_ BitVec 32) (_ BitVec 32) V!13231 V!13231 (_ BitVec 32) Int) ListLongMap!5047)

(assert (=> b!378514 (= lt!176382 (getCurrentListMap!1965 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176379 () array!22115)

(declare-fun lt!176390 () ListLongMap!5047)

(declare-fun lt!176389 () array!22117)

(assert (=> b!378514 (= lt!176390 (getCurrentListMap!1965 lt!176379 lt!176389 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176381 () ListLongMap!5047)

(declare-fun lt!176391 () ListLongMap!5047)

(assert (=> b!378514 (and (= lt!176381 lt!176391) (= lt!176391 lt!176381))))

(declare-fun lt!176387 () ListLongMap!5047)

(declare-fun lt!176383 () tuple2!6134)

(declare-fun +!885 (ListLongMap!5047 tuple2!6134) ListLongMap!5047)

(assert (=> b!378514 (= lt!176391 (+!885 lt!176387 lt!176383))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13231)

(assert (=> b!378514 (= lt!176383 (tuple2!6135 k!778 v!373))))

(declare-datatypes ((Unit!11670 0))(
  ( (Unit!11671) )
))
(declare-fun lt!176385 () Unit!11670)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!123 (array!22115 array!22117 (_ BitVec 32) (_ BitVec 32) V!13231 V!13231 (_ BitVec 32) (_ BitVec 64) V!13231 (_ BitVec 32) Int) Unit!11670)

(assert (=> b!378514 (= lt!176385 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!123 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!799 (array!22115 array!22117 (_ BitVec 32) (_ BitVec 32) V!13231 V!13231 (_ BitVec 32) Int) ListLongMap!5047)

(assert (=> b!378514 (= lt!176381 (getCurrentListMapNoExtraKeys!799 lt!176379 lt!176389 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378514 (= lt!176389 (array!22118 (store (arr!10527 _values!506) i!548 (ValueCellFull!4204 v!373)) (size!10879 _values!506)))))

(assert (=> b!378514 (= lt!176387 (getCurrentListMapNoExtraKeys!799 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378515 () Bool)

(declare-fun e!230361 () Bool)

(assert (=> b!378515 (= e!230361 tp_is_empty!9095)))

(declare-fun mapNonEmpty!15207 () Bool)

(declare-fun mapRes!15207 () Bool)

(declare-fun tp!30056 () Bool)

(assert (=> mapNonEmpty!15207 (= mapRes!15207 (and tp!30056 e!230359))))

(declare-fun mapValue!15207 () ValueCell!4204)

(declare-fun mapKey!15207 () (_ BitVec 32))

(declare-fun mapRest!15207 () (Array (_ BitVec 32) ValueCell!4204))

(assert (=> mapNonEmpty!15207 (= (arr!10527 _values!506) (store mapRest!15207 mapKey!15207 mapValue!15207))))

(declare-fun b!378516 () Bool)

(declare-fun e!230364 () Bool)

(assert (=> b!378516 (= e!230364 (and e!230361 mapRes!15207))))

(declare-fun condMapEmpty!15207 () Bool)

(declare-fun mapDefault!15207 () ValueCell!4204)

