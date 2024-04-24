; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37116 () Bool)

(assert start!37116)

(declare-fun b_free!8257 () Bool)

(declare-fun b_next!8257 () Bool)

(assert (=> start!37116 (= b_free!8257 (not b_next!8257))))

(declare-fun tp!29486 () Bool)

(declare-fun b_and!15513 () Bool)

(assert (=> start!37116 (= tp!29486 b_and!15513)))

(declare-fun b!374168 () Bool)

(declare-fun e!228053 () Bool)

(declare-fun tp_is_empty!8905 () Bool)

(assert (=> b!374168 (= e!228053 tp_is_empty!8905)))

(declare-fun b!374169 () Bool)

(declare-fun res!210967 () Bool)

(declare-fun e!228048 () Bool)

(assert (=> b!374169 (=> (not res!210967) (not e!228048))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374169 (= res!210967 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!14922 () Bool)

(declare-fun mapRes!14922 () Bool)

(assert (=> mapIsEmpty!14922 mapRes!14922))

(declare-fun b!374170 () Bool)

(declare-fun res!210966 () Bool)

(assert (=> b!374170 (=> (not res!210966) (not e!228048))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21730 0))(
  ( (array!21731 (arr!10333 (Array (_ BitVec 32) (_ BitVec 64))) (size!10685 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21730)

(assert (=> b!374170 (= res!210966 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10685 _keys!658))))))

(declare-fun b!374171 () Bool)

(declare-fun e!228049 () Bool)

(assert (=> b!374171 (= e!228049 true)))

(declare-datatypes ((V!12979 0))(
  ( (V!12980 (val!4497 Int)) )
))
(declare-datatypes ((tuple2!5878 0))(
  ( (tuple2!5879 (_1!2950 (_ BitVec 64)) (_2!2950 V!12979)) )
))
(declare-datatypes ((List!5722 0))(
  ( (Nil!5719) (Cons!5718 (h!6574 tuple2!5878) (t!10864 List!5722)) )
))
(declare-datatypes ((ListLongMap!4793 0))(
  ( (ListLongMap!4794 (toList!2412 List!5722)) )
))
(declare-fun lt!172388 () ListLongMap!4793)

(declare-fun lt!172379 () ListLongMap!4793)

(declare-fun lt!172389 () tuple2!5878)

(declare-fun lt!172387 () tuple2!5878)

(declare-fun +!808 (ListLongMap!4793 tuple2!5878) ListLongMap!4793)

(assert (=> b!374171 (= (+!808 lt!172388 lt!172387) (+!808 lt!172379 lt!172389))))

(declare-fun v!373 () V!12979)

(declare-fun lt!172380 () ListLongMap!4793)

(declare-datatypes ((Unit!11505 0))(
  ( (Unit!11506) )
))
(declare-fun lt!172382 () Unit!11505)

(declare-fun minValue!472 () V!12979)

(declare-fun addCommutativeForDiffKeys!236 (ListLongMap!4793 (_ BitVec 64) V!12979 (_ BitVec 64) V!12979) Unit!11505)

(assert (=> b!374171 (= lt!172382 (addCommutativeForDiffKeys!236 lt!172380 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374172 () Bool)

(declare-fun res!210972 () Bool)

(declare-fun e!228047 () Bool)

(assert (=> b!374172 (=> (not res!210972) (not e!228047))))

(declare-fun lt!172385 () array!21730)

(declare-datatypes ((List!5723 0))(
  ( (Nil!5720) (Cons!5719 (h!6575 (_ BitVec 64)) (t!10865 List!5723)) )
))
(declare-fun arrayNoDuplicates!0 (array!21730 (_ BitVec 32) List!5723) Bool)

(assert (=> b!374172 (= res!210972 (arrayNoDuplicates!0 lt!172385 #b00000000000000000000000000000000 Nil!5720))))

(declare-fun b!374173 () Bool)

(declare-fun res!210964 () Bool)

(assert (=> b!374173 (=> (not res!210964) (not e!228048))))

(assert (=> b!374173 (= res!210964 (or (= (select (arr!10333 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10333 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374174 () Bool)

(declare-fun e!228052 () Bool)

(assert (=> b!374174 (= e!228052 tp_is_empty!8905)))

(declare-fun b!374175 () Bool)

(declare-fun res!210963 () Bool)

(assert (=> b!374175 (=> (not res!210963) (not e!228048))))

(assert (=> b!374175 (= res!210963 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5720))))

(declare-fun b!374177 () Bool)

(declare-fun e!228050 () Bool)

(assert (=> b!374177 (= e!228047 (not e!228050))))

(declare-fun res!210965 () Bool)

(assert (=> b!374177 (=> res!210965 e!228050)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374177 (= res!210965 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4109 0))(
  ( (ValueCellFull!4109 (v!6695 V!12979)) (EmptyCell!4109) )
))
(declare-datatypes ((array!21732 0))(
  ( (array!21733 (arr!10334 (Array (_ BitVec 32) ValueCell!4109)) (size!10686 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21732)

(declare-fun lt!172378 () ListLongMap!4793)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12979)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun getCurrentListMap!1871 (array!21730 array!21732 (_ BitVec 32) (_ BitVec 32) V!12979 V!12979 (_ BitVec 32) Int) ListLongMap!4793)

(assert (=> b!374177 (= lt!172378 (getCurrentListMap!1871 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172386 () array!21732)

(declare-fun lt!172392 () ListLongMap!4793)

(assert (=> b!374177 (= lt!172392 (getCurrentListMap!1871 lt!172385 lt!172386 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172383 () ListLongMap!4793)

(declare-fun lt!172381 () ListLongMap!4793)

(assert (=> b!374177 (and (= lt!172383 lt!172381) (= lt!172381 lt!172383))))

(declare-fun lt!172393 () ListLongMap!4793)

(assert (=> b!374177 (= lt!172381 (+!808 lt!172393 lt!172389))))

(assert (=> b!374177 (= lt!172389 (tuple2!5879 k0!778 v!373))))

(declare-fun lt!172384 () Unit!11505)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!58 (array!21730 array!21732 (_ BitVec 32) (_ BitVec 32) V!12979 V!12979 (_ BitVec 32) (_ BitVec 64) V!12979 (_ BitVec 32) Int) Unit!11505)

(assert (=> b!374177 (= lt!172384 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!58 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!718 (array!21730 array!21732 (_ BitVec 32) (_ BitVec 32) V!12979 V!12979 (_ BitVec 32) Int) ListLongMap!4793)

(assert (=> b!374177 (= lt!172383 (getCurrentListMapNoExtraKeys!718 lt!172385 lt!172386 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374177 (= lt!172386 (array!21733 (store (arr!10334 _values!506) i!548 (ValueCellFull!4109 v!373)) (size!10686 _values!506)))))

(assert (=> b!374177 (= lt!172393 (getCurrentListMapNoExtraKeys!718 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374178 () Bool)

(declare-fun e!228054 () Bool)

(assert (=> b!374178 (= e!228054 (and e!228052 mapRes!14922))))

(declare-fun condMapEmpty!14922 () Bool)

(declare-fun mapDefault!14922 () ValueCell!4109)

(assert (=> b!374178 (= condMapEmpty!14922 (= (arr!10334 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4109)) mapDefault!14922)))))

(declare-fun b!374179 () Bool)

(assert (=> b!374179 (= e!228050 e!228049)))

(declare-fun res!210968 () Bool)

(assert (=> b!374179 (=> res!210968 e!228049)))

(assert (=> b!374179 (= res!210968 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172377 () ListLongMap!4793)

(assert (=> b!374179 (= lt!172377 lt!172388)))

(assert (=> b!374179 (= lt!172388 (+!808 lt!172380 lt!172389))))

(declare-fun lt!172390 () Unit!11505)

(assert (=> b!374179 (= lt!172390 (addCommutativeForDiffKeys!236 lt!172393 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!374179 (= lt!172392 (+!808 lt!172377 lt!172387))))

(declare-fun lt!172391 () tuple2!5878)

(assert (=> b!374179 (= lt!172377 (+!808 lt!172381 lt!172391))))

(assert (=> b!374179 (= lt!172378 lt!172379)))

(assert (=> b!374179 (= lt!172379 (+!808 lt!172380 lt!172387))))

(assert (=> b!374179 (= lt!172380 (+!808 lt!172393 lt!172391))))

(assert (=> b!374179 (= lt!172392 (+!808 (+!808 lt!172383 lt!172391) lt!172387))))

(assert (=> b!374179 (= lt!172387 (tuple2!5879 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374179 (= lt!172391 (tuple2!5879 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!14922 () Bool)

(declare-fun tp!29487 () Bool)

(assert (=> mapNonEmpty!14922 (= mapRes!14922 (and tp!29487 e!228053))))

(declare-fun mapRest!14922 () (Array (_ BitVec 32) ValueCell!4109))

(declare-fun mapKey!14922 () (_ BitVec 32))

(declare-fun mapValue!14922 () ValueCell!4109)

(assert (=> mapNonEmpty!14922 (= (arr!10334 _values!506) (store mapRest!14922 mapKey!14922 mapValue!14922))))

(declare-fun b!374180 () Bool)

(declare-fun res!210971 () Bool)

(assert (=> b!374180 (=> (not res!210971) (not e!228048))))

(assert (=> b!374180 (= res!210971 (and (= (size!10686 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10685 _keys!658) (size!10686 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374181 () Bool)

(declare-fun res!210974 () Bool)

(assert (=> b!374181 (=> (not res!210974) (not e!228048))))

(declare-fun arrayContainsKey!0 (array!21730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374181 (= res!210974 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374182 () Bool)

(assert (=> b!374182 (= e!228048 e!228047)))

(declare-fun res!210969 () Bool)

(assert (=> b!374182 (=> (not res!210969) (not e!228047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21730 (_ BitVec 32)) Bool)

(assert (=> b!374182 (= res!210969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172385 mask!970))))

(assert (=> b!374182 (= lt!172385 (array!21731 (store (arr!10333 _keys!658) i!548 k0!778) (size!10685 _keys!658)))))

(declare-fun res!210970 () Bool)

(assert (=> start!37116 (=> (not res!210970) (not e!228048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37116 (= res!210970 (validMask!0 mask!970))))

(assert (=> start!37116 e!228048))

(declare-fun array_inv!7666 (array!21732) Bool)

(assert (=> start!37116 (and (array_inv!7666 _values!506) e!228054)))

(assert (=> start!37116 tp!29486))

(assert (=> start!37116 true))

(assert (=> start!37116 tp_is_empty!8905))

(declare-fun array_inv!7667 (array!21730) Bool)

(assert (=> start!37116 (array_inv!7667 _keys!658)))

(declare-fun b!374176 () Bool)

(declare-fun res!210973 () Bool)

(assert (=> b!374176 (=> (not res!210973) (not e!228048))))

(assert (=> b!374176 (= res!210973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37116 res!210970) b!374180))

(assert (= (and b!374180 res!210971) b!374176))

(assert (= (and b!374176 res!210973) b!374175))

(assert (= (and b!374175 res!210963) b!374170))

(assert (= (and b!374170 res!210966) b!374169))

(assert (= (and b!374169 res!210967) b!374173))

(assert (= (and b!374173 res!210964) b!374181))

(assert (= (and b!374181 res!210974) b!374182))

(assert (= (and b!374182 res!210969) b!374172))

(assert (= (and b!374172 res!210972) b!374177))

(assert (= (and b!374177 (not res!210965)) b!374179))

(assert (= (and b!374179 (not res!210968)) b!374171))

(assert (= (and b!374178 condMapEmpty!14922) mapIsEmpty!14922))

(assert (= (and b!374178 (not condMapEmpty!14922)) mapNonEmpty!14922))

(get-info :version)

(assert (= (and mapNonEmpty!14922 ((_ is ValueCellFull!4109) mapValue!14922)) b!374168))

(assert (= (and b!374178 ((_ is ValueCellFull!4109) mapDefault!14922)) b!374174))

(assert (= start!37116 b!374178))

(declare-fun m!370625 () Bool)

(assert (=> b!374181 m!370625))

(declare-fun m!370627 () Bool)

(assert (=> b!374182 m!370627))

(declare-fun m!370629 () Bool)

(assert (=> b!374182 m!370629))

(declare-fun m!370631 () Bool)

(assert (=> b!374176 m!370631))

(declare-fun m!370633 () Bool)

(assert (=> b!374177 m!370633))

(declare-fun m!370635 () Bool)

(assert (=> b!374177 m!370635))

(declare-fun m!370637 () Bool)

(assert (=> b!374177 m!370637))

(declare-fun m!370639 () Bool)

(assert (=> b!374177 m!370639))

(declare-fun m!370641 () Bool)

(assert (=> b!374177 m!370641))

(declare-fun m!370643 () Bool)

(assert (=> b!374177 m!370643))

(declare-fun m!370645 () Bool)

(assert (=> b!374177 m!370645))

(declare-fun m!370647 () Bool)

(assert (=> mapNonEmpty!14922 m!370647))

(declare-fun m!370649 () Bool)

(assert (=> b!374175 m!370649))

(declare-fun m!370651 () Bool)

(assert (=> b!374169 m!370651))

(declare-fun m!370653 () Bool)

(assert (=> b!374171 m!370653))

(declare-fun m!370655 () Bool)

(assert (=> b!374171 m!370655))

(declare-fun m!370657 () Bool)

(assert (=> b!374171 m!370657))

(declare-fun m!370659 () Bool)

(assert (=> start!37116 m!370659))

(declare-fun m!370661 () Bool)

(assert (=> start!37116 m!370661))

(declare-fun m!370663 () Bool)

(assert (=> start!37116 m!370663))

(declare-fun m!370665 () Bool)

(assert (=> b!374173 m!370665))

(declare-fun m!370667 () Bool)

(assert (=> b!374179 m!370667))

(declare-fun m!370669 () Bool)

(assert (=> b!374179 m!370669))

(declare-fun m!370671 () Bool)

(assert (=> b!374179 m!370671))

(assert (=> b!374179 m!370667))

(declare-fun m!370673 () Bool)

(assert (=> b!374179 m!370673))

(declare-fun m!370675 () Bool)

(assert (=> b!374179 m!370675))

(declare-fun m!370677 () Bool)

(assert (=> b!374179 m!370677))

(declare-fun m!370679 () Bool)

(assert (=> b!374179 m!370679))

(declare-fun m!370681 () Bool)

(assert (=> b!374179 m!370681))

(declare-fun m!370683 () Bool)

(assert (=> b!374172 m!370683))

(check-sat (not b!374177) b_and!15513 (not b!374181) (not start!37116) (not b!374172) tp_is_empty!8905 (not b_next!8257) (not b!374175) (not b!374169) (not mapNonEmpty!14922) (not b!374171) (not b!374179) (not b!374182) (not b!374176))
(check-sat b_and!15513 (not b_next!8257))
