; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37368 () Bool)

(assert start!37368)

(declare-fun b_free!8509 () Bool)

(declare-fun b_next!8509 () Bool)

(assert (=> start!37368 (= b_free!8509 (not b_next!8509))))

(declare-fun tp!30242 () Bool)

(declare-fun b_and!15765 () Bool)

(assert (=> start!37368 (= tp!30242 b_and!15765)))

(declare-fun b!379856 () Bool)

(declare-fun res!215518 () Bool)

(declare-fun e!231075 () Bool)

(assert (=> b!379856 (=> (not res!215518) (not e!231075))))

(declare-datatypes ((array!22220 0))(
  ( (array!22221 (arr!10578 (Array (_ BitVec 32) (_ BitVec 64))) (size!10930 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22220)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379856 (= res!215518 (or (= (select (arr!10578 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10578 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379857 () Bool)

(declare-fun res!215519 () Bool)

(assert (=> b!379857 (=> (not res!215519) (not e!231075))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379857 (= res!215519 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379858 () Bool)

(declare-fun e!231074 () Bool)

(declare-fun e!231077 () Bool)

(assert (=> b!379858 (= e!231074 e!231077)))

(declare-fun res!215522 () Bool)

(assert (=> b!379858 (=> res!215522 e!231077)))

(assert (=> b!379858 (= res!215522 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13315 0))(
  ( (V!13316 (val!4623 Int)) )
))
(declare-datatypes ((tuple2!6082 0))(
  ( (tuple2!6083 (_1!3052 (_ BitVec 64)) (_2!3052 V!13315)) )
))
(declare-datatypes ((List!5918 0))(
  ( (Nil!5915) (Cons!5914 (h!6770 tuple2!6082) (t!11060 List!5918)) )
))
(declare-datatypes ((ListLongMap!4997 0))(
  ( (ListLongMap!4998 (toList!2514 List!5918)) )
))
(declare-fun lt!177608 () ListLongMap!4997)

(declare-fun lt!177617 () ListLongMap!4997)

(assert (=> b!379858 (= lt!177608 lt!177617)))

(declare-fun lt!177607 () ListLongMap!4997)

(declare-fun lt!177611 () tuple2!6082)

(declare-fun +!910 (ListLongMap!4997 tuple2!6082) ListLongMap!4997)

(assert (=> b!379858 (= lt!177617 (+!910 lt!177607 lt!177611))))

(declare-fun lt!177610 () ListLongMap!4997)

(declare-fun lt!177614 () ListLongMap!4997)

(assert (=> b!379858 (= lt!177610 lt!177614)))

(declare-fun lt!177615 () ListLongMap!4997)

(assert (=> b!379858 (= lt!177614 (+!910 lt!177615 lt!177611))))

(declare-fun lt!177619 () ListLongMap!4997)

(assert (=> b!379858 (= lt!177610 (+!910 lt!177619 lt!177611))))

(declare-fun minValue!472 () V!13315)

(assert (=> b!379858 (= lt!177611 (tuple2!6083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379859 () Bool)

(declare-fun e!231076 () Bool)

(declare-fun tp_is_empty!9157 () Bool)

(assert (=> b!379859 (= e!231076 tp_is_empty!9157)))

(declare-fun b!379860 () Bool)

(declare-fun res!215526 () Bool)

(assert (=> b!379860 (=> (not res!215526) (not e!231075))))

(declare-datatypes ((List!5919 0))(
  ( (Nil!5916) (Cons!5915 (h!6771 (_ BitVec 64)) (t!11061 List!5919)) )
))
(declare-fun arrayNoDuplicates!0 (array!22220 (_ BitVec 32) List!5919) Bool)

(assert (=> b!379860 (= res!215526 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5916))))

(declare-fun b!379861 () Bool)

(declare-fun e!231073 () Bool)

(declare-fun e!231071 () Bool)

(declare-fun mapRes!15300 () Bool)

(assert (=> b!379861 (= e!231073 (and e!231071 mapRes!15300))))

(declare-fun condMapEmpty!15300 () Bool)

(declare-datatypes ((ValueCell!4235 0))(
  ( (ValueCellFull!4235 (v!6821 V!13315)) (EmptyCell!4235) )
))
(declare-datatypes ((array!22222 0))(
  ( (array!22223 (arr!10579 (Array (_ BitVec 32) ValueCell!4235)) (size!10931 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22222)

(declare-fun mapDefault!15300 () ValueCell!4235)

(assert (=> b!379861 (= condMapEmpty!15300 (= (arr!10579 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4235)) mapDefault!15300)))))

(declare-fun res!215520 () Bool)

(assert (=> start!37368 (=> (not res!215520) (not e!231075))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37368 (= res!215520 (validMask!0 mask!970))))

(assert (=> start!37368 e!231075))

(declare-fun array_inv!7836 (array!22222) Bool)

(assert (=> start!37368 (and (array_inv!7836 _values!506) e!231073)))

(assert (=> start!37368 tp!30242))

(assert (=> start!37368 true))

(assert (=> start!37368 tp_is_empty!9157))

(declare-fun array_inv!7837 (array!22220) Bool)

(assert (=> start!37368 (array_inv!7837 _keys!658)))

(declare-fun b!379862 () Bool)

(assert (=> b!379862 (= e!231071 tp_is_empty!9157)))

(declare-fun b!379863 () Bool)

(declare-fun res!215521 () Bool)

(assert (=> b!379863 (=> (not res!215521) (not e!231075))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379863 (= res!215521 (and (= (size!10931 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10930 _keys!658) (size!10931 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15300 () Bool)

(declare-fun tp!30243 () Bool)

(assert (=> mapNonEmpty!15300 (= mapRes!15300 (and tp!30243 e!231076))))

(declare-fun mapValue!15300 () ValueCell!4235)

(declare-fun mapRest!15300 () (Array (_ BitVec 32) ValueCell!4235))

(declare-fun mapKey!15300 () (_ BitVec 32))

(assert (=> mapNonEmpty!15300 (= (arr!10579 _values!506) (store mapRest!15300 mapKey!15300 mapValue!15300))))

(declare-fun b!379864 () Bool)

(declare-fun res!215525 () Bool)

(assert (=> b!379864 (=> (not res!215525) (not e!231075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379864 (= res!215525 (validKeyInArray!0 k0!778))))

(declare-fun b!379865 () Bool)

(declare-fun e!231072 () Bool)

(assert (=> b!379865 (= e!231072 (not e!231074))))

(declare-fun res!215527 () Bool)

(assert (=> b!379865 (=> res!215527 e!231074)))

(assert (=> b!379865 (= res!215527 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13315)

(declare-fun getCurrentListMap!1953 (array!22220 array!22222 (_ BitVec 32) (_ BitVec 32) V!13315 V!13315 (_ BitVec 32) Int) ListLongMap!4997)

(assert (=> b!379865 (= lt!177608 (getCurrentListMap!1953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177616 () array!22222)

(declare-fun lt!177609 () array!22220)

(assert (=> b!379865 (= lt!177610 (getCurrentListMap!1953 lt!177609 lt!177616 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379865 (and (= lt!177619 lt!177615) (= lt!177615 lt!177619))))

(declare-fun lt!177618 () tuple2!6082)

(assert (=> b!379865 (= lt!177615 (+!910 lt!177607 lt!177618))))

(declare-fun v!373 () V!13315)

(assert (=> b!379865 (= lt!177618 (tuple2!6083 k0!778 v!373))))

(declare-datatypes ((Unit!11701 0))(
  ( (Unit!11702) )
))
(declare-fun lt!177613 () Unit!11701)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!140 (array!22220 array!22222 (_ BitVec 32) (_ BitVec 32) V!13315 V!13315 (_ BitVec 32) (_ BitVec 64) V!13315 (_ BitVec 32) Int) Unit!11701)

(assert (=> b!379865 (= lt!177613 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!140 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!800 (array!22220 array!22222 (_ BitVec 32) (_ BitVec 32) V!13315 V!13315 (_ BitVec 32) Int) ListLongMap!4997)

(assert (=> b!379865 (= lt!177619 (getCurrentListMapNoExtraKeys!800 lt!177609 lt!177616 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379865 (= lt!177616 (array!22223 (store (arr!10579 _values!506) i!548 (ValueCellFull!4235 v!373)) (size!10931 _values!506)))))

(assert (=> b!379865 (= lt!177607 (getCurrentListMapNoExtraKeys!800 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379866 () Bool)

(assert (=> b!379866 (= e!231075 e!231072)))

(declare-fun res!215523 () Bool)

(assert (=> b!379866 (=> (not res!215523) (not e!231072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22220 (_ BitVec 32)) Bool)

(assert (=> b!379866 (= res!215523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177609 mask!970))))

(assert (=> b!379866 (= lt!177609 (array!22221 (store (arr!10578 _keys!658) i!548 k0!778) (size!10930 _keys!658)))))

(declare-fun mapIsEmpty!15300 () Bool)

(assert (=> mapIsEmpty!15300 mapRes!15300))

(declare-fun b!379867 () Bool)

(declare-fun res!215517 () Bool)

(assert (=> b!379867 (=> (not res!215517) (not e!231075))))

(assert (=> b!379867 (= res!215517 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10930 _keys!658))))))

(declare-fun b!379868 () Bool)

(assert (=> b!379868 (= e!231077 true)))

(assert (=> b!379868 (= lt!177614 (+!910 lt!177617 lt!177618))))

(declare-fun lt!177612 () Unit!11701)

(declare-fun addCommutativeForDiffKeys!321 (ListLongMap!4997 (_ BitVec 64) V!13315 (_ BitVec 64) V!13315) Unit!11701)

(assert (=> b!379868 (= lt!177612 (addCommutativeForDiffKeys!321 lt!177607 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379869 () Bool)

(declare-fun res!215524 () Bool)

(assert (=> b!379869 (=> (not res!215524) (not e!231075))))

(assert (=> b!379869 (= res!215524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379870 () Bool)

(declare-fun res!215528 () Bool)

(assert (=> b!379870 (=> (not res!215528) (not e!231072))))

(assert (=> b!379870 (= res!215528 (arrayNoDuplicates!0 lt!177609 #b00000000000000000000000000000000 Nil!5916))))

(assert (= (and start!37368 res!215520) b!379863))

(assert (= (and b!379863 res!215521) b!379869))

(assert (= (and b!379869 res!215524) b!379860))

(assert (= (and b!379860 res!215526) b!379867))

(assert (= (and b!379867 res!215517) b!379864))

(assert (= (and b!379864 res!215525) b!379856))

(assert (= (and b!379856 res!215518) b!379857))

(assert (= (and b!379857 res!215519) b!379866))

(assert (= (and b!379866 res!215523) b!379870))

(assert (= (and b!379870 res!215528) b!379865))

(assert (= (and b!379865 (not res!215527)) b!379858))

(assert (= (and b!379858 (not res!215522)) b!379868))

(assert (= (and b!379861 condMapEmpty!15300) mapIsEmpty!15300))

(assert (= (and b!379861 (not condMapEmpty!15300)) mapNonEmpty!15300))

(get-info :version)

(assert (= (and mapNonEmpty!15300 ((_ is ValueCellFull!4235) mapValue!15300)) b!379859))

(assert (= (and b!379861 ((_ is ValueCellFull!4235) mapDefault!15300)) b!379862))

(assert (= start!37368 b!379861))

(declare-fun m!377045 () Bool)

(assert (=> b!379870 m!377045))

(declare-fun m!377047 () Bool)

(assert (=> b!379856 m!377047))

(declare-fun m!377049 () Bool)

(assert (=> start!37368 m!377049))

(declare-fun m!377051 () Bool)

(assert (=> start!37368 m!377051))

(declare-fun m!377053 () Bool)

(assert (=> start!37368 m!377053))

(declare-fun m!377055 () Bool)

(assert (=> b!379866 m!377055))

(declare-fun m!377057 () Bool)

(assert (=> b!379866 m!377057))

(declare-fun m!377059 () Bool)

(assert (=> b!379858 m!377059))

(declare-fun m!377061 () Bool)

(assert (=> b!379858 m!377061))

(declare-fun m!377063 () Bool)

(assert (=> b!379858 m!377063))

(declare-fun m!377065 () Bool)

(assert (=> b!379864 m!377065))

(declare-fun m!377067 () Bool)

(assert (=> b!379857 m!377067))

(declare-fun m!377069 () Bool)

(assert (=> b!379869 m!377069))

(declare-fun m!377071 () Bool)

(assert (=> b!379860 m!377071))

(declare-fun m!377073 () Bool)

(assert (=> b!379868 m!377073))

(declare-fun m!377075 () Bool)

(assert (=> b!379868 m!377075))

(declare-fun m!377077 () Bool)

(assert (=> mapNonEmpty!15300 m!377077))

(declare-fun m!377079 () Bool)

(assert (=> b!379865 m!377079))

(declare-fun m!377081 () Bool)

(assert (=> b!379865 m!377081))

(declare-fun m!377083 () Bool)

(assert (=> b!379865 m!377083))

(declare-fun m!377085 () Bool)

(assert (=> b!379865 m!377085))

(declare-fun m!377087 () Bool)

(assert (=> b!379865 m!377087))

(declare-fun m!377089 () Bool)

(assert (=> b!379865 m!377089))

(declare-fun m!377091 () Bool)

(assert (=> b!379865 m!377091))

(check-sat (not b!379857) (not b!379865) tp_is_empty!9157 (not b!379858) b_and!15765 (not mapNonEmpty!15300) (not b!379870) (not b!379860) (not b!379868) (not b!379864) (not b!379866) (not start!37368) (not b_next!8509) (not b!379869))
(check-sat b_and!15765 (not b_next!8509))
