; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37530 () Bool)

(assert start!37530)

(declare-fun b_free!8671 () Bool)

(declare-fun b_next!8671 () Bool)

(assert (=> start!37530 (= b_free!8671 (not b_next!8671))))

(declare-fun tp!30728 () Bool)

(declare-fun b_and!15927 () Bool)

(assert (=> start!37530 (= tp!30728 b_and!15927)))

(declare-fun b!383319 () Bool)

(declare-fun res!218252 () Bool)

(declare-fun e!232839 () Bool)

(assert (=> b!383319 (=> (not res!218252) (not e!232839))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22534 0))(
  ( (array!22535 (arr!10735 (Array (_ BitVec 32) (_ BitVec 64))) (size!11087 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22534)

(assert (=> b!383319 (= res!218252 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11087 _keys!658))))))

(declare-fun b!383320 () Bool)

(declare-fun res!218256 () Bool)

(assert (=> b!383320 (=> (not res!218256) (not e!232839))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383320 (= res!218256 (validKeyInArray!0 k0!778))))

(declare-fun b!383321 () Bool)

(declare-fun res!218253 () Bool)

(assert (=> b!383321 (=> (not res!218253) (not e!232839))))

(declare-fun arrayContainsKey!0 (array!22534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383321 (= res!218253 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383322 () Bool)

(declare-fun e!232836 () Bool)

(declare-fun tp_is_empty!9319 () Bool)

(assert (=> b!383322 (= e!232836 tp_is_empty!9319)))

(declare-fun b!383323 () Bool)

(declare-fun e!232835 () Bool)

(declare-fun e!232838 () Bool)

(assert (=> b!383323 (= e!232835 (not e!232838))))

(declare-fun res!218258 () Bool)

(assert (=> b!383323 (=> res!218258 e!232838)))

(declare-fun lt!180082 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383323 (= res!218258 (or (and (not lt!180082) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180082) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180082)))))

