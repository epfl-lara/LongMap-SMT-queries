; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37470 () Bool)

(assert start!37470)

(declare-fun b_free!8611 () Bool)

(declare-fun b_next!8611 () Bool)

(assert (=> start!37470 (= b_free!8611 (not b_next!8611))))

(declare-fun tp!30548 () Bool)

(declare-fun b_and!15827 () Bool)

(assert (=> start!37470 (= tp!30548 b_and!15827)))

(declare-fun b!381837 () Bool)

(declare-fun e!232063 () Bool)

(assert (=> b!381837 (= e!232063 true)))

(declare-datatypes ((V!13451 0))(
  ( (V!13452 (val!4674 Int)) )
))
(declare-datatypes ((tuple2!6256 0))(
  ( (tuple2!6257 (_1!3139 (_ BitVec 64)) (_2!3139 V!13451)) )
))
(declare-datatypes ((List!6082 0))(
  ( (Nil!6079) (Cons!6078 (h!6934 tuple2!6256) (t!11223 List!6082)) )
))
(declare-datatypes ((ListLongMap!5159 0))(
  ( (ListLongMap!5160 (toList!2595 List!6082)) )
))
(declare-fun lt!178981 () ListLongMap!5159)

(declare-fun lt!178980 () ListLongMap!5159)

(assert (=> b!381837 (= lt!178981 lt!178980)))

(declare-fun b!381838 () Bool)

(declare-fun res!217135 () Bool)

(declare-fun e!232064 () Bool)

(assert (=> b!381838 (=> (not res!217135) (not e!232064))))

