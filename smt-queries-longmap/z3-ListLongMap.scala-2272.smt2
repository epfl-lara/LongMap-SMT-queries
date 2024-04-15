; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37080 () Bool)

(assert start!37080)

(declare-fun b_free!8221 () Bool)

(declare-fun b_next!8221 () Bool)

(assert (=> start!37080 (= b_free!8221 (not b_next!8221))))

(declare-fun tp!29378 () Bool)

(declare-fun b_and!15437 () Bool)

(assert (=> start!37080 (= tp!29378 b_and!15437)))

(declare-fun b!373136 () Bool)

(declare-fun res!210192 () Bool)

(declare-fun e!227479 () Bool)

(assert (=> b!373136 (=> (not res!210192) (not e!227479))))

(declare-datatypes ((array!21655 0))(
  ( (array!21656 (arr!10296 (Array (_ BitVec 32) (_ BitVec 64))) (size!10649 (_ BitVec 32))) )
))
(declare-fun lt!171218 () array!21655)

(declare-datatypes ((List!5752 0))(
  ( (Nil!5749) (Cons!5748 (h!6604 (_ BitVec 64)) (t!10893 List!5752)) )
))
(declare-fun arrayNoDuplicates!0 (array!21655 (_ BitVec 32) List!5752) Bool)

