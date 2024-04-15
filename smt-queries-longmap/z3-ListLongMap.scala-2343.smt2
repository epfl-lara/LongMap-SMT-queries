; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37506 () Bool)

(assert start!37506)

(declare-fun b_free!8647 () Bool)

(declare-fun b_next!8647 () Bool)

(assert (=> start!37506 (= b_free!8647 (not b_next!8647))))

(declare-fun tp!30656 () Bool)

(declare-fun b_and!15863 () Bool)

(assert (=> start!37506 (= tp!30656 b_and!15863)))

(declare-fun b!382593 () Bool)

(declare-fun e!232440 () Bool)

(assert (=> b!382593 (= e!232440 true)))

(declare-datatypes ((V!13499 0))(
  ( (V!13500 (val!4692 Int)) )
))
(declare-datatypes ((tuple2!6286 0))(
  ( (tuple2!6287 (_1!3154 (_ BitVec 64)) (_2!3154 V!13499)) )
))
(declare-datatypes ((List!6112 0))(
  ( (Nil!6109) (Cons!6108 (h!6964 tuple2!6286) (t!11253 List!6112)) )
))
(declare-datatypes ((ListLongMap!5189 0))(
  ( (ListLongMap!5190 (toList!2610 List!6112)) )
))
(declare-fun lt!179463 () ListLongMap!5189)

(declare-fun lt!179461 () ListLongMap!5189)

(assert (=> b!382593 (= lt!179463 lt!179461)))

(declare-fun b!382594 () Bool)

(declare-fun res!217730 () Bool)

(declare-fun e!232445 () Bool)

(assert (=> b!382594 (=> (not res!217730) (not e!232445))))

