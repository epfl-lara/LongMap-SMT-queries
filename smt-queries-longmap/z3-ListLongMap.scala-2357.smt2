; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37590 () Bool)

(assert start!37590)

(declare-fun b_free!8731 () Bool)

(declare-fun b_next!8731 () Bool)

(assert (=> start!37590 (= b_free!8731 (not b_next!8731))))

(declare-fun tp!30908 () Bool)

(declare-fun b_and!15947 () Bool)

(assert (=> start!37590 (= tp!30908 b_and!15947)))

(declare-fun b!384366 () Bool)

(declare-fun e!233336 () Bool)

(declare-fun e!233330 () Bool)

(assert (=> b!384366 (= e!233336 (not e!233330))))

(declare-fun res!219128 () Bool)

(assert (=> b!384366 (=> res!219128 e!233330)))

(declare-fun lt!180808 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384366 (= res!219128 (or (and (not lt!180808) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180808) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180808)))))

(assert (=> b!384366 (= lt!180808 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13611 0))(
  ( (V!13612 (val!4734 Int)) )
))
(declare-datatypes ((ValueCell!4346 0))(
  ( (ValueCellFull!4346 (v!6925 V!13611)) (EmptyCell!4346) )
))
(declare-datatypes ((array!22647 0))(
  ( (array!22648 (arr!10792 (Array (_ BitVec 32) ValueCell!4346)) (size!11145 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22647)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6356 0))(
  ( (tuple2!6357 (_1!3189 (_ BitVec 64)) (_2!3189 V!13611)) )
))
(declare-datatypes ((List!6179 0))(
  ( (Nil!6176) (Cons!6175 (h!7031 tuple2!6356) (t!11320 List!6179)) )
))
(declare-datatypes ((ListLongMap!5259 0))(
  ( (ListLongMap!5260 (toList!2645 List!6179)) )
))
(declare-fun lt!180815 () ListLongMap!5259)

(declare-fun zeroValue!472 () V!13611)

(declare-datatypes ((array!22649 0))(
  ( (array!22650 (arr!10793 (Array (_ BitVec 32) (_ BitVec 64))) (size!11146 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22649)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13611)

(declare-fun getCurrentListMap!2022 (array!22649 array!22647 (_ BitVec 32) (_ BitVec 32) V!13611 V!13611 (_ BitVec 32) Int) ListLongMap!5259)

(assert (=> b!384366 (= lt!180815 (getCurrentListMap!2022 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180806 () array!22647)

(declare-fun lt!180816 () array!22649)

(declare-fun lt!180812 () ListLongMap!5259)

(assert (=> b!384366 (= lt!180812 (getCurrentListMap!2022 lt!180816 lt!180806 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180809 () ListLongMap!5259)

(declare-fun lt!180811 () ListLongMap!5259)

(assert (=> b!384366 (and (= lt!180809 lt!180811) (= lt!180811 lt!180809))))

(declare-fun lt!180814 () ListLongMap!5259)

(declare-fun lt!180810 () tuple2!6356)

(declare-fun +!1002 (ListLongMap!5259 tuple2!6356) ListLongMap!5259)

(assert (=> b!384366 (= lt!180811 (+!1002 lt!180814 lt!180810))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13611)

(assert (=> b!384366 (= lt!180810 (tuple2!6357 k0!778 v!373))))

(declare-datatypes ((Unit!11850 0))(
  ( (Unit!11851) )
))
(declare-fun lt!180807 () Unit!11850)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!215 (array!22649 array!22647 (_ BitVec 32) (_ BitVec 32) V!13611 V!13611 (_ BitVec 32) (_ BitVec 64) V!13611 (_ BitVec 32) Int) Unit!11850)

(assert (=> b!384366 (= lt!180807 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!215 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!887 (array!22649 array!22647 (_ BitVec 32) (_ BitVec 32) V!13611 V!13611 (_ BitVec 32) Int) ListLongMap!5259)

(assert (=> b!384366 (= lt!180809 (getCurrentListMapNoExtraKeys!887 lt!180816 lt!180806 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384366 (= lt!180806 (array!22648 (store (arr!10792 _values!506) i!548 (ValueCellFull!4346 v!373)) (size!11145 _values!506)))))

(assert (=> b!384366 (= lt!180814 (getCurrentListMapNoExtraKeys!887 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384367 () Bool)

(declare-fun e!233331 () Bool)

(declare-fun tp_is_empty!9379 () Bool)

(assert (=> b!384367 (= e!233331 tp_is_empty!9379)))

(declare-fun b!384368 () Bool)

(declare-fun e!233333 () Bool)

(assert (=> b!384368 (= e!233333 e!233336)))

(declare-fun res!219129 () Bool)

(assert (=> b!384368 (=> (not res!219129) (not e!233336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22649 (_ BitVec 32)) Bool)

(assert (=> b!384368 (= res!219129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180816 mask!970))))

(assert (=> b!384368 (= lt!180816 (array!22650 (store (arr!10793 _keys!658) i!548 k0!778) (size!11146 _keys!658)))))

(declare-fun res!219133 () Bool)

(assert (=> start!37590 (=> (not res!219133) (not e!233333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37590 (= res!219133 (validMask!0 mask!970))))

(assert (=> start!37590 e!233333))

(declare-fun e!233332 () Bool)

(declare-fun array_inv!7946 (array!22647) Bool)

(assert (=> start!37590 (and (array_inv!7946 _values!506) e!233332)))

(assert (=> start!37590 tp!30908))

(assert (=> start!37590 true))

(assert (=> start!37590 tp_is_empty!9379))

(declare-fun array_inv!7947 (array!22649) Bool)

(assert (=> start!37590 (array_inv!7947 _keys!658)))

(declare-fun b!384369 () Bool)

(declare-fun res!219124 () Bool)

(assert (=> b!384369 (=> (not res!219124) (not e!233333))))

(declare-fun arrayContainsKey!0 (array!22649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384369 (= res!219124 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384370 () Bool)

(declare-fun res!219130 () Bool)

(assert (=> b!384370 (=> (not res!219130) (not e!233333))))

(assert (=> b!384370 (= res!219130 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11146 _keys!658))))))

(declare-fun b!384371 () Bool)

(declare-fun res!219125 () Bool)

(assert (=> b!384371 (=> (not res!219125) (not e!233336))))

(declare-datatypes ((List!6180 0))(
  ( (Nil!6177) (Cons!6176 (h!7032 (_ BitVec 64)) (t!11321 List!6180)) )
))
(declare-fun arrayNoDuplicates!0 (array!22649 (_ BitVec 32) List!6180) Bool)

(assert (=> b!384371 (= res!219125 (arrayNoDuplicates!0 lt!180816 #b00000000000000000000000000000000 Nil!6177))))

(declare-fun b!384372 () Bool)

(declare-fun e!233334 () Bool)

(declare-fun mapRes!15633 () Bool)

(assert (=> b!384372 (= e!233332 (and e!233334 mapRes!15633))))

(declare-fun condMapEmpty!15633 () Bool)

(declare-fun mapDefault!15633 () ValueCell!4346)

(assert (=> b!384372 (= condMapEmpty!15633 (= (arr!10792 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4346)) mapDefault!15633)))))

(declare-fun b!384373 () Bool)

(declare-fun res!219126 () Bool)

(assert (=> b!384373 (=> (not res!219126) (not e!233333))))

(assert (=> b!384373 (= res!219126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384374 () Bool)

(assert (=> b!384374 (= e!233330 true)))

(declare-fun lt!180813 () ListLongMap!5259)

(assert (=> b!384374 (= lt!180813 (+!1002 lt!180815 lt!180810))))

(assert (=> b!384374 (= lt!180812 lt!180809)))

(declare-fun b!384375 () Bool)

(declare-fun res!219131 () Bool)

(assert (=> b!384375 (=> (not res!219131) (not e!233333))))

(assert (=> b!384375 (= res!219131 (and (= (size!11145 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11146 _keys!658) (size!11145 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15633 () Bool)

(declare-fun tp!30909 () Bool)

(assert (=> mapNonEmpty!15633 (= mapRes!15633 (and tp!30909 e!233331))))

(declare-fun mapValue!15633 () ValueCell!4346)

(declare-fun mapKey!15633 () (_ BitVec 32))

(declare-fun mapRest!15633 () (Array (_ BitVec 32) ValueCell!4346))

(assert (=> mapNonEmpty!15633 (= (arr!10792 _values!506) (store mapRest!15633 mapKey!15633 mapValue!15633))))

(declare-fun b!384376 () Bool)

(declare-fun res!219132 () Bool)

(assert (=> b!384376 (=> (not res!219132) (not e!233333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384376 (= res!219132 (validKeyInArray!0 k0!778))))

(declare-fun b!384377 () Bool)

(assert (=> b!384377 (= e!233334 tp_is_empty!9379)))

(declare-fun b!384378 () Bool)

(declare-fun res!219127 () Bool)

(assert (=> b!384378 (=> (not res!219127) (not e!233333))))

(assert (=> b!384378 (= res!219127 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6177))))

(declare-fun mapIsEmpty!15633 () Bool)

(assert (=> mapIsEmpty!15633 mapRes!15633))

(declare-fun b!384379 () Bool)

(declare-fun res!219134 () Bool)

(assert (=> b!384379 (=> (not res!219134) (not e!233333))))

(assert (=> b!384379 (= res!219134 (or (= (select (arr!10793 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10793 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37590 res!219133) b!384375))

(assert (= (and b!384375 res!219131) b!384373))

(assert (= (and b!384373 res!219126) b!384378))

(assert (= (and b!384378 res!219127) b!384370))

(assert (= (and b!384370 res!219130) b!384376))

(assert (= (and b!384376 res!219132) b!384379))

(assert (= (and b!384379 res!219134) b!384369))

(assert (= (and b!384369 res!219124) b!384368))

(assert (= (and b!384368 res!219129) b!384371))

(assert (= (and b!384371 res!219125) b!384366))

(assert (= (and b!384366 (not res!219128)) b!384374))

(assert (= (and b!384372 condMapEmpty!15633) mapIsEmpty!15633))

(assert (= (and b!384372 (not condMapEmpty!15633)) mapNonEmpty!15633))

(get-info :version)

(assert (= (and mapNonEmpty!15633 ((_ is ValueCellFull!4346) mapValue!15633)) b!384367))

(assert (= (and b!384372 ((_ is ValueCellFull!4346) mapDefault!15633)) b!384377))

(assert (= start!37590 b!384372))

(declare-fun m!380591 () Bool)

(assert (=> b!384368 m!380591))

(declare-fun m!380593 () Bool)

(assert (=> b!384368 m!380593))

(declare-fun m!380595 () Bool)

(assert (=> b!384379 m!380595))

(declare-fun m!380597 () Bool)

(assert (=> b!384378 m!380597))

(declare-fun m!380599 () Bool)

(assert (=> b!384366 m!380599))

(declare-fun m!380601 () Bool)

(assert (=> b!384366 m!380601))

(declare-fun m!380603 () Bool)

(assert (=> b!384366 m!380603))

(declare-fun m!380605 () Bool)

(assert (=> b!384366 m!380605))

(declare-fun m!380607 () Bool)

(assert (=> b!384366 m!380607))

(declare-fun m!380609 () Bool)

(assert (=> b!384366 m!380609))

(declare-fun m!380611 () Bool)

(assert (=> b!384366 m!380611))

(declare-fun m!380613 () Bool)

(assert (=> b!384373 m!380613))

(declare-fun m!380615 () Bool)

(assert (=> mapNonEmpty!15633 m!380615))

(declare-fun m!380617 () Bool)

(assert (=> start!37590 m!380617))

(declare-fun m!380619 () Bool)

(assert (=> start!37590 m!380619))

(declare-fun m!380621 () Bool)

(assert (=> start!37590 m!380621))

(declare-fun m!380623 () Bool)

(assert (=> b!384371 m!380623))

(declare-fun m!380625 () Bool)

(assert (=> b!384374 m!380625))

(declare-fun m!380627 () Bool)

(assert (=> b!384376 m!380627))

(declare-fun m!380629 () Bool)

(assert (=> b!384369 m!380629))

(check-sat (not b!384373) (not b!384369) b_and!15947 (not b_next!8731) (not b!384378) (not b!384371) (not b!384376) (not b!384366) (not b!384374) (not start!37590) (not b!384368) (not mapNonEmpty!15633) tp_is_empty!9379)
(check-sat b_and!15947 (not b_next!8731))
