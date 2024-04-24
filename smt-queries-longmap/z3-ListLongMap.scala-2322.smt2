; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37380 () Bool)

(assert start!37380)

(declare-fun b_free!8521 () Bool)

(declare-fun b_next!8521 () Bool)

(assert (=> start!37380 (= b_free!8521 (not b_next!8521))))

(declare-fun tp!30278 () Bool)

(declare-fun b_and!15777 () Bool)

(assert (=> start!37380 (= tp!30278 b_and!15777)))

(declare-fun mapIsEmpty!15318 () Bool)

(declare-fun mapRes!15318 () Bool)

(assert (=> mapIsEmpty!15318 mapRes!15318))

(declare-fun b!380127 () Bool)

(declare-fun res!215738 () Bool)

(declare-fun e!231217 () Bool)

(assert (=> b!380127 (=> (not res!215738) (not e!231217))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380127 (= res!215738 (validKeyInArray!0 k0!778))))

(declare-fun b!380128 () Bool)

(declare-fun res!215735 () Bool)

(assert (=> b!380128 (=> (not res!215735) (not e!231217))))

(declare-datatypes ((array!22244 0))(
  ( (array!22245 (arr!10590 (Array (_ BitVec 32) (_ BitVec 64))) (size!10942 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22244)

(declare-datatypes ((List!5925 0))(
  ( (Nil!5922) (Cons!5921 (h!6777 (_ BitVec 64)) (t!11067 List!5925)) )
))
(declare-fun arrayNoDuplicates!0 (array!22244 (_ BitVec 32) List!5925) Bool)

(assert (=> b!380128 (= res!215735 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5922))))

(declare-fun b!380129 () Bool)

(declare-fun e!231215 () Bool)

(assert (=> b!380129 (= e!231217 e!231215)))

(declare-fun res!215734 () Bool)

(assert (=> b!380129 (=> (not res!215734) (not e!231215))))

(declare-fun lt!177853 () array!22244)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22244 (_ BitVec 32)) Bool)

(assert (=> b!380129 (= res!215734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177853 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380129 (= lt!177853 (array!22245 (store (arr!10590 _keys!658) i!548 k0!778) (size!10942 _keys!658)))))

(declare-fun b!380130 () Bool)

(declare-fun res!215733 () Bool)

(assert (=> b!380130 (=> (not res!215733) (not e!231217))))

(assert (=> b!380130 (= res!215733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380131 () Bool)

(declare-fun res!215742 () Bool)

(assert (=> b!380131 (=> (not res!215742) (not e!231217))))

(assert (=> b!380131 (= res!215742 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10942 _keys!658))))))

(declare-fun b!380132 () Bool)

(declare-fun e!231216 () Bool)

(declare-fun e!231222 () Bool)

(assert (=> b!380132 (= e!231216 (and e!231222 mapRes!15318))))

(declare-fun condMapEmpty!15318 () Bool)

(declare-datatypes ((V!13331 0))(
  ( (V!13332 (val!4629 Int)) )
))
(declare-datatypes ((ValueCell!4241 0))(
  ( (ValueCellFull!4241 (v!6827 V!13331)) (EmptyCell!4241) )
))
(declare-datatypes ((array!22246 0))(
  ( (array!22247 (arr!10591 (Array (_ BitVec 32) ValueCell!4241)) (size!10943 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22246)

(declare-fun mapDefault!15318 () ValueCell!4241)

(assert (=> b!380132 (= condMapEmpty!15318 (= (arr!10591 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4241)) mapDefault!15318)))))

(declare-fun b!380133 () Bool)

(declare-fun e!231221 () Bool)

(assert (=> b!380133 (= e!231221 true)))

(declare-datatypes ((tuple2!6088 0))(
  ( (tuple2!6089 (_1!3055 (_ BitVec 64)) (_2!3055 V!13331)) )
))
(declare-datatypes ((List!5926 0))(
  ( (Nil!5923) (Cons!5922 (h!6778 tuple2!6088) (t!11068 List!5926)) )
))
(declare-datatypes ((ListLongMap!5003 0))(
  ( (ListLongMap!5004 (toList!2517 List!5926)) )
))
(declare-fun lt!177842 () ListLongMap!5003)

(declare-fun lt!177851 () ListLongMap!5003)

(declare-fun lt!177847 () tuple2!6088)

(declare-fun +!913 (ListLongMap!5003 tuple2!6088) ListLongMap!5003)

(assert (=> b!380133 (= lt!177842 (+!913 lt!177851 lt!177847))))

(declare-fun v!373 () V!13331)

(declare-fun lt!177845 () ListLongMap!5003)

(declare-datatypes ((Unit!11707 0))(
  ( (Unit!11708) )
))
(declare-fun lt!177844 () Unit!11707)

(declare-fun minValue!472 () V!13331)

(declare-fun addCommutativeForDiffKeys!323 (ListLongMap!5003 (_ BitVec 64) V!13331 (_ BitVec 64) V!13331) Unit!11707)

(assert (=> b!380133 (= lt!177844 (addCommutativeForDiffKeys!323 lt!177845 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun res!215736 () Bool)

(assert (=> start!37380 (=> (not res!215736) (not e!231217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37380 (= res!215736 (validMask!0 mask!970))))

(assert (=> start!37380 e!231217))

(declare-fun array_inv!7842 (array!22246) Bool)

(assert (=> start!37380 (and (array_inv!7842 _values!506) e!231216)))

(assert (=> start!37380 tp!30278))

(assert (=> start!37380 true))

(declare-fun tp_is_empty!9169 () Bool)

(assert (=> start!37380 tp_is_empty!9169))

(declare-fun array_inv!7843 (array!22244) Bool)

(assert (=> start!37380 (array_inv!7843 _keys!658)))

(declare-fun b!380126 () Bool)

(assert (=> b!380126 (= e!231222 tp_is_empty!9169)))

(declare-fun b!380134 () Bool)

(declare-fun res!215740 () Bool)

(assert (=> b!380134 (=> (not res!215740) (not e!231217))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380134 (= res!215740 (and (= (size!10943 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10942 _keys!658) (size!10943 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15318 () Bool)

(declare-fun tp!30279 () Bool)

(declare-fun e!231220 () Bool)

(assert (=> mapNonEmpty!15318 (= mapRes!15318 (and tp!30279 e!231220))))

(declare-fun mapKey!15318 () (_ BitVec 32))

(declare-fun mapValue!15318 () ValueCell!4241)

(declare-fun mapRest!15318 () (Array (_ BitVec 32) ValueCell!4241))

(assert (=> mapNonEmpty!15318 (= (arr!10591 _values!506) (store mapRest!15318 mapKey!15318 mapValue!15318))))

(declare-fun b!380135 () Bool)

(declare-fun res!215739 () Bool)

(assert (=> b!380135 (=> (not res!215739) (not e!231217))))

(declare-fun arrayContainsKey!0 (array!22244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380135 (= res!215739 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!380136 () Bool)

(declare-fun e!231219 () Bool)

(assert (=> b!380136 (= e!231215 (not e!231219))))

(declare-fun res!215744 () Bool)

(assert (=> b!380136 (=> res!215744 e!231219)))

(assert (=> b!380136 (= res!215744 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!177846 () ListLongMap!5003)

(declare-fun zeroValue!472 () V!13331)

(declare-fun getCurrentListMap!1956 (array!22244 array!22246 (_ BitVec 32) (_ BitVec 32) V!13331 V!13331 (_ BitVec 32) Int) ListLongMap!5003)

(assert (=> b!380136 (= lt!177846 (getCurrentListMap!1956 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177850 () array!22246)

(declare-fun lt!177849 () ListLongMap!5003)

(assert (=> b!380136 (= lt!177849 (getCurrentListMap!1956 lt!177853 lt!177850 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177852 () ListLongMap!5003)

(declare-fun lt!177841 () ListLongMap!5003)

(assert (=> b!380136 (and (= lt!177852 lt!177841) (= lt!177841 lt!177852))))

(assert (=> b!380136 (= lt!177841 (+!913 lt!177845 lt!177847))))

(assert (=> b!380136 (= lt!177847 (tuple2!6089 k0!778 v!373))))

(declare-fun lt!177843 () Unit!11707)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!143 (array!22244 array!22246 (_ BitVec 32) (_ BitVec 32) V!13331 V!13331 (_ BitVec 32) (_ BitVec 64) V!13331 (_ BitVec 32) Int) Unit!11707)

(assert (=> b!380136 (= lt!177843 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!143 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!803 (array!22244 array!22246 (_ BitVec 32) (_ BitVec 32) V!13331 V!13331 (_ BitVec 32) Int) ListLongMap!5003)

(assert (=> b!380136 (= lt!177852 (getCurrentListMapNoExtraKeys!803 lt!177853 lt!177850 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380136 (= lt!177850 (array!22247 (store (arr!10591 _values!506) i!548 (ValueCellFull!4241 v!373)) (size!10943 _values!506)))))

(assert (=> b!380136 (= lt!177845 (getCurrentListMapNoExtraKeys!803 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380137 () Bool)

(assert (=> b!380137 (= e!231220 tp_is_empty!9169)))

(declare-fun b!380138 () Bool)

(declare-fun res!215741 () Bool)

(assert (=> b!380138 (=> (not res!215741) (not e!231217))))

(assert (=> b!380138 (= res!215741 (or (= (select (arr!10590 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10590 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380139 () Bool)

(declare-fun res!215737 () Bool)

(assert (=> b!380139 (=> (not res!215737) (not e!231215))))

(assert (=> b!380139 (= res!215737 (arrayNoDuplicates!0 lt!177853 #b00000000000000000000000000000000 Nil!5922))))

(declare-fun b!380140 () Bool)

(assert (=> b!380140 (= e!231219 e!231221)))

(declare-fun res!215743 () Bool)

(assert (=> b!380140 (=> res!215743 e!231221)))

(assert (=> b!380140 (= res!215743 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!380140 (= lt!177846 lt!177851)))

(declare-fun lt!177848 () tuple2!6088)

(assert (=> b!380140 (= lt!177851 (+!913 lt!177845 lt!177848))))

(assert (=> b!380140 (= lt!177849 lt!177842)))

(assert (=> b!380140 (= lt!177842 (+!913 lt!177841 lt!177848))))

(assert (=> b!380140 (= lt!177849 (+!913 lt!177852 lt!177848))))

(assert (=> b!380140 (= lt!177848 (tuple2!6089 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (= (and start!37380 res!215736) b!380134))

(assert (= (and b!380134 res!215740) b!380130))

(assert (= (and b!380130 res!215733) b!380128))

(assert (= (and b!380128 res!215735) b!380131))

(assert (= (and b!380131 res!215742) b!380127))

(assert (= (and b!380127 res!215738) b!380138))

(assert (= (and b!380138 res!215741) b!380135))

(assert (= (and b!380135 res!215739) b!380129))

(assert (= (and b!380129 res!215734) b!380139))

(assert (= (and b!380139 res!215737) b!380136))

(assert (= (and b!380136 (not res!215744)) b!380140))

(assert (= (and b!380140 (not res!215743)) b!380133))

(assert (= (and b!380132 condMapEmpty!15318) mapIsEmpty!15318))

(assert (= (and b!380132 (not condMapEmpty!15318)) mapNonEmpty!15318))

(get-info :version)

(assert (= (and mapNonEmpty!15318 ((_ is ValueCellFull!4241) mapValue!15318)) b!380137))

(assert (= (and b!380132 ((_ is ValueCellFull!4241) mapDefault!15318)) b!380126))

(assert (= start!37380 b!380132))

(declare-fun m!377333 () Bool)

(assert (=> b!380133 m!377333))

(declare-fun m!377335 () Bool)

(assert (=> b!380133 m!377335))

(declare-fun m!377337 () Bool)

(assert (=> b!380135 m!377337))

(declare-fun m!377339 () Bool)

(assert (=> b!380129 m!377339))

(declare-fun m!377341 () Bool)

(assert (=> b!380129 m!377341))

(declare-fun m!377343 () Bool)

(assert (=> b!380139 m!377343))

(declare-fun m!377345 () Bool)

(assert (=> start!37380 m!377345))

(declare-fun m!377347 () Bool)

(assert (=> start!37380 m!377347))

(declare-fun m!377349 () Bool)

(assert (=> start!37380 m!377349))

(declare-fun m!377351 () Bool)

(assert (=> b!380130 m!377351))

(declare-fun m!377353 () Bool)

(assert (=> mapNonEmpty!15318 m!377353))

(declare-fun m!377355 () Bool)

(assert (=> b!380140 m!377355))

(declare-fun m!377357 () Bool)

(assert (=> b!380140 m!377357))

(declare-fun m!377359 () Bool)

(assert (=> b!380140 m!377359))

(declare-fun m!377361 () Bool)

(assert (=> b!380138 m!377361))

(declare-fun m!377363 () Bool)

(assert (=> b!380128 m!377363))

(declare-fun m!377365 () Bool)

(assert (=> b!380127 m!377365))

(declare-fun m!377367 () Bool)

(assert (=> b!380136 m!377367))

(declare-fun m!377369 () Bool)

(assert (=> b!380136 m!377369))

(declare-fun m!377371 () Bool)

(assert (=> b!380136 m!377371))

(declare-fun m!377373 () Bool)

(assert (=> b!380136 m!377373))

(declare-fun m!377375 () Bool)

(assert (=> b!380136 m!377375))

(declare-fun m!377377 () Bool)

(assert (=> b!380136 m!377377))

(declare-fun m!377379 () Bool)

(assert (=> b!380136 m!377379))

(check-sat (not b!380133) (not b!380130) (not start!37380) b_and!15777 (not b!380139) (not b_next!8521) (not b!380135) (not mapNonEmpty!15318) (not b!380128) (not b!380140) (not b!380129) (not b!380136) (not b!380127) tp_is_empty!9169)
(check-sat b_and!15777 (not b_next!8521))