(declare-datatypes ((array!22485 0))(
  ( (array!22486 (arr!10711 (Array (_ BitVec 32) (_ BitVec 64))) (size!11064 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22485)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22485 (_ BitVec 32)) Bool)

(assert (=> b!382594 (= res!217730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382595 () Bool)

(declare-fun e!232441 () Bool)

(declare-fun tp_is_empty!9295 () Bool)

(assert (=> b!382595 (= e!232441 tp_is_empty!9295)))

(declare-fun b!382596 () Bool)

(declare-fun res!217734 () Bool)

(assert (=> b!382596 (=> (not res!217734) (not e!232445))))

(declare-datatypes ((List!6113 0))(
  ( (Nil!6110) (Cons!6109 (h!6965 (_ BitVec 64)) (t!11254 List!6113)) )
))
(declare-fun arrayNoDuplicates!0 (array!22485 (_ BitVec 32) List!6113) Bool)

(assert (=> b!382596 (= res!217734 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6110))))

(declare-fun b!382597 () Bool)

(declare-fun res!217736 () Bool)

(declare-fun e!232443 () Bool)

(assert (=> b!382597 (=> (not res!217736) (not e!232443))))

(declare-fun lt!179465 () array!22485)

(assert (=> b!382597 (= res!217736 (arrayNoDuplicates!0 lt!179465 #b00000000000000000000000000000000 Nil!6110))))

(declare-fun b!382598 () Bool)

(assert (=> b!382598 (= e!232443 (not e!232440))))

(declare-fun res!217735 () Bool)

(assert (=> b!382598 (=> res!217735 e!232440)))

(declare-fun lt!179468 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382598 (= res!217735 (or (and (not lt!179468) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179468) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179468)))))

(assert (=> b!382598 (= lt!179468 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!179462 () ListLongMap!5189)

(declare-datatypes ((ValueCell!4304 0))(
  ( (ValueCellFull!4304 (v!6883 V!13499)) (EmptyCell!4304) )
))
(declare-datatypes ((array!22487 0))(
  ( (array!22488 (arr!10712 (Array (_ BitVec 32) ValueCell!4304)) (size!11065 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22487)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13499)

(declare-fun minValue!472 () V!13499)

(declare-fun getCurrentListMap!1994 (array!22485 array!22487 (_ BitVec 32) (_ BitVec 32) V!13499 V!13499 (_ BitVec 32) Int) ListLongMap!5189)

(assert (=> b!382598 (= lt!179462 (getCurrentListMap!1994 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179466 () array!22487)

(assert (=> b!382598 (= lt!179463 (getCurrentListMap!1994 lt!179465 lt!179466 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179467 () ListLongMap!5189)

(assert (=> b!382598 (and (= lt!179461 lt!179467) (= lt!179467 lt!179461))))

(declare-fun lt!179469 () ListLongMap!5189)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13499)

(declare-fun +!968 (ListLongMap!5189 tuple2!6286) ListLongMap!5189)

(assert (=> b!382598 (= lt!179467 (+!968 lt!179469 (tuple2!6287 k0!778 v!373)))))

(declare-datatypes ((Unit!11794 0))(
  ( (Unit!11795) )
))
(declare-fun lt!179464 () Unit!11794)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!187 (array!22485 array!22487 (_ BitVec 32) (_ BitVec 32) V!13499 V!13499 (_ BitVec 32) (_ BitVec 64) V!13499 (_ BitVec 32) Int) Unit!11794)

(assert (=> b!382598 (= lt!179464 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!187 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!859 (array!22485 array!22487 (_ BitVec 32) (_ BitVec 32) V!13499 V!13499 (_ BitVec 32) Int) ListLongMap!5189)

(assert (=> b!382598 (= lt!179461 (getCurrentListMapNoExtraKeys!859 lt!179465 lt!179466 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382598 (= lt!179466 (array!22488 (store (arr!10712 _values!506) i!548 (ValueCellFull!4304 v!373)) (size!11065 _values!506)))))

(assert (=> b!382598 (= lt!179469 (getCurrentListMapNoExtraKeys!859 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382599 () Bool)

(assert (=> b!382599 (= e!232445 e!232443)))

(declare-fun res!217729 () Bool)

(assert (=> b!382599 (=> (not res!217729) (not e!232443))))

(assert (=> b!382599 (= res!217729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179465 mask!970))))

(assert (=> b!382599 (= lt!179465 (array!22486 (store (arr!10711 _keys!658) i!548 k0!778) (size!11064 _keys!658)))))

(declare-fun b!382600 () Bool)

(declare-fun res!217739 () Bool)

(assert (=> b!382600 (=> (not res!217739) (not e!232445))))

(declare-fun arrayContainsKey!0 (array!22485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382600 (= res!217739 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382601 () Bool)

(declare-fun res!217738 () Bool)

(assert (=> b!382601 (=> (not res!217738) (not e!232445))))

(assert (=> b!382601 (= res!217738 (and (= (size!11065 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11064 _keys!658) (size!11065 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!217731 () Bool)

(assert (=> start!37506 (=> (not res!217731) (not e!232445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37506 (= res!217731 (validMask!0 mask!970))))

(assert (=> start!37506 e!232445))

(declare-fun e!232444 () Bool)

(declare-fun array_inv!7886 (array!22487) Bool)

(assert (=> start!37506 (and (array_inv!7886 _values!506) e!232444)))

(assert (=> start!37506 tp!30656))

(assert (=> start!37506 true))

(assert (=> start!37506 tp_is_empty!9295))

(declare-fun array_inv!7887 (array!22485) Bool)

(assert (=> start!37506 (array_inv!7887 _keys!658)))

(declare-fun b!382602 () Bool)

(declare-fun e!232442 () Bool)

(declare-fun mapRes!15507 () Bool)

(assert (=> b!382602 (= e!232444 (and e!232442 mapRes!15507))))

(declare-fun condMapEmpty!15507 () Bool)

(declare-fun mapDefault!15507 () ValueCell!4304)

(assert (=> b!382602 (= condMapEmpty!15507 (= (arr!10712 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4304)) mapDefault!15507)))))

(declare-fun mapNonEmpty!15507 () Bool)

(declare-fun tp!30657 () Bool)

(assert (=> mapNonEmpty!15507 (= mapRes!15507 (and tp!30657 e!232441))))

(declare-fun mapRest!15507 () (Array (_ BitVec 32) ValueCell!4304))

(declare-fun mapKey!15507 () (_ BitVec 32))

(declare-fun mapValue!15507 () ValueCell!4304)

(assert (=> mapNonEmpty!15507 (= (arr!10712 _values!506) (store mapRest!15507 mapKey!15507 mapValue!15507))))

(declare-fun b!382603 () Bool)

(declare-fun res!217737 () Bool)

(assert (=> b!382603 (=> (not res!217737) (not e!232445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382603 (= res!217737 (validKeyInArray!0 k0!778))))

(declare-fun b!382604 () Bool)

(assert (=> b!382604 (= e!232442 tp_is_empty!9295)))

(declare-fun b!382605 () Bool)

(declare-fun res!217732 () Bool)

(assert (=> b!382605 (=> (not res!217732) (not e!232445))))

(assert (=> b!382605 (= res!217732 (or (= (select (arr!10711 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10711 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382606 () Bool)

(declare-fun res!217733 () Bool)

(assert (=> b!382606 (=> (not res!217733) (not e!232445))))

(assert (=> b!382606 (= res!217733 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11064 _keys!658))))))

(declare-fun mapIsEmpty!15507 () Bool)

(assert (=> mapIsEmpty!15507 mapRes!15507))

(assert (= (and start!37506 res!217731) b!382601))

(assert (= (and b!382601 res!217738) b!382594))

(assert (= (and b!382594 res!217730) b!382596))

(assert (= (and b!382596 res!217734) b!382606))

(assert (= (and b!382606 res!217733) b!382603))

(assert (= (and b!382603 res!217737) b!382605))

(assert (= (and b!382605 res!217732) b!382600))

(assert (= (and b!382600 res!217739) b!382599))

(assert (= (and b!382599 res!217729) b!382597))

(assert (= (and b!382597 res!217736) b!382598))

(assert (= (and b!382598 (not res!217735)) b!382593))

(assert (= (and b!382602 condMapEmpty!15507) mapIsEmpty!15507))

(assert (= (and b!382602 (not condMapEmpty!15507)) mapNonEmpty!15507))

(get-info :version)

(assert (= (and mapNonEmpty!15507 ((_ is ValueCellFull!4304) mapValue!15507)) b!382595))

(assert (= (and b!382602 ((_ is ValueCellFull!4304) mapDefault!15507)) b!382604))

(assert (= start!37506 b!382602))

(declare-fun m!378923 () Bool)

(assert (=> b!382603 m!378923))

(declare-fun m!378925 () Bool)

(assert (=> b!382597 m!378925))

(declare-fun m!378927 () Bool)

(assert (=> mapNonEmpty!15507 m!378927))

(declare-fun m!378929 () Bool)

(assert (=> b!382605 m!378929))

(declare-fun m!378931 () Bool)

(assert (=> b!382594 m!378931))

(declare-fun m!378933 () Bool)

(assert (=> b!382599 m!378933))

(declare-fun m!378935 () Bool)

(assert (=> b!382599 m!378935))

(declare-fun m!378937 () Bool)

(assert (=> start!37506 m!378937))

(declare-fun m!378939 () Bool)

(assert (=> start!37506 m!378939))

(declare-fun m!378941 () Bool)

(assert (=> start!37506 m!378941))

(declare-fun m!378943 () Bool)

(assert (=> b!382600 m!378943))

(declare-fun m!378945 () Bool)

(assert (=> b!382596 m!378945))

(declare-fun m!378947 () Bool)

(assert (=> b!382598 m!378947))

(declare-fun m!378949 () Bool)

(assert (=> b!382598 m!378949))

(declare-fun m!378951 () Bool)

(assert (=> b!382598 m!378951))

(declare-fun m!378953 () Bool)

(assert (=> b!382598 m!378953))

(declare-fun m!378955 () Bool)

(assert (=> b!382598 m!378955))

(declare-fun m!378957 () Bool)

(assert (=> b!382598 m!378957))

(declare-fun m!378959 () Bool)

(assert (=> b!382598 m!378959))

(check-sat b_and!15863 (not b!382600) (not b!382594) (not b!382596) (not b!382599) (not b!382603) (not mapNonEmpty!15507) (not b_next!8647) (not start!37506) tp_is_empty!9295 (not b!382597) (not b!382598))
(check-sat b_and!15863 (not b_next!8647))
