; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37282 () Bool)

(assert start!37282)

(declare-fun b_free!8409 () Bool)

(declare-fun b_next!8409 () Bool)

(assert (=> start!37282 (= b_free!8409 (not b_next!8409))))

(declare-fun tp!29943 () Bool)

(declare-fun b_and!15651 () Bool)

(assert (=> start!37282 (= tp!29943 b_and!15651)))

(declare-fun b!377646 () Bool)

(declare-fun res!213711 () Bool)

(declare-fun e!229907 () Bool)

(assert (=> b!377646 (=> (not res!213711) (not e!229907))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377646 (= res!213711 (validKeyInArray!0 k0!778))))

(declare-fun b!377647 () Bool)

(declare-fun e!229910 () Bool)

(declare-fun tp_is_empty!9057 () Bool)

(assert (=> b!377647 (= e!229910 tp_is_empty!9057)))

(declare-fun res!213715 () Bool)

(assert (=> start!37282 (=> (not res!213715) (not e!229907))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37282 (= res!213715 (validMask!0 mask!970))))

(assert (=> start!37282 e!229907))

(declare-datatypes ((V!13181 0))(
  ( (V!13182 (val!4573 Int)) )
))
(declare-datatypes ((ValueCell!4185 0))(
  ( (ValueCellFull!4185 (v!6770 V!13181)) (EmptyCell!4185) )
))
(declare-datatypes ((array!22043 0))(
  ( (array!22044 (arr!10490 (Array (_ BitVec 32) ValueCell!4185)) (size!10842 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22043)

(declare-fun e!229904 () Bool)

(declare-fun array_inv!7728 (array!22043) Bool)

(assert (=> start!37282 (and (array_inv!7728 _values!506) e!229904)))

(assert (=> start!37282 tp!29943))

(assert (=> start!37282 true))

(assert (=> start!37282 tp_is_empty!9057))

(declare-datatypes ((array!22045 0))(
  ( (array!22046 (arr!10491 (Array (_ BitVec 32) (_ BitVec 64))) (size!10843 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22045)

(declare-fun array_inv!7729 (array!22045) Bool)

(assert (=> start!37282 (array_inv!7729 _keys!658)))

(declare-fun b!377648 () Bool)

(declare-fun e!229905 () Bool)

(declare-fun e!229903 () Bool)

(assert (=> b!377648 (= e!229905 (not e!229903))))

(declare-fun res!213717 () Bool)

(assert (=> b!377648 (=> res!213717 e!229903)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377648 (= res!213717 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6100 0))(
  ( (tuple2!6101 (_1!3061 (_ BitVec 64)) (_2!3061 V!13181)) )
))
(declare-datatypes ((List!5939 0))(
  ( (Nil!5936) (Cons!5935 (h!6791 tuple2!6100) (t!11089 List!5939)) )
))
(declare-datatypes ((ListLongMap!5013 0))(
  ( (ListLongMap!5014 (toList!2522 List!5939)) )
))
(declare-fun lt!175681 () ListLongMap!5013)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13181)

(declare-fun minValue!472 () V!13181)

(declare-fun getCurrentListMap!1951 (array!22045 array!22043 (_ BitVec 32) (_ BitVec 32) V!13181 V!13181 (_ BitVec 32) Int) ListLongMap!5013)

(assert (=> b!377648 (= lt!175681 (getCurrentListMap!1951 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175680 () array!22043)

(declare-fun lt!175679 () array!22045)

(declare-fun lt!175683 () ListLongMap!5013)

(assert (=> b!377648 (= lt!175683 (getCurrentListMap!1951 lt!175679 lt!175680 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175678 () ListLongMap!5013)

(declare-fun lt!175676 () ListLongMap!5013)

(assert (=> b!377648 (and (= lt!175678 lt!175676) (= lt!175676 lt!175678))))

(declare-fun lt!175686 () ListLongMap!5013)

(declare-fun lt!175677 () tuple2!6100)

(declare-fun +!868 (ListLongMap!5013 tuple2!6100) ListLongMap!5013)

(assert (=> b!377648 (= lt!175676 (+!868 lt!175686 lt!175677))))

(declare-fun v!373 () V!13181)

(assert (=> b!377648 (= lt!175677 (tuple2!6101 k0!778 v!373))))

(declare-datatypes ((Unit!11638 0))(
  ( (Unit!11639) )
))
(declare-fun lt!175684 () Unit!11638)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!109 (array!22045 array!22043 (_ BitVec 32) (_ BitVec 32) V!13181 V!13181 (_ BitVec 32) (_ BitVec 64) V!13181 (_ BitVec 32) Int) Unit!11638)

(assert (=> b!377648 (= lt!175684 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!109 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!785 (array!22045 array!22043 (_ BitVec 32) (_ BitVec 32) V!13181 V!13181 (_ BitVec 32) Int) ListLongMap!5013)

(assert (=> b!377648 (= lt!175678 (getCurrentListMapNoExtraKeys!785 lt!175679 lt!175680 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377648 (= lt!175680 (array!22044 (store (arr!10490 _values!506) i!548 (ValueCellFull!4185 v!373)) (size!10842 _values!506)))))

(assert (=> b!377648 (= lt!175686 (getCurrentListMapNoExtraKeys!785 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377649 () Bool)

(declare-fun e!229909 () Bool)

(assert (=> b!377649 (= e!229909 true)))

(declare-fun lt!175674 () ListLongMap!5013)

(declare-fun lt!175682 () ListLongMap!5013)

(assert (=> b!377649 (= lt!175674 (+!868 lt!175682 lt!175677))))

(declare-fun lt!175685 () Unit!11638)

(declare-fun addCommutativeForDiffKeys!276 (ListLongMap!5013 (_ BitVec 64) V!13181 (_ BitVec 64) V!13181) Unit!11638)

(assert (=> b!377649 (= lt!175685 (addCommutativeForDiffKeys!276 lt!175686 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377650 () Bool)

(declare-fun res!213718 () Bool)

(assert (=> b!377650 (=> (not res!213718) (not e!229907))))

(assert (=> b!377650 (= res!213718 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10843 _keys!658))))))

(declare-fun b!377651 () Bool)

(declare-fun res!213714 () Bool)

(assert (=> b!377651 (=> (not res!213714) (not e!229907))))

(declare-datatypes ((List!5940 0))(
  ( (Nil!5937) (Cons!5936 (h!6792 (_ BitVec 64)) (t!11090 List!5940)) )
))
(declare-fun arrayNoDuplicates!0 (array!22045 (_ BitVec 32) List!5940) Bool)

(assert (=> b!377651 (= res!213714 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5937))))

(declare-fun b!377652 () Bool)

(declare-fun res!213721 () Bool)

(assert (=> b!377652 (=> (not res!213721) (not e!229907))))

(declare-fun arrayContainsKey!0 (array!22045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377652 (= res!213721 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15150 () Bool)

(declare-fun mapRes!15150 () Bool)

(assert (=> mapIsEmpty!15150 mapRes!15150))

(declare-fun b!377653 () Bool)

(declare-fun res!213713 () Bool)

(assert (=> b!377653 (=> (not res!213713) (not e!229907))))

(assert (=> b!377653 (= res!213713 (and (= (size!10842 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10843 _keys!658) (size!10842 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15150 () Bool)

(declare-fun tp!29942 () Bool)

(assert (=> mapNonEmpty!15150 (= mapRes!15150 (and tp!29942 e!229910))))

(declare-fun mapKey!15150 () (_ BitVec 32))

(declare-fun mapRest!15150 () (Array (_ BitVec 32) ValueCell!4185))

(declare-fun mapValue!15150 () ValueCell!4185)

(assert (=> mapNonEmpty!15150 (= (arr!10490 _values!506) (store mapRest!15150 mapKey!15150 mapValue!15150))))

(declare-fun b!377654 () Bool)

(declare-fun e!229906 () Bool)

(assert (=> b!377654 (= e!229906 tp_is_empty!9057)))

(declare-fun b!377655 () Bool)

(assert (=> b!377655 (= e!229907 e!229905)))

(declare-fun res!213712 () Bool)

(assert (=> b!377655 (=> (not res!213712) (not e!229905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22045 (_ BitVec 32)) Bool)

(assert (=> b!377655 (= res!213712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175679 mask!970))))

(assert (=> b!377655 (= lt!175679 (array!22046 (store (arr!10491 _keys!658) i!548 k0!778) (size!10843 _keys!658)))))

(declare-fun b!377656 () Bool)

(declare-fun res!213722 () Bool)

(assert (=> b!377656 (=> (not res!213722) (not e!229905))))

(assert (=> b!377656 (= res!213722 (arrayNoDuplicates!0 lt!175679 #b00000000000000000000000000000000 Nil!5937))))

(declare-fun b!377657 () Bool)

(declare-fun res!213716 () Bool)

(assert (=> b!377657 (=> (not res!213716) (not e!229907))))

(assert (=> b!377657 (= res!213716 (or (= (select (arr!10491 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10491 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377658 () Bool)

(assert (=> b!377658 (= e!229904 (and e!229906 mapRes!15150))))

(declare-fun condMapEmpty!15150 () Bool)

(declare-fun mapDefault!15150 () ValueCell!4185)

(assert (=> b!377658 (= condMapEmpty!15150 (= (arr!10490 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4185)) mapDefault!15150)))))

(declare-fun b!377659 () Bool)

(declare-fun res!213720 () Bool)

(assert (=> b!377659 (=> (not res!213720) (not e!229907))))

(assert (=> b!377659 (= res!213720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377660 () Bool)

(assert (=> b!377660 (= e!229903 e!229909)))

(declare-fun res!213719 () Bool)

(assert (=> b!377660 (=> res!213719 e!229909)))

(assert (=> b!377660 (= res!213719 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!377660 (= lt!175683 lt!175674)))

(declare-fun lt!175675 () tuple2!6100)

(assert (=> b!377660 (= lt!175674 (+!868 lt!175676 lt!175675))))

(assert (=> b!377660 (= lt!175681 lt!175682)))

(assert (=> b!377660 (= lt!175682 (+!868 lt!175686 lt!175675))))

(assert (=> b!377660 (= lt!175683 (+!868 lt!175678 lt!175675))))

(assert (=> b!377660 (= lt!175675 (tuple2!6101 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37282 res!213715) b!377653))

(assert (= (and b!377653 res!213713) b!377659))

(assert (= (and b!377659 res!213720) b!377651))

(assert (= (and b!377651 res!213714) b!377650))

(assert (= (and b!377650 res!213718) b!377646))

(assert (= (and b!377646 res!213711) b!377657))

(assert (= (and b!377657 res!213716) b!377652))

(assert (= (and b!377652 res!213721) b!377655))

(assert (= (and b!377655 res!213712) b!377656))

(assert (= (and b!377656 res!213722) b!377648))

(assert (= (and b!377648 (not res!213717)) b!377660))

(assert (= (and b!377660 (not res!213719)) b!377649))

(assert (= (and b!377658 condMapEmpty!15150) mapIsEmpty!15150))

(assert (= (and b!377658 (not condMapEmpty!15150)) mapNonEmpty!15150))

(get-info :version)

(assert (= (and mapNonEmpty!15150 ((_ is ValueCellFull!4185) mapValue!15150)) b!377647))

(assert (= (and b!377658 ((_ is ValueCellFull!4185) mapDefault!15150)) b!377654))

(assert (= start!37282 b!377658))

(declare-fun m!374427 () Bool)

(assert (=> b!377646 m!374427))

(declare-fun m!374429 () Bool)

(assert (=> b!377649 m!374429))

(declare-fun m!374431 () Bool)

(assert (=> b!377649 m!374431))

(declare-fun m!374433 () Bool)

(assert (=> b!377659 m!374433))

(declare-fun m!374435 () Bool)

(assert (=> start!37282 m!374435))

(declare-fun m!374437 () Bool)

(assert (=> start!37282 m!374437))

(declare-fun m!374439 () Bool)

(assert (=> start!37282 m!374439))

(declare-fun m!374441 () Bool)

(assert (=> b!377660 m!374441))

(declare-fun m!374443 () Bool)

(assert (=> b!377660 m!374443))

(declare-fun m!374445 () Bool)

(assert (=> b!377660 m!374445))

(declare-fun m!374447 () Bool)

(assert (=> b!377648 m!374447))

(declare-fun m!374449 () Bool)

(assert (=> b!377648 m!374449))

(declare-fun m!374451 () Bool)

(assert (=> b!377648 m!374451))

(declare-fun m!374453 () Bool)

(assert (=> b!377648 m!374453))

(declare-fun m!374455 () Bool)

(assert (=> b!377648 m!374455))

(declare-fun m!374457 () Bool)

(assert (=> b!377648 m!374457))

(declare-fun m!374459 () Bool)

(assert (=> b!377648 m!374459))

(declare-fun m!374461 () Bool)

(assert (=> b!377656 m!374461))

(declare-fun m!374463 () Bool)

(assert (=> b!377655 m!374463))

(declare-fun m!374465 () Bool)

(assert (=> b!377655 m!374465))

(declare-fun m!374467 () Bool)

(assert (=> b!377651 m!374467))

(declare-fun m!374469 () Bool)

(assert (=> b!377652 m!374469))

(declare-fun m!374471 () Bool)

(assert (=> mapNonEmpty!15150 m!374471))

(declare-fun m!374473 () Bool)

(assert (=> b!377657 m!374473))

(check-sat (not b!377656) (not b_next!8409) (not b!377652) (not b!377646) (not start!37282) (not b!377660) tp_is_empty!9057 (not b!377649) (not b!377659) (not b!377651) (not mapNonEmpty!15150) (not b!377648) b_and!15651 (not b!377655))
(check-sat b_and!15651 (not b_next!8409))
