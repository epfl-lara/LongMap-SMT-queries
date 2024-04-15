; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37512 () Bool)

(assert start!37512)

(declare-fun b_free!8653 () Bool)

(declare-fun b_next!8653 () Bool)

(assert (=> start!37512 (= b_free!8653 (not b_next!8653))))

(declare-fun tp!30675 () Bool)

(declare-fun b_and!15869 () Bool)

(assert (=> start!37512 (= tp!30675 b_and!15869)))

(declare-fun b!382719 () Bool)

(declare-fun res!217838 () Bool)

(declare-fun e!232506 () Bool)

(assert (=> b!382719 (=> (not res!217838) (not e!232506))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382719 (= res!217838 (validKeyInArray!0 k0!778))))

(declare-fun b!382720 () Bool)

(declare-fun res!217832 () Bool)

(assert (=> b!382720 (=> (not res!217832) (not e!232506))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22497 0))(
  ( (array!22498 (arr!10717 (Array (_ BitVec 32) (_ BitVec 64))) (size!11070 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22497)

(assert (=> b!382720 (= res!217832 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11070 _keys!658))))))

(declare-fun mapIsEmpty!15516 () Bool)

(declare-fun mapRes!15516 () Bool)

(assert (=> mapIsEmpty!15516 mapRes!15516))

(declare-fun b!382721 () Bool)

(declare-fun res!217828 () Bool)

