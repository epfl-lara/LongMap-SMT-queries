; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38032 () Bool)

(assert start!38032)

(declare-fun b_free!8979 () Bool)

(declare-fun b_next!8979 () Bool)

(assert (=> start!38032 (= b_free!8979 (not b_next!8979))))

(declare-fun tp!31710 () Bool)

(declare-fun b_and!16305 () Bool)

(assert (=> start!38032 (= tp!31710 b_and!16305)))

(declare-fun b!391437 () Bool)

(declare-fun e!237088 () Bool)

(declare-fun e!237086 () Bool)

(assert (=> b!391437 (= e!237088 e!237086)))

(declare-fun res!224056 () Bool)

(assert (=> b!391437 (=> res!224056 e!237086)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!391437 (= res!224056 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13973 0))(
  ( (V!13974 (val!4870 Int)) )
))
(declare-datatypes ((tuple2!6560 0))(
  ( (tuple2!6561 (_1!3291 (_ BitVec 64)) (_2!3291 V!13973)) )
))
(declare-datatypes ((List!6414 0))(
  ( (Nil!6411) (Cons!6410 (h!7266 tuple2!6560) (t!11578 List!6414)) )
))
(declare-datatypes ((ListLongMap!5473 0))(
  ( (ListLongMap!5474 (toList!2752 List!6414)) )
))
(declare-fun lt!184712 () ListLongMap!5473)

(declare-fun lt!184715 () ListLongMap!5473)

(assert (=> b!391437 (= lt!184712 lt!184715)))

(declare-fun lt!184716 () ListLongMap!5473)

(declare-fun lt!184707 () tuple2!6560)

(declare-fun +!1047 (ListLongMap!5473 tuple2!6560) ListLongMap!5473)

(assert (=> b!391437 (= lt!184715 (+!1047 lt!184716 lt!184707))))

(declare-fun lt!184717 () ListLongMap!5473)

(declare-fun lt!184714 () ListLongMap!5473)

(assert (=> b!391437 (= lt!184717 lt!184714)))

(declare-fun lt!184719 () ListLongMap!5473)

(assert (=> b!391437 (= lt!184714 (+!1047 lt!184719 lt!184707))))

(declare-fun lt!184708 () ListLongMap!5473)

(assert (=> b!391437 (= lt!184712 (+!1047 lt!184708 lt!184707))))

(declare-fun zeroValue!472 () V!13973)

