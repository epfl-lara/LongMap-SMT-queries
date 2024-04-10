; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37494 () Bool)

(assert start!37494)

(declare-fun b_free!8621 () Bool)

(declare-fun b_next!8621 () Bool)

(assert (=> start!37494 (= b_free!8621 (not b_next!8621))))

(declare-fun tp!30579 () Bool)

(declare-fun b_and!15863 () Bool)

(assert (=> start!37494 (= tp!30579 b_and!15863)))

(declare-fun b!382318 () Bool)

(declare-fun res!217434 () Bool)

(declare-fun e!232341 () Bool)

(assert (=> b!382318 (=> (not res!217434) (not e!232341))))

(declare-datatypes ((array!22447 0))(
  ( (array!22448 (arr!10692 (Array (_ BitVec 32) (_ BitVec 64))) (size!11044 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22447)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382318 (= res!217434 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!382319 () Bool)

(declare-fun e!232343 () Bool)

(declare-fun tp_is_empty!9269 () Bool)

(assert (=> b!382319 (= e!232343 tp_is_empty!9269)))

(declare-fun b!382320 () Bool)

(declare-fun res!217432 () Bool)

(assert (=> b!382320 (=> (not res!217432) (not e!232341))))

(declare-datatypes ((List!6121 0))(
  ( (Nil!6118) (Cons!6117 (h!6973 (_ BitVec 64)) (t!11271 List!6121)) )
))
(declare-fun arrayNoDuplicates!0 (array!22447 (_ BitVec 32) List!6121) Bool)

(assert (=> b!382320 (= res!217432 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6118))))

(declare-fun b!382321 () Bool)

(declare-fun e!232340 () Bool)

(assert (=> b!382321 (= e!232340 true)))

(declare-datatypes ((V!13463 0))(
  ( (V!13464 (val!4679 Int)) )
))
(declare-datatypes ((tuple2!6290 0))(
  ( (tuple2!6291 (_1!3156 (_ BitVec 64)) (_2!3156 V!13463)) )
))
(declare-datatypes ((List!6122 0))(
  ( (Nil!6119) (Cons!6118 (h!6974 tuple2!6290) (t!11272 List!6122)) )
))
(declare-datatypes ((ListLongMap!5203 0))(
  ( (ListLongMap!5204 (toList!2617 List!6122)) )
))
(declare-fun lt!179345 () ListLongMap!5203)

(declare-fun lt!179347 () ListLongMap!5203)

(assert (=> b!382321 (= lt!179345 lt!179347)))

(declare-fun b!382322 () Bool)

(declare-fun res!217438 () Bool)

(assert (=> b!382322 (=> (not res!217438) (not e!232341))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382322 (= res!217438 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11044 _keys!658))))))

(declare-fun mapIsEmpty!15468 () Bool)

(declare-fun mapRes!15468 () Bool)

(assert (=> mapIsEmpty!15468 mapRes!15468))

(declare-fun b!382323 () Bool)

(declare-fun res!217436 () Bool)

(assert (=> b!382323 (=> (not res!217436) (not e!232341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382323 (= res!217436 (validKeyInArray!0 k!778))))

(declare-fun b!382324 () Bool)

(declare-fun e!232345 () Bool)

(assert (=> b!382324 (= e!232341 e!232345)))

(declare-fun res!217437 () Bool)

(assert (=> b!382324 (=> (not res!217437) (not e!232345))))

(declare-fun lt!179344 () array!22447)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22447 (_ BitVec 32)) Bool)

(assert (=> b!382324 (= res!217437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179344 mask!970))))

(assert (=> b!382324 (= lt!179344 (array!22448 (store (arr!10692 _keys!658) i!548 k!778) (size!11044 _keys!658)))))

(declare-fun res!217431 () Bool)

(assert (=> start!37494 (=> (not res!217431) (not e!232341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37494 (= res!217431 (validMask!0 mask!970))))

(assert (=> start!37494 e!232341))

(declare-datatypes ((ValueCell!4291 0))(
  ( (ValueCellFull!4291 (v!6876 V!13463)) (EmptyCell!4291) )
))
(declare-datatypes ((array!22449 0))(
  ( (array!22450 (arr!10693 (Array (_ BitVec 32) ValueCell!4291)) (size!11045 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22449)

(declare-fun e!232342 () Bool)

(declare-fun array_inv!7872 (array!22449) Bool)

(assert (=> start!37494 (and (array_inv!7872 _values!506) e!232342)))

(assert (=> start!37494 tp!30579))

(assert (=> start!37494 true))

(assert (=> start!37494 tp_is_empty!9269))

(declare-fun array_inv!7873 (array!22447) Bool)

(assert (=> start!37494 (array_inv!7873 _keys!658)))

(declare-fun b!382325 () Bool)

(declare-fun e!232346 () Bool)

(assert (=> b!382325 (= e!232346 tp_is_empty!9269)))

(declare-fun b!382326 () Bool)

(declare-fun res!217435 () Bool)

(assert (=> b!382326 (=> (not res!217435) (not e!232345))))

(assert (=> b!382326 (= res!217435 (arrayNoDuplicates!0 lt!179344 #b00000000000000000000000000000000 Nil!6118))))

(declare-fun mapNonEmpty!15468 () Bool)

(declare-fun tp!30578 () Bool)

(assert (=> mapNonEmpty!15468 (= mapRes!15468 (and tp!30578 e!232346))))

(declare-fun mapValue!15468 () ValueCell!4291)

(declare-fun mapRest!15468 () (Array (_ BitVec 32) ValueCell!4291))

(declare-fun mapKey!15468 () (_ BitVec 32))

(assert (=> mapNonEmpty!15468 (= (arr!10693 _values!506) (store mapRest!15468 mapKey!15468 mapValue!15468))))

(declare-fun b!382327 () Bool)

(declare-fun res!217429 () Bool)

(assert (=> b!382327 (=> (not res!217429) (not e!232341))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382327 (= res!217429 (and (= (size!11045 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11044 _keys!658) (size!11045 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382328 () Bool)

(assert (=> b!382328 (= e!232342 (and e!232343 mapRes!15468))))

(declare-fun condMapEmpty!15468 () Bool)

(declare-fun mapDefault!15468 () ValueCell!4291)

