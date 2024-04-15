; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37356 () Bool)

(assert start!37356)

(declare-fun b_free!8497 () Bool)

(declare-fun b_next!8497 () Bool)

(assert (=> start!37356 (= b_free!8497 (not b_next!8497))))

(declare-fun tp!30207 () Bool)

(declare-fun b_and!15713 () Bool)

(assert (=> start!37356 (= tp!30207 b_and!15713)))

(declare-fun b!379364 () Bool)

(declare-fun res!215182 () Bool)

(declare-fun e!230789 () Bool)

(assert (=> b!379364 (=> (not res!215182) (not e!230789))))

(declare-datatypes ((array!22193 0))(
  ( (array!22194 (arr!10565 (Array (_ BitVec 32) (_ BitVec 64))) (size!10918 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22193)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379364 (= res!215182 (or (= (select (arr!10565 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10565 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379365 () Bool)

(declare-fun e!230792 () Bool)

(declare-fun tp_is_empty!9145 () Bool)

(assert (=> b!379365 (= e!230792 tp_is_empty!9145)))

(declare-fun b!379366 () Bool)

(declare-fun e!230785 () Bool)

(declare-fun e!230786 () Bool)

(assert (=> b!379366 (= e!230785 (not e!230786))))

(declare-fun res!215186 () Bool)

(assert (=> b!379366 (=> res!215186 e!230786)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379366 (= res!215186 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13299 0))(
  ( (V!13300 (val!4617 Int)) )
))
(declare-datatypes ((ValueCell!4229 0))(
  ( (ValueCellFull!4229 (v!6808 V!13299)) (EmptyCell!4229) )
))
(declare-datatypes ((array!22195 0))(
  ( (array!22196 (arr!10566 (Array (_ BitVec 32) ValueCell!4229)) (size!10919 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22195)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6154 0))(
  ( (tuple2!6155 (_1!3088 (_ BitVec 64)) (_2!3088 V!13299)) )
))
(declare-datatypes ((List!5983 0))(
  ( (Nil!5980) (Cons!5979 (h!6835 tuple2!6154) (t!11124 List!5983)) )
))
(declare-datatypes ((ListLongMap!5057 0))(
  ( (ListLongMap!5058 (toList!2544 List!5983)) )
))
(declare-fun lt!177122 () ListLongMap!5057)

(declare-fun zeroValue!472 () V!13299)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13299)

(declare-fun getCurrentListMap!1942 (array!22193 array!22195 (_ BitVec 32) (_ BitVec 32) V!13299 V!13299 (_ BitVec 32) Int) ListLongMap!5057)

(assert (=> b!379366 (= lt!177122 (getCurrentListMap!1942 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177120 () array!22193)

(declare-fun lt!177131 () ListLongMap!5057)

(declare-fun lt!177129 () array!22195)

(assert (=> b!379366 (= lt!177131 (getCurrentListMap!1942 lt!177120 lt!177129 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177127 () ListLongMap!5057)

(declare-fun lt!177126 () ListLongMap!5057)

(assert (=> b!379366 (and (= lt!177127 lt!177126) (= lt!177126 lt!177127))))

(declare-fun lt!177123 () ListLongMap!5057)

(declare-fun lt!177125 () tuple2!6154)

(declare-fun +!912 (ListLongMap!5057 tuple2!6154) ListLongMap!5057)

(assert (=> b!379366 (= lt!177126 (+!912 lt!177123 lt!177125))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13299)

(assert (=> b!379366 (= lt!177125 (tuple2!6155 k0!778 v!373))))

(declare-datatypes ((Unit!11684 0))(
  ( (Unit!11685) )
))
(declare-fun lt!177128 () Unit!11684)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!135 (array!22193 array!22195 (_ BitVec 32) (_ BitVec 32) V!13299 V!13299 (_ BitVec 32) (_ BitVec 64) V!13299 (_ BitVec 32) Int) Unit!11684)

(assert (=> b!379366 (= lt!177128 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!135 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!807 (array!22193 array!22195 (_ BitVec 32) (_ BitVec 32) V!13299 V!13299 (_ BitVec 32) Int) ListLongMap!5057)

(assert (=> b!379366 (= lt!177127 (getCurrentListMapNoExtraKeys!807 lt!177120 lt!177129 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379366 (= lt!177129 (array!22196 (store (arr!10566 _values!506) i!548 (ValueCellFull!4229 v!373)) (size!10919 _values!506)))))

(assert (=> b!379366 (= lt!177123 (getCurrentListMapNoExtraKeys!807 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379367 () Bool)

(declare-fun e!230790 () Bool)

(assert (=> b!379367 (= e!230790 tp_is_empty!9145)))

(declare-fun b!379368 () Bool)

(declare-fun res!215177 () Bool)

(assert (=> b!379368 (=> (not res!215177) (not e!230789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22193 (_ BitVec 32)) Bool)

(assert (=> b!379368 (= res!215177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379369 () Bool)

(declare-fun res!215178 () Bool)

(assert (=> b!379369 (=> (not res!215178) (not e!230789))))

(declare-fun arrayContainsKey!0 (array!22193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379369 (= res!215178 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379370 () Bool)

(declare-fun res!215183 () Bool)

(assert (=> b!379370 (=> (not res!215183) (not e!230785))))

(declare-datatypes ((List!5984 0))(
  ( (Nil!5981) (Cons!5980 (h!6836 (_ BitVec 64)) (t!11125 List!5984)) )
))
(declare-fun arrayNoDuplicates!0 (array!22193 (_ BitVec 32) List!5984) Bool)

(assert (=> b!379370 (= res!215183 (arrayNoDuplicates!0 lt!177120 #b00000000000000000000000000000000 Nil!5981))))

(declare-fun b!379371 () Bool)

(declare-fun e!230787 () Bool)

(assert (=> b!379371 (= e!230787 true)))

(declare-fun lt!177130 () ListLongMap!5057)

(declare-fun lt!177124 () ListLongMap!5057)

(assert (=> b!379371 (= lt!177130 (+!912 lt!177124 lt!177125))))

(declare-fun lt!177121 () Unit!11684)

(declare-fun addCommutativeForDiffKeys!307 (ListLongMap!5057 (_ BitVec 64) V!13299 (_ BitVec 64) V!13299) Unit!11684)

(assert (=> b!379371 (= lt!177121 (addCommutativeForDiffKeys!307 lt!177123 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379372 () Bool)

(assert (=> b!379372 (= e!230789 e!230785)))

(declare-fun res!215185 () Bool)

(assert (=> b!379372 (=> (not res!215185) (not e!230785))))

(assert (=> b!379372 (= res!215185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177120 mask!970))))

(assert (=> b!379372 (= lt!177120 (array!22194 (store (arr!10565 _keys!658) i!548 k0!778) (size!10918 _keys!658)))))

(declare-fun b!379373 () Bool)

(declare-fun res!215175 () Bool)

(assert (=> b!379373 (=> (not res!215175) (not e!230789))))

(assert (=> b!379373 (= res!215175 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5981))))

(declare-fun b!379374 () Bool)

(declare-fun e!230788 () Bool)

(declare-fun mapRes!15282 () Bool)

(assert (=> b!379374 (= e!230788 (and e!230790 mapRes!15282))))

(declare-fun condMapEmpty!15282 () Bool)

(declare-fun mapDefault!15282 () ValueCell!4229)

(assert (=> b!379374 (= condMapEmpty!15282 (= (arr!10566 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4229)) mapDefault!15282)))))

(declare-fun b!379375 () Bool)

(declare-fun res!215181 () Bool)

(assert (=> b!379375 (=> (not res!215181) (not e!230789))))

(assert (=> b!379375 (= res!215181 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10918 _keys!658))))))

(declare-fun b!379376 () Bool)

(assert (=> b!379376 (= e!230786 e!230787)))

(declare-fun res!215180 () Bool)

(assert (=> b!379376 (=> res!215180 e!230787)))

(assert (=> b!379376 (= res!215180 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!379376 (= lt!177122 lt!177124)))

(declare-fun lt!177132 () tuple2!6154)

(assert (=> b!379376 (= lt!177124 (+!912 lt!177123 lt!177132))))

(assert (=> b!379376 (= lt!177131 lt!177130)))

(assert (=> b!379376 (= lt!177130 (+!912 lt!177126 lt!177132))))

(assert (=> b!379376 (= lt!177131 (+!912 lt!177127 lt!177132))))

(assert (=> b!379376 (= lt!177132 (tuple2!6155 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379377 () Bool)

(declare-fun res!215179 () Bool)

(assert (=> b!379377 (=> (not res!215179) (not e!230789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379377 (= res!215179 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!15282 () Bool)

(assert (=> mapIsEmpty!15282 mapRes!15282))

(declare-fun b!379378 () Bool)

(declare-fun res!215176 () Bool)

(assert (=> b!379378 (=> (not res!215176) (not e!230789))))

(assert (=> b!379378 (= res!215176 (and (= (size!10919 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10918 _keys!658) (size!10919 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15282 () Bool)

(declare-fun tp!30206 () Bool)

(assert (=> mapNonEmpty!15282 (= mapRes!15282 (and tp!30206 e!230792))))

(declare-fun mapValue!15282 () ValueCell!4229)

(declare-fun mapRest!15282 () (Array (_ BitVec 32) ValueCell!4229))

(declare-fun mapKey!15282 () (_ BitVec 32))

(assert (=> mapNonEmpty!15282 (= (arr!10566 _values!506) (store mapRest!15282 mapKey!15282 mapValue!15282))))

(declare-fun res!215184 () Bool)

(assert (=> start!37356 (=> (not res!215184) (not e!230789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37356 (= res!215184 (validMask!0 mask!970))))

(assert (=> start!37356 e!230789))

(declare-fun array_inv!7780 (array!22195) Bool)

(assert (=> start!37356 (and (array_inv!7780 _values!506) e!230788)))

(assert (=> start!37356 tp!30207))

(assert (=> start!37356 true))

(assert (=> start!37356 tp_is_empty!9145))

(declare-fun array_inv!7781 (array!22193) Bool)

(assert (=> start!37356 (array_inv!7781 _keys!658)))

(assert (= (and start!37356 res!215184) b!379378))

(assert (= (and b!379378 res!215176) b!379368))

(assert (= (and b!379368 res!215177) b!379373))

(assert (= (and b!379373 res!215175) b!379375))

(assert (= (and b!379375 res!215181) b!379377))

(assert (= (and b!379377 res!215179) b!379364))

(assert (= (and b!379364 res!215182) b!379369))

(assert (= (and b!379369 res!215178) b!379372))

(assert (= (and b!379372 res!215185) b!379370))

(assert (= (and b!379370 res!215183) b!379366))

(assert (= (and b!379366 (not res!215186)) b!379376))

(assert (= (and b!379376 (not res!215180)) b!379371))

(assert (= (and b!379374 condMapEmpty!15282) mapIsEmpty!15282))

(assert (= (and b!379374 (not condMapEmpty!15282)) mapNonEmpty!15282))

(get-info :version)

(assert (= (and mapNonEmpty!15282 ((_ is ValueCellFull!4229) mapValue!15282)) b!379365))

(assert (= (and b!379374 ((_ is ValueCellFull!4229) mapDefault!15282)) b!379367))

(assert (= start!37356 b!379374))

(declare-fun m!375803 () Bool)

(assert (=> b!379366 m!375803))

(declare-fun m!375805 () Bool)

(assert (=> b!379366 m!375805))

(declare-fun m!375807 () Bool)

(assert (=> b!379366 m!375807))

(declare-fun m!375809 () Bool)

(assert (=> b!379366 m!375809))

(declare-fun m!375811 () Bool)

(assert (=> b!379366 m!375811))

(declare-fun m!375813 () Bool)

(assert (=> b!379366 m!375813))

(declare-fun m!375815 () Bool)

(assert (=> b!379366 m!375815))

(declare-fun m!375817 () Bool)

(assert (=> b!379377 m!375817))

(declare-fun m!375819 () Bool)

(assert (=> b!379370 m!375819))

(declare-fun m!375821 () Bool)

(assert (=> start!37356 m!375821))

(declare-fun m!375823 () Bool)

(assert (=> start!37356 m!375823))

(declare-fun m!375825 () Bool)

(assert (=> start!37356 m!375825))

(declare-fun m!375827 () Bool)

(assert (=> b!379364 m!375827))

(declare-fun m!375829 () Bool)

(assert (=> mapNonEmpty!15282 m!375829))

(declare-fun m!375831 () Bool)

(assert (=> b!379371 m!375831))

(declare-fun m!375833 () Bool)

(assert (=> b!379371 m!375833))

(declare-fun m!375835 () Bool)

(assert (=> b!379368 m!375835))

(declare-fun m!375837 () Bool)

(assert (=> b!379373 m!375837))

(declare-fun m!375839 () Bool)

(assert (=> b!379369 m!375839))

(declare-fun m!375841 () Bool)

(assert (=> b!379372 m!375841))

(declare-fun m!375843 () Bool)

(assert (=> b!379372 m!375843))

(declare-fun m!375845 () Bool)

(assert (=> b!379376 m!375845))

(declare-fun m!375847 () Bool)

(assert (=> b!379376 m!375847))

(declare-fun m!375849 () Bool)

(assert (=> b!379376 m!375849))

(check-sat b_and!15713 (not b!379376) (not b!379372) (not b!379366) tp_is_empty!9145 (not b!379371) (not b!379377) (not start!37356) (not mapNonEmpty!15282) (not b!379373) (not b!379368) (not b_next!8497) (not b!379369) (not b!379370))
(check-sat b_and!15713 (not b_next!8497))
