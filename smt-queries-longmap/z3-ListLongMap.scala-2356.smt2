; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37600 () Bool)

(assert start!37600)

(declare-fun b_free!8727 () Bool)

(declare-fun b_next!8727 () Bool)

(assert (=> start!37600 (= b_free!8727 (not b_next!8727))))

(declare-fun tp!30896 () Bool)

(declare-fun b_and!15969 () Bool)

(assert (=> start!37600 (= tp!30896 b_and!15969)))

(declare-fun b!384553 () Bool)

(declare-fun res!219193 () Bool)

(declare-fun e!233468 () Bool)

(assert (=> b!384553 (=> (not res!219193) (not e!233468))))

(declare-datatypes ((array!22653 0))(
  ( (array!22654 (arr!10795 (Array (_ BitVec 32) (_ BitVec 64))) (size!11147 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22653)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384553 (= res!219193 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384555 () Bool)

(declare-fun e!233465 () Bool)

(declare-fun e!233463 () Bool)

(declare-fun mapRes!15627 () Bool)

(assert (=> b!384555 (= e!233465 (and e!233463 mapRes!15627))))

(declare-fun condMapEmpty!15627 () Bool)

(declare-datatypes ((V!13605 0))(
  ( (V!13606 (val!4732 Int)) )
))
(declare-datatypes ((ValueCell!4344 0))(
  ( (ValueCellFull!4344 (v!6929 V!13605)) (EmptyCell!4344) )
))
(declare-datatypes ((array!22655 0))(
  ( (array!22656 (arr!10796 (Array (_ BitVec 32) ValueCell!4344)) (size!11148 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22655)

(declare-fun mapDefault!15627 () ValueCell!4344)

(assert (=> b!384555 (= condMapEmpty!15627 (= (arr!10796 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4344)) mapDefault!15627)))))

(declare-fun b!384556 () Bool)

(declare-fun res!219190 () Bool)

(assert (=> b!384556 (=> (not res!219190) (not e!233468))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22653 (_ BitVec 32)) Bool)

(assert (=> b!384556 (= res!219190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384557 () Bool)

(declare-fun res!219189 () Bool)

(assert (=> b!384557 (=> (not res!219189) (not e!233468))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384557 (= res!219189 (or (= (select (arr!10795 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10795 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384558 () Bool)

(declare-fun res!219187 () Bool)

(assert (=> b!384558 (=> (not res!219187) (not e!233468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384558 (= res!219187 (validKeyInArray!0 k0!778))))

(declare-fun b!384559 () Bool)

(declare-fun res!219194 () Bool)

(assert (=> b!384559 (=> (not res!219194) (not e!233468))))

(assert (=> b!384559 (= res!219194 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11147 _keys!658))))))

(declare-fun b!384560 () Bool)

(declare-fun tp_is_empty!9375 () Bool)

(assert (=> b!384560 (= e!233463 tp_is_empty!9375)))

(declare-fun mapIsEmpty!15627 () Bool)

(assert (=> mapIsEmpty!15627 mapRes!15627))

(declare-fun b!384561 () Bool)

(declare-fun res!219195 () Bool)

(assert (=> b!384561 (=> (not res!219195) (not e!233468))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384561 (= res!219195 (and (= (size!11148 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11147 _keys!658) (size!11148 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384554 () Bool)

(declare-fun e!233467 () Bool)

(assert (=> b!384554 (= e!233467 true)))

(declare-datatypes ((tuple2!6372 0))(
  ( (tuple2!6373 (_1!3197 (_ BitVec 64)) (_2!3197 V!13605)) )
))
(declare-datatypes ((List!6207 0))(
  ( (Nil!6204) (Cons!6203 (h!7059 tuple2!6372) (t!11357 List!6207)) )
))
(declare-datatypes ((ListLongMap!5285 0))(
  ( (ListLongMap!5286 (toList!2658 List!6207)) )
))
(declare-fun lt!180979 () ListLongMap!5285)

(declare-fun lt!180975 () ListLongMap!5285)

(declare-fun lt!180974 () tuple2!6372)

(declare-fun +!993 (ListLongMap!5285 tuple2!6372) ListLongMap!5285)

(assert (=> b!384554 (= lt!180979 (+!993 lt!180975 lt!180974))))

(declare-fun lt!180978 () ListLongMap!5285)

(declare-fun lt!180980 () ListLongMap!5285)

(assert (=> b!384554 (= lt!180978 lt!180980)))

(declare-fun res!219191 () Bool)

(assert (=> start!37600 (=> (not res!219191) (not e!233468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37600 (= res!219191 (validMask!0 mask!970))))

(assert (=> start!37600 e!233468))

(declare-fun array_inv!7948 (array!22655) Bool)

(assert (=> start!37600 (and (array_inv!7948 _values!506) e!233465)))

(assert (=> start!37600 tp!30896))

(assert (=> start!37600 true))

(assert (=> start!37600 tp_is_empty!9375))

(declare-fun array_inv!7949 (array!22653) Bool)

(assert (=> start!37600 (array_inv!7949 _keys!658)))

(declare-fun b!384562 () Bool)

(declare-fun res!219192 () Bool)

(assert (=> b!384562 (=> (not res!219192) (not e!233468))))

(declare-datatypes ((List!6208 0))(
  ( (Nil!6205) (Cons!6204 (h!7060 (_ BitVec 64)) (t!11358 List!6208)) )
))
(declare-fun arrayNoDuplicates!0 (array!22653 (_ BitVec 32) List!6208) Bool)

(assert (=> b!384562 (= res!219192 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6205))))

(declare-fun b!384563 () Bool)

(declare-fun res!219188 () Bool)

(declare-fun e!233464 () Bool)

(assert (=> b!384563 (=> (not res!219188) (not e!233464))))

(declare-fun lt!180976 () array!22653)

(assert (=> b!384563 (= res!219188 (arrayNoDuplicates!0 lt!180976 #b00000000000000000000000000000000 Nil!6205))))

(declare-fun b!384564 () Bool)

(assert (=> b!384564 (= e!233468 e!233464)))

(declare-fun res!219196 () Bool)

(assert (=> b!384564 (=> (not res!219196) (not e!233464))))

(assert (=> b!384564 (= res!219196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180976 mask!970))))

(assert (=> b!384564 (= lt!180976 (array!22654 (store (arr!10795 _keys!658) i!548 k0!778) (size!11147 _keys!658)))))

(declare-fun mapNonEmpty!15627 () Bool)

(declare-fun tp!30897 () Bool)

(declare-fun e!233462 () Bool)

(assert (=> mapNonEmpty!15627 (= mapRes!15627 (and tp!30897 e!233462))))

(declare-fun mapValue!15627 () ValueCell!4344)

(declare-fun mapKey!15627 () (_ BitVec 32))

(declare-fun mapRest!15627 () (Array (_ BitVec 32) ValueCell!4344))

(assert (=> mapNonEmpty!15627 (= (arr!10796 _values!506) (store mapRest!15627 mapKey!15627 mapValue!15627))))

(declare-fun b!384565 () Bool)

(assert (=> b!384565 (= e!233464 (not e!233467))))

(declare-fun res!219197 () Bool)

(assert (=> b!384565 (=> res!219197 e!233467)))

(declare-fun lt!180981 () Bool)

(assert (=> b!384565 (= res!219197 (or (and (not lt!180981) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180981) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180981)))))

(assert (=> b!384565 (= lt!180981 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13605)

(declare-fun minValue!472 () V!13605)

(declare-fun getCurrentListMap!2057 (array!22653 array!22655 (_ BitVec 32) (_ BitVec 32) V!13605 V!13605 (_ BitVec 32) Int) ListLongMap!5285)

(assert (=> b!384565 (= lt!180975 (getCurrentListMap!2057 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180982 () array!22655)

(assert (=> b!384565 (= lt!180978 (getCurrentListMap!2057 lt!180976 lt!180982 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180984 () ListLongMap!5285)

(assert (=> b!384565 (and (= lt!180980 lt!180984) (= lt!180984 lt!180980))))

(declare-fun lt!180983 () ListLongMap!5285)

(assert (=> b!384565 (= lt!180984 (+!993 lt!180983 lt!180974))))

(declare-fun v!373 () V!13605)

(assert (=> b!384565 (= lt!180974 (tuple2!6373 k0!778 v!373))))

(declare-datatypes ((Unit!11868 0))(
  ( (Unit!11869) )
))
(declare-fun lt!180977 () Unit!11868)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!215 (array!22653 array!22655 (_ BitVec 32) (_ BitVec 32) V!13605 V!13605 (_ BitVec 32) (_ BitVec 64) V!13605 (_ BitVec 32) Int) Unit!11868)

(assert (=> b!384565 (= lt!180977 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!215 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!891 (array!22653 array!22655 (_ BitVec 32) (_ BitVec 32) V!13605 V!13605 (_ BitVec 32) Int) ListLongMap!5285)

(assert (=> b!384565 (= lt!180980 (getCurrentListMapNoExtraKeys!891 lt!180976 lt!180982 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384565 (= lt!180982 (array!22656 (store (arr!10796 _values!506) i!548 (ValueCellFull!4344 v!373)) (size!11148 _values!506)))))

(assert (=> b!384565 (= lt!180983 (getCurrentListMapNoExtraKeys!891 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384566 () Bool)

(assert (=> b!384566 (= e!233462 tp_is_empty!9375)))

(assert (= (and start!37600 res!219191) b!384561))

(assert (= (and b!384561 res!219195) b!384556))

(assert (= (and b!384556 res!219190) b!384562))

(assert (= (and b!384562 res!219192) b!384559))

(assert (= (and b!384559 res!219194) b!384558))

(assert (= (and b!384558 res!219187) b!384557))

(assert (= (and b!384557 res!219189) b!384553))

(assert (= (and b!384553 res!219193) b!384564))

(assert (= (and b!384564 res!219196) b!384563))

(assert (= (and b!384563 res!219188) b!384565))

(assert (= (and b!384565 (not res!219197)) b!384554))

(assert (= (and b!384555 condMapEmpty!15627) mapIsEmpty!15627))

(assert (= (and b!384555 (not condMapEmpty!15627)) mapNonEmpty!15627))

(get-info :version)

(assert (= (and mapNonEmpty!15627 ((_ is ValueCellFull!4344) mapValue!15627)) b!384566))

(assert (= (and b!384555 ((_ is ValueCellFull!4344) mapDefault!15627)) b!384560))

(assert (= start!37600 b!384555))

(declare-fun m!381235 () Bool)

(assert (=> b!384562 m!381235))

(declare-fun m!381237 () Bool)

(assert (=> b!384553 m!381237))

(declare-fun m!381239 () Bool)

(assert (=> b!384558 m!381239))

(declare-fun m!381241 () Bool)

(assert (=> b!384556 m!381241))

(declare-fun m!381243 () Bool)

(assert (=> b!384565 m!381243))

(declare-fun m!381245 () Bool)

(assert (=> b!384565 m!381245))

(declare-fun m!381247 () Bool)

(assert (=> b!384565 m!381247))

(declare-fun m!381249 () Bool)

(assert (=> b!384565 m!381249))

(declare-fun m!381251 () Bool)

(assert (=> b!384565 m!381251))

(declare-fun m!381253 () Bool)

(assert (=> b!384565 m!381253))

(declare-fun m!381255 () Bool)

(assert (=> b!384565 m!381255))

(declare-fun m!381257 () Bool)

(assert (=> b!384563 m!381257))

(declare-fun m!381259 () Bool)

(assert (=> b!384557 m!381259))

(declare-fun m!381261 () Bool)

(assert (=> b!384554 m!381261))

(declare-fun m!381263 () Bool)

(assert (=> mapNonEmpty!15627 m!381263))

(declare-fun m!381265 () Bool)

(assert (=> start!37600 m!381265))

(declare-fun m!381267 () Bool)

(assert (=> start!37600 m!381267))

(declare-fun m!381269 () Bool)

(assert (=> start!37600 m!381269))

(declare-fun m!381271 () Bool)

(assert (=> b!384564 m!381271))

(declare-fun m!381273 () Bool)

(assert (=> b!384564 m!381273))

(check-sat (not b!384563) (not b_next!8727) (not start!37600) (not b!384558) (not b!384553) b_and!15969 (not b!384564) tp_is_empty!9375 (not b!384554) (not b!384556) (not b!384562) (not b!384565) (not mapNonEmpty!15627))
(check-sat b_and!15969 (not b_next!8727))