(assert (=> b!391437 (= lt!184707 (tuple2!6561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391438 () Bool)

(declare-fun res!224045 () Bool)

(declare-fun e!237092 () Bool)

(assert (=> b!391438 (=> (not res!224045) (not e!237092))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23205 0))(
  ( (array!23206 (arr!11064 (Array (_ BitVec 32) (_ BitVec 64))) (size!11416 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23205)

(assert (=> b!391438 (= res!224045 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11416 _keys!658))))))

(declare-fun b!391439 () Bool)

(declare-fun res!224053 () Bool)

(assert (=> b!391439 (=> (not res!224053) (not e!237092))))

(declare-datatypes ((ValueCell!4482 0))(
  ( (ValueCellFull!4482 (v!7095 V!13973)) (EmptyCell!4482) )
))
(declare-datatypes ((array!23207 0))(
  ( (array!23208 (arr!11065 (Array (_ BitVec 32) ValueCell!4482)) (size!11417 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23207)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391439 (= res!224053 (and (= (size!11417 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11416 _keys!658) (size!11417 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391440 () Bool)

(declare-fun res!224052 () Bool)

(assert (=> b!391440 (=> (not res!224052) (not e!237092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391440 (= res!224052 (validKeyInArray!0 k0!778))))

(declare-fun b!391441 () Bool)

(declare-fun e!237089 () Bool)

(declare-fun tp_is_empty!9651 () Bool)

(assert (=> b!391441 (= e!237089 tp_is_empty!9651)))

(declare-fun b!391442 () Bool)

(declare-fun e!237087 () Bool)

(assert (=> b!391442 (= e!237087 tp_is_empty!9651)))

(declare-fun mapNonEmpty!16062 () Bool)

(declare-fun mapRes!16062 () Bool)

(declare-fun tp!31709 () Bool)

(assert (=> mapNonEmpty!16062 (= mapRes!16062 (and tp!31709 e!237089))))

(declare-fun mapValue!16062 () ValueCell!4482)

(declare-fun mapKey!16062 () (_ BitVec 32))

(declare-fun mapRest!16062 () (Array (_ BitVec 32) ValueCell!4482))

(assert (=> mapNonEmpty!16062 (= (arr!11065 _values!506) (store mapRest!16062 mapKey!16062 mapValue!16062))))

(declare-fun b!391443 () Bool)

(declare-fun res!224046 () Bool)

(declare-fun e!237091 () Bool)

(assert (=> b!391443 (=> (not res!224046) (not e!237091))))

(declare-fun lt!184718 () array!23205)

(declare-datatypes ((List!6415 0))(
  ( (Nil!6412) (Cons!6411 (h!7267 (_ BitVec 64)) (t!11579 List!6415)) )
))
(declare-fun arrayNoDuplicates!0 (array!23205 (_ BitVec 32) List!6415) Bool)

(assert (=> b!391443 (= res!224046 (arrayNoDuplicates!0 lt!184718 #b00000000000000000000000000000000 Nil!6412))))

(declare-fun b!391444 () Bool)

(declare-fun res!224049 () Bool)

(assert (=> b!391444 (=> (not res!224049) (not e!237092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23205 (_ BitVec 32)) Bool)

(assert (=> b!391444 (= res!224049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!224047 () Bool)

(assert (=> start!38032 (=> (not res!224047) (not e!237092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38032 (= res!224047 (validMask!0 mask!970))))

(assert (=> start!38032 e!237092))

(declare-fun e!237093 () Bool)

(declare-fun array_inv!8126 (array!23207) Bool)

(assert (=> start!38032 (and (array_inv!8126 _values!506) e!237093)))

(assert (=> start!38032 tp!31710))

(assert (=> start!38032 true))

(assert (=> start!38032 tp_is_empty!9651))

(declare-fun array_inv!8127 (array!23205) Bool)

(assert (=> start!38032 (array_inv!8127 _keys!658)))

(declare-fun b!391445 () Bool)

(declare-fun res!224055 () Bool)

(assert (=> b!391445 (=> (not res!224055) (not e!237092))))

(assert (=> b!391445 (= res!224055 (or (= (select (arr!11064 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11064 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391446 () Bool)

(declare-fun res!224051 () Bool)

(assert (=> b!391446 (=> (not res!224051) (not e!237092))))

(declare-fun arrayContainsKey!0 (array!23205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391446 (= res!224051 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!391447 () Bool)

(declare-fun res!224048 () Bool)

(assert (=> b!391447 (=> (not res!224048) (not e!237092))))

(assert (=> b!391447 (= res!224048 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6412))))

(declare-fun mapIsEmpty!16062 () Bool)

(assert (=> mapIsEmpty!16062 mapRes!16062))

(declare-fun b!391448 () Bool)

(assert (=> b!391448 (= e!237086 true)))

(declare-fun lt!184713 () tuple2!6560)

(assert (=> b!391448 (= lt!184715 (+!1047 lt!184714 lt!184713))))

(declare-fun v!373 () V!13973)

(declare-datatypes ((Unit!11976 0))(
  ( (Unit!11977) )
))
(declare-fun lt!184710 () Unit!11976)

(declare-fun addCommutativeForDiffKeys!338 (ListLongMap!5473 (_ BitVec 64) V!13973 (_ BitVec 64) V!13973) Unit!11976)

(assert (=> b!391448 (= lt!184710 (addCommutativeForDiffKeys!338 lt!184719 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391449 () Bool)

(assert (=> b!391449 (= e!237092 e!237091)))

(declare-fun res!224054 () Bool)

(assert (=> b!391449 (=> (not res!224054) (not e!237091))))

(assert (=> b!391449 (= res!224054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184718 mask!970))))

(assert (=> b!391449 (= lt!184718 (array!23206 (store (arr!11064 _keys!658) i!548 k0!778) (size!11416 _keys!658)))))

(declare-fun b!391450 () Bool)

(assert (=> b!391450 (= e!237091 (not e!237088))))

(declare-fun res!224050 () Bool)

(assert (=> b!391450 (=> res!224050 e!237088)))

(assert (=> b!391450 (= res!224050 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13973)

(declare-fun getCurrentListMap!2096 (array!23205 array!23207 (_ BitVec 32) (_ BitVec 32) V!13973 V!13973 (_ BitVec 32) Int) ListLongMap!5473)

(assert (=> b!391450 (= lt!184717 (getCurrentListMap!2096 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184709 () array!23207)

(assert (=> b!391450 (= lt!184712 (getCurrentListMap!2096 lt!184718 lt!184709 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391450 (and (= lt!184708 lt!184716) (= lt!184716 lt!184708))))

(assert (=> b!391450 (= lt!184716 (+!1047 lt!184719 lt!184713))))

(assert (=> b!391450 (= lt!184713 (tuple2!6561 k0!778 v!373))))

(declare-fun lt!184711 () Unit!11976)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!260 (array!23205 array!23207 (_ BitVec 32) (_ BitVec 32) V!13973 V!13973 (_ BitVec 32) (_ BitVec 64) V!13973 (_ BitVec 32) Int) Unit!11976)

(assert (=> b!391450 (= lt!184711 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!260 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!976 (array!23205 array!23207 (_ BitVec 32) (_ BitVec 32) V!13973 V!13973 (_ BitVec 32) Int) ListLongMap!5473)

(assert (=> b!391450 (= lt!184708 (getCurrentListMapNoExtraKeys!976 lt!184718 lt!184709 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391450 (= lt!184709 (array!23208 (store (arr!11065 _values!506) i!548 (ValueCellFull!4482 v!373)) (size!11417 _values!506)))))

(assert (=> b!391450 (= lt!184719 (getCurrentListMapNoExtraKeys!976 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391451 () Bool)

(assert (=> b!391451 (= e!237093 (and e!237087 mapRes!16062))))

(declare-fun condMapEmpty!16062 () Bool)

(declare-fun mapDefault!16062 () ValueCell!4482)

(assert (=> b!391451 (= condMapEmpty!16062 (= (arr!11065 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4482)) mapDefault!16062)))))

(assert (= (and start!38032 res!224047) b!391439))

(assert (= (and b!391439 res!224053) b!391444))

(assert (= (and b!391444 res!224049) b!391447))

(assert (= (and b!391447 res!224048) b!391438))

(assert (= (and b!391438 res!224045) b!391440))

(assert (= (and b!391440 res!224052) b!391445))

(assert (= (and b!391445 res!224055) b!391446))

(assert (= (and b!391446 res!224051) b!391449))

(assert (= (and b!391449 res!224054) b!391443))

(assert (= (and b!391443 res!224046) b!391450))

(assert (= (and b!391450 (not res!224050)) b!391437))

(assert (= (and b!391437 (not res!224056)) b!391448))

(assert (= (and b!391451 condMapEmpty!16062) mapIsEmpty!16062))

(assert (= (and b!391451 (not condMapEmpty!16062)) mapNonEmpty!16062))

(get-info :version)

(assert (= (and mapNonEmpty!16062 ((_ is ValueCellFull!4482) mapValue!16062)) b!391441))

(assert (= (and b!391451 ((_ is ValueCellFull!4482) mapDefault!16062)) b!391442))

(assert (= start!38032 b!391451))

(declare-fun m!387803 () Bool)

(assert (=> start!38032 m!387803))

(declare-fun m!387805 () Bool)

(assert (=> start!38032 m!387805))

(declare-fun m!387807 () Bool)

(assert (=> start!38032 m!387807))

(declare-fun m!387809 () Bool)

(assert (=> b!391447 m!387809))

(declare-fun m!387811 () Bool)

(assert (=> b!391440 m!387811))

(declare-fun m!387813 () Bool)

(assert (=> b!391444 m!387813))

(declare-fun m!387815 () Bool)

(assert (=> b!391437 m!387815))

(declare-fun m!387817 () Bool)

(assert (=> b!391437 m!387817))

(declare-fun m!387819 () Bool)

(assert (=> b!391437 m!387819))

(declare-fun m!387821 () Bool)

(assert (=> mapNonEmpty!16062 m!387821))

(declare-fun m!387823 () Bool)

(assert (=> b!391445 m!387823))

(declare-fun m!387825 () Bool)

(assert (=> b!391446 m!387825))

(declare-fun m!387827 () Bool)

(assert (=> b!391450 m!387827))

(declare-fun m!387829 () Bool)

(assert (=> b!391450 m!387829))

(declare-fun m!387831 () Bool)

(assert (=> b!391450 m!387831))

(declare-fun m!387833 () Bool)

(assert (=> b!391450 m!387833))

(declare-fun m!387835 () Bool)

(assert (=> b!391450 m!387835))

(declare-fun m!387837 () Bool)

(assert (=> b!391450 m!387837))

(declare-fun m!387839 () Bool)

(assert (=> b!391450 m!387839))

(declare-fun m!387841 () Bool)

(assert (=> b!391443 m!387841))

(declare-fun m!387843 () Bool)

(assert (=> b!391449 m!387843))

(declare-fun m!387845 () Bool)

(assert (=> b!391449 m!387845))

(declare-fun m!387847 () Bool)

(assert (=> b!391448 m!387847))

(declare-fun m!387849 () Bool)

(assert (=> b!391448 m!387849))

(check-sat (not b!391444) (not b!391447) (not b!391446) (not mapNonEmpty!16062) b_and!16305 (not b_next!8979) (not b!391437) (not start!38032) (not b!391450) (not b!391440) (not b!391443) (not b!391449) (not b!391448) tp_is_empty!9651)
(check-sat b_and!16305 (not b_next!8979))
