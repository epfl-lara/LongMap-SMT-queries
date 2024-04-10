; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37588 () Bool)

(assert start!37588)

(declare-fun b_free!8715 () Bool)

(declare-fun b_next!8715 () Bool)

(assert (=> start!37588 (= b_free!8715 (not b_next!8715))))

(declare-fun tp!30861 () Bool)

(declare-fun b_and!15957 () Bool)

(assert (=> start!37588 (= tp!30861 b_and!15957)))

(declare-fun b!384301 () Bool)

(declare-fun res!218999 () Bool)

(declare-fun e!233338 () Bool)

(assert (=> b!384301 (=> (not res!218999) (not e!233338))))

(declare-datatypes ((array!22631 0))(
  ( (array!22632 (arr!10784 (Array (_ BitVec 32) (_ BitVec 64))) (size!11136 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22631)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384301 (= res!218999 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15609 () Bool)

(declare-fun mapRes!15609 () Bool)

(assert (=> mapIsEmpty!15609 mapRes!15609))

(declare-fun b!384302 () Bool)

(declare-fun e!233341 () Bool)

(declare-fun e!233337 () Bool)

(assert (=> b!384302 (= e!233341 (not e!233337))))

(declare-fun res!218998 () Bool)

(assert (=> b!384302 (=> res!218998 e!233337)))

(declare-fun lt!180779 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384302 (= res!218998 (or (and (not lt!180779) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180779) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180779)))))

(assert (=> b!384302 (= lt!180779 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((V!13589 0))(
  ( (V!13590 (val!4726 Int)) )
))
(declare-fun zeroValue!472 () V!13589)

(declare-datatypes ((tuple2!6360 0))(
  ( (tuple2!6361 (_1!3191 (_ BitVec 64)) (_2!3191 V!13589)) )
))
(declare-datatypes ((List!6196 0))(
  ( (Nil!6193) (Cons!6192 (h!7048 tuple2!6360) (t!11346 List!6196)) )
))
(declare-datatypes ((ListLongMap!5273 0))(
  ( (ListLongMap!5274 (toList!2652 List!6196)) )
))
(declare-fun lt!180780 () ListLongMap!5273)

(declare-datatypes ((ValueCell!4338 0))(
  ( (ValueCellFull!4338 (v!6923 V!13589)) (EmptyCell!4338) )
))
(declare-datatypes ((array!22633 0))(
  ( (array!22634 (arr!10785 (Array (_ BitVec 32) ValueCell!4338)) (size!11137 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22633)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13589)

(declare-fun getCurrentListMap!2053 (array!22631 array!22633 (_ BitVec 32) (_ BitVec 32) V!13589 V!13589 (_ BitVec 32) Int) ListLongMap!5273)

(assert (=> b!384302 (= lt!180780 (getCurrentListMap!2053 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180777 () ListLongMap!5273)

(declare-fun lt!180782 () array!22631)

(declare-fun lt!180784 () array!22633)

(assert (=> b!384302 (= lt!180777 (getCurrentListMap!2053 lt!180782 lt!180784 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180778 () ListLongMap!5273)

(declare-fun lt!180785 () ListLongMap!5273)

(assert (=> b!384302 (and (= lt!180778 lt!180785) (= lt!180785 lt!180778))))

(declare-fun lt!180783 () ListLongMap!5273)

(declare-fun lt!180781 () tuple2!6360)

(declare-fun +!987 (ListLongMap!5273 tuple2!6360) ListLongMap!5273)

(assert (=> b!384302 (= lt!180785 (+!987 lt!180783 lt!180781))))

(declare-fun v!373 () V!13589)

(assert (=> b!384302 (= lt!180781 (tuple2!6361 k0!778 v!373))))

(declare-datatypes ((Unit!11860 0))(
  ( (Unit!11861) )
))
(declare-fun lt!180776 () Unit!11860)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!211 (array!22631 array!22633 (_ BitVec 32) (_ BitVec 32) V!13589 V!13589 (_ BitVec 32) (_ BitVec 64) V!13589 (_ BitVec 32) Int) Unit!11860)

(assert (=> b!384302 (= lt!180776 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!211 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!887 (array!22631 array!22633 (_ BitVec 32) (_ BitVec 32) V!13589 V!13589 (_ BitVec 32) Int) ListLongMap!5273)

(assert (=> b!384302 (= lt!180778 (getCurrentListMapNoExtraKeys!887 lt!180782 lt!180784 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384302 (= lt!180784 (array!22634 (store (arr!10785 _values!506) i!548 (ValueCellFull!4338 v!373)) (size!11137 _values!506)))))

(assert (=> b!384302 (= lt!180783 (getCurrentListMapNoExtraKeys!887 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384303 () Bool)

(declare-fun res!218989 () Bool)

(assert (=> b!384303 (=> (not res!218989) (not e!233338))))

(assert (=> b!384303 (= res!218989 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11136 _keys!658))))))

(declare-fun b!384304 () Bool)

(assert (=> b!384304 (= e!233337 true)))

(declare-fun lt!180786 () ListLongMap!5273)

(assert (=> b!384304 (= lt!180786 (+!987 lt!180780 lt!180781))))

(assert (=> b!384304 (= lt!180777 lt!180778)))

(declare-fun b!384305 () Bool)

(declare-fun e!233336 () Bool)

(declare-fun e!233342 () Bool)

(assert (=> b!384305 (= e!233336 (and e!233342 mapRes!15609))))

(declare-fun condMapEmpty!15609 () Bool)

(declare-fun mapDefault!15609 () ValueCell!4338)

(assert (=> b!384305 (= condMapEmpty!15609 (= (arr!10785 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4338)) mapDefault!15609)))))

(declare-fun b!384306 () Bool)

(declare-fun res!218997 () Bool)

(assert (=> b!384306 (=> (not res!218997) (not e!233338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384306 (= res!218997 (validKeyInArray!0 k0!778))))

(declare-fun b!384307 () Bool)

(declare-fun res!218994 () Bool)

(assert (=> b!384307 (=> (not res!218994) (not e!233341))))

(declare-datatypes ((List!6197 0))(
  ( (Nil!6194) (Cons!6193 (h!7049 (_ BitVec 64)) (t!11347 List!6197)) )
))
(declare-fun arrayNoDuplicates!0 (array!22631 (_ BitVec 32) List!6197) Bool)

(assert (=> b!384307 (= res!218994 (arrayNoDuplicates!0 lt!180782 #b00000000000000000000000000000000 Nil!6194))))

(declare-fun mapNonEmpty!15609 () Bool)

(declare-fun tp!30860 () Bool)

(declare-fun e!233339 () Bool)

(assert (=> mapNonEmpty!15609 (= mapRes!15609 (and tp!30860 e!233339))))

(declare-fun mapKey!15609 () (_ BitVec 32))

(declare-fun mapRest!15609 () (Array (_ BitVec 32) ValueCell!4338))

(declare-fun mapValue!15609 () ValueCell!4338)

(assert (=> mapNonEmpty!15609 (= (arr!10785 _values!506) (store mapRest!15609 mapKey!15609 mapValue!15609))))

(declare-fun b!384308 () Bool)

(declare-fun res!218992 () Bool)

(assert (=> b!384308 (=> (not res!218992) (not e!233338))))

(assert (=> b!384308 (= res!218992 (and (= (size!11137 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11136 _keys!658) (size!11137 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384309 () Bool)

(declare-fun res!218991 () Bool)

(assert (=> b!384309 (=> (not res!218991) (not e!233338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22631 (_ BitVec 32)) Bool)

(assert (=> b!384309 (= res!218991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!218996 () Bool)

(assert (=> start!37588 (=> (not res!218996) (not e!233338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37588 (= res!218996 (validMask!0 mask!970))))

(assert (=> start!37588 e!233338))

(declare-fun array_inv!7940 (array!22633) Bool)

(assert (=> start!37588 (and (array_inv!7940 _values!506) e!233336)))

(assert (=> start!37588 tp!30861))

(assert (=> start!37588 true))

(declare-fun tp_is_empty!9363 () Bool)

(assert (=> start!37588 tp_is_empty!9363))

(declare-fun array_inv!7941 (array!22631) Bool)

(assert (=> start!37588 (array_inv!7941 _keys!658)))

(declare-fun b!384310 () Bool)

(assert (=> b!384310 (= e!233342 tp_is_empty!9363)))

(declare-fun b!384311 () Bool)

(assert (=> b!384311 (= e!233338 e!233341)))

(declare-fun res!218993 () Bool)

(assert (=> b!384311 (=> (not res!218993) (not e!233341))))

(assert (=> b!384311 (= res!218993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180782 mask!970))))

(assert (=> b!384311 (= lt!180782 (array!22632 (store (arr!10784 _keys!658) i!548 k0!778) (size!11136 _keys!658)))))

(declare-fun b!384312 () Bool)

(declare-fun res!218995 () Bool)

(assert (=> b!384312 (=> (not res!218995) (not e!233338))))

(assert (=> b!384312 (= res!218995 (or (= (select (arr!10784 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10784 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384313 () Bool)

(assert (=> b!384313 (= e!233339 tp_is_empty!9363)))

(declare-fun b!384314 () Bool)

(declare-fun res!218990 () Bool)

(assert (=> b!384314 (=> (not res!218990) (not e!233338))))

(assert (=> b!384314 (= res!218990 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6194))))

(assert (= (and start!37588 res!218996) b!384308))

(assert (= (and b!384308 res!218992) b!384309))

(assert (= (and b!384309 res!218991) b!384314))

(assert (= (and b!384314 res!218990) b!384303))

(assert (= (and b!384303 res!218989) b!384306))

(assert (= (and b!384306 res!218997) b!384312))

(assert (= (and b!384312 res!218995) b!384301))

(assert (= (and b!384301 res!218999) b!384311))

(assert (= (and b!384311 res!218993) b!384307))

(assert (= (and b!384307 res!218994) b!384302))

(assert (= (and b!384302 (not res!218998)) b!384304))

(assert (= (and b!384305 condMapEmpty!15609) mapIsEmpty!15609))

(assert (= (and b!384305 (not condMapEmpty!15609)) mapNonEmpty!15609))

(get-info :version)

(assert (= (and mapNonEmpty!15609 ((_ is ValueCellFull!4338) mapValue!15609)) b!384313))

(assert (= (and b!384305 ((_ is ValueCellFull!4338) mapDefault!15609)) b!384310))

(assert (= start!37588 b!384305))

(declare-fun m!380995 () Bool)

(assert (=> b!384307 m!380995))

(declare-fun m!380997 () Bool)

(assert (=> b!384302 m!380997))

(declare-fun m!380999 () Bool)

(assert (=> b!384302 m!380999))

(declare-fun m!381001 () Bool)

(assert (=> b!384302 m!381001))

(declare-fun m!381003 () Bool)

(assert (=> b!384302 m!381003))

(declare-fun m!381005 () Bool)

(assert (=> b!384302 m!381005))

(declare-fun m!381007 () Bool)

(assert (=> b!384302 m!381007))

(declare-fun m!381009 () Bool)

(assert (=> b!384302 m!381009))

(declare-fun m!381011 () Bool)

(assert (=> b!384312 m!381011))

(declare-fun m!381013 () Bool)

(assert (=> b!384309 m!381013))

(declare-fun m!381015 () Bool)

(assert (=> b!384304 m!381015))

(declare-fun m!381017 () Bool)

(assert (=> b!384301 m!381017))

(declare-fun m!381019 () Bool)

(assert (=> b!384311 m!381019))

(declare-fun m!381021 () Bool)

(assert (=> b!384311 m!381021))

(declare-fun m!381023 () Bool)

(assert (=> mapNonEmpty!15609 m!381023))

(declare-fun m!381025 () Bool)

(assert (=> start!37588 m!381025))

(declare-fun m!381027 () Bool)

(assert (=> start!37588 m!381027))

(declare-fun m!381029 () Bool)

(assert (=> start!37588 m!381029))

(declare-fun m!381031 () Bool)

(assert (=> b!384306 m!381031))

(declare-fun m!381033 () Bool)

(assert (=> b!384314 m!381033))

(check-sat b_and!15957 (not b!384302) (not b!384306) (not b_next!8715) (not mapNonEmpty!15609) tp_is_empty!9363 (not b!384309) (not b!384307) (not b!384301) (not b!384314) (not b!384311) (not b!384304) (not start!37588))
(check-sat b_and!15957 (not b_next!8715))
