; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37330 () Bool)

(assert start!37330)

(declare-fun b_free!8457 () Bool)

(declare-fun b_next!8457 () Bool)

(assert (=> start!37330 (= b_free!8457 (not b_next!8457))))

(declare-fun tp!30086 () Bool)

(declare-fun b_and!15699 () Bool)

(assert (=> start!37330 (= tp!30086 b_and!15699)))

(declare-fun b!378735 () Bool)

(declare-fun e!230480 () Bool)

(declare-fun e!230479 () Bool)

(assert (=> b!378735 (= e!230480 e!230479)))

(declare-fun res!214589 () Bool)

(assert (=> b!378735 (=> res!214589 e!230479)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!378735 (= res!214589 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13245 0))(
  ( (V!13246 (val!4597 Int)) )
))
(declare-datatypes ((tuple2!6142 0))(
  ( (tuple2!6143 (_1!3082 (_ BitVec 64)) (_2!3082 V!13245)) )
))
(declare-datatypes ((List!5979 0))(
  ( (Nil!5976) (Cons!5975 (h!6831 tuple2!6142) (t!11129 List!5979)) )
))
(declare-datatypes ((ListLongMap!5055 0))(
  ( (ListLongMap!5056 (toList!2543 List!5979)) )
))
(declare-fun lt!176579 () ListLongMap!5055)

(declare-fun lt!176582 () ListLongMap!5055)

(assert (=> b!378735 (= lt!176579 lt!176582)))

(declare-fun lt!176576 () ListLongMap!5055)

(declare-fun lt!176578 () tuple2!6142)

(declare-fun +!889 (ListLongMap!5055 tuple2!6142) ListLongMap!5055)

(assert (=> b!378735 (= lt!176582 (+!889 lt!176576 lt!176578))))

(declare-fun lt!176581 () ListLongMap!5055)

(declare-fun lt!176586 () ListLongMap!5055)

(assert (=> b!378735 (= lt!176581 lt!176586)))

(declare-fun lt!176585 () ListLongMap!5055)

(assert (=> b!378735 (= lt!176586 (+!889 lt!176585 lt!176578))))

(declare-fun lt!176577 () ListLongMap!5055)

(assert (=> b!378735 (= lt!176581 (+!889 lt!176577 lt!176578))))

(declare-fun minValue!472 () V!13245)