(assert (=> b!382721 (=> (not res!217828) (not e!232506))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13507 0))(
  ( (V!13508 (val!4695 Int)) )
))
(declare-datatypes ((ValueCell!4307 0))(
  ( (ValueCellFull!4307 (v!6886 V!13507)) (EmptyCell!4307) )
))
(declare-datatypes ((array!22499 0))(
  ( (array!22500 (arr!10718 (Array (_ BitVec 32) ValueCell!4307)) (size!11071 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22499)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!382721 (= res!217828 (and (= (size!11071 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11070 _keys!658) (size!11071 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382722 () Bool)

(declare-fun res!217835 () Bool)

(assert (=> b!382722 (=> (not res!217835) (not e!232506))))

(assert (=> b!382722 (= res!217835 (or (= (select (arr!10717 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10717 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382723 () Bool)

(declare-fun e!232505 () Bool)

(declare-fun tp_is_empty!9301 () Bool)

(assert (=> b!382723 (= e!232505 tp_is_empty!9301)))

(declare-fun b!382724 () Bool)

(declare-fun res!217836 () Bool)

(assert (=> b!382724 (=> (not res!217836) (not e!232506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22497 (_ BitVec 32)) Bool)

(assert (=> b!382724 (= res!217836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!217831 () Bool)

(assert (=> start!37512 (=> (not res!217831) (not e!232506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37512 (= res!217831 (validMask!0 mask!970))))

(assert (=> start!37512 e!232506))

(declare-fun e!232507 () Bool)

(declare-fun array_inv!7892 (array!22499) Bool)

(assert (=> start!37512 (and (array_inv!7892 _values!506) e!232507)))

(assert (=> start!37512 tp!30675))

(assert (=> start!37512 true))

(assert (=> start!37512 tp_is_empty!9301))

(declare-fun array_inv!7893 (array!22497) Bool)

(assert (=> start!37512 (array_inv!7893 _keys!658)))

(declare-fun mapNonEmpty!15516 () Bool)

(declare-fun tp!30674 () Bool)

(assert (=> mapNonEmpty!15516 (= mapRes!15516 (and tp!30674 e!232505))))

(declare-fun mapKey!15516 () (_ BitVec 32))

(declare-fun mapValue!15516 () ValueCell!4307)

(declare-fun mapRest!15516 () (Array (_ BitVec 32) ValueCell!4307))

(assert (=> mapNonEmpty!15516 (= (arr!10718 _values!506) (store mapRest!15516 mapKey!15516 mapValue!15516))))

(declare-fun b!382725 () Bool)

(declare-fun res!217833 () Bool)

(declare-fun e!232504 () Bool)

(assert (=> b!382725 (=> (not res!217833) (not e!232504))))

(declare-fun lt!179547 () array!22497)

(declare-datatypes ((List!6118 0))(
  ( (Nil!6115) (Cons!6114 (h!6970 (_ BitVec 64)) (t!11259 List!6118)) )
))
(declare-fun arrayNoDuplicates!0 (array!22497 (_ BitVec 32) List!6118) Bool)

(assert (=> b!382725 (= res!217833 (arrayNoDuplicates!0 lt!179547 #b00000000000000000000000000000000 Nil!6115))))

(declare-fun b!382726 () Bool)

(declare-fun e!232503 () Bool)

(assert (=> b!382726 (= e!232503 tp_is_empty!9301)))

(declare-fun b!382727 () Bool)

(declare-fun res!217830 () Bool)

(assert (=> b!382727 (=> (not res!217830) (not e!232506))))

(declare-fun arrayContainsKey!0 (array!22497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382727 (= res!217830 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382728 () Bool)

(declare-fun res!217837 () Bool)

(assert (=> b!382728 (=> (not res!217837) (not e!232506))))

(assert (=> b!382728 (= res!217837 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6115))))

(declare-fun b!382729 () Bool)

(assert (=> b!382729 (= e!232506 e!232504)))

(declare-fun res!217834 () Bool)

(assert (=> b!382729 (=> (not res!217834) (not e!232504))))

(assert (=> b!382729 (= res!217834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179547 mask!970))))

(assert (=> b!382729 (= lt!179547 (array!22498 (store (arr!10717 _keys!658) i!548 k0!778) (size!11070 _keys!658)))))

(declare-fun b!382730 () Bool)

(assert (=> b!382730 (= e!232507 (and e!232503 mapRes!15516))))

(declare-fun condMapEmpty!15516 () Bool)

(declare-fun mapDefault!15516 () ValueCell!4307)

(assert (=> b!382730 (= condMapEmpty!15516 (= (arr!10718 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4307)) mapDefault!15516)))))

(declare-fun b!382731 () Bool)

(declare-fun e!232508 () Bool)

(assert (=> b!382731 (= e!232504 (not e!232508))))

(declare-fun res!217829 () Bool)

(assert (=> b!382731 (=> res!217829 e!232508)))

(declare-fun lt!179549 () Bool)

(assert (=> b!382731 (= res!217829 (or (and (not lt!179549) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179549) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179549)))))

(assert (=> b!382731 (= lt!179549 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6292 0))(
  ( (tuple2!6293 (_1!3157 (_ BitVec 64)) (_2!3157 V!13507)) )
))
(declare-datatypes ((List!6119 0))(
  ( (Nil!6116) (Cons!6115 (h!6971 tuple2!6292) (t!11260 List!6119)) )
))
(declare-datatypes ((ListLongMap!5195 0))(
  ( (ListLongMap!5196 (toList!2613 List!6119)) )
))
(declare-fun lt!179548 () ListLongMap!5195)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13507)

(declare-fun minValue!472 () V!13507)

(declare-fun getCurrentListMap!1997 (array!22497 array!22499 (_ BitVec 32) (_ BitVec 32) V!13507 V!13507 (_ BitVec 32) Int) ListLongMap!5195)

(assert (=> b!382731 (= lt!179548 (getCurrentListMap!1997 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179544 () array!22499)

(declare-fun lt!179546 () ListLongMap!5195)

(assert (=> b!382731 (= lt!179546 (getCurrentListMap!1997 lt!179547 lt!179544 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179545 () ListLongMap!5195)

(declare-fun lt!179542 () ListLongMap!5195)

(assert (=> b!382731 (and (= lt!179545 lt!179542) (= lt!179542 lt!179545))))

(declare-fun v!373 () V!13507)

(declare-fun lt!179550 () ListLongMap!5195)

(declare-fun +!971 (ListLongMap!5195 tuple2!6292) ListLongMap!5195)

(assert (=> b!382731 (= lt!179542 (+!971 lt!179550 (tuple2!6293 k0!778 v!373)))))

(declare-datatypes ((Unit!11800 0))(
  ( (Unit!11801) )
))
(declare-fun lt!179543 () Unit!11800)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!190 (array!22497 array!22499 (_ BitVec 32) (_ BitVec 32) V!13507 V!13507 (_ BitVec 32) (_ BitVec 64) V!13507 (_ BitVec 32) Int) Unit!11800)

(assert (=> b!382731 (= lt!179543 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!190 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!862 (array!22497 array!22499 (_ BitVec 32) (_ BitVec 32) V!13507 V!13507 (_ BitVec 32) Int) ListLongMap!5195)

(assert (=> b!382731 (= lt!179545 (getCurrentListMapNoExtraKeys!862 lt!179547 lt!179544 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382731 (= lt!179544 (array!22500 (store (arr!10718 _values!506) i!548 (ValueCellFull!4307 v!373)) (size!11071 _values!506)))))

(assert (=> b!382731 (= lt!179550 (getCurrentListMapNoExtraKeys!862 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382732 () Bool)

(assert (=> b!382732 (= e!232508 (bvsle #b00000000000000000000000000000000 (size!11070 _keys!658)))))

(assert (=> b!382732 (= lt!179546 lt!179545)))

(assert (= (and start!37512 res!217831) b!382721))

(assert (= (and b!382721 res!217828) b!382724))

(assert (= (and b!382724 res!217836) b!382728))

(assert (= (and b!382728 res!217837) b!382720))

(assert (= (and b!382720 res!217832) b!382719))

(assert (= (and b!382719 res!217838) b!382722))

(assert (= (and b!382722 res!217835) b!382727))

(assert (= (and b!382727 res!217830) b!382729))

(assert (= (and b!382729 res!217834) b!382725))

(assert (= (and b!382725 res!217833) b!382731))

(assert (= (and b!382731 (not res!217829)) b!382732))

(assert (= (and b!382730 condMapEmpty!15516) mapIsEmpty!15516))

(assert (= (and b!382730 (not condMapEmpty!15516)) mapNonEmpty!15516))

(get-info :version)

(assert (= (and mapNonEmpty!15516 ((_ is ValueCellFull!4307) mapValue!15516)) b!382723))

(assert (= (and b!382730 ((_ is ValueCellFull!4307) mapDefault!15516)) b!382726))

(assert (= start!37512 b!382730))

(declare-fun m!379037 () Bool)

(assert (=> mapNonEmpty!15516 m!379037))

(declare-fun m!379039 () Bool)

(assert (=> b!382722 m!379039))

(declare-fun m!379041 () Bool)

(assert (=> b!382724 m!379041))

(declare-fun m!379043 () Bool)

(assert (=> b!382727 m!379043))

(declare-fun m!379045 () Bool)

(assert (=> b!382728 m!379045))

(declare-fun m!379047 () Bool)

(assert (=> b!382731 m!379047))

(declare-fun m!379049 () Bool)

(assert (=> b!382731 m!379049))

(declare-fun m!379051 () Bool)

(assert (=> b!382731 m!379051))

(declare-fun m!379053 () Bool)

(assert (=> b!382731 m!379053))

(declare-fun m!379055 () Bool)

(assert (=> b!382731 m!379055))

(declare-fun m!379057 () Bool)

(assert (=> b!382731 m!379057))

(declare-fun m!379059 () Bool)

(assert (=> b!382731 m!379059))

(declare-fun m!379061 () Bool)

(assert (=> b!382729 m!379061))

(declare-fun m!379063 () Bool)

(assert (=> b!382729 m!379063))

(declare-fun m!379065 () Bool)

(assert (=> b!382719 m!379065))

(declare-fun m!379067 () Bool)

(assert (=> start!37512 m!379067))

(declare-fun m!379069 () Bool)

(assert (=> start!37512 m!379069))

(declare-fun m!379071 () Bool)

(assert (=> start!37512 m!379071))

(declare-fun m!379073 () Bool)

(assert (=> b!382725 m!379073))

(check-sat (not b!382728) (not b!382727) (not b_next!8653) (not mapNonEmpty!15516) (not b!382725) (not b!382729) (not start!37512) b_and!15869 tp_is_empty!9301 (not b!382731) (not b!382719) (not b!382724))
(check-sat b_and!15869 (not b_next!8653))