(assert (=> b!383323 (= lt!180082 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13531 0))(
  ( (V!13532 (val!4704 Int)) )
))
(declare-datatypes ((ValueCell!4316 0))(
  ( (ValueCellFull!4316 (v!6902 V!13531)) (EmptyCell!4316) )
))
(declare-datatypes ((array!22536 0))(
  ( (array!22537 (arr!10736 (Array (_ BitVec 32) ValueCell!4316)) (size!11088 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22536)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13531)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13531)

(declare-datatypes ((tuple2!6206 0))(
  ( (tuple2!6207 (_1!3114 (_ BitVec 64)) (_2!3114 V!13531)) )
))
(declare-datatypes ((List!6042 0))(
  ( (Nil!6039) (Cons!6038 (h!6894 tuple2!6206) (t!11184 List!6042)) )
))
(declare-datatypes ((ListLongMap!5121 0))(
  ( (ListLongMap!5122 (toList!2576 List!6042)) )
))
(declare-fun lt!180078 () ListLongMap!5121)

(declare-fun getCurrentListMap!2009 (array!22534 array!22536 (_ BitVec 32) (_ BitVec 32) V!13531 V!13531 (_ BitVec 32) Int) ListLongMap!5121)

(assert (=> b!383323 (= lt!180078 (getCurrentListMap!2009 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180085 () array!22536)

(declare-fun lt!180083 () array!22534)

(declare-fun lt!180081 () ListLongMap!5121)

(assert (=> b!383323 (= lt!180081 (getCurrentListMap!2009 lt!180083 lt!180085 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180086 () ListLongMap!5121)

(declare-fun lt!180080 () ListLongMap!5121)

(assert (=> b!383323 (and (= lt!180086 lt!180080) (= lt!180080 lt!180086))))

(declare-fun lt!180079 () ListLongMap!5121)

(declare-fun lt!180087 () tuple2!6206)

(declare-fun +!968 (ListLongMap!5121 tuple2!6206) ListLongMap!5121)

(assert (=> b!383323 (= lt!180080 (+!968 lt!180079 lt!180087))))

(declare-fun v!373 () V!13531)

(assert (=> b!383323 (= lt!180087 (tuple2!6207 k0!778 v!373))))

(declare-datatypes ((Unit!11813 0))(
  ( (Unit!11814) )
))
(declare-fun lt!180088 () Unit!11813)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!196 (array!22534 array!22536 (_ BitVec 32) (_ BitVec 32) V!13531 V!13531 (_ BitVec 32) (_ BitVec 64) V!13531 (_ BitVec 32) Int) Unit!11813)

(assert (=> b!383323 (= lt!180088 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!196 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!856 (array!22534 array!22536 (_ BitVec 32) (_ BitVec 32) V!13531 V!13531 (_ BitVec 32) Int) ListLongMap!5121)

(assert (=> b!383323 (= lt!180086 (getCurrentListMapNoExtraKeys!856 lt!180083 lt!180085 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383323 (= lt!180085 (array!22537 (store (arr!10736 _values!506) i!548 (ValueCellFull!4316 v!373)) (size!11088 _values!506)))))

(assert (=> b!383323 (= lt!180079 (getCurrentListMapNoExtraKeys!856 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383324 () Bool)

(declare-fun res!218259 () Bool)

(assert (=> b!383324 (=> (not res!218259) (not e!232839))))

(assert (=> b!383324 (= res!218259 (or (= (select (arr!10735 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10735 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383325 () Bool)

(declare-fun e!232837 () Bool)

(declare-fun mapRes!15543 () Bool)

(assert (=> b!383325 (= e!232837 (and e!232836 mapRes!15543))))

(declare-fun condMapEmpty!15543 () Bool)

(declare-fun mapDefault!15543 () ValueCell!4316)

(assert (=> b!383325 (= condMapEmpty!15543 (= (arr!10736 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4316)) mapDefault!15543)))))

(declare-fun b!383326 () Bool)

(declare-fun res!218260 () Bool)

(assert (=> b!383326 (=> (not res!218260) (not e!232839))))

(declare-datatypes ((List!6043 0))(
  ( (Nil!6040) (Cons!6039 (h!6895 (_ BitVec 64)) (t!11185 List!6043)) )
))
(declare-fun arrayNoDuplicates!0 (array!22534 (_ BitVec 32) List!6043) Bool)

(assert (=> b!383326 (= res!218260 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6040))))

(declare-fun b!383327 () Bool)

(assert (=> b!383327 (= e!232838 true)))

(declare-fun lt!180084 () ListLongMap!5121)

(assert (=> b!383327 (= lt!180084 (+!968 lt!180078 lt!180087))))

(assert (=> b!383327 (= lt!180081 lt!180086)))

(declare-fun b!383328 () Bool)

(declare-fun e!232834 () Bool)

(assert (=> b!383328 (= e!232834 tp_is_empty!9319)))

(declare-fun b!383329 () Bool)

(declare-fun res!218254 () Bool)

(assert (=> b!383329 (=> (not res!218254) (not e!232839))))

(assert (=> b!383329 (= res!218254 (and (= (size!11088 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11087 _keys!658) (size!11088 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383330 () Bool)

(declare-fun res!218251 () Bool)

(assert (=> b!383330 (=> (not res!218251) (not e!232835))))

(assert (=> b!383330 (= res!218251 (arrayNoDuplicates!0 lt!180083 #b00000000000000000000000000000000 Nil!6040))))

(declare-fun mapIsEmpty!15543 () Bool)

(assert (=> mapIsEmpty!15543 mapRes!15543))

(declare-fun mapNonEmpty!15543 () Bool)

(declare-fun tp!30729 () Bool)

(assert (=> mapNonEmpty!15543 (= mapRes!15543 (and tp!30729 e!232834))))

(declare-fun mapKey!15543 () (_ BitVec 32))

(declare-fun mapRest!15543 () (Array (_ BitVec 32) ValueCell!4316))

(declare-fun mapValue!15543 () ValueCell!4316)

(assert (=> mapNonEmpty!15543 (= (arr!10736 _values!506) (store mapRest!15543 mapKey!15543 mapValue!15543))))

(declare-fun res!218261 () Bool)

(assert (=> start!37530 (=> (not res!218261) (not e!232839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37530 (= res!218261 (validMask!0 mask!970))))

(assert (=> start!37530 e!232839))

(declare-fun array_inv!7944 (array!22536) Bool)

(assert (=> start!37530 (and (array_inv!7944 _values!506) e!232837)))

(assert (=> start!37530 tp!30728))

(assert (=> start!37530 true))

(assert (=> start!37530 tp_is_empty!9319))

(declare-fun array_inv!7945 (array!22534) Bool)

(assert (=> start!37530 (array_inv!7945 _keys!658)))

(declare-fun b!383331 () Bool)

(assert (=> b!383331 (= e!232839 e!232835)))

(declare-fun res!218255 () Bool)

(assert (=> b!383331 (=> (not res!218255) (not e!232835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22534 (_ BitVec 32)) Bool)

(assert (=> b!383331 (= res!218255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180083 mask!970))))

(assert (=> b!383331 (= lt!180083 (array!22535 (store (arr!10735 _keys!658) i!548 k0!778) (size!11087 _keys!658)))))

(declare-fun b!383332 () Bool)

(declare-fun res!218257 () Bool)

(assert (=> b!383332 (=> (not res!218257) (not e!232839))))

(assert (=> b!383332 (= res!218257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37530 res!218261) b!383329))

(assert (= (and b!383329 res!218254) b!383332))

(assert (= (and b!383332 res!218257) b!383326))

(assert (= (and b!383326 res!218260) b!383319))

(assert (= (and b!383319 res!218252) b!383320))

(assert (= (and b!383320 res!218256) b!383324))

(assert (= (and b!383324 res!218259) b!383321))

(assert (= (and b!383321 res!218253) b!383331))

(assert (= (and b!383331 res!218255) b!383330))

(assert (= (and b!383330 res!218251) b!383323))

(assert (= (and b!383323 (not res!218258)) b!383327))

(assert (= (and b!383325 condMapEmpty!15543) mapIsEmpty!15543))

(assert (= (and b!383325 (not condMapEmpty!15543)) mapNonEmpty!15543))

(get-info :version)

(assert (= (and mapNonEmpty!15543 ((_ is ValueCellFull!4316) mapValue!15543)) b!383328))

(assert (= (and b!383325 ((_ is ValueCellFull!4316) mapDefault!15543)) b!383322))

(assert (= start!37530 b!383325))

(declare-fun m!380345 () Bool)

(assert (=> b!383320 m!380345))

(declare-fun m!380347 () Bool)

(assert (=> b!383331 m!380347))

(declare-fun m!380349 () Bool)

(assert (=> b!383331 m!380349))

(declare-fun m!380351 () Bool)

(assert (=> start!37530 m!380351))

(declare-fun m!380353 () Bool)

(assert (=> start!37530 m!380353))

(declare-fun m!380355 () Bool)

(assert (=> start!37530 m!380355))

(declare-fun m!380357 () Bool)

(assert (=> b!383321 m!380357))

(declare-fun m!380359 () Bool)

(assert (=> b!383327 m!380359))

(declare-fun m!380361 () Bool)

(assert (=> b!383330 m!380361))

(declare-fun m!380363 () Bool)

(assert (=> b!383323 m!380363))

(declare-fun m!380365 () Bool)

(assert (=> b!383323 m!380365))

(declare-fun m!380367 () Bool)

(assert (=> b!383323 m!380367))

(declare-fun m!380369 () Bool)

(assert (=> b!383323 m!380369))

(declare-fun m!380371 () Bool)

(assert (=> b!383323 m!380371))

(declare-fun m!380373 () Bool)

(assert (=> b!383323 m!380373))

(declare-fun m!380375 () Bool)

(assert (=> b!383323 m!380375))

(declare-fun m!380377 () Bool)

(assert (=> b!383326 m!380377))

(declare-fun m!380379 () Bool)

(assert (=> b!383324 m!380379))

(declare-fun m!380381 () Bool)

(assert (=> mapNonEmpty!15543 m!380381))

(declare-fun m!380383 () Bool)

(assert (=> b!383332 m!380383))

(check-sat (not b!383321) (not mapNonEmpty!15543) (not b!383327) (not b!383320) (not b!383331) b_and!15927 (not b!383323) (not b!383332) tp_is_empty!9319 (not b!383330) (not b_next!8671) (not start!37530) (not b!383326))
(check-sat b_and!15927 (not b_next!8671))
