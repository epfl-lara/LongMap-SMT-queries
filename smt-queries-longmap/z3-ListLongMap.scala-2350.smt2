; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37564 () Bool)

(assert start!37564)

(declare-fun b_free!8691 () Bool)

(declare-fun b_next!8691 () Bool)

(assert (=> start!37564 (= b_free!8691 (not b_next!8691))))

(declare-fun tp!30789 () Bool)

(declare-fun b_and!15933 () Bool)

(assert (=> start!37564 (= tp!30789 b_and!15933)))

(declare-fun res!218593 () Bool)

(declare-fun e!233077 () Bool)

(assert (=> start!37564 (=> (not res!218593) (not e!233077))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37564 (= res!218593 (validMask!0 mask!970))))

(assert (=> start!37564 e!233077))

(declare-datatypes ((V!13557 0))(
  ( (V!13558 (val!4714 Int)) )
))
(declare-datatypes ((ValueCell!4326 0))(
  ( (ValueCellFull!4326 (v!6911 V!13557)) (EmptyCell!4326) )
))
(declare-datatypes ((array!22585 0))(
  ( (array!22586 (arr!10761 (Array (_ BitVec 32) ValueCell!4326)) (size!11113 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22585)

(declare-fun e!233078 () Bool)

(declare-fun array_inv!7920 (array!22585) Bool)

(assert (=> start!37564 (and (array_inv!7920 _values!506) e!233078)))

(assert (=> start!37564 tp!30789))

(assert (=> start!37564 true))

(declare-fun tp_is_empty!9339 () Bool)

(assert (=> start!37564 tp_is_empty!9339))

(declare-datatypes ((array!22587 0))(
  ( (array!22588 (arr!10762 (Array (_ BitVec 32) (_ BitVec 64))) (size!11114 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22587)

(declare-fun array_inv!7921 (array!22587) Bool)

(assert (=> start!37564 (array_inv!7921 _keys!658)))

(declare-fun b!383788 () Bool)

(declare-fun res!218588 () Bool)

(declare-fun e!233080 () Bool)

(assert (=> b!383788 (=> (not res!218588) (not e!233080))))

(declare-fun lt!180393 () array!22587)

(declare-datatypes ((List!6179 0))(
  ( (Nil!6176) (Cons!6175 (h!7031 (_ BitVec 64)) (t!11329 List!6179)) )
))
(declare-fun arrayNoDuplicates!0 (array!22587 (_ BitVec 32) List!6179) Bool)

(assert (=> b!383788 (= res!218588 (arrayNoDuplicates!0 lt!180393 #b00000000000000000000000000000000 Nil!6176))))

(declare-fun mapNonEmpty!15573 () Bool)

(declare-fun mapRes!15573 () Bool)

(declare-fun tp!30788 () Bool)

(declare-fun e!233079 () Bool)

(assert (=> mapNonEmpty!15573 (= mapRes!15573 (and tp!30788 e!233079))))

(declare-fun mapRest!15573 () (Array (_ BitVec 32) ValueCell!4326))

(declare-fun mapValue!15573 () ValueCell!4326)

(declare-fun mapKey!15573 () (_ BitVec 32))

(assert (=> mapNonEmpty!15573 (= (arr!10761 _values!506) (store mapRest!15573 mapKey!15573 mapValue!15573))))

(declare-fun b!383789 () Bool)

(declare-fun e!233075 () Bool)

(assert (=> b!383789 (= e!233078 (and e!233075 mapRes!15573))))

(declare-fun condMapEmpty!15573 () Bool)

(declare-fun mapDefault!15573 () ValueCell!4326)

(assert (=> b!383789 (= condMapEmpty!15573 (= (arr!10761 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4326)) mapDefault!15573)))))

(declare-fun b!383790 () Bool)

(assert (=> b!383790 (= e!233079 tp_is_empty!9339)))

(declare-fun b!383791 () Bool)

(declare-fun res!218584 () Bool)

(assert (=> b!383791 (=> (not res!218584) (not e!233077))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383791 (= res!218584 (and (= (size!11113 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11114 _keys!658) (size!11113 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383792 () Bool)

(declare-fun res!218592 () Bool)

(assert (=> b!383792 (=> (not res!218592) (not e!233077))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383792 (= res!218592 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383793 () Bool)

(declare-fun res!218590 () Bool)

(assert (=> b!383793 (=> (not res!218590) (not e!233077))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383793 (= res!218590 (or (= (select (arr!10762 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10762 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383794 () Bool)

(declare-fun e!233081 () Bool)

(assert (=> b!383794 (= e!233081 true)))

(declare-datatypes ((tuple2!6344 0))(
  ( (tuple2!6345 (_1!3183 (_ BitVec 64)) (_2!3183 V!13557)) )
))
(declare-datatypes ((List!6180 0))(
  ( (Nil!6177) (Cons!6176 (h!7032 tuple2!6344) (t!11330 List!6180)) )
))
(declare-datatypes ((ListLongMap!5257 0))(
  ( (ListLongMap!5258 (toList!2644 List!6180)) )
))
(declare-fun lt!180395 () ListLongMap!5257)

(declare-fun lt!180394 () ListLongMap!5257)

(declare-fun lt!180398 () tuple2!6344)

(declare-fun +!979 (ListLongMap!5257 tuple2!6344) ListLongMap!5257)

(assert (=> b!383794 (= lt!180395 (+!979 lt!180394 lt!180398))))

(declare-fun lt!180397 () ListLongMap!5257)

(declare-fun lt!180392 () ListLongMap!5257)

(assert (=> b!383794 (= lt!180397 lt!180392)))

(declare-fun mapIsEmpty!15573 () Bool)

(assert (=> mapIsEmpty!15573 mapRes!15573))

(declare-fun b!383795 () Bool)

(assert (=> b!383795 (= e!233080 (not e!233081))))

(declare-fun res!218591 () Bool)

(assert (=> b!383795 (=> res!218591 e!233081)))

(declare-fun lt!180390 () Bool)

(assert (=> b!383795 (= res!218591 (or (and (not lt!180390) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180390) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180390)))))

(assert (=> b!383795 (= lt!180390 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13557)

(declare-fun minValue!472 () V!13557)

(declare-fun getCurrentListMap!2047 (array!22587 array!22585 (_ BitVec 32) (_ BitVec 32) V!13557 V!13557 (_ BitVec 32) Int) ListLongMap!5257)

(assert (=> b!383795 (= lt!180394 (getCurrentListMap!2047 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180389 () array!22585)

(assert (=> b!383795 (= lt!180397 (getCurrentListMap!2047 lt!180393 lt!180389 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180399 () ListLongMap!5257)

(assert (=> b!383795 (and (= lt!180392 lt!180399) (= lt!180399 lt!180392))))

(declare-fun lt!180396 () ListLongMap!5257)

(assert (=> b!383795 (= lt!180399 (+!979 lt!180396 lt!180398))))

(declare-fun v!373 () V!13557)

(assert (=> b!383795 (= lt!180398 (tuple2!6345 k0!778 v!373))))

(declare-datatypes ((Unit!11848 0))(
  ( (Unit!11849) )
))
(declare-fun lt!180391 () Unit!11848)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!205 (array!22587 array!22585 (_ BitVec 32) (_ BitVec 32) V!13557 V!13557 (_ BitVec 32) (_ BitVec 64) V!13557 (_ BitVec 32) Int) Unit!11848)

(assert (=> b!383795 (= lt!180391 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!205 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!881 (array!22587 array!22585 (_ BitVec 32) (_ BitVec 32) V!13557 V!13557 (_ BitVec 32) Int) ListLongMap!5257)

(assert (=> b!383795 (= lt!180392 (getCurrentListMapNoExtraKeys!881 lt!180393 lt!180389 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383795 (= lt!180389 (array!22586 (store (arr!10761 _values!506) i!548 (ValueCellFull!4326 v!373)) (size!11113 _values!506)))))

(assert (=> b!383795 (= lt!180396 (getCurrentListMapNoExtraKeys!881 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383796 () Bool)

(declare-fun res!218594 () Bool)

(assert (=> b!383796 (=> (not res!218594) (not e!233077))))

(assert (=> b!383796 (= res!218594 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11114 _keys!658))))))

(declare-fun b!383797 () Bool)

(declare-fun res!218589 () Bool)

(assert (=> b!383797 (=> (not res!218589) (not e!233077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383797 (= res!218589 (validKeyInArray!0 k0!778))))

(declare-fun b!383798 () Bool)

(declare-fun res!218585 () Bool)

(assert (=> b!383798 (=> (not res!218585) (not e!233077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22587 (_ BitVec 32)) Bool)

(assert (=> b!383798 (= res!218585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383799 () Bool)

(assert (=> b!383799 (= e!233075 tp_is_empty!9339)))

(declare-fun b!383800 () Bool)

(declare-fun res!218586 () Bool)

(assert (=> b!383800 (=> (not res!218586) (not e!233077))))

(assert (=> b!383800 (= res!218586 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6176))))

(declare-fun b!383801 () Bool)

(assert (=> b!383801 (= e!233077 e!233080)))

(declare-fun res!218587 () Bool)

(assert (=> b!383801 (=> (not res!218587) (not e!233080))))

(assert (=> b!383801 (= res!218587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180393 mask!970))))

(assert (=> b!383801 (= lt!180393 (array!22588 (store (arr!10762 _keys!658) i!548 k0!778) (size!11114 _keys!658)))))

(assert (= (and start!37564 res!218593) b!383791))

(assert (= (and b!383791 res!218584) b!383798))

(assert (= (and b!383798 res!218585) b!383800))

(assert (= (and b!383800 res!218586) b!383796))

(assert (= (and b!383796 res!218594) b!383797))

(assert (= (and b!383797 res!218589) b!383793))

(assert (= (and b!383793 res!218590) b!383792))

(assert (= (and b!383792 res!218592) b!383801))

(assert (= (and b!383801 res!218587) b!383788))

(assert (= (and b!383788 res!218588) b!383795))

(assert (= (and b!383795 (not res!218591)) b!383794))

(assert (= (and b!383789 condMapEmpty!15573) mapIsEmpty!15573))

(assert (= (and b!383789 (not condMapEmpty!15573)) mapNonEmpty!15573))

(get-info :version)

(assert (= (and mapNonEmpty!15573 ((_ is ValueCellFull!4326) mapValue!15573)) b!383790))

(assert (= (and b!383789 ((_ is ValueCellFull!4326) mapDefault!15573)) b!383799))

(assert (= start!37564 b!383789))

(declare-fun m!380515 () Bool)

(assert (=> b!383798 m!380515))

(declare-fun m!380517 () Bool)

(assert (=> b!383792 m!380517))

(declare-fun m!380519 () Bool)

(assert (=> b!383788 m!380519))

(declare-fun m!380521 () Bool)

(assert (=> b!383794 m!380521))

(declare-fun m!380523 () Bool)

(assert (=> b!383800 m!380523))

(declare-fun m!380525 () Bool)

(assert (=> start!37564 m!380525))

(declare-fun m!380527 () Bool)

(assert (=> start!37564 m!380527))

(declare-fun m!380529 () Bool)

(assert (=> start!37564 m!380529))

(declare-fun m!380531 () Bool)

(assert (=> b!383797 m!380531))

(declare-fun m!380533 () Bool)

(assert (=> b!383795 m!380533))

(declare-fun m!380535 () Bool)

(assert (=> b!383795 m!380535))

(declare-fun m!380537 () Bool)

(assert (=> b!383795 m!380537))

(declare-fun m!380539 () Bool)

(assert (=> b!383795 m!380539))

(declare-fun m!380541 () Bool)

(assert (=> b!383795 m!380541))

(declare-fun m!380543 () Bool)

(assert (=> b!383795 m!380543))

(declare-fun m!380545 () Bool)

(assert (=> b!383795 m!380545))

(declare-fun m!380547 () Bool)

(assert (=> b!383793 m!380547))

(declare-fun m!380549 () Bool)

(assert (=> b!383801 m!380549))

(declare-fun m!380551 () Bool)

(assert (=> b!383801 m!380551))

(declare-fun m!380553 () Bool)

(assert (=> mapNonEmpty!15573 m!380553))

(check-sat (not b_next!8691) (not b!383800) (not b!383792) (not b!383797) (not b!383801) b_and!15933 (not b!383788) (not start!37564) (not b!383794) (not b!383798) (not mapNonEmpty!15573) tp_is_empty!9339 (not b!383795))
(check-sat b_and!15933 (not b_next!8691))
