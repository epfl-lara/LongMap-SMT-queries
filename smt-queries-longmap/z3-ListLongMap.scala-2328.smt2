; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37416 () Bool)

(assert start!37416)

(declare-fun b_free!8557 () Bool)

(declare-fun b_next!8557 () Bool)

(assert (=> start!37416 (= b_free!8557 (not b_next!8557))))

(declare-fun tp!30387 () Bool)

(declare-fun b_and!15773 () Bool)

(assert (=> start!37416 (= tp!30387 b_and!15773)))

(declare-fun b!380703 () Bool)

(declare-fun res!216254 () Bool)

(declare-fun e!231500 () Bool)

(assert (=> b!380703 (=> (not res!216254) (not e!231500))))

(declare-datatypes ((array!22307 0))(
  ( (array!22308 (arr!10622 (Array (_ BitVec 32) (_ BitVec 64))) (size!10975 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22307)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380703 (= res!216254 (or (= (select (arr!10622 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10622 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380704 () Bool)

(declare-fun res!216250 () Bool)

(assert (=> b!380704 (=> (not res!216250) (not e!231500))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380704 (= res!216250 (validKeyInArray!0 k0!778))))

(declare-fun b!380705 () Bool)

(declare-fun res!216253 () Bool)

(assert (=> b!380705 (=> (not res!216253) (not e!231500))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22307 (_ BitVec 32)) Bool)

(assert (=> b!380705 (= res!216253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380706 () Bool)

(declare-fun res!216244 () Bool)

(assert (=> b!380706 (=> (not res!216244) (not e!231500))))

(assert (=> b!380706 (= res!216244 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10975 _keys!658))))))

(declare-fun res!216249 () Bool)

(assert (=> start!37416 (=> (not res!216249) (not e!231500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37416 (= res!216249 (validMask!0 mask!970))))

(assert (=> start!37416 e!231500))

(declare-datatypes ((V!13379 0))(
  ( (V!13380 (val!4647 Int)) )
))
(declare-datatypes ((ValueCell!4259 0))(
  ( (ValueCellFull!4259 (v!6838 V!13379)) (EmptyCell!4259) )
))
(declare-datatypes ((array!22309 0))(
  ( (array!22310 (arr!10623 (Array (_ BitVec 32) ValueCell!4259)) (size!10976 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22309)

(declare-fun e!231497 () Bool)

(declare-fun array_inv!7822 (array!22309) Bool)

(assert (=> start!37416 (and (array_inv!7822 _values!506) e!231497)))

(assert (=> start!37416 tp!30387))

(assert (=> start!37416 true))

(declare-fun tp_is_empty!9205 () Bool)

(assert (=> start!37416 tp_is_empty!9205))

(declare-fun array_inv!7823 (array!22307) Bool)

(assert (=> start!37416 (array_inv!7823 _keys!658)))

(declare-fun mapIsEmpty!15372 () Bool)

(declare-fun mapRes!15372 () Bool)

(assert (=> mapIsEmpty!15372 mapRes!15372))

(declare-fun b!380707 () Bool)

(declare-fun e!231498 () Bool)

(declare-fun e!231499 () Bool)

(assert (=> b!380707 (= e!231498 (not e!231499))))

(declare-fun res!216246 () Bool)

(assert (=> b!380707 (=> res!216246 e!231499)))

(declare-fun lt!178250 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380707 (= res!216246 (or (and (not lt!178250) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178250) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178250)))))

(assert (=> b!380707 (= lt!178250 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6206 0))(
  ( (tuple2!6207 (_1!3114 (_ BitVec 64)) (_2!3114 V!13379)) )
))
(declare-datatypes ((List!6035 0))(
  ( (Nil!6032) (Cons!6031 (h!6887 tuple2!6206) (t!11176 List!6035)) )
))
(declare-datatypes ((ListLongMap!5109 0))(
  ( (ListLongMap!5110 (toList!2570 List!6035)) )
))
(declare-fun lt!178253 () ListLongMap!5109)

(declare-fun zeroValue!472 () V!13379)

(declare-fun minValue!472 () V!13379)

(declare-fun getCurrentListMap!1963 (array!22307 array!22309 (_ BitVec 32) (_ BitVec 32) V!13379 V!13379 (_ BitVec 32) Int) ListLongMap!5109)

(assert (=> b!380707 (= lt!178253 (getCurrentListMap!1963 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178246 () ListLongMap!5109)

(declare-fun lt!178248 () array!22307)

(declare-fun lt!178249 () array!22309)

(assert (=> b!380707 (= lt!178246 (getCurrentListMap!1963 lt!178248 lt!178249 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178254 () ListLongMap!5109)

(declare-fun lt!178252 () ListLongMap!5109)

(assert (=> b!380707 (and (= lt!178254 lt!178252) (= lt!178252 lt!178254))))

(declare-fun v!373 () V!13379)

(declare-fun lt!178251 () ListLongMap!5109)

(declare-fun +!937 (ListLongMap!5109 tuple2!6206) ListLongMap!5109)

(assert (=> b!380707 (= lt!178252 (+!937 lt!178251 (tuple2!6207 k0!778 v!373)))))

(declare-datatypes ((Unit!11732 0))(
  ( (Unit!11733) )
))
(declare-fun lt!178247 () Unit!11732)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!156 (array!22307 array!22309 (_ BitVec 32) (_ BitVec 32) V!13379 V!13379 (_ BitVec 32) (_ BitVec 64) V!13379 (_ BitVec 32) Int) Unit!11732)

(assert (=> b!380707 (= lt!178247 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!156 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!828 (array!22307 array!22309 (_ BitVec 32) (_ BitVec 32) V!13379 V!13379 (_ BitVec 32) Int) ListLongMap!5109)

(assert (=> b!380707 (= lt!178254 (getCurrentListMapNoExtraKeys!828 lt!178248 lt!178249 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380707 (= lt!178249 (array!22310 (store (arr!10623 _values!506) i!548 (ValueCellFull!4259 v!373)) (size!10976 _values!506)))))

(assert (=> b!380707 (= lt!178251 (getCurrentListMapNoExtraKeys!828 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380708 () Bool)

(declare-fun e!231496 () Bool)

(assert (=> b!380708 (= e!231497 (and e!231496 mapRes!15372))))

(declare-fun condMapEmpty!15372 () Bool)

(declare-fun mapDefault!15372 () ValueCell!4259)

(assert (=> b!380708 (= condMapEmpty!15372 (= (arr!10623 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4259)) mapDefault!15372)))))

(declare-fun b!380709 () Bool)

(declare-fun res!216251 () Bool)

(assert (=> b!380709 (=> (not res!216251) (not e!231498))))

(declare-datatypes ((List!6036 0))(
  ( (Nil!6033) (Cons!6032 (h!6888 (_ BitVec 64)) (t!11177 List!6036)) )
))
(declare-fun arrayNoDuplicates!0 (array!22307 (_ BitVec 32) List!6036) Bool)

(assert (=> b!380709 (= res!216251 (arrayNoDuplicates!0 lt!178248 #b00000000000000000000000000000000 Nil!6033))))

(declare-fun b!380710 () Bool)

(declare-fun res!216252 () Bool)

(assert (=> b!380710 (=> (not res!216252) (not e!231500))))

(assert (=> b!380710 (= res!216252 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6033))))

(declare-fun mapNonEmpty!15372 () Bool)

(declare-fun tp!30386 () Bool)

(declare-fun e!231494 () Bool)

(assert (=> mapNonEmpty!15372 (= mapRes!15372 (and tp!30386 e!231494))))

(declare-fun mapRest!15372 () (Array (_ BitVec 32) ValueCell!4259))

(declare-fun mapKey!15372 () (_ BitVec 32))

(declare-fun mapValue!15372 () ValueCell!4259)

(assert (=> mapNonEmpty!15372 (= (arr!10623 _values!506) (store mapRest!15372 mapKey!15372 mapValue!15372))))

(declare-fun b!380711 () Bool)

(assert (=> b!380711 (= e!231494 tp_is_empty!9205)))

(declare-fun b!380712 () Bool)

(assert (=> b!380712 (= e!231499 true)))

(assert (=> b!380712 (= lt!178246 lt!178254)))

(declare-fun b!380713 () Bool)

(assert (=> b!380713 (= e!231496 tp_is_empty!9205)))

(declare-fun b!380714 () Bool)

(assert (=> b!380714 (= e!231500 e!231498)))

(declare-fun res!216248 () Bool)

(assert (=> b!380714 (=> (not res!216248) (not e!231498))))

(assert (=> b!380714 (= res!216248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178248 mask!970))))

(assert (=> b!380714 (= lt!178248 (array!22308 (store (arr!10622 _keys!658) i!548 k0!778) (size!10975 _keys!658)))))

(declare-fun b!380715 () Bool)

(declare-fun res!216247 () Bool)

(assert (=> b!380715 (=> (not res!216247) (not e!231500))))

(assert (=> b!380715 (= res!216247 (and (= (size!10976 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10975 _keys!658) (size!10976 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380716 () Bool)

(declare-fun res!216245 () Bool)

(assert (=> b!380716 (=> (not res!216245) (not e!231500))))

(declare-fun arrayContainsKey!0 (array!22307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380716 (= res!216245 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37416 res!216249) b!380715))

(assert (= (and b!380715 res!216247) b!380705))

(assert (= (and b!380705 res!216253) b!380710))

(assert (= (and b!380710 res!216252) b!380706))

(assert (= (and b!380706 res!216244) b!380704))

(assert (= (and b!380704 res!216250) b!380703))

(assert (= (and b!380703 res!216254) b!380716))

(assert (= (and b!380716 res!216245) b!380714))

(assert (= (and b!380714 res!216248) b!380709))

(assert (= (and b!380709 res!216251) b!380707))

(assert (= (and b!380707 (not res!216246)) b!380712))

(assert (= (and b!380708 condMapEmpty!15372) mapIsEmpty!15372))

(assert (= (and b!380708 (not condMapEmpty!15372)) mapNonEmpty!15372))

(get-info :version)

(assert (= (and mapNonEmpty!15372 ((_ is ValueCellFull!4259) mapValue!15372)) b!380711))

(assert (= (and b!380708 ((_ is ValueCellFull!4259) mapDefault!15372)) b!380713))

(assert (= start!37416 b!380708))

(declare-fun m!377213 () Bool)

(assert (=> start!37416 m!377213))

(declare-fun m!377215 () Bool)

(assert (=> start!37416 m!377215))

(declare-fun m!377217 () Bool)

(assert (=> start!37416 m!377217))

(declare-fun m!377219 () Bool)

(assert (=> b!380714 m!377219))

(declare-fun m!377221 () Bool)

(assert (=> b!380714 m!377221))

(declare-fun m!377223 () Bool)

(assert (=> b!380707 m!377223))

(declare-fun m!377225 () Bool)

(assert (=> b!380707 m!377225))

(declare-fun m!377227 () Bool)

(assert (=> b!380707 m!377227))

(declare-fun m!377229 () Bool)

(assert (=> b!380707 m!377229))

(declare-fun m!377231 () Bool)

(assert (=> b!380707 m!377231))

(declare-fun m!377233 () Bool)

(assert (=> b!380707 m!377233))

(declare-fun m!377235 () Bool)

(assert (=> b!380707 m!377235))

(declare-fun m!377237 () Bool)

(assert (=> b!380705 m!377237))

(declare-fun m!377239 () Bool)

(assert (=> b!380704 m!377239))

(declare-fun m!377241 () Bool)

(assert (=> b!380709 m!377241))

(declare-fun m!377243 () Bool)

(assert (=> b!380710 m!377243))

(declare-fun m!377245 () Bool)

(assert (=> b!380716 m!377245))

(declare-fun m!377247 () Bool)

(assert (=> mapNonEmpty!15372 m!377247))

(declare-fun m!377249 () Bool)

(assert (=> b!380703 m!377249))

(check-sat (not start!37416) (not b!380705) (not b_next!8557) tp_is_empty!9205 (not b!380710) (not b!380704) (not b!380714) b_and!15773 (not b!380707) (not b!380709) (not b!380716) (not mapNonEmpty!15372))
(check-sat b_and!15773 (not b_next!8557))
