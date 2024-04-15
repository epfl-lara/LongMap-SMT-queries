; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37224 () Bool)

(assert start!37224)

(declare-fun b_free!8365 () Bool)

(declare-fun b_next!8365 () Bool)

(assert (=> start!37224 (= b_free!8365 (not b_next!8365))))

(declare-fun tp!29811 () Bool)

(declare-fun b_and!15581 () Bool)

(assert (=> start!37224 (= tp!29811 b_and!15581)))

(declare-fun b!376385 () Bool)

(declare-fun res!212794 () Bool)

(declare-fun e!229207 () Bool)

(assert (=> b!376385 (=> (not res!212794) (not e!229207))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13123 0))(
  ( (V!13124 (val!4551 Int)) )
))
(declare-datatypes ((ValueCell!4163 0))(
  ( (ValueCellFull!4163 (v!6742 V!13123)) (EmptyCell!4163) )
))
(declare-datatypes ((array!21937 0))(
  ( (array!21938 (arr!10437 (Array (_ BitVec 32) ValueCell!4163)) (size!10790 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21937)

(declare-datatypes ((array!21939 0))(
  ( (array!21940 (arr!10438 (Array (_ BitVec 32) (_ BitVec 64))) (size!10791 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21939)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!376385 (= res!212794 (and (= (size!10790 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10791 _keys!658) (size!10790 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15084 () Bool)

(declare-fun mapRes!15084 () Bool)

(assert (=> mapIsEmpty!15084 mapRes!15084))

(declare-fun b!376386 () Bool)

(declare-fun res!212801 () Bool)

(assert (=> b!376386 (=> (not res!212801) (not e!229207))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376386 (= res!212801 (validKeyInArray!0 k0!778))))

(declare-fun b!376387 () Bool)

(declare-fun res!212800 () Bool)

(assert (=> b!376387 (=> (not res!212800) (not e!229207))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376387 (= res!212800 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10791 _keys!658))))))

(declare-fun b!376388 () Bool)

(declare-fun res!212793 () Bool)

(assert (=> b!376388 (=> (not res!212793) (not e!229207))))

(declare-datatypes ((List!5873 0))(
  ( (Nil!5870) (Cons!5869 (h!6725 (_ BitVec 64)) (t!11014 List!5873)) )
))
(declare-fun arrayNoDuplicates!0 (array!21939 (_ BitVec 32) List!5873) Bool)

(assert (=> b!376388 (= res!212793 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5870))))

(declare-fun b!376389 () Bool)

(declare-fun e!229203 () Bool)

(declare-fun e!229208 () Bool)

(assert (=> b!376389 (= e!229203 e!229208)))

(declare-fun res!212799 () Bool)

(assert (=> b!376389 (=> res!212799 e!229208)))

(assert (=> b!376389 (= res!212799 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6044 0))(
  ( (tuple2!6045 (_1!3033 (_ BitVec 64)) (_2!3033 V!13123)) )
))
(declare-datatypes ((List!5874 0))(
  ( (Nil!5871) (Cons!5870 (h!6726 tuple2!6044) (t!11015 List!5874)) )
))
(declare-datatypes ((ListLongMap!4947 0))(
  ( (ListLongMap!4948 (toList!2489 List!5874)) )
))
(declare-fun lt!174591 () ListLongMap!4947)

(declare-fun lt!174584 () ListLongMap!4947)

(assert (=> b!376389 (= lt!174591 lt!174584)))

(declare-fun lt!174592 () ListLongMap!4947)

(declare-fun lt!174586 () tuple2!6044)

(declare-fun +!857 (ListLongMap!4947 tuple2!6044) ListLongMap!4947)

(assert (=> b!376389 (= lt!174584 (+!857 lt!174592 lt!174586))))

(declare-fun lt!174589 () ListLongMap!4947)

(declare-fun lt!174583 () ListLongMap!4947)

(assert (=> b!376389 (= lt!174589 lt!174583)))

(declare-fun lt!174582 () ListLongMap!4947)

(assert (=> b!376389 (= lt!174583 (+!857 lt!174582 lt!174586))))

(declare-fun lt!174593 () ListLongMap!4947)

(assert (=> b!376389 (= lt!174591 (+!857 lt!174593 lt!174586))))

(declare-fun zeroValue!472 () V!13123)

(assert (=> b!376389 (= lt!174586 (tuple2!6045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!15084 () Bool)

(declare-fun tp!29810 () Bool)

(declare-fun e!229206 () Bool)

(assert (=> mapNonEmpty!15084 (= mapRes!15084 (and tp!29810 e!229206))))

(declare-fun mapValue!15084 () ValueCell!4163)

(declare-fun mapKey!15084 () (_ BitVec 32))

(declare-fun mapRest!15084 () (Array (_ BitVec 32) ValueCell!4163))

(assert (=> mapNonEmpty!15084 (= (arr!10437 _values!506) (store mapRest!15084 mapKey!15084 mapValue!15084))))

(declare-fun res!212792 () Bool)

(assert (=> start!37224 (=> (not res!212792) (not e!229207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37224 (= res!212792 (validMask!0 mask!970))))

(assert (=> start!37224 e!229207))

(declare-fun e!229201 () Bool)

(declare-fun array_inv!7698 (array!21937) Bool)

(assert (=> start!37224 (and (array_inv!7698 _values!506) e!229201)))

(assert (=> start!37224 tp!29811))

(assert (=> start!37224 true))

(declare-fun tp_is_empty!9013 () Bool)

(assert (=> start!37224 tp_is_empty!9013))

(declare-fun array_inv!7699 (array!21939) Bool)

(assert (=> start!37224 (array_inv!7699 _keys!658)))

(declare-fun b!376390 () Bool)

(declare-fun e!229205 () Bool)

(assert (=> b!376390 (= e!229207 e!229205)))

(declare-fun res!212796 () Bool)

(assert (=> b!376390 (=> (not res!212796) (not e!229205))))

(declare-fun lt!174585 () array!21939)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21939 (_ BitVec 32)) Bool)

(assert (=> b!376390 (= res!212796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174585 mask!970))))

(assert (=> b!376390 (= lt!174585 (array!21940 (store (arr!10438 _keys!658) i!548 k0!778) (size!10791 _keys!658)))))

(declare-fun b!376391 () Bool)

(declare-fun res!212795 () Bool)

(assert (=> b!376391 (=> (not res!212795) (not e!229207))))

(assert (=> b!376391 (= res!212795 (or (= (select (arr!10438 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10438 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376392 () Bool)

(declare-fun res!212791 () Bool)

(assert (=> b!376392 (=> (not res!212791) (not e!229205))))

(assert (=> b!376392 (= res!212791 (arrayNoDuplicates!0 lt!174585 #b00000000000000000000000000000000 Nil!5870))))

(declare-fun b!376393 () Bool)

(declare-fun e!229204 () Bool)

(assert (=> b!376393 (= e!229201 (and e!229204 mapRes!15084))))

(declare-fun condMapEmpty!15084 () Bool)

(declare-fun mapDefault!15084 () ValueCell!4163)

(assert (=> b!376393 (= condMapEmpty!15084 (= (arr!10437 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4163)) mapDefault!15084)))))

(declare-fun b!376394 () Bool)

(declare-fun res!212790 () Bool)

(assert (=> b!376394 (=> (not res!212790) (not e!229207))))

(assert (=> b!376394 (= res!212790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376395 () Bool)

(assert (=> b!376395 (= e!229204 tp_is_empty!9013)))

(declare-fun b!376396 () Bool)

(assert (=> b!376396 (= e!229208 true)))

(declare-fun lt!174587 () tuple2!6044)

(assert (=> b!376396 (= lt!174584 (+!857 lt!174583 lt!174587))))

(declare-fun v!373 () V!13123)

(declare-datatypes ((Unit!11584 0))(
  ( (Unit!11585) )
))
(declare-fun lt!174588 () Unit!11584)

(declare-fun addCommutativeForDiffKeys!266 (ListLongMap!4947 (_ BitVec 64) V!13123 (_ BitVec 64) V!13123) Unit!11584)

(assert (=> b!376396 (= lt!174588 (addCommutativeForDiffKeys!266 lt!174582 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376397 () Bool)

(assert (=> b!376397 (= e!229205 (not e!229203))))

(declare-fun res!212797 () Bool)

(assert (=> b!376397 (=> res!212797 e!229203)))

(assert (=> b!376397 (= res!212797 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13123)

(declare-fun getCurrentListMap!1899 (array!21939 array!21937 (_ BitVec 32) (_ BitVec 32) V!13123 V!13123 (_ BitVec 32) Int) ListLongMap!4947)

(assert (=> b!376397 (= lt!174589 (getCurrentListMap!1899 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174594 () array!21937)

(assert (=> b!376397 (= lt!174591 (getCurrentListMap!1899 lt!174585 lt!174594 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376397 (and (= lt!174593 lt!174592) (= lt!174592 lt!174593))))

(assert (=> b!376397 (= lt!174592 (+!857 lt!174582 lt!174587))))

(assert (=> b!376397 (= lt!174587 (tuple2!6045 k0!778 v!373))))

(declare-fun lt!174590 () Unit!11584)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!92 (array!21939 array!21937 (_ BitVec 32) (_ BitVec 32) V!13123 V!13123 (_ BitVec 32) (_ BitVec 64) V!13123 (_ BitVec 32) Int) Unit!11584)

(assert (=> b!376397 (= lt!174590 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!92 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!764 (array!21939 array!21937 (_ BitVec 32) (_ BitVec 32) V!13123 V!13123 (_ BitVec 32) Int) ListLongMap!4947)

(assert (=> b!376397 (= lt!174593 (getCurrentListMapNoExtraKeys!764 lt!174585 lt!174594 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376397 (= lt!174594 (array!21938 (store (arr!10437 _values!506) i!548 (ValueCellFull!4163 v!373)) (size!10790 _values!506)))))

(assert (=> b!376397 (= lt!174582 (getCurrentListMapNoExtraKeys!764 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376398 () Bool)

(declare-fun res!212798 () Bool)

(assert (=> b!376398 (=> (not res!212798) (not e!229207))))

(declare-fun arrayContainsKey!0 (array!21939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376398 (= res!212798 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376399 () Bool)

(assert (=> b!376399 (= e!229206 tp_is_empty!9013)))

(assert (= (and start!37224 res!212792) b!376385))

(assert (= (and b!376385 res!212794) b!376394))

(assert (= (and b!376394 res!212790) b!376388))

(assert (= (and b!376388 res!212793) b!376387))

(assert (= (and b!376387 res!212800) b!376386))

(assert (= (and b!376386 res!212801) b!376391))

(assert (= (and b!376391 res!212795) b!376398))

(assert (= (and b!376398 res!212798) b!376390))

(assert (= (and b!376390 res!212796) b!376392))

(assert (= (and b!376392 res!212791) b!376397))

(assert (= (and b!376397 (not res!212797)) b!376389))

(assert (= (and b!376389 (not res!212799)) b!376396))

(assert (= (and b!376393 condMapEmpty!15084) mapIsEmpty!15084))

(assert (= (and b!376393 (not condMapEmpty!15084)) mapNonEmpty!15084))

(get-info :version)

(assert (= (and mapNonEmpty!15084 ((_ is ValueCellFull!4163) mapValue!15084)) b!376399))

(assert (= (and b!376393 ((_ is ValueCellFull!4163) mapDefault!15084)) b!376395))

(assert (= start!37224 b!376393))

(declare-fun m!372647 () Bool)

(assert (=> b!376386 m!372647))

(declare-fun m!372649 () Bool)

(assert (=> b!376389 m!372649))

(declare-fun m!372651 () Bool)

(assert (=> b!376389 m!372651))

(declare-fun m!372653 () Bool)

(assert (=> b!376389 m!372653))

(declare-fun m!372655 () Bool)

(assert (=> b!376388 m!372655))

(declare-fun m!372657 () Bool)

(assert (=> start!37224 m!372657))

(declare-fun m!372659 () Bool)

(assert (=> start!37224 m!372659))

(declare-fun m!372661 () Bool)

(assert (=> start!37224 m!372661))

(declare-fun m!372663 () Bool)

(assert (=> mapNonEmpty!15084 m!372663))

(declare-fun m!372665 () Bool)

(assert (=> b!376390 m!372665))

(declare-fun m!372667 () Bool)

(assert (=> b!376390 m!372667))

(declare-fun m!372669 () Bool)

(assert (=> b!376392 m!372669))

(declare-fun m!372671 () Bool)

(assert (=> b!376398 m!372671))

(declare-fun m!372673 () Bool)

(assert (=> b!376391 m!372673))

(declare-fun m!372675 () Bool)

(assert (=> b!376396 m!372675))

(declare-fun m!372677 () Bool)

(assert (=> b!376396 m!372677))

(declare-fun m!372679 () Bool)

(assert (=> b!376397 m!372679))

(declare-fun m!372681 () Bool)

(assert (=> b!376397 m!372681))

(declare-fun m!372683 () Bool)

(assert (=> b!376397 m!372683))

(declare-fun m!372685 () Bool)

(assert (=> b!376397 m!372685))

(declare-fun m!372687 () Bool)

(assert (=> b!376397 m!372687))

(declare-fun m!372689 () Bool)

(assert (=> b!376397 m!372689))

(declare-fun m!372691 () Bool)

(assert (=> b!376397 m!372691))

(declare-fun m!372693 () Bool)

(assert (=> b!376394 m!372693))

(check-sat (not b!376397) (not b!376396) (not b!376386) (not b!376398) b_and!15581 (not b!376394) (not b!376388) (not b!376389) (not b!376390) (not start!37224) (not mapNonEmpty!15084) (not b!376392) tp_is_empty!9013 (not b_next!8365))
(check-sat b_and!15581 (not b_next!8365))