(declare-datatypes ((array!22413 0))(
  ( (array!22414 (arr!10675 (Array (_ BitVec 32) (_ BitVec 64))) (size!11028 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22413)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381838 (= res!217135 (or (= (select (arr!10675 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10675 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381839 () Bool)

(declare-fun e!232065 () Bool)

(assert (=> b!381839 (= e!232064 e!232065)))

(declare-fun res!217137 () Bool)

(assert (=> b!381839 (=> (not res!217137) (not e!232065))))

(declare-fun lt!178975 () array!22413)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22413 (_ BitVec 32)) Bool)

(assert (=> b!381839 (= res!217137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178975 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!381839 (= lt!178975 (array!22414 (store (arr!10675 _keys!658) i!548 k0!778) (size!11028 _keys!658)))))

(declare-fun b!381840 () Bool)

(declare-fun e!232061 () Bool)

(declare-fun tp_is_empty!9259 () Bool)

(assert (=> b!381840 (= e!232061 tp_is_empty!9259)))

(declare-fun b!381841 () Bool)

(declare-fun res!217145 () Bool)

(assert (=> b!381841 (=> (not res!217145) (not e!232064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381841 (= res!217145 (validKeyInArray!0 k0!778))))

(declare-fun b!381842 () Bool)

(declare-fun res!217144 () Bool)

(assert (=> b!381842 (=> (not res!217144) (not e!232065))))

(declare-datatypes ((List!6083 0))(
  ( (Nil!6080) (Cons!6079 (h!6935 (_ BitVec 64)) (t!11224 List!6083)) )
))
(declare-fun arrayNoDuplicates!0 (array!22413 (_ BitVec 32) List!6083) Bool)

(assert (=> b!381842 (= res!217144 (arrayNoDuplicates!0 lt!178975 #b00000000000000000000000000000000 Nil!6080))))

(declare-fun mapNonEmpty!15453 () Bool)

(declare-fun mapRes!15453 () Bool)

(declare-fun tp!30549 () Bool)

(assert (=> mapNonEmpty!15453 (= mapRes!15453 (and tp!30549 e!232061))))

(declare-datatypes ((ValueCell!4286 0))(
  ( (ValueCellFull!4286 (v!6865 V!13451)) (EmptyCell!4286) )
))
(declare-datatypes ((array!22415 0))(
  ( (array!22416 (arr!10676 (Array (_ BitVec 32) ValueCell!4286)) (size!11029 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22415)

(declare-fun mapRest!15453 () (Array (_ BitVec 32) ValueCell!4286))

(declare-fun mapKey!15453 () (_ BitVec 32))

(declare-fun mapValue!15453 () ValueCell!4286)

(assert (=> mapNonEmpty!15453 (= (arr!10676 _values!506) (store mapRest!15453 mapKey!15453 mapValue!15453))))

(declare-fun b!381843 () Bool)

(declare-fun e!232066 () Bool)

(assert (=> b!381843 (= e!232066 tp_is_empty!9259)))

(declare-fun b!381844 () Bool)

(declare-fun res!217136 () Bool)

(assert (=> b!381844 (=> (not res!217136) (not e!232064))))

(assert (=> b!381844 (= res!217136 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11028 _keys!658))))))

(declare-fun b!381845 () Bool)

(declare-fun e!232062 () Bool)

(assert (=> b!381845 (= e!232062 (and e!232066 mapRes!15453))))

(declare-fun condMapEmpty!15453 () Bool)

(declare-fun mapDefault!15453 () ValueCell!4286)

(assert (=> b!381845 (= condMapEmpty!15453 (= (arr!10676 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4286)) mapDefault!15453)))))

(declare-fun res!217140 () Bool)

(assert (=> start!37470 (=> (not res!217140) (not e!232064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37470 (= res!217140 (validMask!0 mask!970))))

(assert (=> start!37470 e!232064))

(declare-fun array_inv!7862 (array!22415) Bool)

(assert (=> start!37470 (and (array_inv!7862 _values!506) e!232062)))

(assert (=> start!37470 tp!30548))

(assert (=> start!37470 true))

(assert (=> start!37470 tp_is_empty!9259))

(declare-fun array_inv!7863 (array!22413) Bool)

(assert (=> start!37470 (array_inv!7863 _keys!658)))

(declare-fun b!381846 () Bool)

(declare-fun res!217142 () Bool)

(assert (=> b!381846 (=> (not res!217142) (not e!232064))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381846 (= res!217142 (and (= (size!11029 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11028 _keys!658) (size!11029 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15453 () Bool)

(assert (=> mapIsEmpty!15453 mapRes!15453))

(declare-fun b!381847 () Bool)

(declare-fun res!217138 () Bool)

(assert (=> b!381847 (=> (not res!217138) (not e!232064))))

(assert (=> b!381847 (= res!217138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381848 () Bool)

(assert (=> b!381848 (= e!232065 (not e!232063))))

(declare-fun res!217143 () Bool)

(assert (=> b!381848 (=> res!217143 e!232063)))

(declare-fun lt!178982 () Bool)

(assert (=> b!381848 (= res!217143 (or (and (not lt!178982) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178982) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178982)))))

(assert (=> b!381848 (= lt!178982 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!178983 () ListLongMap!5159)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13451)

(declare-fun minValue!472 () V!13451)

(declare-fun getCurrentListMap!1982 (array!22413 array!22415 (_ BitVec 32) (_ BitVec 32) V!13451 V!13451 (_ BitVec 32) Int) ListLongMap!5159)

(assert (=> b!381848 (= lt!178983 (getCurrentListMap!1982 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178977 () array!22415)

(assert (=> b!381848 (= lt!178981 (getCurrentListMap!1982 lt!178975 lt!178977 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178976 () ListLongMap!5159)

(assert (=> b!381848 (and (= lt!178980 lt!178976) (= lt!178976 lt!178980))))

(declare-fun v!373 () V!13451)

(declare-fun lt!178978 () ListLongMap!5159)

(declare-fun +!956 (ListLongMap!5159 tuple2!6256) ListLongMap!5159)

(assert (=> b!381848 (= lt!178976 (+!956 lt!178978 (tuple2!6257 k0!778 v!373)))))

(declare-datatypes ((Unit!11770 0))(
  ( (Unit!11771) )
))
(declare-fun lt!178979 () Unit!11770)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!175 (array!22413 array!22415 (_ BitVec 32) (_ BitVec 32) V!13451 V!13451 (_ BitVec 32) (_ BitVec 64) V!13451 (_ BitVec 32) Int) Unit!11770)

(assert (=> b!381848 (= lt!178979 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!175 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!847 (array!22413 array!22415 (_ BitVec 32) (_ BitVec 32) V!13451 V!13451 (_ BitVec 32) Int) ListLongMap!5159)

(assert (=> b!381848 (= lt!178980 (getCurrentListMapNoExtraKeys!847 lt!178975 lt!178977 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381848 (= lt!178977 (array!22416 (store (arr!10676 _values!506) i!548 (ValueCellFull!4286 v!373)) (size!11029 _values!506)))))

(assert (=> b!381848 (= lt!178978 (getCurrentListMapNoExtraKeys!847 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381849 () Bool)

(declare-fun res!217139 () Bool)

(assert (=> b!381849 (=> (not res!217139) (not e!232064))))

(assert (=> b!381849 (= res!217139 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6080))))

(declare-fun b!381850 () Bool)

(declare-fun res!217141 () Bool)

(assert (=> b!381850 (=> (not res!217141) (not e!232064))))

(declare-fun arrayContainsKey!0 (array!22413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381850 (= res!217141 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37470 res!217140) b!381846))

(assert (= (and b!381846 res!217142) b!381847))

(assert (= (and b!381847 res!217138) b!381849))

(assert (= (and b!381849 res!217139) b!381844))

(assert (= (and b!381844 res!217136) b!381841))

(assert (= (and b!381841 res!217145) b!381838))

(assert (= (and b!381838 res!217135) b!381850))

(assert (= (and b!381850 res!217141) b!381839))

(assert (= (and b!381839 res!217137) b!381842))

(assert (= (and b!381842 res!217144) b!381848))

(assert (= (and b!381848 (not res!217143)) b!381837))

(assert (= (and b!381845 condMapEmpty!15453) mapIsEmpty!15453))

(assert (= (and b!381845 (not condMapEmpty!15453)) mapNonEmpty!15453))

(get-info :version)

(assert (= (and mapNonEmpty!15453 ((_ is ValueCellFull!4286) mapValue!15453)) b!381840))

(assert (= (and b!381845 ((_ is ValueCellFull!4286) mapDefault!15453)) b!381843))

(assert (= start!37470 b!381845))

(declare-fun m!378239 () Bool)

(assert (=> b!381850 m!378239))

(declare-fun m!378241 () Bool)

(assert (=> b!381839 m!378241))

(declare-fun m!378243 () Bool)

(assert (=> b!381839 m!378243))

(declare-fun m!378245 () Bool)

(assert (=> b!381848 m!378245))

(declare-fun m!378247 () Bool)

(assert (=> b!381848 m!378247))

(declare-fun m!378249 () Bool)

(assert (=> b!381848 m!378249))

(declare-fun m!378251 () Bool)

(assert (=> b!381848 m!378251))

(declare-fun m!378253 () Bool)

(assert (=> b!381848 m!378253))

(declare-fun m!378255 () Bool)

(assert (=> b!381848 m!378255))

(declare-fun m!378257 () Bool)

(assert (=> b!381848 m!378257))

(declare-fun m!378259 () Bool)

(assert (=> b!381842 m!378259))

(declare-fun m!378261 () Bool)

(assert (=> b!381849 m!378261))

(declare-fun m!378263 () Bool)

(assert (=> start!37470 m!378263))

(declare-fun m!378265 () Bool)

(assert (=> start!37470 m!378265))

(declare-fun m!378267 () Bool)

(assert (=> start!37470 m!378267))

(declare-fun m!378269 () Bool)

(assert (=> b!381841 m!378269))

(declare-fun m!378271 () Bool)

(assert (=> b!381838 m!378271))

(declare-fun m!378273 () Bool)

(assert (=> mapNonEmpty!15453 m!378273))

(declare-fun m!378275 () Bool)

(assert (=> b!381847 m!378275))

(check-sat (not b!381850) tp_is_empty!9259 (not b!381839) (not b!381849) (not b!381841) (not b!381842) (not mapNonEmpty!15453) (not b!381847) b_and!15827 (not b!381848) (not b_next!8611) (not start!37470))
(check-sat b_and!15827 (not b_next!8611))
