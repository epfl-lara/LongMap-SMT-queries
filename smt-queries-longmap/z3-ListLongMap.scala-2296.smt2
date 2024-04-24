; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37224 () Bool)

(assert start!37224)

(declare-fun b_free!8365 () Bool)

(declare-fun b_next!8365 () Bool)

(assert (=> start!37224 (= b_free!8365 (not b_next!8365))))

(declare-fun tp!29810 () Bool)

(declare-fun b_and!15621 () Bool)

(assert (=> start!37224 (= tp!29810 b_and!15621)))

(declare-fun b!376607 () Bool)

(declare-fun e!229343 () Bool)

(assert (=> b!376607 (= e!229343 true)))

(declare-datatypes ((V!13123 0))(
  ( (V!13124 (val!4551 Int)) )
))
(declare-datatypes ((tuple2!5968 0))(
  ( (tuple2!5969 (_1!2995 (_ BitVec 64)) (_2!2995 V!13123)) )
))
(declare-datatypes ((List!5810 0))(
  ( (Nil!5807) (Cons!5806 (h!6662 tuple2!5968) (t!10952 List!5810)) )
))
(declare-datatypes ((ListLongMap!4883 0))(
  ( (ListLongMap!4884 (toList!2457 List!5810)) )
))
(declare-fun lt!174838 () ListLongMap!4883)

(declare-fun lt!174840 () ListLongMap!4883)

(declare-fun lt!174837 () tuple2!5968)

(declare-fun +!853 (ListLongMap!4883 tuple2!5968) ListLongMap!4883)

(assert (=> b!376607 (= lt!174838 (+!853 lt!174840 lt!174837))))

(declare-datatypes ((Unit!11593 0))(
  ( (Unit!11594) )
))
(declare-fun lt!174836 () Unit!11593)

(declare-fun lt!174843 () ListLongMap!4883)

(declare-fun v!373 () V!13123)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13123)

(declare-fun addCommutativeForDiffKeys!274 (ListLongMap!4883 (_ BitVec 64) V!13123 (_ BitVec 64) V!13123) Unit!11593)

