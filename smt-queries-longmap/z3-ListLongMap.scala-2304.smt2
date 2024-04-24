; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37272 () Bool)

(assert start!37272)

(declare-fun b_free!8413 () Bool)

(declare-fun b_next!8413 () Bool)

(assert (=> start!37272 (= b_free!8413 (not b_next!8413))))

(declare-fun tp!29954 () Bool)

(declare-fun b_and!15669 () Bool)

(assert (=> start!37272 (= tp!29954 b_and!15669)))

(declare-fun res!213781 () Bool)

(declare-fun e!229921 () Bool)

(assert (=> start!37272 (=> (not res!213781) (not e!229921))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37272 (= res!213781 (validMask!0 mask!970))))

(assert (=> start!37272 e!229921))

(declare-datatypes ((V!13187 0))(
  ( (V!13188 (val!4575 Int)) )
))
(declare-datatypes ((ValueCell!4187 0))(
  ( (ValueCellFull!4187 (v!6773 V!13187)) (EmptyCell!4187) )
))
(declare-datatypes ((array!22038 0))(
  ( (array!22039 (arr!10487 (Array (_ BitVec 32) ValueCell!4187)) (size!10839 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22038)

(declare-fun e!229925 () Bool)

(declare-fun array_inv!7778 (array!22038) Bool)

(assert (=> start!37272 (and (array_inv!7778 _values!506) e!229925)))

(assert (=> start!37272 tp!29954))

(assert (=> start!37272 true))

(declare-fun tp_is_empty!9061 () Bool)

(assert (=> start!37272 tp_is_empty!9061))

(declare-datatypes ((array!22040 0))(
  ( (array!22041 (arr!10488 (Array (_ BitVec 32) (_ BitVec 64))) (size!10840 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22040)

(declare-fun array_inv!7779 (array!22040) Bool)

(assert (=> start!37272 (array_inv!7779 _keys!658)))

(declare-fun b!377687 () Bool)

(declare-fun e!229926 () Bool)

(assert (=> b!377687 (= e!229926 true)))

(declare-datatypes ((tuple2!6010 0))(
  ( (tuple2!6011 (_1!3016 (_ BitVec 64)) (_2!3016 V!13187)) )
))
(declare-datatypes ((List!5849 0))(
  ( (Nil!5846) (Cons!5845 (h!6701 tuple2!6010) (t!10991 List!5849)) )
))
(declare-datatypes ((ListLongMap!4925 0))(
  ( (ListLongMap!4926 (toList!2478 List!5849)) )
))
(declare-fun lt!175782 () ListLongMap!4925)

(declare-fun lt!175779 () ListLongMap!4925)

(declare-fun lt!175783 () tuple2!6010)

(declare-fun +!874 (ListLongMap!4925 tuple2!6010) ListLongMap!4925)

(assert (=> b!377687 (= lt!175782 (+!874 lt!175779 lt!175783))))

(declare-fun v!373 () V!13187)

(declare-fun lt!175774 () ListLongMap!4925)

(declare-fun zeroValue!472 () V!13187)

(declare-datatypes ((Unit!11631 0))(
  ( (Unit!11632) )
))
(declare-fun lt!175775 () Unit!11631)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!290 (ListLongMap!4925 (_ BitVec 64) V!13187 (_ BitVec 64) V!13187) Unit!11631)

(assert (=> b!377687 (= lt!175775 (addCommutativeForDiffKeys!290 lt!175774 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377688 () Bool)

(declare-fun e!229923 () Bool)

(assert (=> b!377688 (= e!229921 e!229923)))

(declare-fun res!213784 () Bool)

(assert (=> b!377688 (=> (not res!213784) (not e!229923))))

(declare-fun lt!175771 () array!22040)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22040 (_ BitVec 32)) Bool)

(assert (=> b!377688 (= res!213784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175771 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377688 (= lt!175771 (array!22041 (store (arr!10488 _keys!658) i!548 k0!778) (size!10840 _keys!658)))))

(declare-fun b!377689 () Bool)

(declare-fun e!229920 () Bool)

(declare-fun mapRes!15156 () Bool)

(assert (=> b!377689 (= e!229925 (and e!229920 mapRes!15156))))

(declare-fun condMapEmpty!15156 () Bool)

(declare-fun mapDefault!15156 () ValueCell!4187)

(assert (=> b!377689 (= condMapEmpty!15156 (= (arr!10487 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4187)) mapDefault!15156)))))

(declare-fun b!377690 () Bool)

(declare-fun res!213780 () Bool)

(assert (=> b!377690 (=> (not res!213780) (not e!229923))))

(declare-datatypes ((List!5850 0))(
  ( (Nil!5847) (Cons!5846 (h!6702 (_ BitVec 64)) (t!10992 List!5850)) )
))
(declare-fun arrayNoDuplicates!0 (array!22040 (_ BitVec 32) List!5850) Bool)

(assert (=> b!377690 (= res!213780 (arrayNoDuplicates!0 lt!175771 #b00000000000000000000000000000000 Nil!5847))))

(declare-fun b!377691 () Bool)

(declare-fun e!229919 () Bool)

(assert (=> b!377691 (= e!229919 e!229926)))

(declare-fun res!213783 () Bool)

(assert (=> b!377691 (=> res!213783 e!229926)))

(assert (=> b!377691 (= res!213783 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!175781 () ListLongMap!4925)

(assert (=> b!377691 (= lt!175781 lt!175782)))

(declare-fun lt!175777 () ListLongMap!4925)

(declare-fun lt!175773 () tuple2!6010)

(assert (=> b!377691 (= lt!175782 (+!874 lt!175777 lt!175773))))

(declare-fun lt!175780 () ListLongMap!4925)

(assert (=> b!377691 (= lt!175780 lt!175779)))

(assert (=> b!377691 (= lt!175779 (+!874 lt!175774 lt!175773))))

(declare-fun lt!175778 () ListLongMap!4925)

(assert (=> b!377691 (= lt!175781 (+!874 lt!175778 lt!175773))))

(assert (=> b!377691 (= lt!175773 (tuple2!6011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377692 () Bool)

(declare-fun res!213789 () Bool)

(assert (=> b!377692 (=> (not res!213789) (not e!229921))))

(assert (=> b!377692 (= res!213789 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10840 _keys!658))))))

(declare-fun b!377693 () Bool)

(declare-fun res!213791 () Bool)

(assert (=> b!377693 (=> (not res!213791) (not e!229921))))

(assert (=> b!377693 (= res!213791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377694 () Bool)

(declare-fun res!213785 () Bool)

(assert (=> b!377694 (=> (not res!213785) (not e!229921))))

(declare-fun arrayContainsKey!0 (array!22040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377694 (= res!213785 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377695 () Bool)

(assert (=> b!377695 (= e!229920 tp_is_empty!9061)))

(declare-fun b!377696 () Bool)

(declare-fun res!213787 () Bool)

(assert (=> b!377696 (=> (not res!213787) (not e!229921))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377696 (= res!213787 (and (= (size!10839 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10840 _keys!658) (size!10839 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15156 () Bool)

(declare-fun tp!29955 () Bool)

(declare-fun e!229924 () Bool)

(assert (=> mapNonEmpty!15156 (= mapRes!15156 (and tp!29955 e!229924))))

(declare-fun mapRest!15156 () (Array (_ BitVec 32) ValueCell!4187))

(declare-fun mapValue!15156 () ValueCell!4187)

(declare-fun mapKey!15156 () (_ BitVec 32))

(assert (=> mapNonEmpty!15156 (= (arr!10487 _values!506) (store mapRest!15156 mapKey!15156 mapValue!15156))))

(declare-fun b!377697 () Bool)

(declare-fun res!213790 () Bool)

(assert (=> b!377697 (=> (not res!213790) (not e!229921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377697 (= res!213790 (validKeyInArray!0 k0!778))))

(declare-fun b!377698 () Bool)

(assert (=> b!377698 (= e!229923 (not e!229919))))

(declare-fun res!213788 () Bool)

(assert (=> b!377698 (=> res!213788 e!229919)))

(assert (=> b!377698 (= res!213788 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13187)

(declare-fun getCurrentListMap!1922 (array!22040 array!22038 (_ BitVec 32) (_ BitVec 32) V!13187 V!13187 (_ BitVec 32) Int) ListLongMap!4925)

(assert (=> b!377698 (= lt!175780 (getCurrentListMap!1922 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175776 () array!22038)

(assert (=> b!377698 (= lt!175781 (getCurrentListMap!1922 lt!175771 lt!175776 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377698 (and (= lt!175778 lt!175777) (= lt!175777 lt!175778))))

(assert (=> b!377698 (= lt!175777 (+!874 lt!175774 lt!175783))))

(assert (=> b!377698 (= lt!175783 (tuple2!6011 k0!778 v!373))))

(declare-fun lt!175772 () Unit!11631)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!109 (array!22040 array!22038 (_ BitVec 32) (_ BitVec 32) V!13187 V!13187 (_ BitVec 32) (_ BitVec 64) V!13187 (_ BitVec 32) Int) Unit!11631)

(assert (=> b!377698 (= lt!175772 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!109 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!769 (array!22040 array!22038 (_ BitVec 32) (_ BitVec 32) V!13187 V!13187 (_ BitVec 32) Int) ListLongMap!4925)

(assert (=> b!377698 (= lt!175778 (getCurrentListMapNoExtraKeys!769 lt!175771 lt!175776 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377698 (= lt!175776 (array!22039 (store (arr!10487 _values!506) i!548 (ValueCellFull!4187 v!373)) (size!10839 _values!506)))))

(assert (=> b!377698 (= lt!175774 (getCurrentListMapNoExtraKeys!769 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377699 () Bool)

(declare-fun res!213782 () Bool)

(assert (=> b!377699 (=> (not res!213782) (not e!229921))))

(assert (=> b!377699 (= res!213782 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5847))))

(declare-fun mapIsEmpty!15156 () Bool)

(assert (=> mapIsEmpty!15156 mapRes!15156))

(declare-fun b!377700 () Bool)

(assert (=> b!377700 (= e!229924 tp_is_empty!9061)))

(declare-fun b!377701 () Bool)

(declare-fun res!213786 () Bool)

(assert (=> b!377701 (=> (not res!213786) (not e!229921))))

(assert (=> b!377701 (= res!213786 (or (= (select (arr!10488 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10488 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37272 res!213781) b!377696))

(assert (= (and b!377696 res!213787) b!377693))

(assert (= (and b!377693 res!213791) b!377699))

(assert (= (and b!377699 res!213782) b!377692))

(assert (= (and b!377692 res!213789) b!377697))

(assert (= (and b!377697 res!213790) b!377701))

(assert (= (and b!377701 res!213786) b!377694))

(assert (= (and b!377694 res!213785) b!377688))

(assert (= (and b!377688 res!213784) b!377690))

(assert (= (and b!377690 res!213780) b!377698))

(assert (= (and b!377698 (not res!213788)) b!377691))

(assert (= (and b!377691 (not res!213783)) b!377687))

(assert (= (and b!377689 condMapEmpty!15156) mapIsEmpty!15156))

(assert (= (and b!377689 (not condMapEmpty!15156)) mapNonEmpty!15156))

(get-info :version)

(assert (= (and mapNonEmpty!15156 ((_ is ValueCellFull!4187) mapValue!15156)) b!377700))

(assert (= (and b!377689 ((_ is ValueCellFull!4187) mapDefault!15156)) b!377695))

(assert (= start!37272 b!377689))

(declare-fun m!374753 () Bool)

(assert (=> b!377693 m!374753))

(declare-fun m!374755 () Bool)

(assert (=> b!377687 m!374755))

(declare-fun m!374757 () Bool)

(assert (=> b!377687 m!374757))

(declare-fun m!374759 () Bool)

(assert (=> b!377698 m!374759))

(declare-fun m!374761 () Bool)

(assert (=> b!377698 m!374761))

(declare-fun m!374763 () Bool)

(assert (=> b!377698 m!374763))

(declare-fun m!374765 () Bool)

(assert (=> b!377698 m!374765))

(declare-fun m!374767 () Bool)

(assert (=> b!377698 m!374767))

(declare-fun m!374769 () Bool)

(assert (=> b!377698 m!374769))

(declare-fun m!374771 () Bool)

(assert (=> b!377698 m!374771))

(declare-fun m!374773 () Bool)

(assert (=> b!377701 m!374773))

(declare-fun m!374775 () Bool)

(assert (=> b!377694 m!374775))

(declare-fun m!374777 () Bool)

(assert (=> mapNonEmpty!15156 m!374777))

(declare-fun m!374779 () Bool)

(assert (=> b!377699 m!374779))

(declare-fun m!374781 () Bool)

(assert (=> start!37272 m!374781))

(declare-fun m!374783 () Bool)

(assert (=> start!37272 m!374783))

(declare-fun m!374785 () Bool)

(assert (=> start!37272 m!374785))

(declare-fun m!374787 () Bool)

(assert (=> b!377697 m!374787))

(declare-fun m!374789 () Bool)

(assert (=> b!377688 m!374789))

(declare-fun m!374791 () Bool)

(assert (=> b!377688 m!374791))

(declare-fun m!374793 () Bool)

(assert (=> b!377691 m!374793))

(declare-fun m!374795 () Bool)

(assert (=> b!377691 m!374795))

(declare-fun m!374797 () Bool)

(assert (=> b!377691 m!374797))

(declare-fun m!374799 () Bool)

(assert (=> b!377690 m!374799))

(check-sat (not start!37272) (not mapNonEmpty!15156) (not b!377691) (not b!377690) (not b!377687) (not b!377688) (not b!377698) (not b!377694) tp_is_empty!9061 (not b!377697) (not b!377693) b_and!15669 (not b!377699) (not b_next!8413))
(check-sat b_and!15669 (not b_next!8413))
