; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37474 () Bool)

(assert start!37474)

(declare-fun b_free!8601 () Bool)

(declare-fun b_next!8601 () Bool)

(assert (=> start!37474 (= b_free!8601 (not b_next!8601))))

(declare-fun tp!30518 () Bool)

(declare-fun b_and!15843 () Bool)

(assert (=> start!37474 (= tp!30518 b_and!15843)))

(declare-fun b!381898 () Bool)

(declare-fun e!232134 () Bool)

(declare-fun e!232132 () Bool)

(declare-fun mapRes!15438 () Bool)

(assert (=> b!381898 (= e!232134 (and e!232132 mapRes!15438))))

(declare-fun condMapEmpty!15438 () Bool)

(declare-datatypes ((V!13437 0))(
  ( (V!13438 (val!4669 Int)) )
))
(declare-datatypes ((ValueCell!4281 0))(
  ( (ValueCellFull!4281 (v!6866 V!13437)) (EmptyCell!4281) )
))
(declare-datatypes ((array!22411 0))(
  ( (array!22412 (arr!10674 (Array (_ BitVec 32) ValueCell!4281)) (size!11026 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22411)

(declare-fun mapDefault!15438 () ValueCell!4281)

(assert (=> b!381898 (= condMapEmpty!15438 (= (arr!10674 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4281)) mapDefault!15438)))))

(declare-fun b!381899 () Bool)

(declare-fun res!217105 () Bool)

(declare-fun e!232130 () Bool)

(assert (=> b!381899 (=> (not res!217105) (not e!232130))))

(declare-datatypes ((array!22413 0))(
  ( (array!22414 (arr!10675 (Array (_ BitVec 32) (_ BitVec 64))) (size!11027 (_ BitVec 32))) )
))
(declare-fun lt!179075 () array!22413)

(declare-datatypes ((List!6106 0))(
  ( (Nil!6103) (Cons!6102 (h!6958 (_ BitVec 64)) (t!11256 List!6106)) )
))
(declare-fun arrayNoDuplicates!0 (array!22413 (_ BitVec 32) List!6106) Bool)

(assert (=> b!381899 (= res!217105 (arrayNoDuplicates!0 lt!179075 #b00000000000000000000000000000000 Nil!6103))))

(declare-fun b!381901 () Bool)

(declare-fun res!217104 () Bool)

(declare-fun e!232135 () Bool)

(assert (=> b!381901 (=> (not res!217104) (not e!232135))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!22413)

(assert (=> b!381901 (= res!217104 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11027 _keys!658))))))

(declare-fun b!381902 () Bool)

(declare-fun e!232131 () Bool)

(declare-fun tp_is_empty!9249 () Bool)

(assert (=> b!381902 (= e!232131 tp_is_empty!9249)))

(declare-fun b!381903 () Bool)

(declare-fun res!217106 () Bool)

(assert (=> b!381903 (=> (not res!217106) (not e!232135))))

(assert (=> b!381903 (= res!217106 (or (= (select (arr!10675 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10675 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381904 () Bool)

(declare-fun res!217100 () Bool)

(assert (=> b!381904 (=> (not res!217100) (not e!232135))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22413 (_ BitVec 32)) Bool)

(assert (=> b!381904 (= res!217100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381905 () Bool)

(declare-fun res!217099 () Bool)

(assert (=> b!381905 (=> (not res!217099) (not e!232135))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381905 (= res!217099 (and (= (size!11026 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11027 _keys!658) (size!11026 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381906 () Bool)

(assert (=> b!381906 (= e!232132 tp_is_empty!9249)))

(declare-fun b!381907 () Bool)

(declare-fun e!232136 () Bool)

(assert (=> b!381907 (= e!232130 (not e!232136))))

(declare-fun res!217108 () Bool)

(assert (=> b!381907 (=> res!217108 e!232136)))

(declare-fun lt!179078 () Bool)

(assert (=> b!381907 (= res!217108 (or (and (not lt!179078) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179078) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179078)))))

(assert (=> b!381907 (= lt!179078 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6276 0))(
  ( (tuple2!6277 (_1!3149 (_ BitVec 64)) (_2!3149 V!13437)) )
))
(declare-datatypes ((List!6107 0))(
  ( (Nil!6104) (Cons!6103 (h!6959 tuple2!6276) (t!11257 List!6107)) )
))
(declare-datatypes ((ListLongMap!5189 0))(
  ( (ListLongMap!5190 (toList!2610 List!6107)) )
))
(declare-fun lt!179077 () ListLongMap!5189)

(declare-fun zeroValue!472 () V!13437)

(declare-fun minValue!472 () V!13437)

(declare-fun getCurrentListMap!2017 (array!22413 array!22411 (_ BitVec 32) (_ BitVec 32) V!13437 V!13437 (_ BitVec 32) Int) ListLongMap!5189)

(assert (=> b!381907 (= lt!179077 (getCurrentListMap!2017 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179076 () array!22411)

(declare-fun lt!179079 () ListLongMap!5189)

(assert (=> b!381907 (= lt!179079 (getCurrentListMap!2017 lt!179075 lt!179076 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179081 () ListLongMap!5189)

(declare-fun lt!179082 () ListLongMap!5189)

(assert (=> b!381907 (and (= lt!179081 lt!179082) (= lt!179082 lt!179081))))

(declare-fun v!373 () V!13437)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!179074 () ListLongMap!5189)

(declare-fun +!947 (ListLongMap!5189 tuple2!6276) ListLongMap!5189)

(assert (=> b!381907 (= lt!179082 (+!947 lt!179074 (tuple2!6277 k0!778 v!373)))))

(declare-datatypes ((Unit!11788 0))(
  ( (Unit!11789) )
))
(declare-fun lt!179080 () Unit!11788)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!175 (array!22413 array!22411 (_ BitVec 32) (_ BitVec 32) V!13437 V!13437 (_ BitVec 32) (_ BitVec 64) V!13437 (_ BitVec 32) Int) Unit!11788)

(assert (=> b!381907 (= lt!179080 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!175 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!851 (array!22413 array!22411 (_ BitVec 32) (_ BitVec 32) V!13437 V!13437 (_ BitVec 32) Int) ListLongMap!5189)

(assert (=> b!381907 (= lt!179081 (getCurrentListMapNoExtraKeys!851 lt!179075 lt!179076 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381907 (= lt!179076 (array!22412 (store (arr!10674 _values!506) i!548 (ValueCellFull!4281 v!373)) (size!11026 _values!506)))))

(assert (=> b!381907 (= lt!179074 (getCurrentListMapNoExtraKeys!851 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381908 () Bool)

(assert (=> b!381908 (= e!232135 e!232130)))

(declare-fun res!217101 () Bool)

(assert (=> b!381908 (=> (not res!217101) (not e!232130))))

(assert (=> b!381908 (= res!217101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179075 mask!970))))

(assert (=> b!381908 (= lt!179075 (array!22414 (store (arr!10675 _keys!658) i!548 k0!778) (size!11027 _keys!658)))))

(declare-fun b!381909 () Bool)

(declare-fun res!217109 () Bool)

(assert (=> b!381909 (=> (not res!217109) (not e!232135))))

(assert (=> b!381909 (= res!217109 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6103))))

(declare-fun b!381910 () Bool)

(declare-fun res!217103 () Bool)

(assert (=> b!381910 (=> (not res!217103) (not e!232135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381910 (= res!217103 (validKeyInArray!0 k0!778))))

(declare-fun b!381911 () Bool)

(declare-fun res!217107 () Bool)

(assert (=> b!381911 (=> (not res!217107) (not e!232135))))

(declare-fun arrayContainsKey!0 (array!22413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381911 (= res!217107 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15438 () Bool)

(assert (=> mapIsEmpty!15438 mapRes!15438))

(declare-fun mapNonEmpty!15438 () Bool)

(declare-fun tp!30519 () Bool)

(assert (=> mapNonEmpty!15438 (= mapRes!15438 (and tp!30519 e!232131))))

(declare-fun mapRest!15438 () (Array (_ BitVec 32) ValueCell!4281))

(declare-fun mapValue!15438 () ValueCell!4281)

(declare-fun mapKey!15438 () (_ BitVec 32))

(assert (=> mapNonEmpty!15438 (= (arr!10674 _values!506) (store mapRest!15438 mapKey!15438 mapValue!15438))))

(declare-fun res!217102 () Bool)

(assert (=> start!37474 (=> (not res!217102) (not e!232135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37474 (= res!217102 (validMask!0 mask!970))))

(assert (=> start!37474 e!232135))

(declare-fun array_inv!7860 (array!22411) Bool)

(assert (=> start!37474 (and (array_inv!7860 _values!506) e!232134)))

(assert (=> start!37474 tp!30518))

(assert (=> start!37474 true))

(assert (=> start!37474 tp_is_empty!9249))

(declare-fun array_inv!7861 (array!22413) Bool)

(assert (=> start!37474 (array_inv!7861 _keys!658)))

(declare-fun b!381900 () Bool)

(assert (=> b!381900 (= e!232136 (bvsle #b00000000000000000000000000000000 (size!11027 _keys!658)))))

(assert (=> b!381900 (= lt!179079 lt!179081)))

(assert (= (and start!37474 res!217102) b!381905))

(assert (= (and b!381905 res!217099) b!381904))

(assert (= (and b!381904 res!217100) b!381909))

(assert (= (and b!381909 res!217109) b!381901))

(assert (= (and b!381901 res!217104) b!381910))

(assert (= (and b!381910 res!217103) b!381903))

(assert (= (and b!381903 res!217106) b!381911))

(assert (= (and b!381911 res!217107) b!381908))

(assert (= (and b!381908 res!217101) b!381899))

(assert (= (and b!381899 res!217105) b!381907))

(assert (= (and b!381907 (not res!217108)) b!381900))

(assert (= (and b!381898 condMapEmpty!15438) mapIsEmpty!15438))

(assert (= (and b!381898 (not condMapEmpty!15438)) mapNonEmpty!15438))

(get-info :version)

(assert (= (and mapNonEmpty!15438 ((_ is ValueCellFull!4281) mapValue!15438)) b!381902))

(assert (= (and b!381898 ((_ is ValueCellFull!4281) mapDefault!15438)) b!381906))

(assert (= start!37474 b!381898))

(declare-fun m!378773 () Bool)

(assert (=> start!37474 m!378773))

(declare-fun m!378775 () Bool)

(assert (=> start!37474 m!378775))

(declare-fun m!378777 () Bool)

(assert (=> start!37474 m!378777))

(declare-fun m!378779 () Bool)

(assert (=> b!381904 m!378779))

(declare-fun m!378781 () Bool)

(assert (=> b!381910 m!378781))

(declare-fun m!378783 () Bool)

(assert (=> b!381909 m!378783))

(declare-fun m!378785 () Bool)

(assert (=> b!381907 m!378785))

(declare-fun m!378787 () Bool)

(assert (=> b!381907 m!378787))

(declare-fun m!378789 () Bool)

(assert (=> b!381907 m!378789))

(declare-fun m!378791 () Bool)

(assert (=> b!381907 m!378791))

(declare-fun m!378793 () Bool)

(assert (=> b!381907 m!378793))

(declare-fun m!378795 () Bool)

(assert (=> b!381907 m!378795))

(declare-fun m!378797 () Bool)

(assert (=> b!381907 m!378797))

(declare-fun m!378799 () Bool)

(assert (=> mapNonEmpty!15438 m!378799))

(declare-fun m!378801 () Bool)

(assert (=> b!381899 m!378801))

(declare-fun m!378803 () Bool)

(assert (=> b!381911 m!378803))

(declare-fun m!378805 () Bool)

(assert (=> b!381908 m!378805))

(declare-fun m!378807 () Bool)

(assert (=> b!381908 m!378807))

(declare-fun m!378809 () Bool)

(assert (=> b!381903 m!378809))

(check-sat (not b!381904) tp_is_empty!9249 (not b!381910) (not mapNonEmpty!15438) (not start!37474) (not b!381899) (not b_next!8601) (not b!381909) (not b!381908) (not b!381911) (not b!381907) b_and!15843)
(check-sat b_and!15843 (not b_next!8601))