(assert (=> b!376607 (= lt!174836 (addCommutativeForDiffKeys!274 lt!174843 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!212925 () Bool)

(declare-fun e!229348 () Bool)

(assert (=> start!37224 (=> (not res!212925) (not e!229348))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37224 (= res!212925 (validMask!0 mask!970))))

(assert (=> start!37224 e!229348))

(declare-datatypes ((ValueCell!4163 0))(
  ( (ValueCellFull!4163 (v!6749 V!13123)) (EmptyCell!4163) )
))
(declare-datatypes ((array!21944 0))(
  ( (array!21945 (arr!10440 (Array (_ BitVec 32) ValueCell!4163)) (size!10792 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21944)

(declare-fun e!229350 () Bool)

(declare-fun array_inv!7748 (array!21944) Bool)

(assert (=> start!37224 (and (array_inv!7748 _values!506) e!229350)))

(assert (=> start!37224 tp!29810))

(assert (=> start!37224 true))

(declare-fun tp_is_empty!9013 () Bool)

(assert (=> start!37224 tp_is_empty!9013))

(declare-datatypes ((array!21946 0))(
  ( (array!21947 (arr!10441 (Array (_ BitVec 32) (_ BitVec 64))) (size!10793 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21946)

(declare-fun array_inv!7749 (array!21946) Bool)

(assert (=> start!37224 (array_inv!7749 _keys!658)))

(declare-fun b!376608 () Bool)

(declare-fun res!212920 () Bool)

(assert (=> b!376608 (=> (not res!212920) (not e!229348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21946 (_ BitVec 32)) Bool)

(assert (=> b!376608 (= res!212920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376609 () Bool)

(declare-fun res!212923 () Bool)

(assert (=> b!376609 (=> (not res!212923) (not e!229348))))

(declare-fun arrayContainsKey!0 (array!21946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376609 (= res!212923 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376610 () Bool)

(declare-fun res!212926 () Bool)

(assert (=> b!376610 (=> (not res!212926) (not e!229348))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376610 (= res!212926 (or (= (select (arr!10441 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10441 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376611 () Bool)

(declare-fun res!212924 () Bool)

(declare-fun e!229347 () Bool)

(assert (=> b!376611 (=> (not res!212924) (not e!229347))))

(declare-fun lt!174835 () array!21946)

(declare-datatypes ((List!5811 0))(
  ( (Nil!5808) (Cons!5807 (h!6663 (_ BitVec 64)) (t!10953 List!5811)) )
))
(declare-fun arrayNoDuplicates!0 (array!21946 (_ BitVec 32) List!5811) Bool)

(assert (=> b!376611 (= res!212924 (arrayNoDuplicates!0 lt!174835 #b00000000000000000000000000000000 Nil!5808))))

(declare-fun b!376612 () Bool)

(declare-fun res!212918 () Bool)

(assert (=> b!376612 (=> (not res!212918) (not e!229348))))

(assert (=> b!376612 (= res!212918 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5808))))

(declare-fun b!376613 () Bool)

(declare-fun res!212919 () Bool)

(assert (=> b!376613 (=> (not res!212919) (not e!229348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376613 (= res!212919 (validKeyInArray!0 k0!778))))

(declare-fun b!376614 () Bool)

(assert (=> b!376614 (= e!229348 e!229347)))

(declare-fun res!212927 () Bool)

(assert (=> b!376614 (=> (not res!212927) (not e!229347))))

(assert (=> b!376614 (= res!212927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174835 mask!970))))

(assert (=> b!376614 (= lt!174835 (array!21947 (store (arr!10441 _keys!658) i!548 k0!778) (size!10793 _keys!658)))))

(declare-fun mapNonEmpty!15084 () Bool)

(declare-fun mapRes!15084 () Bool)

(declare-fun tp!29811 () Bool)

(declare-fun e!229349 () Bool)

(assert (=> mapNonEmpty!15084 (= mapRes!15084 (and tp!29811 e!229349))))

(declare-fun mapValue!15084 () ValueCell!4163)

(declare-fun mapKey!15084 () (_ BitVec 32))

(declare-fun mapRest!15084 () (Array (_ BitVec 32) ValueCell!4163))

(assert (=> mapNonEmpty!15084 (= (arr!10440 _values!506) (store mapRest!15084 mapKey!15084 mapValue!15084))))

(declare-fun b!376615 () Bool)

(declare-fun e!229346 () Bool)

(assert (=> b!376615 (= e!229346 tp_is_empty!9013)))

(declare-fun b!376616 () Bool)

(declare-fun res!212922 () Bool)

(assert (=> b!376616 (=> (not res!212922) (not e!229348))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376616 (= res!212922 (and (= (size!10792 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10793 _keys!658) (size!10792 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376617 () Bool)

(declare-fun res!212921 () Bool)

(assert (=> b!376617 (=> (not res!212921) (not e!229348))))

(assert (=> b!376617 (= res!212921 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10793 _keys!658))))))

(declare-fun b!376618 () Bool)

(assert (=> b!376618 (= e!229350 (and e!229346 mapRes!15084))))

(declare-fun condMapEmpty!15084 () Bool)

(declare-fun mapDefault!15084 () ValueCell!4163)

(assert (=> b!376618 (= condMapEmpty!15084 (= (arr!10440 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4163)) mapDefault!15084)))))

(declare-fun mapIsEmpty!15084 () Bool)

(assert (=> mapIsEmpty!15084 mapRes!15084))

(declare-fun b!376619 () Bool)

(assert (=> b!376619 (= e!229349 tp_is_empty!9013)))

(declare-fun b!376620 () Bool)

(declare-fun e!229344 () Bool)

(assert (=> b!376620 (= e!229347 (not e!229344))))

(declare-fun res!212916 () Bool)

(assert (=> b!376620 (=> res!212916 e!229344)))

(assert (=> b!376620 (= res!212916 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!174841 () ListLongMap!4883)

(declare-fun minValue!472 () V!13123)

(declare-fun getCurrentListMap!1907 (array!21946 array!21944 (_ BitVec 32) (_ BitVec 32) V!13123 V!13123 (_ BitVec 32) Int) ListLongMap!4883)

(assert (=> b!376620 (= lt!174841 (getCurrentListMap!1907 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174846 () array!21944)

(declare-fun lt!174839 () ListLongMap!4883)

(assert (=> b!376620 (= lt!174839 (getCurrentListMap!1907 lt!174835 lt!174846 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174847 () ListLongMap!4883)

(declare-fun lt!174844 () ListLongMap!4883)

(assert (=> b!376620 (and (= lt!174847 lt!174844) (= lt!174844 lt!174847))))

(assert (=> b!376620 (= lt!174844 (+!853 lt!174843 lt!174837))))

(assert (=> b!376620 (= lt!174837 (tuple2!5969 k0!778 v!373))))

(declare-fun lt!174845 () Unit!11593)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!94 (array!21946 array!21944 (_ BitVec 32) (_ BitVec 32) V!13123 V!13123 (_ BitVec 32) (_ BitVec 64) V!13123 (_ BitVec 32) Int) Unit!11593)

(assert (=> b!376620 (= lt!174845 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!94 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!754 (array!21946 array!21944 (_ BitVec 32) (_ BitVec 32) V!13123 V!13123 (_ BitVec 32) Int) ListLongMap!4883)

(assert (=> b!376620 (= lt!174847 (getCurrentListMapNoExtraKeys!754 lt!174835 lt!174846 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376620 (= lt!174846 (array!21945 (store (arr!10440 _values!506) i!548 (ValueCellFull!4163 v!373)) (size!10792 _values!506)))))

(assert (=> b!376620 (= lt!174843 (getCurrentListMapNoExtraKeys!754 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376621 () Bool)

(assert (=> b!376621 (= e!229344 e!229343)))

(declare-fun res!212917 () Bool)

(assert (=> b!376621 (=> res!212917 e!229343)))

(assert (=> b!376621 (= res!212917 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!376621 (= lt!174839 lt!174838)))

(declare-fun lt!174842 () tuple2!5968)

(assert (=> b!376621 (= lt!174838 (+!853 lt!174844 lt!174842))))

(assert (=> b!376621 (= lt!174841 lt!174840)))

(assert (=> b!376621 (= lt!174840 (+!853 lt!174843 lt!174842))))

(assert (=> b!376621 (= lt!174839 (+!853 lt!174847 lt!174842))))

(assert (=> b!376621 (= lt!174842 (tuple2!5969 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37224 res!212925) b!376616))

(assert (= (and b!376616 res!212922) b!376608))

(assert (= (and b!376608 res!212920) b!376612))

(assert (= (and b!376612 res!212918) b!376617))

(assert (= (and b!376617 res!212921) b!376613))

(assert (= (and b!376613 res!212919) b!376610))

(assert (= (and b!376610 res!212926) b!376609))

(assert (= (and b!376609 res!212923) b!376614))

(assert (= (and b!376614 res!212927) b!376611))

(assert (= (and b!376611 res!212924) b!376620))

(assert (= (and b!376620 (not res!212916)) b!376621))

(assert (= (and b!376621 (not res!212917)) b!376607))

(assert (= (and b!376618 condMapEmpty!15084) mapIsEmpty!15084))

(assert (= (and b!376618 (not condMapEmpty!15084)) mapNonEmpty!15084))

(get-info :version)

(assert (= (and mapNonEmpty!15084 ((_ is ValueCellFull!4163) mapValue!15084)) b!376619))

(assert (= (and b!376618 ((_ is ValueCellFull!4163) mapDefault!15084)) b!376615))

(assert (= start!37224 b!376618))

(declare-fun m!373601 () Bool)

(assert (=> b!376607 m!373601))

(declare-fun m!373603 () Bool)

(assert (=> b!376607 m!373603))

(declare-fun m!373605 () Bool)

(assert (=> start!37224 m!373605))

(declare-fun m!373607 () Bool)

(assert (=> start!37224 m!373607))

(declare-fun m!373609 () Bool)

(assert (=> start!37224 m!373609))

(declare-fun m!373611 () Bool)

(assert (=> b!376613 m!373611))

(declare-fun m!373613 () Bool)

(assert (=> b!376611 m!373613))

(declare-fun m!373615 () Bool)

(assert (=> b!376610 m!373615))

(declare-fun m!373617 () Bool)

(assert (=> b!376614 m!373617))

(declare-fun m!373619 () Bool)

(assert (=> b!376614 m!373619))

(declare-fun m!373621 () Bool)

(assert (=> b!376609 m!373621))

(declare-fun m!373623 () Bool)

(assert (=> b!376608 m!373623))

(declare-fun m!373625 () Bool)

(assert (=> b!376612 m!373625))

(declare-fun m!373627 () Bool)

(assert (=> mapNonEmpty!15084 m!373627))

(declare-fun m!373629 () Bool)

(assert (=> b!376621 m!373629))

(declare-fun m!373631 () Bool)

(assert (=> b!376621 m!373631))

(declare-fun m!373633 () Bool)

(assert (=> b!376621 m!373633))

(declare-fun m!373635 () Bool)

(assert (=> b!376620 m!373635))

(declare-fun m!373637 () Bool)

(assert (=> b!376620 m!373637))

(declare-fun m!373639 () Bool)

(assert (=> b!376620 m!373639))

(declare-fun m!373641 () Bool)

(assert (=> b!376620 m!373641))

(declare-fun m!373643 () Bool)

(assert (=> b!376620 m!373643))

(declare-fun m!373645 () Bool)

(assert (=> b!376620 m!373645))

(declare-fun m!373647 () Bool)

(assert (=> b!376620 m!373647))

(check-sat (not b!376607) (not b!376609) (not b!376612) tp_is_empty!9013 (not b_next!8365) (not b!376613) (not b!376620) (not b!376621) b_and!15621 (not start!37224) (not b!376611) (not b!376608) (not b!376614) (not mapNonEmpty!15084))
(check-sat b_and!15621 (not b_next!8365))
