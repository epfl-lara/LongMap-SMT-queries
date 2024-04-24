; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37302 () Bool)

(assert start!37302)

(declare-fun b_free!8443 () Bool)

(declare-fun b_next!8443 () Bool)

(assert (=> start!37302 (= b_free!8443 (not b_next!8443))))

(declare-fun tp!30045 () Bool)

(declare-fun b_and!15699 () Bool)

(assert (=> start!37302 (= tp!30045 b_and!15699)))

(declare-fun b!378371 () Bool)

(declare-fun res!214333 () Bool)

(declare-fun e!230280 () Bool)

(assert (=> b!378371 (=> (not res!214333) (not e!230280))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22096 0))(
  ( (array!22097 (arr!10516 (Array (_ BitVec 32) (_ BitVec 64))) (size!10868 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22096)

(assert (=> b!378371 (= res!214333 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10868 _keys!658))))))

(declare-fun b!378372 () Bool)

(declare-fun e!230284 () Bool)

(declare-fun e!230286 () Bool)

(declare-fun mapRes!15201 () Bool)

(assert (=> b!378372 (= e!230284 (and e!230286 mapRes!15201))))

(declare-fun condMapEmpty!15201 () Bool)

(declare-datatypes ((V!13227 0))(
  ( (V!13228 (val!4590 Int)) )
))
(declare-datatypes ((ValueCell!4202 0))(
  ( (ValueCellFull!4202 (v!6788 V!13227)) (EmptyCell!4202) )
))
(declare-datatypes ((array!22098 0))(
  ( (array!22099 (arr!10517 (Array (_ BitVec 32) ValueCell!4202)) (size!10869 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22098)

(declare-fun mapDefault!15201 () ValueCell!4202)

(assert (=> b!378372 (= condMapEmpty!15201 (= (arr!10517 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4202)) mapDefault!15201)))))

(declare-fun b!378373 () Bool)

(declare-fun res!214336 () Bool)

(assert (=> b!378373 (=> (not res!214336) (not e!230280))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378373 (= res!214336 (validKeyInArray!0 k0!778))))

(declare-fun b!378374 () Bool)

(declare-fun res!214337 () Bool)

(declare-fun e!230279 () Bool)

(assert (=> b!378374 (=> (not res!214337) (not e!230279))))

(declare-fun lt!176323 () array!22096)

(declare-datatypes ((List!5871 0))(
  ( (Nil!5868) (Cons!5867 (h!6723 (_ BitVec 64)) (t!11013 List!5871)) )
))
(declare-fun arrayNoDuplicates!0 (array!22096 (_ BitVec 32) List!5871) Bool)

(assert (=> b!378374 (= res!214337 (arrayNoDuplicates!0 lt!176323 #b00000000000000000000000000000000 Nil!5868))))

(declare-fun b!378375 () Bool)

(declare-fun e!230282 () Bool)

(assert (=> b!378375 (= e!230279 (not e!230282))))

(declare-fun res!214338 () Bool)

(assert (=> b!378375 (=> res!214338 e!230282)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378375 (= res!214338 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6032 0))(
  ( (tuple2!6033 (_1!3027 (_ BitVec 64)) (_2!3027 V!13227)) )
))
(declare-datatypes ((List!5872 0))(
  ( (Nil!5869) (Cons!5868 (h!6724 tuple2!6032) (t!11014 List!5872)) )
))
(declare-datatypes ((ListLongMap!4947 0))(
  ( (ListLongMap!4948 (toList!2489 List!5872)) )
))
(declare-fun lt!176326 () ListLongMap!4947)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13227)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13227)

(declare-fun getCurrentListMap!1932 (array!22096 array!22098 (_ BitVec 32) (_ BitVec 32) V!13227 V!13227 (_ BitVec 32) Int) ListLongMap!4947)

(assert (=> b!378375 (= lt!176326 (getCurrentListMap!1932 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176321 () ListLongMap!4947)

(declare-fun lt!176328 () array!22098)

(assert (=> b!378375 (= lt!176321 (getCurrentListMap!1932 lt!176323 lt!176328 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176320 () ListLongMap!4947)

(declare-fun lt!176332 () ListLongMap!4947)

(assert (=> b!378375 (and (= lt!176320 lt!176332) (= lt!176332 lt!176320))))

(declare-fun lt!176330 () ListLongMap!4947)

(declare-fun lt!176324 () tuple2!6032)

(declare-fun +!885 (ListLongMap!4947 tuple2!6032) ListLongMap!4947)

(assert (=> b!378375 (= lt!176332 (+!885 lt!176330 lt!176324))))

(declare-fun v!373 () V!13227)

(assert (=> b!378375 (= lt!176324 (tuple2!6033 k0!778 v!373))))

(declare-datatypes ((Unit!11653 0))(
  ( (Unit!11654) )
))
(declare-fun lt!176329 () Unit!11653)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!119 (array!22096 array!22098 (_ BitVec 32) (_ BitVec 32) V!13227 V!13227 (_ BitVec 32) (_ BitVec 64) V!13227 (_ BitVec 32) Int) Unit!11653)

(assert (=> b!378375 (= lt!176329 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!119 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!779 (array!22096 array!22098 (_ BitVec 32) (_ BitVec 32) V!13227 V!13227 (_ BitVec 32) Int) ListLongMap!4947)

(assert (=> b!378375 (= lt!176320 (getCurrentListMapNoExtraKeys!779 lt!176323 lt!176328 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378375 (= lt!176328 (array!22099 (store (arr!10517 _values!506) i!548 (ValueCellFull!4202 v!373)) (size!10869 _values!506)))))

(assert (=> b!378375 (= lt!176330 (getCurrentListMapNoExtraKeys!779 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378376 () Bool)

(declare-fun e!230281 () Bool)

(assert (=> b!378376 (= e!230282 e!230281)))

(declare-fun res!214339 () Bool)

(assert (=> b!378376 (=> res!214339 e!230281)))

(assert (=> b!378376 (= res!214339 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176327 () ListLongMap!4947)

(assert (=> b!378376 (= lt!176326 lt!176327)))

(declare-fun lt!176325 () tuple2!6032)

(assert (=> b!378376 (= lt!176327 (+!885 lt!176330 lt!176325))))

(declare-fun lt!176331 () ListLongMap!4947)

(assert (=> b!378376 (= lt!176321 lt!176331)))

(assert (=> b!378376 (= lt!176331 (+!885 lt!176332 lt!176325))))

(assert (=> b!378376 (= lt!176321 (+!885 lt!176320 lt!176325))))

(assert (=> b!378376 (= lt!176325 (tuple2!6033 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378377 () Bool)

(declare-fun res!214331 () Bool)

(assert (=> b!378377 (=> (not res!214331) (not e!230280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22096 (_ BitVec 32)) Bool)

(assert (=> b!378377 (= res!214331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378378 () Bool)

(assert (=> b!378378 (= e!230280 e!230279)))

(declare-fun res!214332 () Bool)

(assert (=> b!378378 (=> (not res!214332) (not e!230279))))

(assert (=> b!378378 (= res!214332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176323 mask!970))))

(assert (=> b!378378 (= lt!176323 (array!22097 (store (arr!10516 _keys!658) i!548 k0!778) (size!10868 _keys!658)))))

(declare-fun mapIsEmpty!15201 () Bool)

(assert (=> mapIsEmpty!15201 mapRes!15201))

(declare-fun b!378380 () Bool)

(declare-fun res!214329 () Bool)

(assert (=> b!378380 (=> (not res!214329) (not e!230280))))

(declare-fun arrayContainsKey!0 (array!22096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378380 (= res!214329 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378381 () Bool)

(declare-fun res!214330 () Bool)

(assert (=> b!378381 (=> (not res!214330) (not e!230280))))

(assert (=> b!378381 (= res!214330 (and (= (size!10869 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10868 _keys!658) (size!10869 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378382 () Bool)

(declare-fun tp_is_empty!9091 () Bool)

(assert (=> b!378382 (= e!230286 tp_is_empty!9091)))

(declare-fun mapNonEmpty!15201 () Bool)

(declare-fun tp!30044 () Bool)

(declare-fun e!230285 () Bool)

(assert (=> mapNonEmpty!15201 (= mapRes!15201 (and tp!30044 e!230285))))

(declare-fun mapRest!15201 () (Array (_ BitVec 32) ValueCell!4202))

(declare-fun mapKey!15201 () (_ BitVec 32))

(declare-fun mapValue!15201 () ValueCell!4202)

(assert (=> mapNonEmpty!15201 (= (arr!10517 _values!506) (store mapRest!15201 mapKey!15201 mapValue!15201))))

(declare-fun b!378383 () Bool)

(assert (=> b!378383 (= e!230285 tp_is_empty!9091)))

(declare-fun b!378384 () Bool)

(declare-fun res!214340 () Bool)

(assert (=> b!378384 (=> (not res!214340) (not e!230280))))

(assert (=> b!378384 (= res!214340 (or (= (select (arr!10516 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10516 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378385 () Bool)

(assert (=> b!378385 (= e!230281 true)))

(assert (=> b!378385 (= lt!176331 (+!885 lt!176327 lt!176324))))

(declare-fun lt!176322 () Unit!11653)

(declare-fun addCommutativeForDiffKeys!300 (ListLongMap!4947 (_ BitVec 64) V!13227 (_ BitVec 64) V!13227) Unit!11653)

(assert (=> b!378385 (= lt!176322 (addCommutativeForDiffKeys!300 lt!176330 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378379 () Bool)

(declare-fun res!214334 () Bool)

(assert (=> b!378379 (=> (not res!214334) (not e!230280))))

(assert (=> b!378379 (= res!214334 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5868))))

(declare-fun res!214335 () Bool)

(assert (=> start!37302 (=> (not res!214335) (not e!230280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37302 (= res!214335 (validMask!0 mask!970))))

(assert (=> start!37302 e!230280))

(declare-fun array_inv!7798 (array!22098) Bool)

(assert (=> start!37302 (and (array_inv!7798 _values!506) e!230284)))

(assert (=> start!37302 tp!30045))

(assert (=> start!37302 true))

(assert (=> start!37302 tp_is_empty!9091))

(declare-fun array_inv!7799 (array!22096) Bool)

(assert (=> start!37302 (array_inv!7799 _keys!658)))

(assert (= (and start!37302 res!214335) b!378381))

(assert (= (and b!378381 res!214330) b!378377))

(assert (= (and b!378377 res!214331) b!378379))

(assert (= (and b!378379 res!214334) b!378371))

(assert (= (and b!378371 res!214333) b!378373))

(assert (= (and b!378373 res!214336) b!378384))

(assert (= (and b!378384 res!214340) b!378380))

(assert (= (and b!378380 res!214329) b!378378))

(assert (= (and b!378378 res!214332) b!378374))

(assert (= (and b!378374 res!214337) b!378375))

(assert (= (and b!378375 (not res!214338)) b!378376))

(assert (= (and b!378376 (not res!214339)) b!378385))

(assert (= (and b!378372 condMapEmpty!15201) mapIsEmpty!15201))

(assert (= (and b!378372 (not condMapEmpty!15201)) mapNonEmpty!15201))

(get-info :version)

(assert (= (and mapNonEmpty!15201 ((_ is ValueCellFull!4202) mapValue!15201)) b!378383))

(assert (= (and b!378372 ((_ is ValueCellFull!4202) mapDefault!15201)) b!378382))

(assert (= start!37302 b!378372))

(declare-fun m!375461 () Bool)

(assert (=> b!378385 m!375461))

(declare-fun m!375463 () Bool)

(assert (=> b!378385 m!375463))

(declare-fun m!375465 () Bool)

(assert (=> b!378376 m!375465))

(declare-fun m!375467 () Bool)

(assert (=> b!378376 m!375467))

(declare-fun m!375469 () Bool)

(assert (=> b!378376 m!375469))

(declare-fun m!375471 () Bool)

(assert (=> b!378375 m!375471))

(declare-fun m!375473 () Bool)

(assert (=> b!378375 m!375473))

(declare-fun m!375475 () Bool)

(assert (=> b!378375 m!375475))

(declare-fun m!375477 () Bool)

(assert (=> b!378375 m!375477))

(declare-fun m!375479 () Bool)

(assert (=> b!378375 m!375479))

(declare-fun m!375481 () Bool)

(assert (=> b!378375 m!375481))

(declare-fun m!375483 () Bool)

(assert (=> b!378375 m!375483))

(declare-fun m!375485 () Bool)

(assert (=> b!378374 m!375485))

(declare-fun m!375487 () Bool)

(assert (=> b!378373 m!375487))

(declare-fun m!375489 () Bool)

(assert (=> b!378380 m!375489))

(declare-fun m!375491 () Bool)

(assert (=> b!378384 m!375491))

(declare-fun m!375493 () Bool)

(assert (=> mapNonEmpty!15201 m!375493))

(declare-fun m!375495 () Bool)

(assert (=> b!378377 m!375495))

(declare-fun m!375497 () Bool)

(assert (=> b!378378 m!375497))

(declare-fun m!375499 () Bool)

(assert (=> b!378378 m!375499))

(declare-fun m!375501 () Bool)

(assert (=> start!37302 m!375501))

(declare-fun m!375503 () Bool)

(assert (=> start!37302 m!375503))

(declare-fun m!375505 () Bool)

(assert (=> start!37302 m!375505))

(declare-fun m!375507 () Bool)

(assert (=> b!378379 m!375507))

(check-sat (not b!378375) (not b_next!8443) (not b!378373) (not b!378374) (not mapNonEmpty!15201) (not b!378379) (not b!378380) tp_is_empty!9091 (not b!378377) (not start!37302) (not b!378376) b_and!15699 (not b!378378) (not b!378385))
(check-sat b_and!15699 (not b_next!8443))
