; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37458 () Bool)

(assert start!37458)

(declare-fun b_free!8599 () Bool)

(declare-fun b_next!8599 () Bool)

(assert (=> start!37458 (= b_free!8599 (not b_next!8599))))

(declare-fun tp!30513 () Bool)

(declare-fun b_and!15815 () Bool)

(assert (=> start!37458 (= tp!30513 b_and!15815)))

(declare-fun mapNonEmpty!15435 () Bool)

(declare-fun mapRes!15435 () Bool)

(declare-fun tp!30512 () Bool)

(declare-fun e!231941 () Bool)

(assert (=> mapNonEmpty!15435 (= mapRes!15435 (and tp!30512 e!231941))))

(declare-datatypes ((V!13435 0))(
  ( (V!13436 (val!4668 Int)) )
))
(declare-datatypes ((ValueCell!4280 0))(
  ( (ValueCellFull!4280 (v!6859 V!13435)) (EmptyCell!4280) )
))
(declare-fun mapRest!15435 () (Array (_ BitVec 32) ValueCell!4280))

(declare-fun mapValue!15435 () ValueCell!4280)

(declare-datatypes ((array!22389 0))(
  ( (array!22390 (arr!10663 (Array (_ BitVec 32) ValueCell!4280)) (size!11016 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22389)

(declare-fun mapKey!15435 () (_ BitVec 32))

(assert (=> mapNonEmpty!15435 (= (arr!10663 _values!506) (store mapRest!15435 mapKey!15435 mapValue!15435))))

(declare-fun b!381585 () Bool)

(declare-fun res!216942 () Bool)

(declare-fun e!231936 () Bool)

(assert (=> b!381585 (=> (not res!216942) (not e!231936))))

(declare-datatypes ((array!22391 0))(
  ( (array!22392 (arr!10664 (Array (_ BitVec 32) (_ BitVec 64))) (size!11017 (_ BitVec 32))) )
))
(declare-fun lt!178821 () array!22391)

(declare-datatypes ((List!6070 0))(
  ( (Nil!6067) (Cons!6066 (h!6922 (_ BitVec 64)) (t!11211 List!6070)) )
))
(declare-fun arrayNoDuplicates!0 (array!22391 (_ BitVec 32) List!6070) Bool)

(assert (=> b!381585 (= res!216942 (arrayNoDuplicates!0 lt!178821 #b00000000000000000000000000000000 Nil!6067))))

(declare-fun res!216941 () Bool)

(declare-fun e!231938 () Bool)

(assert (=> start!37458 (=> (not res!216941) (not e!231938))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37458 (= res!216941 (validMask!0 mask!970))))

(assert (=> start!37458 e!231938))

(declare-fun e!231937 () Bool)

(declare-fun array_inv!7852 (array!22389) Bool)

(assert (=> start!37458 (and (array_inv!7852 _values!506) e!231937)))

(assert (=> start!37458 tp!30513))

(assert (=> start!37458 true))

(declare-fun tp_is_empty!9247 () Bool)

(assert (=> start!37458 tp_is_empty!9247))

(declare-fun _keys!658 () array!22391)

(declare-fun array_inv!7853 (array!22391) Bool)

(assert (=> start!37458 (array_inv!7853 _keys!658)))

(declare-fun b!381586 () Bool)

(declare-fun e!231940 () Bool)

(assert (=> b!381586 (= e!231937 (and e!231940 mapRes!15435))))

(declare-fun condMapEmpty!15435 () Bool)

(declare-fun mapDefault!15435 () ValueCell!4280)

(assert (=> b!381586 (= condMapEmpty!15435 (= (arr!10663 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4280)) mapDefault!15435)))))

(declare-fun b!381587 () Bool)

(declare-fun res!216939 () Bool)

(assert (=> b!381587 (=> (not res!216939) (not e!231938))))

(assert (=> b!381587 (= res!216939 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6067))))

(declare-fun b!381588 () Bool)

(declare-fun res!216940 () Bool)

(assert (=> b!381588 (=> (not res!216940) (not e!231938))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381588 (= res!216940 (validKeyInArray!0 k0!778))))

(declare-fun b!381589 () Bool)

(declare-fun e!231939 () Bool)

(assert (=> b!381589 (= e!231939 (bvsle #b00000000000000000000000000000000 (size!11017 _keys!658)))))

(declare-datatypes ((tuple2!6244 0))(
  ( (tuple2!6245 (_1!3133 (_ BitVec 64)) (_2!3133 V!13435)) )
))
(declare-datatypes ((List!6071 0))(
  ( (Nil!6068) (Cons!6067 (h!6923 tuple2!6244) (t!11212 List!6071)) )
))
(declare-datatypes ((ListLongMap!5147 0))(
  ( (ListLongMap!5148 (toList!2589 List!6071)) )
))
(declare-fun lt!178815 () ListLongMap!5147)

(declare-fun lt!178817 () ListLongMap!5147)

(assert (=> b!381589 (= lt!178815 lt!178817)))

(declare-fun b!381590 () Bool)

(assert (=> b!381590 (= e!231940 tp_is_empty!9247)))

(declare-fun b!381591 () Bool)

(declare-fun res!216945 () Bool)

(assert (=> b!381591 (=> (not res!216945) (not e!231938))))

(declare-fun arrayContainsKey!0 (array!22391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381591 (= res!216945 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381592 () Bool)

(assert (=> b!381592 (= e!231936 (not e!231939))))

(declare-fun res!216946 () Bool)

(assert (=> b!381592 (=> res!216946 e!231939)))

(declare-fun lt!178813 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381592 (= res!216946 (or (and (not lt!178813) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178813) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178813)))))

(assert (=> b!381592 (= lt!178813 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13435)

(declare-fun lt!178820 () ListLongMap!5147)

(declare-fun minValue!472 () V!13435)

(declare-fun getCurrentListMap!1977 (array!22391 array!22389 (_ BitVec 32) (_ BitVec 32) V!13435 V!13435 (_ BitVec 32) Int) ListLongMap!5147)

(assert (=> b!381592 (= lt!178820 (getCurrentListMap!1977 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178816 () array!22389)

(assert (=> b!381592 (= lt!178815 (getCurrentListMap!1977 lt!178821 lt!178816 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178814 () ListLongMap!5147)

(assert (=> b!381592 (and (= lt!178817 lt!178814) (= lt!178814 lt!178817))))

(declare-fun lt!178818 () ListLongMap!5147)

(declare-fun v!373 () V!13435)

(declare-fun +!951 (ListLongMap!5147 tuple2!6244) ListLongMap!5147)

(assert (=> b!381592 (= lt!178814 (+!951 lt!178818 (tuple2!6245 k0!778 v!373)))))

(declare-datatypes ((Unit!11760 0))(
  ( (Unit!11761) )
))
(declare-fun lt!178819 () Unit!11760)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!170 (array!22391 array!22389 (_ BitVec 32) (_ BitVec 32) V!13435 V!13435 (_ BitVec 32) (_ BitVec 64) V!13435 (_ BitVec 32) Int) Unit!11760)

(assert (=> b!381592 (= lt!178819 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!170 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!842 (array!22391 array!22389 (_ BitVec 32) (_ BitVec 32) V!13435 V!13435 (_ BitVec 32) Int) ListLongMap!5147)

(assert (=> b!381592 (= lt!178817 (getCurrentListMapNoExtraKeys!842 lt!178821 lt!178816 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381592 (= lt!178816 (array!22390 (store (arr!10663 _values!506) i!548 (ValueCellFull!4280 v!373)) (size!11016 _values!506)))))

(assert (=> b!381592 (= lt!178818 (getCurrentListMapNoExtraKeys!842 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381593 () Bool)

(assert (=> b!381593 (= e!231938 e!231936)))

(declare-fun res!216944 () Bool)

(assert (=> b!381593 (=> (not res!216944) (not e!231936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22391 (_ BitVec 32)) Bool)

(assert (=> b!381593 (= res!216944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178821 mask!970))))

(assert (=> b!381593 (= lt!178821 (array!22392 (store (arr!10664 _keys!658) i!548 k0!778) (size!11017 _keys!658)))))

(declare-fun mapIsEmpty!15435 () Bool)

(assert (=> mapIsEmpty!15435 mapRes!15435))

(declare-fun b!381594 () Bool)

(assert (=> b!381594 (= e!231941 tp_is_empty!9247)))

(declare-fun b!381595 () Bool)

(declare-fun res!216938 () Bool)

(assert (=> b!381595 (=> (not res!216938) (not e!231938))))

(assert (=> b!381595 (= res!216938 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11017 _keys!658))))))

(declare-fun b!381596 () Bool)

(declare-fun res!216943 () Bool)

(assert (=> b!381596 (=> (not res!216943) (not e!231938))))

(assert (=> b!381596 (= res!216943 (and (= (size!11016 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11017 _keys!658) (size!11016 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381597 () Bool)

(declare-fun res!216937 () Bool)

(assert (=> b!381597 (=> (not res!216937) (not e!231938))))

(assert (=> b!381597 (= res!216937 (or (= (select (arr!10664 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10664 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381598 () Bool)

(declare-fun res!216947 () Bool)

(assert (=> b!381598 (=> (not res!216947) (not e!231938))))

(assert (=> b!381598 (= res!216947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37458 res!216941) b!381596))

(assert (= (and b!381596 res!216943) b!381598))

(assert (= (and b!381598 res!216947) b!381587))

(assert (= (and b!381587 res!216939) b!381595))

(assert (= (and b!381595 res!216938) b!381588))

(assert (= (and b!381588 res!216940) b!381597))

(assert (= (and b!381597 res!216937) b!381591))

(assert (= (and b!381591 res!216945) b!381593))

(assert (= (and b!381593 res!216944) b!381585))

(assert (= (and b!381585 res!216942) b!381592))

(assert (= (and b!381592 (not res!216946)) b!381589))

(assert (= (and b!381586 condMapEmpty!15435) mapIsEmpty!15435))

(assert (= (and b!381586 (not condMapEmpty!15435)) mapNonEmpty!15435))

(get-info :version)

(assert (= (and mapNonEmpty!15435 ((_ is ValueCellFull!4280) mapValue!15435)) b!381594))

(assert (= (and b!381586 ((_ is ValueCellFull!4280) mapDefault!15435)) b!381590))

(assert (= start!37458 b!381586))

(declare-fun m!378011 () Bool)

(assert (=> b!381591 m!378011))

(declare-fun m!378013 () Bool)

(assert (=> b!381593 m!378013))

(declare-fun m!378015 () Bool)

(assert (=> b!381593 m!378015))

(declare-fun m!378017 () Bool)

(assert (=> b!381585 m!378017))

(declare-fun m!378019 () Bool)

(assert (=> b!381597 m!378019))

(declare-fun m!378021 () Bool)

(assert (=> mapNonEmpty!15435 m!378021))

(declare-fun m!378023 () Bool)

(assert (=> b!381588 m!378023))

(declare-fun m!378025 () Bool)

(assert (=> start!37458 m!378025))

(declare-fun m!378027 () Bool)

(assert (=> start!37458 m!378027))

(declare-fun m!378029 () Bool)

(assert (=> start!37458 m!378029))

(declare-fun m!378031 () Bool)

(assert (=> b!381598 m!378031))

(declare-fun m!378033 () Bool)

(assert (=> b!381592 m!378033))

(declare-fun m!378035 () Bool)

(assert (=> b!381592 m!378035))

(declare-fun m!378037 () Bool)

(assert (=> b!381592 m!378037))

(declare-fun m!378039 () Bool)

(assert (=> b!381592 m!378039))

(declare-fun m!378041 () Bool)

(assert (=> b!381592 m!378041))

(declare-fun m!378043 () Bool)

(assert (=> b!381592 m!378043))

(declare-fun m!378045 () Bool)

(assert (=> b!381592 m!378045))

(declare-fun m!378047 () Bool)

(assert (=> b!381587 m!378047))

(check-sat b_and!15815 (not b!381592) (not b!381588) (not b!381593) (not b!381585) (not b_next!8599) (not mapNonEmpty!15435) (not start!37458) (not b!381598) tp_is_empty!9247 (not b!381587) (not b!381591))
(check-sat b_and!15815 (not b_next!8599))
