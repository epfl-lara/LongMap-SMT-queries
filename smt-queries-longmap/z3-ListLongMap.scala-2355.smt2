; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37578 () Bool)

(assert start!37578)

(declare-fun b_free!8719 () Bool)

(declare-fun b_next!8719 () Bool)

(assert (=> start!37578 (= b_free!8719 (not b_next!8719))))

(declare-fun tp!30872 () Bool)

(declare-fun b_and!15975 () Bool)

(assert (=> start!37578 (= tp!30872 b_and!15975)))

(declare-fun b!384336 () Bool)

(declare-fun e!233351 () Bool)

(declare-fun tp_is_empty!9367 () Bool)

(assert (=> b!384336 (= e!233351 tp_is_empty!9367)))

(declare-fun b!384337 () Bool)

(declare-fun res!219053 () Bool)

(declare-fun e!233347 () Bool)

(assert (=> b!384337 (=> (not res!219053) (not e!233347))))

(declare-datatypes ((array!22628 0))(
  ( (array!22629 (arr!10782 (Array (_ BitVec 32) (_ BitVec 64))) (size!11134 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22628)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384337 (= res!219053 (or (= (select (arr!10782 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10782 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384338 () Bool)

(declare-fun res!219057 () Bool)

(assert (=> b!384338 (=> (not res!219057) (not e!233347))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22628 (_ BitVec 32)) Bool)

(assert (=> b!384338 (= res!219057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384339 () Bool)

(declare-fun e!233352 () Bool)

(assert (=> b!384339 (= e!233347 e!233352)))

(declare-fun res!219059 () Bool)

(assert (=> b!384339 (=> (not res!219059) (not e!233352))))

(declare-fun lt!180863 () array!22628)

(assert (=> b!384339 (= res!219059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180863 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!384339 (= lt!180863 (array!22629 (store (arr!10782 _keys!658) i!548 k0!778) (size!11134 _keys!658)))))

(declare-fun b!384340 () Bool)

(declare-fun e!233350 () Bool)

(declare-fun mapRes!15615 () Bool)

(assert (=> b!384340 (= e!233350 (and e!233351 mapRes!15615))))

(declare-fun condMapEmpty!15615 () Bool)

(declare-datatypes ((V!13595 0))(
  ( (V!13596 (val!4728 Int)) )
))
(declare-datatypes ((ValueCell!4340 0))(
  ( (ValueCellFull!4340 (v!6926 V!13595)) (EmptyCell!4340) )
))
(declare-datatypes ((array!22630 0))(
  ( (array!22631 (arr!10783 (Array (_ BitVec 32) ValueCell!4340)) (size!11135 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22630)

(declare-fun mapDefault!15615 () ValueCell!4340)

(assert (=> b!384340 (= condMapEmpty!15615 (= (arr!10783 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4340)) mapDefault!15615)))))

(declare-fun b!384341 () Bool)

(declare-fun res!219061 () Bool)

(assert (=> b!384341 (=> (not res!219061) (not e!233347))))

(assert (=> b!384341 (= res!219061 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11134 _keys!658))))))

(declare-fun mapIsEmpty!15615 () Bool)

(assert (=> mapIsEmpty!15615 mapRes!15615))

(declare-fun b!384342 () Bool)

(declare-fun res!219062 () Bool)

(assert (=> b!384342 (=> (not res!219062) (not e!233347))))

(declare-fun arrayContainsKey!0 (array!22628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384342 (= res!219062 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384343 () Bool)

(declare-fun res!219055 () Bool)

(assert (=> b!384343 (=> (not res!219055) (not e!233347))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384343 (= res!219055 (and (= (size!11135 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11134 _keys!658) (size!11135 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384344 () Bool)

(declare-fun res!219060 () Bool)

(assert (=> b!384344 (=> (not res!219060) (not e!233352))))

(declare-datatypes ((List!6076 0))(
  ( (Nil!6073) (Cons!6072 (h!6928 (_ BitVec 64)) (t!11218 List!6076)) )
))
(declare-fun arrayNoDuplicates!0 (array!22628 (_ BitVec 32) List!6076) Bool)

(assert (=> b!384344 (= res!219060 (arrayNoDuplicates!0 lt!180863 #b00000000000000000000000000000000 Nil!6073))))

(declare-fun mapNonEmpty!15615 () Bool)

(declare-fun tp!30873 () Bool)

(declare-fun e!233346 () Bool)

(assert (=> mapNonEmpty!15615 (= mapRes!15615 (and tp!30873 e!233346))))

(declare-fun mapValue!15615 () ValueCell!4340)

(declare-fun mapRest!15615 () (Array (_ BitVec 32) ValueCell!4340))

(declare-fun mapKey!15615 () (_ BitVec 32))

(assert (=> mapNonEmpty!15615 (= (arr!10783 _values!506) (store mapRest!15615 mapKey!15615 mapValue!15615))))

(declare-fun b!384346 () Bool)

(assert (=> b!384346 (= e!233346 tp_is_empty!9367)))

(declare-fun b!384347 () Bool)

(declare-fun res!219054 () Bool)

(assert (=> b!384347 (=> (not res!219054) (not e!233347))))

(assert (=> b!384347 (= res!219054 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6073))))

(declare-fun b!384348 () Bool)

(declare-fun res!219058 () Bool)

(assert (=> b!384348 (=> (not res!219058) (not e!233347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384348 (= res!219058 (validKeyInArray!0 k0!778))))

(declare-fun b!384349 () Bool)

(declare-fun e!233348 () Bool)

(assert (=> b!384349 (= e!233348 true)))

(declare-datatypes ((tuple2!6240 0))(
  ( (tuple2!6241 (_1!3131 (_ BitVec 64)) (_2!3131 V!13595)) )
))
(declare-datatypes ((List!6077 0))(
  ( (Nil!6074) (Cons!6073 (h!6929 tuple2!6240) (t!11219 List!6077)) )
))
(declare-datatypes ((ListLongMap!5155 0))(
  ( (ListLongMap!5156 (toList!2593 List!6077)) )
))
(declare-fun lt!180867 () ListLongMap!5155)

(declare-fun lt!180870 () ListLongMap!5155)

(declare-fun lt!180865 () tuple2!6240)

(declare-fun +!985 (ListLongMap!5155 tuple2!6240) ListLongMap!5155)

(assert (=> b!384349 (= lt!180867 (+!985 lt!180870 lt!180865))))

(declare-fun lt!180869 () ListLongMap!5155)

(declare-fun lt!180862 () ListLongMap!5155)

(assert (=> b!384349 (= lt!180869 lt!180862)))

(declare-fun b!384345 () Bool)

(assert (=> b!384345 (= e!233352 (not e!233348))))

(declare-fun res!219052 () Bool)

(assert (=> b!384345 (=> res!219052 e!233348)))

(declare-fun lt!180866 () Bool)

(assert (=> b!384345 (= res!219052 (or (and (not lt!180866) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180866) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180866)))))

(assert (=> b!384345 (= lt!180866 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13595)

(declare-fun minValue!472 () V!13595)

(declare-fun getCurrentListMap!2023 (array!22628 array!22630 (_ BitVec 32) (_ BitVec 32) V!13595 V!13595 (_ BitVec 32) Int) ListLongMap!5155)

(assert (=> b!384345 (= lt!180870 (getCurrentListMap!2023 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180868 () array!22630)

(assert (=> b!384345 (= lt!180869 (getCurrentListMap!2023 lt!180863 lt!180868 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180861 () ListLongMap!5155)

(assert (=> b!384345 (and (= lt!180862 lt!180861) (= lt!180861 lt!180862))))

(declare-fun lt!180864 () ListLongMap!5155)

(assert (=> b!384345 (= lt!180861 (+!985 lt!180864 lt!180865))))

(declare-fun v!373 () V!13595)

(assert (=> b!384345 (= lt!180865 (tuple2!6241 k0!778 v!373))))

(declare-datatypes ((Unit!11841 0))(
  ( (Unit!11842) )
))
(declare-fun lt!180871 () Unit!11841)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!210 (array!22628 array!22630 (_ BitVec 32) (_ BitVec 32) V!13595 V!13595 (_ BitVec 32) (_ BitVec 64) V!13595 (_ BitVec 32) Int) Unit!11841)

(assert (=> b!384345 (= lt!180871 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!210 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!870 (array!22628 array!22630 (_ BitVec 32) (_ BitVec 32) V!13595 V!13595 (_ BitVec 32) Int) ListLongMap!5155)

(assert (=> b!384345 (= lt!180862 (getCurrentListMapNoExtraKeys!870 lt!180863 lt!180868 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384345 (= lt!180868 (array!22631 (store (arr!10783 _values!506) i!548 (ValueCellFull!4340 v!373)) (size!11135 _values!506)))))

(assert (=> b!384345 (= lt!180864 (getCurrentListMapNoExtraKeys!870 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!219056 () Bool)

(assert (=> start!37578 (=> (not res!219056) (not e!233347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37578 (= res!219056 (validMask!0 mask!970))))

(assert (=> start!37578 e!233347))

(declare-fun array_inv!7980 (array!22630) Bool)

(assert (=> start!37578 (and (array_inv!7980 _values!506) e!233350)))

(assert (=> start!37578 tp!30872))

(assert (=> start!37578 true))

(assert (=> start!37578 tp_is_empty!9367))

(declare-fun array_inv!7981 (array!22628) Bool)

(assert (=> start!37578 (array_inv!7981 _keys!658)))

(assert (= (and start!37578 res!219056) b!384343))

(assert (= (and b!384343 res!219055) b!384338))

(assert (= (and b!384338 res!219057) b!384347))

(assert (= (and b!384347 res!219054) b!384341))

(assert (= (and b!384341 res!219061) b!384348))

(assert (= (and b!384348 res!219058) b!384337))

(assert (= (and b!384337 res!219053) b!384342))

(assert (= (and b!384342 res!219062) b!384339))

(assert (= (and b!384339 res!219059) b!384344))

(assert (= (and b!384344 res!219060) b!384345))

(assert (= (and b!384345 (not res!219052)) b!384349))

(assert (= (and b!384340 condMapEmpty!15615) mapIsEmpty!15615))

(assert (= (and b!384340 (not condMapEmpty!15615)) mapNonEmpty!15615))

(get-info :version)

(assert (= (and mapNonEmpty!15615 ((_ is ValueCellFull!4340) mapValue!15615)) b!384346))

(assert (= (and b!384340 ((_ is ValueCellFull!4340) mapDefault!15615)) b!384336))

(assert (= start!37578 b!384340))

(declare-fun m!381305 () Bool)

(assert (=> b!384344 m!381305))

(declare-fun m!381307 () Bool)

(assert (=> b!384345 m!381307))

(declare-fun m!381309 () Bool)

(assert (=> b!384345 m!381309))

(declare-fun m!381311 () Bool)

(assert (=> b!384345 m!381311))

(declare-fun m!381313 () Bool)

(assert (=> b!384345 m!381313))

(declare-fun m!381315 () Bool)

(assert (=> b!384345 m!381315))

(declare-fun m!381317 () Bool)

(assert (=> b!384345 m!381317))

(declare-fun m!381319 () Bool)

(assert (=> b!384345 m!381319))

(declare-fun m!381321 () Bool)

(assert (=> b!384337 m!381321))

(declare-fun m!381323 () Bool)

(assert (=> start!37578 m!381323))

(declare-fun m!381325 () Bool)

(assert (=> start!37578 m!381325))

(declare-fun m!381327 () Bool)

(assert (=> start!37578 m!381327))

(declare-fun m!381329 () Bool)

(assert (=> mapNonEmpty!15615 m!381329))

(declare-fun m!381331 () Bool)

(assert (=> b!384349 m!381331))

(declare-fun m!381333 () Bool)

(assert (=> b!384339 m!381333))

(declare-fun m!381335 () Bool)

(assert (=> b!384339 m!381335))

(declare-fun m!381337 () Bool)

(assert (=> b!384342 m!381337))

(declare-fun m!381339 () Bool)

(assert (=> b!384338 m!381339))

(declare-fun m!381341 () Bool)

(assert (=> b!384348 m!381341))

(declare-fun m!381343 () Bool)

(assert (=> b!384347 m!381343))

(check-sat (not mapNonEmpty!15615) tp_is_empty!9367 (not b!384342) b_and!15975 (not b!384349) (not b!384347) (not b_next!8719) (not b!384344) (not b!384348) (not start!37578) (not b!384339) (not b!384338) (not b!384345))
(check-sat b_and!15975 (not b_next!8719))
