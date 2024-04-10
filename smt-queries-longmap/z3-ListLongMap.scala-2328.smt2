; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37432 () Bool)

(assert start!37432)

(declare-fun b_free!8559 () Bool)

(declare-fun b_next!8559 () Bool)

(assert (=> start!37432 (= b_free!8559 (not b_next!8559))))

(declare-fun tp!30392 () Bool)

(declare-fun b_and!15801 () Bool)

(assert (=> start!37432 (= tp!30392 b_and!15801)))

(declare-fun b!381016 () Bool)

(declare-fun res!216410 () Bool)

(declare-fun e!231692 () Bool)

(assert (=> b!381016 (=> (not res!216410) (not e!231692))))

(declare-datatypes ((array!22331 0))(
  ( (array!22332 (arr!10634 (Array (_ BitVec 32) (_ BitVec 64))) (size!10986 (_ BitVec 32))) )
))
(declare-fun lt!178507 () array!22331)

(declare-datatypes ((List!6071 0))(
  ( (Nil!6068) (Cons!6067 (h!6923 (_ BitVec 64)) (t!11221 List!6071)) )
))
(declare-fun arrayNoDuplicates!0 (array!22331 (_ BitVec 32) List!6071) Bool)

(assert (=> b!381016 (= res!216410 (arrayNoDuplicates!0 lt!178507 #b00000000000000000000000000000000 Nil!6068))))

(declare-fun b!381017 () Bool)

(declare-fun e!231690 () Bool)

(assert (=> b!381017 (= e!231690 true)))

(declare-datatypes ((V!13381 0))(
  ( (V!13382 (val!4648 Int)) )
))
(declare-datatypes ((tuple2!6238 0))(
  ( (tuple2!6239 (_1!3130 (_ BitVec 64)) (_2!3130 V!13381)) )
))
(declare-datatypes ((List!6072 0))(
  ( (Nil!6069) (Cons!6068 (h!6924 tuple2!6238) (t!11222 List!6072)) )
))
(declare-datatypes ((ListLongMap!5151 0))(
  ( (ListLongMap!5152 (toList!2591 List!6072)) )
))
(declare-fun lt!178508 () ListLongMap!5151)

(declare-fun lt!178509 () ListLongMap!5151)

(assert (=> b!381017 (= lt!178508 lt!178509)))

(declare-fun mapNonEmpty!15375 () Bool)

(declare-fun mapRes!15375 () Bool)

(declare-fun tp!30393 () Bool)

(declare-fun e!231694 () Bool)

(assert (=> mapNonEmpty!15375 (= mapRes!15375 (and tp!30393 e!231694))))

(declare-datatypes ((ValueCell!4260 0))(
  ( (ValueCellFull!4260 (v!6845 V!13381)) (EmptyCell!4260) )
))
(declare-fun mapRest!15375 () (Array (_ BitVec 32) ValueCell!4260))

(declare-datatypes ((array!22333 0))(
  ( (array!22334 (arr!10635 (Array (_ BitVec 32) ValueCell!4260)) (size!10987 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22333)

(declare-fun mapValue!15375 () ValueCell!4260)

(declare-fun mapKey!15375 () (_ BitVec 32))

(assert (=> mapNonEmpty!15375 (= (arr!10635 _values!506) (store mapRest!15375 mapKey!15375 mapValue!15375))))

(declare-fun b!381018 () Bool)

(declare-fun e!231691 () Bool)

(declare-fun tp_is_empty!9207 () Bool)

(assert (=> b!381018 (= e!231691 tp_is_empty!9207)))

(declare-fun b!381019 () Bool)

(declare-fun res!216414 () Bool)

(declare-fun e!231693 () Bool)

(assert (=> b!381019 (=> (not res!216414) (not e!231693))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381019 (= res!216414 (validKeyInArray!0 k0!778))))

(declare-fun b!381020 () Bool)

(declare-fun res!216406 () Bool)

(assert (=> b!381020 (=> (not res!216406) (not e!231693))))

(declare-fun _keys!658 () array!22331)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381020 (= res!216406 (or (= (select (arr!10634 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10634 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!216413 () Bool)

(assert (=> start!37432 (=> (not res!216413) (not e!231693))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37432 (= res!216413 (validMask!0 mask!970))))

(assert (=> start!37432 e!231693))

(declare-fun e!231695 () Bool)

(declare-fun array_inv!7830 (array!22333) Bool)

(assert (=> start!37432 (and (array_inv!7830 _values!506) e!231695)))

(assert (=> start!37432 tp!30392))

(assert (=> start!37432 true))

(assert (=> start!37432 tp_is_empty!9207))

(declare-fun array_inv!7831 (array!22331) Bool)

(assert (=> start!37432 (array_inv!7831 _keys!658)))

(declare-fun b!381021 () Bool)

(declare-fun res!216411 () Bool)

(assert (=> b!381021 (=> (not res!216411) (not e!231693))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381021 (= res!216411 (and (= (size!10987 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10986 _keys!658) (size!10987 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15375 () Bool)

(assert (=> mapIsEmpty!15375 mapRes!15375))

(declare-fun b!381022 () Bool)

(assert (=> b!381022 (= e!231693 e!231692)))

(declare-fun res!216412 () Bool)

(assert (=> b!381022 (=> (not res!216412) (not e!231692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22331 (_ BitVec 32)) Bool)

(assert (=> b!381022 (= res!216412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178507 mask!970))))

(assert (=> b!381022 (= lt!178507 (array!22332 (store (arr!10634 _keys!658) i!548 k0!778) (size!10986 _keys!658)))))

(declare-fun b!381023 () Bool)

(assert (=> b!381023 (= e!231695 (and e!231691 mapRes!15375))))

(declare-fun condMapEmpty!15375 () Bool)

(declare-fun mapDefault!15375 () ValueCell!4260)

(assert (=> b!381023 (= condMapEmpty!15375 (= (arr!10635 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4260)) mapDefault!15375)))))

(declare-fun b!381024 () Bool)

(assert (=> b!381024 (= e!231692 (not e!231690))))

(declare-fun res!216415 () Bool)

(assert (=> b!381024 (=> res!216415 e!231690)))

(declare-fun lt!178512 () Bool)

(assert (=> b!381024 (= res!216415 (or (and (not lt!178512) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178512) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178512)))))

(assert (=> b!381024 (= lt!178512 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13381)

(declare-fun lt!178511 () ListLongMap!5151)

(declare-fun minValue!472 () V!13381)

(declare-fun getCurrentListMap!2006 (array!22331 array!22333 (_ BitVec 32) (_ BitVec 32) V!13381 V!13381 (_ BitVec 32) Int) ListLongMap!5151)

(assert (=> b!381024 (= lt!178511 (getCurrentListMap!2006 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178515 () array!22333)

(assert (=> b!381024 (= lt!178508 (getCurrentListMap!2006 lt!178507 lt!178515 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178513 () ListLongMap!5151)

(assert (=> b!381024 (and (= lt!178509 lt!178513) (= lt!178513 lt!178509))))

(declare-fun v!373 () V!13381)

(declare-fun lt!178514 () ListLongMap!5151)

(declare-fun +!936 (ListLongMap!5151 tuple2!6238) ListLongMap!5151)

(assert (=> b!381024 (= lt!178513 (+!936 lt!178514 (tuple2!6239 k0!778 v!373)))))

(declare-datatypes ((Unit!11766 0))(
  ( (Unit!11767) )
))
(declare-fun lt!178510 () Unit!11766)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!164 (array!22331 array!22333 (_ BitVec 32) (_ BitVec 32) V!13381 V!13381 (_ BitVec 32) (_ BitVec 64) V!13381 (_ BitVec 32) Int) Unit!11766)

(assert (=> b!381024 (= lt!178510 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!164 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!840 (array!22331 array!22333 (_ BitVec 32) (_ BitVec 32) V!13381 V!13381 (_ BitVec 32) Int) ListLongMap!5151)

(assert (=> b!381024 (= lt!178509 (getCurrentListMapNoExtraKeys!840 lt!178507 lt!178515 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381024 (= lt!178515 (array!22334 (store (arr!10635 _values!506) i!548 (ValueCellFull!4260 v!373)) (size!10987 _values!506)))))

(assert (=> b!381024 (= lt!178514 (getCurrentListMapNoExtraKeys!840 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381025 () Bool)

(declare-fun res!216409 () Bool)

(assert (=> b!381025 (=> (not res!216409) (not e!231693))))

(assert (=> b!381025 (= res!216409 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10986 _keys!658))))))

(declare-fun b!381026 () Bool)

(declare-fun res!216416 () Bool)

(assert (=> b!381026 (=> (not res!216416) (not e!231693))))

(declare-fun arrayContainsKey!0 (array!22331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381026 (= res!216416 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381027 () Bool)

(declare-fun res!216407 () Bool)

(assert (=> b!381027 (=> (not res!216407) (not e!231693))))

(assert (=> b!381027 (= res!216407 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6068))))

(declare-fun b!381028 () Bool)

(assert (=> b!381028 (= e!231694 tp_is_empty!9207)))

(declare-fun b!381029 () Bool)

(declare-fun res!216408 () Bool)

(assert (=> b!381029 (=> (not res!216408) (not e!231693))))

(assert (=> b!381029 (= res!216408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37432 res!216413) b!381021))

(assert (= (and b!381021 res!216411) b!381029))

(assert (= (and b!381029 res!216408) b!381027))

(assert (= (and b!381027 res!216407) b!381025))

(assert (= (and b!381025 res!216409) b!381019))

(assert (= (and b!381019 res!216414) b!381020))

(assert (= (and b!381020 res!216406) b!381026))

(assert (= (and b!381026 res!216416) b!381022))

(assert (= (and b!381022 res!216412) b!381016))

(assert (= (and b!381016 res!216410) b!381024))

(assert (= (and b!381024 (not res!216415)) b!381017))

(assert (= (and b!381023 condMapEmpty!15375) mapIsEmpty!15375))

(assert (= (and b!381023 (not condMapEmpty!15375)) mapNonEmpty!15375))

(get-info :version)

(assert (= (and mapNonEmpty!15375 ((_ is ValueCellFull!4260) mapValue!15375)) b!381028))

(assert (= (and b!381023 ((_ is ValueCellFull!4260) mapDefault!15375)) b!381018))

(assert (= start!37432 b!381023))

(declare-fun m!377975 () Bool)

(assert (=> b!381019 m!377975))

(declare-fun m!377977 () Bool)

(assert (=> start!37432 m!377977))

(declare-fun m!377979 () Bool)

(assert (=> start!37432 m!377979))

(declare-fun m!377981 () Bool)

(assert (=> start!37432 m!377981))

(declare-fun m!377983 () Bool)

(assert (=> b!381026 m!377983))

(declare-fun m!377985 () Bool)

(assert (=> mapNonEmpty!15375 m!377985))

(declare-fun m!377987 () Bool)

(assert (=> b!381029 m!377987))

(declare-fun m!377989 () Bool)

(assert (=> b!381027 m!377989))

(declare-fun m!377991 () Bool)

(assert (=> b!381016 m!377991))

(declare-fun m!377993 () Bool)

(assert (=> b!381020 m!377993))

(declare-fun m!377995 () Bool)

(assert (=> b!381022 m!377995))

(declare-fun m!377997 () Bool)

(assert (=> b!381022 m!377997))

(declare-fun m!377999 () Bool)

(assert (=> b!381024 m!377999))

(declare-fun m!378001 () Bool)

(assert (=> b!381024 m!378001))

(declare-fun m!378003 () Bool)

(assert (=> b!381024 m!378003))

(declare-fun m!378005 () Bool)

(assert (=> b!381024 m!378005))

(declare-fun m!378007 () Bool)

(assert (=> b!381024 m!378007))

(declare-fun m!378009 () Bool)

(assert (=> b!381024 m!378009))

(declare-fun m!378011 () Bool)

(assert (=> b!381024 m!378011))

(check-sat (not b!381016) (not b_next!8559) (not mapNonEmpty!15375) b_and!15801 (not b!381024) (not b!381022) tp_is_empty!9207 (not start!37432) (not b!381029) (not b!381019) (not b!381026) (not b!381027))
(check-sat b_and!15801 (not b_next!8559))
