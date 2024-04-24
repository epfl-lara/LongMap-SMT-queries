; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37356 () Bool)

(assert start!37356)

(declare-fun b_free!8497 () Bool)

(declare-fun b_next!8497 () Bool)

(assert (=> start!37356 (= b_free!8497 (not b_next!8497))))

(declare-fun tp!30207 () Bool)

(declare-fun b_and!15753 () Bool)

(assert (=> start!37356 (= tp!30207 b_and!15753)))

(declare-fun b!379586 () Bool)

(declare-fun res!215310 () Bool)

(declare-fun e!230934 () Bool)

(assert (=> b!379586 (=> (not res!215310) (not e!230934))))

(declare-datatypes ((array!22196 0))(
  ( (array!22197 (arr!10566 (Array (_ BitVec 32) (_ BitVec 64))) (size!10918 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22196)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379586 (= res!215310 (or (= (select (arr!10566 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10566 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15282 () Bool)

(declare-fun mapRes!15282 () Bool)

(declare-fun tp!30206 () Bool)

(declare-fun e!230931 () Bool)

(assert (=> mapNonEmpty!15282 (= mapRes!15282 (and tp!30206 e!230931))))

(declare-datatypes ((V!13299 0))(
  ( (V!13300 (val!4617 Int)) )
))
(declare-datatypes ((ValueCell!4229 0))(
  ( (ValueCellFull!4229 (v!6815 V!13299)) (EmptyCell!4229) )
))
(declare-fun mapRest!15282 () (Array (_ BitVec 32) ValueCell!4229))

(declare-datatypes ((array!22198 0))(
  ( (array!22199 (arr!10567 (Array (_ BitVec 32) ValueCell!4229)) (size!10919 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22198)

(declare-fun mapValue!15282 () ValueCell!4229)

(declare-fun mapKey!15282 () (_ BitVec 32))

(assert (=> mapNonEmpty!15282 (= (arr!10567 _values!506) (store mapRest!15282 mapKey!15282 mapValue!15282))))

(declare-fun b!379587 () Bool)

(declare-fun res!215304 () Bool)

(assert (=> b!379587 (=> (not res!215304) (not e!230934))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!379587 (= res!215304 (and (= (size!10919 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10918 _keys!658) (size!10919 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379588 () Bool)

(declare-fun res!215302 () Bool)

(assert (=> b!379588 (=> (not res!215302) (not e!230934))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379588 (= res!215302 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!215303 () Bool)

(assert (=> start!37356 (=> (not res!215303) (not e!230934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37356 (= res!215303 (validMask!0 mask!970))))

(assert (=> start!37356 e!230934))

(declare-fun e!230933 () Bool)

(declare-fun array_inv!7828 (array!22198) Bool)

(assert (=> start!37356 (and (array_inv!7828 _values!506) e!230933)))

(assert (=> start!37356 tp!30207))

(assert (=> start!37356 true))

(declare-fun tp_is_empty!9145 () Bool)

(assert (=> start!37356 tp_is_empty!9145))

(declare-fun array_inv!7829 (array!22196) Bool)

(assert (=> start!37356 (array_inv!7829 _keys!658)))

(declare-fun b!379589 () Bool)

(declare-fun e!230929 () Bool)

(declare-fun e!230930 () Bool)

(assert (=> b!379589 (= e!230929 (not e!230930))))

(declare-fun res!215305 () Bool)

(assert (=> b!379589 (=> res!215305 e!230930)))

(assert (=> b!379589 (= res!215305 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6072 0))(
  ( (tuple2!6073 (_1!3047 (_ BitVec 64)) (_2!3047 V!13299)) )
))
(declare-datatypes ((List!5909 0))(
  ( (Nil!5906) (Cons!5905 (h!6761 tuple2!6072) (t!11051 List!5909)) )
))
(declare-datatypes ((ListLongMap!4987 0))(
  ( (ListLongMap!4988 (toList!2509 List!5909)) )
))
(declare-fun lt!177382 () ListLongMap!4987)

(declare-fun zeroValue!472 () V!13299)

(declare-fun minValue!472 () V!13299)

(declare-fun getCurrentListMap!1948 (array!22196 array!22198 (_ BitVec 32) (_ BitVec 32) V!13299 V!13299 (_ BitVec 32) Int) ListLongMap!4987)

(assert (=> b!379589 (= lt!177382 (getCurrentListMap!1948 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177378 () ListLongMap!4987)

(declare-fun lt!177385 () array!22196)

(declare-fun lt!177379 () array!22198)

(assert (=> b!379589 (= lt!177378 (getCurrentListMap!1948 lt!177385 lt!177379 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177377 () ListLongMap!4987)

(declare-fun lt!177373 () ListLongMap!4987)

(assert (=> b!379589 (and (= lt!177377 lt!177373) (= lt!177373 lt!177377))))

(declare-fun lt!177376 () ListLongMap!4987)

(declare-fun lt!177375 () tuple2!6072)

(declare-fun +!905 (ListLongMap!4987 tuple2!6072) ListLongMap!4987)

(assert (=> b!379589 (= lt!177373 (+!905 lt!177376 lt!177375))))

(declare-fun v!373 () V!13299)

(assert (=> b!379589 (= lt!177375 (tuple2!6073 k0!778 v!373))))

(declare-datatypes ((Unit!11691 0))(
  ( (Unit!11692) )
))
(declare-fun lt!177381 () Unit!11691)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!135 (array!22196 array!22198 (_ BitVec 32) (_ BitVec 32) V!13299 V!13299 (_ BitVec 32) (_ BitVec 64) V!13299 (_ BitVec 32) Int) Unit!11691)

(assert (=> b!379589 (= lt!177381 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!135 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!795 (array!22196 array!22198 (_ BitVec 32) (_ BitVec 32) V!13299 V!13299 (_ BitVec 32) Int) ListLongMap!4987)

(assert (=> b!379589 (= lt!177377 (getCurrentListMapNoExtraKeys!795 lt!177385 lt!177379 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379589 (= lt!177379 (array!22199 (store (arr!10567 _values!506) i!548 (ValueCellFull!4229 v!373)) (size!10919 _values!506)))))

(assert (=> b!379589 (= lt!177376 (getCurrentListMapNoExtraKeys!795 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379590 () Bool)

(declare-fun res!215312 () Bool)

(assert (=> b!379590 (=> (not res!215312) (not e!230934))))

(declare-datatypes ((List!5910 0))(
  ( (Nil!5907) (Cons!5906 (h!6762 (_ BitVec 64)) (t!11052 List!5910)) )
))
(declare-fun arrayNoDuplicates!0 (array!22196 (_ BitVec 32) List!5910) Bool)

(assert (=> b!379590 (= res!215312 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5907))))

(declare-fun b!379591 () Bool)

(declare-fun e!230932 () Bool)

(assert (=> b!379591 (= e!230932 tp_is_empty!9145)))

(declare-fun b!379592 () Bool)

(assert (=> b!379592 (= e!230934 e!230929)))

(declare-fun res!215309 () Bool)

(assert (=> b!379592 (=> (not res!215309) (not e!230929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22196 (_ BitVec 32)) Bool)

(assert (=> b!379592 (= res!215309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177385 mask!970))))

(assert (=> b!379592 (= lt!177385 (array!22197 (store (arr!10566 _keys!658) i!548 k0!778) (size!10918 _keys!658)))))

(declare-fun b!379593 () Bool)

(assert (=> b!379593 (= e!230933 (and e!230932 mapRes!15282))))

(declare-fun condMapEmpty!15282 () Bool)

(declare-fun mapDefault!15282 () ValueCell!4229)

(assert (=> b!379593 (= condMapEmpty!15282 (= (arr!10567 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4229)) mapDefault!15282)))))

(declare-fun b!379594 () Bool)

(declare-fun e!230927 () Bool)

(assert (=> b!379594 (= e!230930 e!230927)))

(declare-fun res!215307 () Bool)

(assert (=> b!379594 (=> res!215307 e!230927)))

(assert (=> b!379594 (= res!215307 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!177374 () ListLongMap!4987)

(assert (=> b!379594 (= lt!177382 lt!177374)))

(declare-fun lt!177380 () tuple2!6072)

(assert (=> b!379594 (= lt!177374 (+!905 lt!177376 lt!177380))))

(declare-fun lt!177383 () ListLongMap!4987)

(assert (=> b!379594 (= lt!177378 lt!177383)))

(assert (=> b!379594 (= lt!177383 (+!905 lt!177373 lt!177380))))

(assert (=> b!379594 (= lt!177378 (+!905 lt!177377 lt!177380))))

(assert (=> b!379594 (= lt!177380 (tuple2!6073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379595 () Bool)

(declare-fun res!215306 () Bool)

(assert (=> b!379595 (=> (not res!215306) (not e!230934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379595 (= res!215306 (validKeyInArray!0 k0!778))))

(declare-fun b!379596 () Bool)

(declare-fun res!215301 () Bool)

(assert (=> b!379596 (=> (not res!215301) (not e!230934))))

(assert (=> b!379596 (= res!215301 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10918 _keys!658))))))

(declare-fun b!379597 () Bool)

(declare-fun res!215308 () Bool)

(assert (=> b!379597 (=> (not res!215308) (not e!230934))))

(assert (=> b!379597 (= res!215308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15282 () Bool)

(assert (=> mapIsEmpty!15282 mapRes!15282))

(declare-fun b!379598 () Bool)

(assert (=> b!379598 (= e!230927 true)))

(assert (=> b!379598 (= lt!177383 (+!905 lt!177374 lt!177375))))

(declare-fun lt!177384 () Unit!11691)

(declare-fun addCommutativeForDiffKeys!317 (ListLongMap!4987 (_ BitVec 64) V!13299 (_ BitVec 64) V!13299) Unit!11691)

(assert (=> b!379598 (= lt!177384 (addCommutativeForDiffKeys!317 lt!177376 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379599 () Bool)

(assert (=> b!379599 (= e!230931 tp_is_empty!9145)))

(declare-fun b!379600 () Bool)

(declare-fun res!215311 () Bool)

(assert (=> b!379600 (=> (not res!215311) (not e!230929))))

(assert (=> b!379600 (= res!215311 (arrayNoDuplicates!0 lt!177385 #b00000000000000000000000000000000 Nil!5907))))

(assert (= (and start!37356 res!215303) b!379587))

(assert (= (and b!379587 res!215304) b!379597))

(assert (= (and b!379597 res!215308) b!379590))

(assert (= (and b!379590 res!215312) b!379596))

(assert (= (and b!379596 res!215301) b!379595))

(assert (= (and b!379595 res!215306) b!379586))

(assert (= (and b!379586 res!215310) b!379588))

(assert (= (and b!379588 res!215302) b!379592))

(assert (= (and b!379592 res!215309) b!379600))

(assert (= (and b!379600 res!215311) b!379589))

(assert (= (and b!379589 (not res!215305)) b!379594))

(assert (= (and b!379594 (not res!215307)) b!379598))

(assert (= (and b!379593 condMapEmpty!15282) mapIsEmpty!15282))

(assert (= (and b!379593 (not condMapEmpty!15282)) mapNonEmpty!15282))

(get-info :version)

(assert (= (and mapNonEmpty!15282 ((_ is ValueCellFull!4229) mapValue!15282)) b!379599))

(assert (= (and b!379593 ((_ is ValueCellFull!4229) mapDefault!15282)) b!379591))

(assert (= start!37356 b!379593))

(declare-fun m!376757 () Bool)

(assert (=> b!379594 m!376757))

(declare-fun m!376759 () Bool)

(assert (=> b!379594 m!376759))

(declare-fun m!376761 () Bool)

(assert (=> b!379594 m!376761))

(declare-fun m!376763 () Bool)

(assert (=> b!379600 m!376763))

(declare-fun m!376765 () Bool)

(assert (=> b!379589 m!376765))

(declare-fun m!376767 () Bool)

(assert (=> b!379589 m!376767))

(declare-fun m!376769 () Bool)

(assert (=> b!379589 m!376769))

(declare-fun m!376771 () Bool)

(assert (=> b!379589 m!376771))

(declare-fun m!376773 () Bool)

(assert (=> b!379589 m!376773))

(declare-fun m!376775 () Bool)

(assert (=> b!379589 m!376775))

(declare-fun m!376777 () Bool)

(assert (=> b!379589 m!376777))

(declare-fun m!376779 () Bool)

(assert (=> b!379586 m!376779))

(declare-fun m!376781 () Bool)

(assert (=> b!379597 m!376781))

(declare-fun m!376783 () Bool)

(assert (=> b!379592 m!376783))

(declare-fun m!376785 () Bool)

(assert (=> b!379592 m!376785))

(declare-fun m!376787 () Bool)

(assert (=> b!379598 m!376787))

(declare-fun m!376789 () Bool)

(assert (=> b!379598 m!376789))

(declare-fun m!376791 () Bool)

(assert (=> b!379588 m!376791))

(declare-fun m!376793 () Bool)

(assert (=> start!37356 m!376793))

(declare-fun m!376795 () Bool)

(assert (=> start!37356 m!376795))

(declare-fun m!376797 () Bool)

(assert (=> start!37356 m!376797))

(declare-fun m!376799 () Bool)

(assert (=> mapNonEmpty!15282 m!376799))

(declare-fun m!376801 () Bool)

(assert (=> b!379590 m!376801))

(declare-fun m!376803 () Bool)

(assert (=> b!379595 m!376803))

(check-sat (not b!379589) (not b!379590) (not b!379595) (not b!379592) (not start!37356) (not b!379597) (not mapNonEmpty!15282) b_and!15753 (not b!379588) (not b!379600) (not b_next!8497) (not b!379598) tp_is_empty!9145 (not b!379594))
(check-sat b_and!15753 (not b_next!8497))