(assert (=> b!378735 (= lt!176578 (tuple2!6143 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378736 () Bool)

(declare-fun res!214585 () Bool)

(declare-fun e!230484 () Bool)

(assert (=> b!378736 (=> (not res!214585) (not e!230484))))

(declare-datatypes ((array!22135 0))(
  ( (array!22136 (arr!10536 (Array (_ BitVec 32) (_ BitVec 64))) (size!10888 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22135)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22135 (_ BitVec 32)) Bool)

(assert (=> b!378736 (= res!214585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378737 () Bool)

(declare-fun res!214586 () Bool)

(declare-fun e!230486 () Bool)

(assert (=> b!378737 (=> (not res!214586) (not e!230486))))

(declare-fun lt!176574 () array!22135)

(declare-datatypes ((List!5980 0))(
  ( (Nil!5977) (Cons!5976 (h!6832 (_ BitVec 64)) (t!11130 List!5980)) )
))
(declare-fun arrayNoDuplicates!0 (array!22135 (_ BitVec 32) List!5980) Bool)

(assert (=> b!378737 (= res!214586 (arrayNoDuplicates!0 lt!176574 #b00000000000000000000000000000000 Nil!5977))))

(declare-fun b!378738 () Bool)

(declare-fun res!214595 () Bool)

(assert (=> b!378738 (=> (not res!214595) (not e!230484))))

(declare-fun arrayContainsKey!0 (array!22135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378738 (= res!214595 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378739 () Bool)

(declare-fun e!230481 () Bool)

(declare-fun tp_is_empty!9105 () Bool)

(assert (=> b!378739 (= e!230481 tp_is_empty!9105)))

(declare-fun b!378740 () Bool)

(declare-fun res!214594 () Bool)

(assert (=> b!378740 (=> (not res!214594) (not e!230484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378740 (= res!214594 (validKeyInArray!0 k0!778))))

(declare-fun b!378741 () Bool)

(assert (=> b!378741 (= e!230479 true)))

(declare-fun lt!176583 () tuple2!6142)

(assert (=> b!378741 (= lt!176586 (+!889 lt!176582 lt!176583))))

(declare-fun v!373 () V!13245)

(declare-datatypes ((Unit!11678 0))(
  ( (Unit!11679) )
))
(declare-fun lt!176584 () Unit!11678)

(declare-fun addCommutativeForDiffKeys!291 (ListLongMap!5055 (_ BitVec 64) V!13245 (_ BitVec 64) V!13245) Unit!11678)

(assert (=> b!378741 (= lt!176584 (addCommutativeForDiffKeys!291 lt!176576 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15222 () Bool)

(declare-fun mapRes!15222 () Bool)

(declare-fun tp!30087 () Bool)

(declare-fun e!230483 () Bool)

(assert (=> mapNonEmpty!15222 (= mapRes!15222 (and tp!30087 e!230483))))

(declare-datatypes ((ValueCell!4209 0))(
  ( (ValueCellFull!4209 (v!6794 V!13245)) (EmptyCell!4209) )
))
(declare-datatypes ((array!22137 0))(
  ( (array!22138 (arr!10537 (Array (_ BitVec 32) ValueCell!4209)) (size!10889 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22137)

(declare-fun mapRest!15222 () (Array (_ BitVec 32) ValueCell!4209))

(declare-fun mapKey!15222 () (_ BitVec 32))

(declare-fun mapValue!15222 () ValueCell!4209)

(assert (=> mapNonEmpty!15222 (= (arr!10537 _values!506) (store mapRest!15222 mapKey!15222 mapValue!15222))))

(declare-fun res!214588 () Bool)

(assert (=> start!37330 (=> (not res!214588) (not e!230484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37330 (= res!214588 (validMask!0 mask!970))))

(assert (=> start!37330 e!230484))

(declare-fun e!230482 () Bool)

(declare-fun array_inv!7760 (array!22137) Bool)

(assert (=> start!37330 (and (array_inv!7760 _values!506) e!230482)))

(assert (=> start!37330 tp!30086))

(assert (=> start!37330 true))

(assert (=> start!37330 tp_is_empty!9105))

(declare-fun array_inv!7761 (array!22135) Bool)

(assert (=> start!37330 (array_inv!7761 _keys!658)))

(declare-fun b!378742 () Bool)

(assert (=> b!378742 (= e!230482 (and e!230481 mapRes!15222))))

(declare-fun condMapEmpty!15222 () Bool)

(declare-fun mapDefault!15222 () ValueCell!4209)

(assert (=> b!378742 (= condMapEmpty!15222 (= (arr!10537 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4209)) mapDefault!15222)))))

(declare-fun b!378743 () Bool)

(declare-fun res!214593 () Bool)

(assert (=> b!378743 (=> (not res!214593) (not e!230484))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378743 (= res!214593 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10888 _keys!658))))))

(declare-fun b!378744 () Bool)

(declare-fun res!214592 () Bool)

(assert (=> b!378744 (=> (not res!214592) (not e!230484))))

(assert (=> b!378744 (= res!214592 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5977))))

(declare-fun b!378745 () Bool)

(declare-fun res!214587 () Bool)

(assert (=> b!378745 (=> (not res!214587) (not e!230484))))

(assert (=> b!378745 (= res!214587 (or (= (select (arr!10536 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10536 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378746 () Bool)

(declare-fun res!214591 () Bool)

(assert (=> b!378746 (=> (not res!214591) (not e!230484))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378746 (= res!214591 (and (= (size!10889 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10888 _keys!658) (size!10889 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378747 () Bool)

(assert (=> b!378747 (= e!230484 e!230486)))

(declare-fun res!214584 () Bool)

(assert (=> b!378747 (=> (not res!214584) (not e!230486))))

(assert (=> b!378747 (= res!214584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176574 mask!970))))

(assert (=> b!378747 (= lt!176574 (array!22136 (store (arr!10536 _keys!658) i!548 k0!778) (size!10888 _keys!658)))))

(declare-fun b!378748 () Bool)

(assert (=> b!378748 (= e!230486 (not e!230480))))

(declare-fun res!214590 () Bool)

(assert (=> b!378748 (=> res!214590 e!230480)))

(assert (=> b!378748 (= res!214590 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13245)

(declare-fun getCurrentListMap!1968 (array!22135 array!22137 (_ BitVec 32) (_ BitVec 32) V!13245 V!13245 (_ BitVec 32) Int) ListLongMap!5055)

(assert (=> b!378748 (= lt!176579 (getCurrentListMap!1968 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176575 () array!22137)

(assert (=> b!378748 (= lt!176581 (getCurrentListMap!1968 lt!176574 lt!176575 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378748 (and (= lt!176577 lt!176585) (= lt!176585 lt!176577))))

(assert (=> b!378748 (= lt!176585 (+!889 lt!176576 lt!176583))))

(assert (=> b!378748 (= lt!176583 (tuple2!6143 k0!778 v!373))))

(declare-fun lt!176580 () Unit!11678)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!126 (array!22135 array!22137 (_ BitVec 32) (_ BitVec 32) V!13245 V!13245 (_ BitVec 32) (_ BitVec 64) V!13245 (_ BitVec 32) Int) Unit!11678)

(assert (=> b!378748 (= lt!176580 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!126 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!802 (array!22135 array!22137 (_ BitVec 32) (_ BitVec 32) V!13245 V!13245 (_ BitVec 32) Int) ListLongMap!5055)

(assert (=> b!378748 (= lt!176577 (getCurrentListMapNoExtraKeys!802 lt!176574 lt!176575 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378748 (= lt!176575 (array!22138 (store (arr!10537 _values!506) i!548 (ValueCellFull!4209 v!373)) (size!10889 _values!506)))))

(assert (=> b!378748 (= lt!176576 (getCurrentListMapNoExtraKeys!802 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15222 () Bool)

(assert (=> mapIsEmpty!15222 mapRes!15222))

(declare-fun b!378749 () Bool)

(assert (=> b!378749 (= e!230483 tp_is_empty!9105)))

(assert (= (and start!37330 res!214588) b!378746))

(assert (= (and b!378746 res!214591) b!378736))

(assert (= (and b!378736 res!214585) b!378744))

(assert (= (and b!378744 res!214592) b!378743))

(assert (= (and b!378743 res!214593) b!378740))

(assert (= (and b!378740 res!214594) b!378745))

(assert (= (and b!378745 res!214587) b!378738))

(assert (= (and b!378738 res!214595) b!378747))

(assert (= (and b!378747 res!214584) b!378737))

(assert (= (and b!378737 res!214586) b!378748))

(assert (= (and b!378748 (not res!214590)) b!378735))

(assert (= (and b!378735 (not res!214589)) b!378741))

(assert (= (and b!378742 condMapEmpty!15222) mapIsEmpty!15222))

(assert (= (and b!378742 (not condMapEmpty!15222)) mapNonEmpty!15222))

(get-info :version)

(assert (= (and mapNonEmpty!15222 ((_ is ValueCellFull!4209) mapValue!15222)) b!378749))

(assert (= (and b!378742 ((_ is ValueCellFull!4209) mapDefault!15222)) b!378739))

(assert (= start!37330 b!378742))

(declare-fun m!375567 () Bool)

(assert (=> mapNonEmpty!15222 m!375567))

(declare-fun m!375569 () Bool)

(assert (=> b!378744 m!375569))

(declare-fun m!375571 () Bool)

(assert (=> b!378748 m!375571))

(declare-fun m!375573 () Bool)

(assert (=> b!378748 m!375573))

(declare-fun m!375575 () Bool)

(assert (=> b!378748 m!375575))

(declare-fun m!375577 () Bool)

(assert (=> b!378748 m!375577))

(declare-fun m!375579 () Bool)

(assert (=> b!378748 m!375579))

(declare-fun m!375581 () Bool)

(assert (=> b!378748 m!375581))

(declare-fun m!375583 () Bool)

(assert (=> b!378748 m!375583))

(declare-fun m!375585 () Bool)

(assert (=> b!378741 m!375585))

(declare-fun m!375587 () Bool)

(assert (=> b!378741 m!375587))

(declare-fun m!375589 () Bool)

(assert (=> b!378735 m!375589))

(declare-fun m!375591 () Bool)

(assert (=> b!378735 m!375591))

(declare-fun m!375593 () Bool)

(assert (=> b!378735 m!375593))

(declare-fun m!375595 () Bool)

(assert (=> b!378737 m!375595))

(declare-fun m!375597 () Bool)

(assert (=> b!378747 m!375597))

(declare-fun m!375599 () Bool)

(assert (=> b!378747 m!375599))

(declare-fun m!375601 () Bool)

(assert (=> start!37330 m!375601))

(declare-fun m!375603 () Bool)

(assert (=> start!37330 m!375603))

(declare-fun m!375605 () Bool)

(assert (=> start!37330 m!375605))

(declare-fun m!375607 () Bool)

(assert (=> b!378738 m!375607))

(declare-fun m!375609 () Bool)

(assert (=> b!378740 m!375609))

(declare-fun m!375611 () Bool)

(assert (=> b!378745 m!375611))

(declare-fun m!375613 () Bool)

(assert (=> b!378736 m!375613))

(check-sat (not b!378747) (not b!378740) (not b!378737) (not b_next!8457) (not start!37330) (not b!378735) b_and!15699 (not b!378748) tp_is_empty!9105 (not b!378736) (not mapNonEmpty!15222) (not b!378741) (not b!378738) (not b!378744))
(check-sat b_and!15699 (not b_next!8457))
