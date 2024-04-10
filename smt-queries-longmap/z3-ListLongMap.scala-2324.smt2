; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37408 () Bool)

(assert start!37408)

(declare-fun b_free!8535 () Bool)

(declare-fun b_next!8535 () Bool)

(assert (=> start!37408 (= b_free!8535 (not b_next!8535))))

(declare-fun tp!30321 () Bool)

(declare-fun b_and!15777 () Bool)

(assert (=> start!37408 (= tp!30321 b_and!15777)))

(declare-fun mapNonEmpty!15339 () Bool)

(declare-fun mapRes!15339 () Bool)

(declare-fun tp!30320 () Bool)

(declare-fun e!231421 () Bool)

(assert (=> mapNonEmpty!15339 (= mapRes!15339 (and tp!30320 e!231421))))

(declare-datatypes ((V!13349 0))(
  ( (V!13350 (val!4636 Int)) )
))
(declare-datatypes ((ValueCell!4248 0))(
  ( (ValueCellFull!4248 (v!6833 V!13349)) (EmptyCell!4248) )
))
(declare-datatypes ((array!22285 0))(
  ( (array!22286 (arr!10611 (Array (_ BitVec 32) ValueCell!4248)) (size!10963 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22285)

(declare-fun mapKey!15339 () (_ BitVec 32))

(declare-fun mapRest!15339 () (Array (_ BitVec 32) ValueCell!4248))

(declare-fun mapValue!15339 () ValueCell!4248)

(assert (=> mapNonEmpty!15339 (= (arr!10611 _values!506) (store mapRest!15339 mapKey!15339 mapValue!15339))))

(declare-fun res!215999 () Bool)

(declare-fun e!231415 () Bool)

(assert (=> start!37408 (=> (not res!215999) (not e!231415))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37408 (= res!215999 (validMask!0 mask!970))))

(assert (=> start!37408 e!231415))

(declare-fun e!231418 () Bool)

(declare-fun array_inv!7812 (array!22285) Bool)

(assert (=> start!37408 (and (array_inv!7812 _values!506) e!231418)))

(assert (=> start!37408 tp!30321))

(assert (=> start!37408 true))

(declare-fun tp_is_empty!9183 () Bool)

(assert (=> start!37408 tp_is_empty!9183))

(declare-datatypes ((array!22287 0))(
  ( (array!22288 (arr!10612 (Array (_ BitVec 32) (_ BitVec 64))) (size!10964 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22287)

(declare-fun array_inv!7813 (array!22287) Bool)

(assert (=> start!37408 (array_inv!7813 _keys!658)))

(declare-fun b!380490 () Bool)

(declare-fun e!231420 () Bool)

(declare-fun e!231419 () Bool)

(assert (=> b!380490 (= e!231420 e!231419)))

(declare-fun res!215996 () Bool)

(assert (=> b!380490 (=> res!215996 e!231419)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!380490 (= res!215996 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6216 0))(
  ( (tuple2!6217 (_1!3119 (_ BitVec 64)) (_2!3119 V!13349)) )
))
(declare-datatypes ((List!6051 0))(
  ( (Nil!6048) (Cons!6047 (h!6903 tuple2!6216) (t!11201 List!6051)) )
))
(declare-datatypes ((ListLongMap!5129 0))(
  ( (ListLongMap!5130 (toList!2580 List!6051)) )
))
(declare-fun lt!178102 () ListLongMap!5129)

(declare-fun lt!178103 () ListLongMap!5129)

(assert (=> b!380490 (= lt!178102 lt!178103)))

(declare-fun lt!178097 () ListLongMap!5129)

(declare-fun lt!178096 () tuple2!6216)

(declare-fun +!926 (ListLongMap!5129 tuple2!6216) ListLongMap!5129)

(assert (=> b!380490 (= lt!178103 (+!926 lt!178097 lt!178096))))

(declare-fun lt!178107 () ListLongMap!5129)

(declare-fun lt!178101 () ListLongMap!5129)

(assert (=> b!380490 (= lt!178107 lt!178101)))

(declare-fun lt!178100 () ListLongMap!5129)

(assert (=> b!380490 (= lt!178101 (+!926 lt!178100 lt!178096))))

(declare-fun lt!178105 () ListLongMap!5129)

(assert (=> b!380490 (= lt!178107 (+!926 lt!178105 lt!178096))))

(declare-fun minValue!472 () V!13349)

(assert (=> b!380490 (= lt!178096 (tuple2!6217 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380491 () Bool)

(declare-fun e!231417 () Bool)

(assert (=> b!380491 (= e!231418 (and e!231417 mapRes!15339))))

(declare-fun condMapEmpty!15339 () Bool)

(declare-fun mapDefault!15339 () ValueCell!4248)

(assert (=> b!380491 (= condMapEmpty!15339 (= (arr!10611 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4248)) mapDefault!15339)))))

(declare-fun b!380492 () Bool)

(declare-fun e!231422 () Bool)

(assert (=> b!380492 (= e!231422 (not e!231420))))

(declare-fun res!215991 () Bool)

(assert (=> b!380492 (=> res!215991 e!231420)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380492 (= res!215991 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13349)

(declare-fun getCurrentListMap!1996 (array!22287 array!22285 (_ BitVec 32) (_ BitVec 32) V!13349 V!13349 (_ BitVec 32) Int) ListLongMap!5129)

(assert (=> b!380492 (= lt!178102 (getCurrentListMap!1996 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178095 () array!22285)

(declare-fun lt!178099 () array!22287)

(assert (=> b!380492 (= lt!178107 (getCurrentListMap!1996 lt!178099 lt!178095 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380492 (and (= lt!178105 lt!178100) (= lt!178100 lt!178105))))

(declare-fun lt!178106 () tuple2!6216)

(assert (=> b!380492 (= lt!178100 (+!926 lt!178097 lt!178106))))

(declare-fun v!373 () V!13349)

(assert (=> b!380492 (= lt!178106 (tuple2!6217 k0!778 v!373))))

(declare-datatypes ((Unit!11746 0))(
  ( (Unit!11747) )
))
(declare-fun lt!178098 () Unit!11746)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!154 (array!22287 array!22285 (_ BitVec 32) (_ BitVec 32) V!13349 V!13349 (_ BitVec 32) (_ BitVec 64) V!13349 (_ BitVec 32) Int) Unit!11746)

(assert (=> b!380492 (= lt!178098 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!154 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!830 (array!22287 array!22285 (_ BitVec 32) (_ BitVec 32) V!13349 V!13349 (_ BitVec 32) Int) ListLongMap!5129)

(assert (=> b!380492 (= lt!178105 (getCurrentListMapNoExtraKeys!830 lt!178099 lt!178095 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380492 (= lt!178095 (array!22286 (store (arr!10611 _values!506) i!548 (ValueCellFull!4248 v!373)) (size!10963 _values!506)))))

(assert (=> b!380492 (= lt!178097 (getCurrentListMapNoExtraKeys!830 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380493 () Bool)

(declare-fun res!215997 () Bool)

(assert (=> b!380493 (=> (not res!215997) (not e!231422))))

(declare-datatypes ((List!6052 0))(
  ( (Nil!6049) (Cons!6048 (h!6904 (_ BitVec 64)) (t!11202 List!6052)) )
))
(declare-fun arrayNoDuplicates!0 (array!22287 (_ BitVec 32) List!6052) Bool)

(assert (=> b!380493 (= res!215997 (arrayNoDuplicates!0 lt!178099 #b00000000000000000000000000000000 Nil!6049))))

(declare-fun b!380494 () Bool)

(declare-fun res!215989 () Bool)

(assert (=> b!380494 (=> (not res!215989) (not e!231415))))

(assert (=> b!380494 (= res!215989 (or (= (select (arr!10612 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10612 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380495 () Bool)

(assert (=> b!380495 (= e!231415 e!231422)))

(declare-fun res!215988 () Bool)

(assert (=> b!380495 (=> (not res!215988) (not e!231422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22287 (_ BitVec 32)) Bool)

(assert (=> b!380495 (= res!215988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178099 mask!970))))

(assert (=> b!380495 (= lt!178099 (array!22288 (store (arr!10612 _keys!658) i!548 k0!778) (size!10964 _keys!658)))))

(declare-fun mapIsEmpty!15339 () Bool)

(assert (=> mapIsEmpty!15339 mapRes!15339))

(declare-fun b!380496 () Bool)

(declare-fun res!215998 () Bool)

(assert (=> b!380496 (=> (not res!215998) (not e!231415))))

(assert (=> b!380496 (= res!215998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380497 () Bool)

(declare-fun res!215994 () Bool)

(assert (=> b!380497 (=> (not res!215994) (not e!231415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380497 (= res!215994 (validKeyInArray!0 k0!778))))

(declare-fun b!380498 () Bool)

(declare-fun res!215992 () Bool)

(assert (=> b!380498 (=> (not res!215992) (not e!231415))))

(assert (=> b!380498 (= res!215992 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10964 _keys!658))))))

(declare-fun b!380499 () Bool)

(assert (=> b!380499 (= e!231417 tp_is_empty!9183)))

(declare-fun b!380500 () Bool)

(assert (=> b!380500 (= e!231419 true)))

(assert (=> b!380500 (= lt!178101 (+!926 lt!178103 lt!178106))))

(declare-fun lt!178104 () Unit!11746)

(declare-fun addCommutativeForDiffKeys!323 (ListLongMap!5129 (_ BitVec 64) V!13349 (_ BitVec 64) V!13349) Unit!11746)

(assert (=> b!380500 (= lt!178104 (addCommutativeForDiffKeys!323 lt!178097 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380501 () Bool)

(declare-fun res!215993 () Bool)

(assert (=> b!380501 (=> (not res!215993) (not e!231415))))

(assert (=> b!380501 (= res!215993 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6049))))

(declare-fun b!380502 () Bool)

(assert (=> b!380502 (= e!231421 tp_is_empty!9183)))

(declare-fun b!380503 () Bool)

(declare-fun res!215990 () Bool)

(assert (=> b!380503 (=> (not res!215990) (not e!231415))))

(declare-fun arrayContainsKey!0 (array!22287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380503 (= res!215990 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!380504 () Bool)

(declare-fun res!215995 () Bool)

(assert (=> b!380504 (=> (not res!215995) (not e!231415))))

(assert (=> b!380504 (= res!215995 (and (= (size!10963 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10964 _keys!658) (size!10963 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37408 res!215999) b!380504))

(assert (= (and b!380504 res!215995) b!380496))

(assert (= (and b!380496 res!215998) b!380501))

(assert (= (and b!380501 res!215993) b!380498))

(assert (= (and b!380498 res!215992) b!380497))

(assert (= (and b!380497 res!215994) b!380494))

(assert (= (and b!380494 res!215989) b!380503))

(assert (= (and b!380503 res!215990) b!380495))

(assert (= (and b!380495 res!215988) b!380493))

(assert (= (and b!380493 res!215997) b!380492))

(assert (= (and b!380492 (not res!215991)) b!380490))

(assert (= (and b!380490 (not res!215996)) b!380500))

(assert (= (and b!380491 condMapEmpty!15339) mapIsEmpty!15339))

(assert (= (and b!380491 (not condMapEmpty!15339)) mapNonEmpty!15339))

(get-info :version)

(assert (= (and mapNonEmpty!15339 ((_ is ValueCellFull!4248) mapValue!15339)) b!380502))

(assert (= (and b!380491 ((_ is ValueCellFull!4248) mapDefault!15339)) b!380499))

(assert (= start!37408 b!380491))

(declare-fun m!377439 () Bool)

(assert (=> b!380495 m!377439))

(declare-fun m!377441 () Bool)

(assert (=> b!380495 m!377441))

(declare-fun m!377443 () Bool)

(assert (=> b!380497 m!377443))

(declare-fun m!377445 () Bool)

(assert (=> b!380500 m!377445))

(declare-fun m!377447 () Bool)

(assert (=> b!380500 m!377447))

(declare-fun m!377449 () Bool)

(assert (=> mapNonEmpty!15339 m!377449))

(declare-fun m!377451 () Bool)

(assert (=> start!37408 m!377451))

(declare-fun m!377453 () Bool)

(assert (=> start!37408 m!377453))

(declare-fun m!377455 () Bool)

(assert (=> start!37408 m!377455))

(declare-fun m!377457 () Bool)

(assert (=> b!380494 m!377457))

(declare-fun m!377459 () Bool)

(assert (=> b!380490 m!377459))

(declare-fun m!377461 () Bool)

(assert (=> b!380490 m!377461))

(declare-fun m!377463 () Bool)

(assert (=> b!380490 m!377463))

(declare-fun m!377465 () Bool)

(assert (=> b!380496 m!377465))

(declare-fun m!377467 () Bool)

(assert (=> b!380492 m!377467))

(declare-fun m!377469 () Bool)

(assert (=> b!380492 m!377469))

(declare-fun m!377471 () Bool)

(assert (=> b!380492 m!377471))

(declare-fun m!377473 () Bool)

(assert (=> b!380492 m!377473))

(declare-fun m!377475 () Bool)

(assert (=> b!380492 m!377475))

(declare-fun m!377477 () Bool)

(assert (=> b!380492 m!377477))

(declare-fun m!377479 () Bool)

(assert (=> b!380492 m!377479))

(declare-fun m!377481 () Bool)

(assert (=> b!380501 m!377481))

(declare-fun m!377483 () Bool)

(assert (=> b!380493 m!377483))

(declare-fun m!377485 () Bool)

(assert (=> b!380503 m!377485))

(check-sat (not mapNonEmpty!15339) (not b!380493) (not b!380503) (not b!380497) tp_is_empty!9183 (not b!380495) (not b!380492) (not b!380501) (not b!380496) (not b!380490) (not b_next!8535) (not start!37408) (not b!380500) b_and!15777)
(check-sat b_and!15777 (not b_next!8535))
