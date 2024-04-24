; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37602 () Bool)

(assert start!37602)

(declare-fun b_free!8743 () Bool)

(declare-fun b_next!8743 () Bool)

(assert (=> start!37602 (= b_free!8743 (not b_next!8743))))

(declare-fun tp!30944 () Bool)

(declare-fun b_and!15999 () Bool)

(assert (=> start!37602 (= tp!30944 b_and!15999)))

(declare-fun b!384840 () Bool)

(declare-fun res!219454 () Bool)

(declare-fun e!233598 () Bool)

(assert (=> b!384840 (=> (not res!219454) (not e!233598))))

(declare-datatypes ((array!22674 0))(
  ( (array!22675 (arr!10805 (Array (_ BitVec 32) (_ BitVec 64))) (size!11157 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22674)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22674 (_ BitVec 32)) Bool)

(assert (=> b!384840 (= res!219454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384841 () Bool)

(declare-fun e!233602 () Bool)

(declare-fun tp_is_empty!9391 () Bool)

(assert (=> b!384841 (= e!233602 tp_is_empty!9391)))

(declare-fun b!384842 () Bool)

(declare-fun e!233601 () Bool)

(assert (=> b!384842 (= e!233598 e!233601)))

(declare-fun res!219448 () Bool)

(assert (=> b!384842 (=> (not res!219448) (not e!233601))))

(declare-fun lt!181259 () array!22674)

(assert (=> b!384842 (= res!219448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181259 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384842 (= lt!181259 (array!22675 (store (arr!10805 _keys!658) i!548 k0!778) (size!11157 _keys!658)))))

(declare-fun b!384843 () Bool)

(declare-fun res!219449 () Bool)

(assert (=> b!384843 (=> (not res!219449) (not e!233598))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13627 0))(
  ( (V!13628 (val!4740 Int)) )
))
(declare-datatypes ((ValueCell!4352 0))(
  ( (ValueCellFull!4352 (v!6938 V!13627)) (EmptyCell!4352) )
))
(declare-datatypes ((array!22676 0))(
  ( (array!22677 (arr!10806 (Array (_ BitVec 32) ValueCell!4352)) (size!11158 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22676)

(assert (=> b!384843 (= res!219449 (and (= (size!11158 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11157 _keys!658) (size!11158 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384844 () Bool)

(declare-fun res!219455 () Bool)

(assert (=> b!384844 (=> (not res!219455) (not e!233598))))

(assert (=> b!384844 (= res!219455 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11157 _keys!658))))))

(declare-fun b!384845 () Bool)

(declare-fun res!219456 () Bool)

(assert (=> b!384845 (=> (not res!219456) (not e!233598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384845 (= res!219456 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15651 () Bool)

(declare-fun mapRes!15651 () Bool)

(declare-fun tp!30945 () Bool)

(assert (=> mapNonEmpty!15651 (= mapRes!15651 (and tp!30945 e!233602))))

(declare-fun mapValue!15651 () ValueCell!4352)

(declare-fun mapKey!15651 () (_ BitVec 32))

(declare-fun mapRest!15651 () (Array (_ BitVec 32) ValueCell!4352))

(assert (=> mapNonEmpty!15651 (= (arr!10806 _values!506) (store mapRest!15651 mapKey!15651 mapValue!15651))))

(declare-fun b!384846 () Bool)

(declare-fun e!233603 () Bool)

(declare-fun e!233604 () Bool)

(assert (=> b!384846 (= e!233603 (and e!233604 mapRes!15651))))

(declare-fun condMapEmpty!15651 () Bool)

(declare-fun mapDefault!15651 () ValueCell!4352)

(assert (=> b!384846 (= condMapEmpty!15651 (= (arr!10806 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4352)) mapDefault!15651)))))

(declare-fun b!384847 () Bool)

(assert (=> b!384847 (= e!233604 tp_is_empty!9391)))

(declare-fun b!384848 () Bool)

(declare-fun res!219452 () Bool)

(assert (=> b!384848 (=> (not res!219452) (not e!233601))))

(declare-datatypes ((List!6089 0))(
  ( (Nil!6086) (Cons!6085 (h!6941 (_ BitVec 64)) (t!11231 List!6089)) )
))
(declare-fun arrayNoDuplicates!0 (array!22674 (_ BitVec 32) List!6089) Bool)

(assert (=> b!384848 (= res!219452 (arrayNoDuplicates!0 lt!181259 #b00000000000000000000000000000000 Nil!6086))))

(declare-fun b!384849 () Bool)

(declare-fun res!219451 () Bool)

(assert (=> b!384849 (=> (not res!219451) (not e!233598))))

(assert (=> b!384849 (= res!219451 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6086))))

(declare-fun mapIsEmpty!15651 () Bool)

(assert (=> mapIsEmpty!15651 mapRes!15651))

(declare-fun b!384850 () Bool)

(declare-fun res!219450 () Bool)

(assert (=> b!384850 (=> (not res!219450) (not e!233598))))

(assert (=> b!384850 (= res!219450 (or (= (select (arr!10805 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10805 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384851 () Bool)

(declare-fun res!219458 () Bool)

(assert (=> b!384851 (=> (not res!219458) (not e!233598))))

(declare-fun arrayContainsKey!0 (array!22674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384851 (= res!219458 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384852 () Bool)

(declare-fun e!233599 () Bool)

(assert (=> b!384852 (= e!233601 (not e!233599))))

(declare-fun res!219457 () Bool)

(assert (=> b!384852 (=> res!219457 e!233599)))

(declare-fun lt!181263 () Bool)

(assert (=> b!384852 (= res!219457 (or (and (not lt!181263) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181263) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181263)))))

(assert (=> b!384852 (= lt!181263 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6252 0))(
  ( (tuple2!6253 (_1!3137 (_ BitVec 64)) (_2!3137 V!13627)) )
))
(declare-datatypes ((List!6090 0))(
  ( (Nil!6087) (Cons!6086 (h!6942 tuple2!6252) (t!11232 List!6090)) )
))
(declare-datatypes ((ListLongMap!5167 0))(
  ( (ListLongMap!5168 (toList!2599 List!6090)) )
))
(declare-fun lt!181258 () ListLongMap!5167)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13627)

(declare-fun minValue!472 () V!13627)

(declare-fun getCurrentListMap!2029 (array!22674 array!22676 (_ BitVec 32) (_ BitVec 32) V!13627 V!13627 (_ BitVec 32) Int) ListLongMap!5167)

(assert (=> b!384852 (= lt!181258 (getCurrentListMap!2029 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181265 () array!22676)

(declare-fun lt!181267 () ListLongMap!5167)

(assert (=> b!384852 (= lt!181267 (getCurrentListMap!2029 lt!181259 lt!181265 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181261 () ListLongMap!5167)

(declare-fun lt!181260 () ListLongMap!5167)

(assert (=> b!384852 (and (= lt!181261 lt!181260) (= lt!181260 lt!181261))))

(declare-fun lt!181264 () ListLongMap!5167)

(declare-fun lt!181266 () tuple2!6252)

(declare-fun +!991 (ListLongMap!5167 tuple2!6252) ListLongMap!5167)

(assert (=> b!384852 (= lt!181260 (+!991 lt!181264 lt!181266))))

(declare-fun v!373 () V!13627)

(assert (=> b!384852 (= lt!181266 (tuple2!6253 k0!778 v!373))))

(declare-datatypes ((Unit!11853 0))(
  ( (Unit!11854) )
))
(declare-fun lt!181262 () Unit!11853)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!216 (array!22674 array!22676 (_ BitVec 32) (_ BitVec 32) V!13627 V!13627 (_ BitVec 32) (_ BitVec 64) V!13627 (_ BitVec 32) Int) Unit!11853)

(assert (=> b!384852 (= lt!181262 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!216 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!876 (array!22674 array!22676 (_ BitVec 32) (_ BitVec 32) V!13627 V!13627 (_ BitVec 32) Int) ListLongMap!5167)

(assert (=> b!384852 (= lt!181261 (getCurrentListMapNoExtraKeys!876 lt!181259 lt!181265 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384852 (= lt!181265 (array!22677 (store (arr!10806 _values!506) i!548 (ValueCellFull!4352 v!373)) (size!11158 _values!506)))))

(assert (=> b!384852 (= lt!181264 (getCurrentListMapNoExtraKeys!876 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384853 () Bool)

(assert (=> b!384853 (= e!233599 true)))

(declare-fun lt!181257 () ListLongMap!5167)

(assert (=> b!384853 (= lt!181257 (+!991 lt!181258 lt!181266))))

(assert (=> b!384853 (= lt!181267 lt!181261)))

(declare-fun res!219453 () Bool)

(assert (=> start!37602 (=> (not res!219453) (not e!233598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37602 (= res!219453 (validMask!0 mask!970))))

(assert (=> start!37602 e!233598))

(declare-fun array_inv!7992 (array!22676) Bool)

(assert (=> start!37602 (and (array_inv!7992 _values!506) e!233603)))

(assert (=> start!37602 tp!30944))

(assert (=> start!37602 true))

(assert (=> start!37602 tp_is_empty!9391))

(declare-fun array_inv!7993 (array!22674) Bool)

(assert (=> start!37602 (array_inv!7993 _keys!658)))

(assert (= (and start!37602 res!219453) b!384843))

(assert (= (and b!384843 res!219449) b!384840))

(assert (= (and b!384840 res!219454) b!384849))

(assert (= (and b!384849 res!219451) b!384844))

(assert (= (and b!384844 res!219455) b!384845))

(assert (= (and b!384845 res!219456) b!384850))

(assert (= (and b!384850 res!219450) b!384851))

(assert (= (and b!384851 res!219458) b!384842))

(assert (= (and b!384842 res!219448) b!384848))

(assert (= (and b!384848 res!219452) b!384852))

(assert (= (and b!384852 (not res!219457)) b!384853))

(assert (= (and b!384846 condMapEmpty!15651) mapIsEmpty!15651))

(assert (= (and b!384846 (not condMapEmpty!15651)) mapNonEmpty!15651))

(get-info :version)

(assert (= (and mapNonEmpty!15651 ((_ is ValueCellFull!4352) mapValue!15651)) b!384841))

(assert (= (and b!384846 ((_ is ValueCellFull!4352) mapDefault!15651)) b!384847))

(assert (= start!37602 b!384846))

(declare-fun m!381785 () Bool)

(assert (=> mapNonEmpty!15651 m!381785))

(declare-fun m!381787 () Bool)

(assert (=> b!384845 m!381787))

(declare-fun m!381789 () Bool)

(assert (=> b!384853 m!381789))

(declare-fun m!381791 () Bool)

(assert (=> start!37602 m!381791))

(declare-fun m!381793 () Bool)

(assert (=> start!37602 m!381793))

(declare-fun m!381795 () Bool)

(assert (=> start!37602 m!381795))

(declare-fun m!381797 () Bool)

(assert (=> b!384842 m!381797))

(declare-fun m!381799 () Bool)

(assert (=> b!384842 m!381799))

(declare-fun m!381801 () Bool)

(assert (=> b!384849 m!381801))

(declare-fun m!381803 () Bool)

(assert (=> b!384848 m!381803))

(declare-fun m!381805 () Bool)

(assert (=> b!384850 m!381805))

(declare-fun m!381807 () Bool)

(assert (=> b!384852 m!381807))

(declare-fun m!381809 () Bool)

(assert (=> b!384852 m!381809))

(declare-fun m!381811 () Bool)

(assert (=> b!384852 m!381811))

(declare-fun m!381813 () Bool)

(assert (=> b!384852 m!381813))

(declare-fun m!381815 () Bool)

(assert (=> b!384852 m!381815))

(declare-fun m!381817 () Bool)

(assert (=> b!384852 m!381817))

(declare-fun m!381819 () Bool)

(assert (=> b!384852 m!381819))

(declare-fun m!381821 () Bool)

(assert (=> b!384851 m!381821))

(declare-fun m!381823 () Bool)

(assert (=> b!384840 m!381823))

(check-sat (not b!384842) (not b!384848) (not b!384851) (not b!384845) tp_is_empty!9391 (not start!37602) (not b!384849) (not b_next!8743) (not mapNonEmpty!15651) b_and!15999 (not b!384840) (not b!384853) (not b!384852))
(check-sat b_and!15999 (not b_next!8743))