(assert (=> b!373136 (= res!210192 (arrayNoDuplicates!0 lt!171218 #b00000000000000000000000000000000 Nil!5749))))

(declare-fun b!373137 () Bool)

(declare-fun res!210197 () Bool)

(declare-fun e!227477 () Bool)

(assert (=> b!373137 (=> (not res!210197) (not e!227477))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!21655)

(assert (=> b!373137 (= res!210197 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10649 _keys!658))))))

(declare-fun b!373138 () Bool)

(declare-fun res!210196 () Bool)

(assert (=> b!373138 (=> (not res!210196) (not e!227477))))

(assert (=> b!373138 (= res!210196 (or (= (select (arr!10296 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10296 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373139 () Bool)

(declare-fun res!210200 () Bool)

(assert (=> b!373139 (=> (not res!210200) (not e!227477))))

(assert (=> b!373139 (= res!210200 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5749))))

(declare-fun b!373140 () Bool)

(declare-fun e!227478 () Bool)

(declare-fun e!227474 () Bool)

(declare-fun mapRes!14868 () Bool)

(assert (=> b!373140 (= e!227478 (and e!227474 mapRes!14868))))

(declare-fun condMapEmpty!14868 () Bool)

(declare-datatypes ((V!12931 0))(
  ( (V!12932 (val!4479 Int)) )
))
(declare-datatypes ((ValueCell!4091 0))(
  ( (ValueCellFull!4091 (v!6670 V!12931)) (EmptyCell!4091) )
))
(declare-datatypes ((array!21657 0))(
  ( (array!21658 (arr!10297 (Array (_ BitVec 32) ValueCell!4091)) (size!10650 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21657)

(declare-fun mapDefault!14868 () ValueCell!4091)

(assert (=> b!373140 (= condMapEmpty!14868 (= (arr!10297 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4091)) mapDefault!14868)))))

(declare-fun b!373141 () Bool)

(declare-fun e!227480 () Bool)

(assert (=> b!373141 (= e!227480 true)))

(declare-datatypes ((tuple2!5914 0))(
  ( (tuple2!5915 (_1!2968 (_ BitVec 64)) (_2!2968 V!12931)) )
))
(declare-datatypes ((List!5753 0))(
  ( (Nil!5750) (Cons!5749 (h!6605 tuple2!5914) (t!10894 List!5753)) )
))
(declare-datatypes ((ListLongMap!4817 0))(
  ( (ListLongMap!4818 (toList!2424 List!5753)) )
))
(declare-fun lt!171222 () ListLongMap!4817)

(declare-fun lt!171212 () tuple2!5914)

(declare-fun lt!171206 () ListLongMap!4817)

(declare-fun lt!171207 () tuple2!5914)

(declare-fun +!792 (ListLongMap!4817 tuple2!5914) ListLongMap!4817)

(assert (=> b!373141 (= (+!792 lt!171222 lt!171212) (+!792 lt!171206 lt!171207))))

(declare-fun v!373 () V!12931)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun minValue!472 () V!12931)

(declare-datatypes ((Unit!11456 0))(
  ( (Unit!11457) )
))
(declare-fun lt!171211 () Unit!11456)

(declare-fun lt!171213 () ListLongMap!4817)

(declare-fun addCommutativeForDiffKeys!212 (ListLongMap!4817 (_ BitVec 64) V!12931 (_ BitVec 64) V!12931) Unit!11456)

(assert (=> b!373141 (= lt!171211 (addCommutativeForDiffKeys!212 lt!171213 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373142 () Bool)

(declare-fun res!210194 () Bool)

(assert (=> b!373142 (=> (not res!210194) (not e!227477))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!373142 (= res!210194 (and (= (size!10650 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10649 _keys!658) (size!10650 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373143 () Bool)

(declare-fun e!227476 () Bool)

(assert (=> b!373143 (= e!227479 (not e!227476))))

(declare-fun res!210190 () Bool)

(assert (=> b!373143 (=> res!210190 e!227476)))

(assert (=> b!373143 (= res!210190 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!171209 () ListLongMap!4817)

(declare-fun zeroValue!472 () V!12931)

(declare-fun getCurrentListMap!1847 (array!21655 array!21657 (_ BitVec 32) (_ BitVec 32) V!12931 V!12931 (_ BitVec 32) Int) ListLongMap!4817)

(assert (=> b!373143 (= lt!171209 (getCurrentListMap!1847 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171221 () array!21657)

(declare-fun lt!171219 () ListLongMap!4817)

(assert (=> b!373143 (= lt!171219 (getCurrentListMap!1847 lt!171218 lt!171221 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171215 () ListLongMap!4817)

(declare-fun lt!171214 () ListLongMap!4817)

(assert (=> b!373143 (and (= lt!171215 lt!171214) (= lt!171214 lt!171215))))

(declare-fun lt!171216 () ListLongMap!4817)

(assert (=> b!373143 (= lt!171214 (+!792 lt!171216 lt!171207))))

(assert (=> b!373143 (= lt!171207 (tuple2!5915 k0!778 v!373))))

(declare-fun lt!171208 () Unit!11456)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!40 (array!21655 array!21657 (_ BitVec 32) (_ BitVec 32) V!12931 V!12931 (_ BitVec 32) (_ BitVec 64) V!12931 (_ BitVec 32) Int) Unit!11456)

(assert (=> b!373143 (= lt!171208 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!40 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!712 (array!21655 array!21657 (_ BitVec 32) (_ BitVec 32) V!12931 V!12931 (_ BitVec 32) Int) ListLongMap!4817)

(assert (=> b!373143 (= lt!171215 (getCurrentListMapNoExtraKeys!712 lt!171218 lt!171221 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373143 (= lt!171221 (array!21658 (store (arr!10297 _values!506) i!548 (ValueCellFull!4091 v!373)) (size!10650 _values!506)))))

(assert (=> b!373143 (= lt!171216 (getCurrentListMapNoExtraKeys!712 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373144 () Bool)

(declare-fun e!227475 () Bool)

(declare-fun tp_is_empty!8869 () Bool)

(assert (=> b!373144 (= e!227475 tp_is_empty!8869)))

(declare-fun b!373145 () Bool)

(declare-fun res!210191 () Bool)

(assert (=> b!373145 (=> (not res!210191) (not e!227477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373145 (= res!210191 (validKeyInArray!0 k0!778))))

(declare-fun b!373146 () Bool)

(assert (=> b!373146 (= e!227477 e!227479)))

(declare-fun res!210189 () Bool)

(assert (=> b!373146 (=> (not res!210189) (not e!227479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21655 (_ BitVec 32)) Bool)

(assert (=> b!373146 (= res!210189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171218 mask!970))))

(assert (=> b!373146 (= lt!171218 (array!21656 (store (arr!10296 _keys!658) i!548 k0!778) (size!10649 _keys!658)))))

(declare-fun b!373147 () Bool)

(assert (=> b!373147 (= e!227476 e!227480)))

(declare-fun res!210195 () Bool)

(assert (=> b!373147 (=> res!210195 e!227480)))

(assert (=> b!373147 (= res!210195 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!171210 () ListLongMap!4817)

(assert (=> b!373147 (= lt!171210 lt!171222)))

(assert (=> b!373147 (= lt!171222 (+!792 lt!171213 lt!171207))))

(declare-fun lt!171220 () Unit!11456)

(assert (=> b!373147 (= lt!171220 (addCommutativeForDiffKeys!212 lt!171216 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!373147 (= lt!171219 (+!792 lt!171210 lt!171212))))

(declare-fun lt!171217 () tuple2!5914)

(assert (=> b!373147 (= lt!171210 (+!792 lt!171214 lt!171217))))

(assert (=> b!373147 (= lt!171209 lt!171206)))

(assert (=> b!373147 (= lt!171206 (+!792 lt!171213 lt!171212))))

(assert (=> b!373147 (= lt!171213 (+!792 lt!171216 lt!171217))))

(assert (=> b!373147 (= lt!171219 (+!792 (+!792 lt!171215 lt!171217) lt!171212))))

(assert (=> b!373147 (= lt!171212 (tuple2!5915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373147 (= lt!171217 (tuple2!5915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!14868 () Bool)

(declare-fun tp!29379 () Bool)

(assert (=> mapNonEmpty!14868 (= mapRes!14868 (and tp!29379 e!227475))))

(declare-fun mapKey!14868 () (_ BitVec 32))

(declare-fun mapRest!14868 () (Array (_ BitVec 32) ValueCell!4091))

(declare-fun mapValue!14868 () ValueCell!4091)

(assert (=> mapNonEmpty!14868 (= (arr!10297 _values!506) (store mapRest!14868 mapKey!14868 mapValue!14868))))

(declare-fun res!210199 () Bool)

(assert (=> start!37080 (=> (not res!210199) (not e!227477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37080 (= res!210199 (validMask!0 mask!970))))

(assert (=> start!37080 e!227477))

(declare-fun array_inv!7596 (array!21657) Bool)

(assert (=> start!37080 (and (array_inv!7596 _values!506) e!227478)))

(assert (=> start!37080 tp!29378))

(assert (=> start!37080 true))

(assert (=> start!37080 tp_is_empty!8869))

(declare-fun array_inv!7597 (array!21655) Bool)

(assert (=> start!37080 (array_inv!7597 _keys!658)))

(declare-fun b!373148 () Bool)

(declare-fun res!210193 () Bool)

(assert (=> b!373148 (=> (not res!210193) (not e!227477))))

(declare-fun arrayContainsKey!0 (array!21655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373148 (= res!210193 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14868 () Bool)

(assert (=> mapIsEmpty!14868 mapRes!14868))

(declare-fun b!373149 () Bool)

(assert (=> b!373149 (= e!227474 tp_is_empty!8869)))

(declare-fun b!373150 () Bool)

(declare-fun res!210198 () Bool)

(assert (=> b!373150 (=> (not res!210198) (not e!227477))))

(assert (=> b!373150 (= res!210198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37080 res!210199) b!373142))

(assert (= (and b!373142 res!210194) b!373150))

(assert (= (and b!373150 res!210198) b!373139))

(assert (= (and b!373139 res!210200) b!373137))

(assert (= (and b!373137 res!210197) b!373145))

(assert (= (and b!373145 res!210191) b!373138))

(assert (= (and b!373138 res!210196) b!373148))

(assert (= (and b!373148 res!210193) b!373146))

(assert (= (and b!373146 res!210189) b!373136))

(assert (= (and b!373136 res!210192) b!373143))

(assert (= (and b!373143 (not res!210190)) b!373147))

(assert (= (and b!373147 (not res!210195)) b!373141))

(assert (= (and b!373140 condMapEmpty!14868) mapIsEmpty!14868))

(assert (= (and b!373140 (not condMapEmpty!14868)) mapNonEmpty!14868))

(get-info :version)

(assert (= (and mapNonEmpty!14868 ((_ is ValueCellFull!4091) mapValue!14868)) b!373144))

(assert (= (and b!373140 ((_ is ValueCellFull!4091) mapDefault!14868)) b!373149))

(assert (= start!37080 b!373140))

(declare-fun m!368591 () Bool)

(assert (=> b!373138 m!368591))

(declare-fun m!368593 () Bool)

(assert (=> b!373150 m!368593))

(declare-fun m!368595 () Bool)

(assert (=> b!373148 m!368595))

(declare-fun m!368597 () Bool)

(assert (=> b!373145 m!368597))

(declare-fun m!368599 () Bool)

(assert (=> b!373139 m!368599))

(declare-fun m!368601 () Bool)

(assert (=> b!373147 m!368601))

(declare-fun m!368603 () Bool)

(assert (=> b!373147 m!368603))

(declare-fun m!368605 () Bool)

(assert (=> b!373147 m!368605))

(declare-fun m!368607 () Bool)

(assert (=> b!373147 m!368607))

(assert (=> b!373147 m!368603))

(declare-fun m!368609 () Bool)

(assert (=> b!373147 m!368609))

(declare-fun m!368611 () Bool)

(assert (=> b!373147 m!368611))

(declare-fun m!368613 () Bool)

(assert (=> b!373147 m!368613))

(declare-fun m!368615 () Bool)

(assert (=> b!373147 m!368615))

(declare-fun m!368617 () Bool)

(assert (=> b!373143 m!368617))

(declare-fun m!368619 () Bool)

(assert (=> b!373143 m!368619))

(declare-fun m!368621 () Bool)

(assert (=> b!373143 m!368621))

(declare-fun m!368623 () Bool)

(assert (=> b!373143 m!368623))

(declare-fun m!368625 () Bool)

(assert (=> b!373143 m!368625))

(declare-fun m!368627 () Bool)

(assert (=> b!373143 m!368627))

(declare-fun m!368629 () Bool)

(assert (=> b!373143 m!368629))

(declare-fun m!368631 () Bool)

(assert (=> b!373136 m!368631))

(declare-fun m!368633 () Bool)

(assert (=> start!37080 m!368633))

(declare-fun m!368635 () Bool)

(assert (=> start!37080 m!368635))

(declare-fun m!368637 () Bool)

(assert (=> start!37080 m!368637))

(declare-fun m!368639 () Bool)

(assert (=> b!373146 m!368639))

(declare-fun m!368641 () Bool)

(assert (=> b!373146 m!368641))

(declare-fun m!368643 () Bool)

(assert (=> b!373141 m!368643))

(declare-fun m!368645 () Bool)

(assert (=> b!373141 m!368645))

(declare-fun m!368647 () Bool)

(assert (=> b!373141 m!368647))

(declare-fun m!368649 () Bool)

(assert (=> mapNonEmpty!14868 m!368649))

(check-sat (not b!373141) (not b!373139) (not b!373146) (not b_next!8221) (not b!373147) (not b!373150) tp_is_empty!8869 b_and!15437 (not mapNonEmpty!14868) (not b!373136) (not b!373145) (not b!373143) (not b!373148) (not start!37080))
(check-sat b_and!15437 (not b_next!8221))
