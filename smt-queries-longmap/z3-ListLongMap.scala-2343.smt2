; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37506 () Bool)

(assert start!37506)

(declare-fun b_free!8647 () Bool)

(declare-fun b_next!8647 () Bool)

(assert (=> start!37506 (= b_free!8647 (not b_next!8647))))

(declare-fun tp!30656 () Bool)

(declare-fun b_and!15903 () Bool)

(assert (=> start!37506 (= tp!30656 b_and!15903)))

(declare-fun b!382815 () Bool)

(declare-fun res!217860 () Bool)

(declare-fun e!232583 () Bool)

(assert (=> b!382815 (=> (not res!217860) (not e!232583))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382815 (= res!217860 (validKeyInArray!0 k0!778))))

(declare-fun b!382816 () Bool)

(declare-fun e!232587 () Bool)

(declare-fun tp_is_empty!9295 () Bool)

(assert (=> b!382816 (= e!232587 tp_is_empty!9295)))

(declare-fun res!217855 () Bool)

(assert (=> start!37506 (=> (not res!217855) (not e!232583))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37506 (= res!217855 (validMask!0 mask!970))))

(assert (=> start!37506 e!232583))

(declare-datatypes ((V!13499 0))(
  ( (V!13500 (val!4692 Int)) )
))
(declare-datatypes ((ValueCell!4304 0))(
  ( (ValueCellFull!4304 (v!6890 V!13499)) (EmptyCell!4304) )
))
(declare-datatypes ((array!22488 0))(
  ( (array!22489 (arr!10712 (Array (_ BitVec 32) ValueCell!4304)) (size!11064 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22488)

(declare-fun e!232581 () Bool)

(declare-fun array_inv!7928 (array!22488) Bool)

(assert (=> start!37506 (and (array_inv!7928 _values!506) e!232581)))

(assert (=> start!37506 tp!30656))

(assert (=> start!37506 true))

(assert (=> start!37506 tp_is_empty!9295))

(declare-datatypes ((array!22490 0))(
  ( (array!22491 (arr!10713 (Array (_ BitVec 32) (_ BitVec 64))) (size!11065 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22490)

(declare-fun array_inv!7929 (array!22490) Bool)

(assert (=> start!37506 (array_inv!7929 _keys!658)))

(declare-fun b!382817 () Bool)

(declare-fun res!217862 () Bool)

(assert (=> b!382817 (=> (not res!217862) (not e!232583))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382817 (= res!217862 (and (= (size!11064 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11065 _keys!658) (size!11064 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382818 () Bool)

(declare-fun e!232582 () Bool)

(declare-fun mapRes!15507 () Bool)

(assert (=> b!382818 (= e!232581 (and e!232582 mapRes!15507))))

(declare-fun condMapEmpty!15507 () Bool)

(declare-fun mapDefault!15507 () ValueCell!4304)

(assert (=> b!382818 (= condMapEmpty!15507 (= (arr!10712 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4304)) mapDefault!15507)))))

(declare-fun b!382819 () Bool)

(assert (=> b!382819 (= e!232582 tp_is_empty!9295)))

(declare-fun b!382820 () Bool)

(declare-fun res!217857 () Bool)

(assert (=> b!382820 (=> (not res!217857) (not e!232583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22490 (_ BitVec 32)) Bool)

(assert (=> b!382820 (= res!217857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382821 () Bool)

(declare-fun e!232585 () Bool)

(assert (=> b!382821 (= e!232585 true)))

(declare-datatypes ((tuple2!6188 0))(
  ( (tuple2!6189 (_1!3105 (_ BitVec 64)) (_2!3105 V!13499)) )
))
(declare-datatypes ((List!6023 0))(
  ( (Nil!6020) (Cons!6019 (h!6875 tuple2!6188) (t!11165 List!6023)) )
))
(declare-datatypes ((ListLongMap!5103 0))(
  ( (ListLongMap!5104 (toList!2567 List!6023)) )
))
(declare-fun lt!179717 () ListLongMap!5103)

(declare-fun lt!179720 () ListLongMap!5103)

(assert (=> b!382821 (= lt!179717 lt!179720)))

(declare-fun b!382822 () Bool)

(declare-fun res!217858 () Bool)

(assert (=> b!382822 (=> (not res!217858) (not e!232583))))

(declare-datatypes ((List!6024 0))(
  ( (Nil!6021) (Cons!6020 (h!6876 (_ BitVec 64)) (t!11166 List!6024)) )
))
(declare-fun arrayNoDuplicates!0 (array!22490 (_ BitVec 32) List!6024) Bool)

(assert (=> b!382822 (= res!217858 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6021))))

(declare-fun b!382823 () Bool)

(declare-fun res!217859 () Bool)

(assert (=> b!382823 (=> (not res!217859) (not e!232583))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382823 (= res!217859 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11065 _keys!658))))))

(declare-fun b!382824 () Bool)

(declare-fun res!217861 () Bool)

(assert (=> b!382824 (=> (not res!217861) (not e!232583))))

(assert (=> b!382824 (= res!217861 (or (= (select (arr!10713 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10713 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382825 () Bool)

(declare-fun res!217865 () Bool)

(assert (=> b!382825 (=> (not res!217865) (not e!232583))))

(declare-fun arrayContainsKey!0 (array!22490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382825 (= res!217865 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382826 () Bool)

(declare-fun e!232586 () Bool)

(assert (=> b!382826 (= e!232583 e!232586)))

(declare-fun res!217863 () Bool)

(assert (=> b!382826 (=> (not res!217863) (not e!232586))))

(declare-fun lt!179715 () array!22490)

(assert (=> b!382826 (= res!217863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179715 mask!970))))

(assert (=> b!382826 (= lt!179715 (array!22491 (store (arr!10713 _keys!658) i!548 k0!778) (size!11065 _keys!658)))))

(declare-fun mapIsEmpty!15507 () Bool)

(assert (=> mapIsEmpty!15507 mapRes!15507))

(declare-fun b!382827 () Bool)

(declare-fun res!217856 () Bool)

(assert (=> b!382827 (=> (not res!217856) (not e!232586))))

(assert (=> b!382827 (= res!217856 (arrayNoDuplicates!0 lt!179715 #b00000000000000000000000000000000 Nil!6021))))

(declare-fun b!382828 () Bool)

(assert (=> b!382828 (= e!232586 (not e!232585))))

(declare-fun res!217864 () Bool)

(assert (=> b!382828 (=> res!217864 e!232585)))

(declare-fun lt!179719 () Bool)

(assert (=> b!382828 (= res!217864 (or (and (not lt!179719) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179719) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179719)))))

(assert (=> b!382828 (= lt!179719 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!179721 () ListLongMap!5103)

(declare-fun zeroValue!472 () V!13499)

(declare-fun minValue!472 () V!13499)

(declare-fun getCurrentListMap!2001 (array!22490 array!22488 (_ BitVec 32) (_ BitVec 32) V!13499 V!13499 (_ BitVec 32) Int) ListLongMap!5103)

(assert (=> b!382828 (= lt!179721 (getCurrentListMap!2001 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179714 () array!22488)

(assert (=> b!382828 (= lt!179717 (getCurrentListMap!2001 lt!179715 lt!179714 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179718 () ListLongMap!5103)

(assert (=> b!382828 (and (= lt!179720 lt!179718) (= lt!179718 lt!179720))))

(declare-fun v!373 () V!13499)

(declare-fun lt!179716 () ListLongMap!5103)

(declare-fun +!959 (ListLongMap!5103 tuple2!6188) ListLongMap!5103)

(assert (=> b!382828 (= lt!179718 (+!959 lt!179716 (tuple2!6189 k0!778 v!373)))))

(declare-datatypes ((Unit!11797 0))(
  ( (Unit!11798) )
))
(declare-fun lt!179722 () Unit!11797)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!188 (array!22490 array!22488 (_ BitVec 32) (_ BitVec 32) V!13499 V!13499 (_ BitVec 32) (_ BitVec 64) V!13499 (_ BitVec 32) Int) Unit!11797)

(assert (=> b!382828 (= lt!179722 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!188 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!848 (array!22490 array!22488 (_ BitVec 32) (_ BitVec 32) V!13499 V!13499 (_ BitVec 32) Int) ListLongMap!5103)

(assert (=> b!382828 (= lt!179720 (getCurrentListMapNoExtraKeys!848 lt!179715 lt!179714 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382828 (= lt!179714 (array!22489 (store (arr!10712 _values!506) i!548 (ValueCellFull!4304 v!373)) (size!11064 _values!506)))))

(assert (=> b!382828 (= lt!179716 (getCurrentListMapNoExtraKeys!848 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15507 () Bool)

(declare-fun tp!30657 () Bool)

(assert (=> mapNonEmpty!15507 (= mapRes!15507 (and tp!30657 e!232587))))

(declare-fun mapValue!15507 () ValueCell!4304)

(declare-fun mapRest!15507 () (Array (_ BitVec 32) ValueCell!4304))

(declare-fun mapKey!15507 () (_ BitVec 32))

(assert (=> mapNonEmpty!15507 (= (arr!10712 _values!506) (store mapRest!15507 mapKey!15507 mapValue!15507))))

(assert (= (and start!37506 res!217855) b!382817))

(assert (= (and b!382817 res!217862) b!382820))

(assert (= (and b!382820 res!217857) b!382822))

(assert (= (and b!382822 res!217858) b!382823))

(assert (= (and b!382823 res!217859) b!382815))

(assert (= (and b!382815 res!217860) b!382824))

(assert (= (and b!382824 res!217861) b!382825))

(assert (= (and b!382825 res!217865) b!382826))

(assert (= (and b!382826 res!217863) b!382827))

(assert (= (and b!382827 res!217856) b!382828))

(assert (= (and b!382828 (not res!217864)) b!382821))

(assert (= (and b!382818 condMapEmpty!15507) mapIsEmpty!15507))

(assert (= (and b!382818 (not condMapEmpty!15507)) mapNonEmpty!15507))

(get-info :version)

(assert (= (and mapNonEmpty!15507 ((_ is ValueCellFull!4304) mapValue!15507)) b!382816))

(assert (= (and b!382818 ((_ is ValueCellFull!4304) mapDefault!15507)) b!382819))

(assert (= start!37506 b!382818))

(declare-fun m!379877 () Bool)

(assert (=> b!382828 m!379877))

(declare-fun m!379879 () Bool)

(assert (=> b!382828 m!379879))

(declare-fun m!379881 () Bool)

(assert (=> b!382828 m!379881))

(declare-fun m!379883 () Bool)

(assert (=> b!382828 m!379883))

(declare-fun m!379885 () Bool)

(assert (=> b!382828 m!379885))

(declare-fun m!379887 () Bool)

(assert (=> b!382828 m!379887))

(declare-fun m!379889 () Bool)

(assert (=> b!382828 m!379889))

(declare-fun m!379891 () Bool)

(assert (=> b!382826 m!379891))

(declare-fun m!379893 () Bool)

(assert (=> b!382826 m!379893))

(declare-fun m!379895 () Bool)

(assert (=> b!382822 m!379895))

(declare-fun m!379897 () Bool)

(assert (=> b!382827 m!379897))

(declare-fun m!379899 () Bool)

(assert (=> mapNonEmpty!15507 m!379899))

(declare-fun m!379901 () Bool)

(assert (=> start!37506 m!379901))

(declare-fun m!379903 () Bool)

(assert (=> start!37506 m!379903))

(declare-fun m!379905 () Bool)

(assert (=> start!37506 m!379905))

(declare-fun m!379907 () Bool)

(assert (=> b!382824 m!379907))

(declare-fun m!379909 () Bool)

(assert (=> b!382815 m!379909))

(declare-fun m!379911 () Bool)

(assert (=> b!382820 m!379911))

(declare-fun m!379913 () Bool)

(assert (=> b!382825 m!379913))

(check-sat (not b!382820) (not b!382828) (not b!382827) (not b!382826) b_and!15903 (not b!382822) (not start!37506) (not mapNonEmpty!15507) (not b!382825) tp_is_empty!9295 (not b!382815) (not b_next!8647))
(check-sat b_and!15903 (not b_next!8647))
