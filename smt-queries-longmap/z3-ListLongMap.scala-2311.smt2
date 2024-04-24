; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37314 () Bool)

(assert start!37314)

(declare-fun b_free!8455 () Bool)

(declare-fun b_next!8455 () Bool)

(assert (=> start!37314 (= b_free!8455 (not b_next!8455))))

(declare-fun tp!30081 () Bool)

(declare-fun b_and!15711 () Bool)

(assert (=> start!37314 (= tp!30081 b_and!15711)))

(declare-fun b!378641 () Bool)

(declare-fun e!230426 () Bool)

(declare-fun e!230424 () Bool)

(assert (=> b!378641 (= e!230426 e!230424)))

(declare-fun res!214556 () Bool)

(assert (=> b!378641 (=> (not res!214556) (not e!230424))))

(declare-datatypes ((array!22120 0))(
  ( (array!22121 (arr!10528 (Array (_ BitVec 32) (_ BitVec 64))) (size!10880 (_ BitVec 32))) )
))
(declare-fun lt!176559 () array!22120)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22120 (_ BitVec 32)) Bool)

(assert (=> b!378641 (= res!214556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176559 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22120)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378641 (= lt!176559 (array!22121 (store (arr!10528 _keys!658) i!548 k0!778) (size!10880 _keys!658)))))

(declare-fun b!378642 () Bool)

(declare-fun res!214548 () Bool)

(assert (=> b!378642 (=> (not res!214548) (not e!230426))))

(assert (=> b!378642 (= res!214548 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10880 _keys!658))))))

(declare-fun b!378643 () Bool)

(declare-fun e!230427 () Bool)

(assert (=> b!378643 (= e!230427 true)))

(declare-datatypes ((V!13243 0))(
  ( (V!13244 (val!4596 Int)) )
))
(declare-datatypes ((tuple2!6044 0))(
  ( (tuple2!6045 (_1!3033 (_ BitVec 64)) (_2!3033 V!13243)) )
))
(declare-datatypes ((List!5882 0))(
  ( (Nil!5879) (Cons!5878 (h!6734 tuple2!6044) (t!11024 List!5882)) )
))
(declare-datatypes ((ListLongMap!4959 0))(
  ( (ListLongMap!4960 (toList!2495 List!5882)) )
))
(declare-fun lt!176558 () ListLongMap!4959)

(declare-fun lt!176554 () ListLongMap!4959)

(declare-fun lt!176565 () tuple2!6044)

(declare-fun +!891 (ListLongMap!4959 tuple2!6044) ListLongMap!4959)

(assert (=> b!378643 (= lt!176558 (+!891 lt!176554 lt!176565))))

(declare-fun v!373 () V!13243)

(declare-fun lt!176556 () ListLongMap!4959)

(declare-datatypes ((Unit!11665 0))(
  ( (Unit!11666) )
))
(declare-fun lt!176555 () Unit!11665)

(declare-fun minValue!472 () V!13243)

(declare-fun addCommutativeForDiffKeys!305 (ListLongMap!4959 (_ BitVec 64) V!13243 (_ BitVec 64) V!13243) Unit!11665)

(assert (=> b!378643 (= lt!176555 (addCommutativeForDiffKeys!305 lt!176556 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378644 () Bool)

(declare-fun res!214552 () Bool)

(assert (=> b!378644 (=> (not res!214552) (not e!230426))))

(assert (=> b!378644 (= res!214552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15219 () Bool)

(declare-fun mapRes!15219 () Bool)

(declare-fun tp!30080 () Bool)

(declare-fun e!230425 () Bool)

(assert (=> mapNonEmpty!15219 (= mapRes!15219 (and tp!30080 e!230425))))

(declare-datatypes ((ValueCell!4208 0))(
  ( (ValueCellFull!4208 (v!6794 V!13243)) (EmptyCell!4208) )
))
(declare-fun mapRest!15219 () (Array (_ BitVec 32) ValueCell!4208))

(declare-fun mapKey!15219 () (_ BitVec 32))

(declare-datatypes ((array!22122 0))(
  ( (array!22123 (arr!10529 (Array (_ BitVec 32) ValueCell!4208)) (size!10881 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22122)

(declare-fun mapValue!15219 () ValueCell!4208)

(assert (=> mapNonEmpty!15219 (= (arr!10529 _values!506) (store mapRest!15219 mapKey!15219 mapValue!15219))))

(declare-fun b!378645 () Bool)

(declare-fun tp_is_empty!9103 () Bool)

(assert (=> b!378645 (= e!230425 tp_is_empty!9103)))

(declare-fun b!378646 () Bool)

(declare-fun res!214554 () Bool)

(assert (=> b!378646 (=> (not res!214554) (not e!230426))))

(declare-fun arrayContainsKey!0 (array!22120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378646 (= res!214554 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378647 () Bool)

(declare-fun res!214546 () Bool)

(assert (=> b!378647 (=> (not res!214546) (not e!230426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378647 (= res!214546 (validKeyInArray!0 k0!778))))

(declare-fun b!378648 () Bool)

(declare-fun res!214547 () Bool)

(assert (=> b!378648 (=> (not res!214547) (not e!230426))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378648 (= res!214547 (and (= (size!10881 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10880 _keys!658) (size!10881 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378649 () Bool)

(declare-fun e!230430 () Bool)

(assert (=> b!378649 (= e!230430 e!230427)))

(declare-fun res!214550 () Bool)

(assert (=> b!378649 (=> res!214550 e!230427)))

(assert (=> b!378649 (= res!214550 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176561 () ListLongMap!4959)

(assert (=> b!378649 (= lt!176561 lt!176554)))

(declare-fun lt!176557 () tuple2!6044)

(assert (=> b!378649 (= lt!176554 (+!891 lt!176556 lt!176557))))

(declare-fun lt!176566 () ListLongMap!4959)

(assert (=> b!378649 (= lt!176566 lt!176558)))

(declare-fun lt!176562 () ListLongMap!4959)

(assert (=> b!378649 (= lt!176558 (+!891 lt!176562 lt!176557))))

(declare-fun lt!176563 () ListLongMap!4959)

(assert (=> b!378649 (= lt!176566 (+!891 lt!176563 lt!176557))))

(assert (=> b!378649 (= lt!176557 (tuple2!6045 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun res!214553 () Bool)

(assert (=> start!37314 (=> (not res!214553) (not e!230426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37314 (= res!214553 (validMask!0 mask!970))))

(assert (=> start!37314 e!230426))

(declare-fun e!230429 () Bool)

(declare-fun array_inv!7804 (array!22122) Bool)

(assert (=> start!37314 (and (array_inv!7804 _values!506) e!230429)))

(assert (=> start!37314 tp!30081))

(assert (=> start!37314 true))

(assert (=> start!37314 tp_is_empty!9103))

(declare-fun array_inv!7805 (array!22120) Bool)

(assert (=> start!37314 (array_inv!7805 _keys!658)))

(declare-fun b!378650 () Bool)

(declare-fun res!214555 () Bool)

(assert (=> b!378650 (=> (not res!214555) (not e!230426))))

(declare-datatypes ((List!5883 0))(
  ( (Nil!5880) (Cons!5879 (h!6735 (_ BitVec 64)) (t!11025 List!5883)) )
))
(declare-fun arrayNoDuplicates!0 (array!22120 (_ BitVec 32) List!5883) Bool)

(assert (=> b!378650 (= res!214555 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5880))))

(declare-fun b!378651 () Bool)

(declare-fun res!214549 () Bool)

(assert (=> b!378651 (=> (not res!214549) (not e!230426))))

(assert (=> b!378651 (= res!214549 (or (= (select (arr!10528 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10528 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378652 () Bool)

(declare-fun e!230428 () Bool)

(assert (=> b!378652 (= e!230428 tp_is_empty!9103)))

(declare-fun b!378653 () Bool)

(declare-fun res!214551 () Bool)

(assert (=> b!378653 (=> (not res!214551) (not e!230424))))

(assert (=> b!378653 (= res!214551 (arrayNoDuplicates!0 lt!176559 #b00000000000000000000000000000000 Nil!5880))))

(declare-fun b!378654 () Bool)

(assert (=> b!378654 (= e!230429 (and e!230428 mapRes!15219))))

(declare-fun condMapEmpty!15219 () Bool)

(declare-fun mapDefault!15219 () ValueCell!4208)

(assert (=> b!378654 (= condMapEmpty!15219 (= (arr!10529 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4208)) mapDefault!15219)))))

(declare-fun mapIsEmpty!15219 () Bool)

(assert (=> mapIsEmpty!15219 mapRes!15219))

(declare-fun b!378655 () Bool)

(assert (=> b!378655 (= e!230424 (not e!230430))))

(declare-fun res!214545 () Bool)

(assert (=> b!378655 (=> res!214545 e!230430)))

(assert (=> b!378655 (= res!214545 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13243)

(declare-fun getCurrentListMap!1936 (array!22120 array!22122 (_ BitVec 32) (_ BitVec 32) V!13243 V!13243 (_ BitVec 32) Int) ListLongMap!4959)

(assert (=> b!378655 (= lt!176561 (getCurrentListMap!1936 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176564 () array!22122)

(assert (=> b!378655 (= lt!176566 (getCurrentListMap!1936 lt!176559 lt!176564 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378655 (and (= lt!176563 lt!176562) (= lt!176562 lt!176563))))

(assert (=> b!378655 (= lt!176562 (+!891 lt!176556 lt!176565))))

(assert (=> b!378655 (= lt!176565 (tuple2!6045 k0!778 v!373))))

(declare-fun lt!176560 () Unit!11665)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!123 (array!22120 array!22122 (_ BitVec 32) (_ BitVec 32) V!13243 V!13243 (_ BitVec 32) (_ BitVec 64) V!13243 (_ BitVec 32) Int) Unit!11665)

(assert (=> b!378655 (= lt!176560 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!123 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!783 (array!22120 array!22122 (_ BitVec 32) (_ BitVec 32) V!13243 V!13243 (_ BitVec 32) Int) ListLongMap!4959)

(assert (=> b!378655 (= lt!176563 (getCurrentListMapNoExtraKeys!783 lt!176559 lt!176564 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378655 (= lt!176564 (array!22123 (store (arr!10529 _values!506) i!548 (ValueCellFull!4208 v!373)) (size!10881 _values!506)))))

(assert (=> b!378655 (= lt!176556 (getCurrentListMapNoExtraKeys!783 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37314 res!214553) b!378648))

(assert (= (and b!378648 res!214547) b!378644))

(assert (= (and b!378644 res!214552) b!378650))

(assert (= (and b!378650 res!214555) b!378642))

(assert (= (and b!378642 res!214548) b!378647))

(assert (= (and b!378647 res!214546) b!378651))

(assert (= (and b!378651 res!214549) b!378646))

(assert (= (and b!378646 res!214554) b!378641))

(assert (= (and b!378641 res!214556) b!378653))

(assert (= (and b!378653 res!214551) b!378655))

(assert (= (and b!378655 (not res!214545)) b!378649))

(assert (= (and b!378649 (not res!214550)) b!378643))

(assert (= (and b!378654 condMapEmpty!15219) mapIsEmpty!15219))

(assert (= (and b!378654 (not condMapEmpty!15219)) mapNonEmpty!15219))

(get-info :version)

(assert (= (and mapNonEmpty!15219 ((_ is ValueCellFull!4208) mapValue!15219)) b!378645))

(assert (= (and b!378654 ((_ is ValueCellFull!4208) mapDefault!15219)) b!378652))

(assert (= start!37314 b!378654))

(declare-fun m!375749 () Bool)

(assert (=> mapNonEmpty!15219 m!375749))

(declare-fun m!375751 () Bool)

(assert (=> b!378644 m!375751))

(declare-fun m!375753 () Bool)

(assert (=> b!378641 m!375753))

(declare-fun m!375755 () Bool)

(assert (=> b!378641 m!375755))

(declare-fun m!375757 () Bool)

(assert (=> start!37314 m!375757))

(declare-fun m!375759 () Bool)

(assert (=> start!37314 m!375759))

(declare-fun m!375761 () Bool)

(assert (=> start!37314 m!375761))

(declare-fun m!375763 () Bool)

(assert (=> b!378650 m!375763))

(declare-fun m!375765 () Bool)

(assert (=> b!378646 m!375765))

(declare-fun m!375767 () Bool)

(assert (=> b!378647 m!375767))

(declare-fun m!375769 () Bool)

(assert (=> b!378651 m!375769))

(declare-fun m!375771 () Bool)

(assert (=> b!378649 m!375771))

(declare-fun m!375773 () Bool)

(assert (=> b!378649 m!375773))

(declare-fun m!375775 () Bool)

(assert (=> b!378649 m!375775))

(declare-fun m!375777 () Bool)

(assert (=> b!378653 m!375777))

(declare-fun m!375779 () Bool)

(assert (=> b!378655 m!375779))

(declare-fun m!375781 () Bool)

(assert (=> b!378655 m!375781))

(declare-fun m!375783 () Bool)

(assert (=> b!378655 m!375783))

(declare-fun m!375785 () Bool)

(assert (=> b!378655 m!375785))

(declare-fun m!375787 () Bool)

(assert (=> b!378655 m!375787))

(declare-fun m!375789 () Bool)

(assert (=> b!378655 m!375789))

(declare-fun m!375791 () Bool)

(assert (=> b!378655 m!375791))

(declare-fun m!375793 () Bool)

(assert (=> b!378643 m!375793))

(declare-fun m!375795 () Bool)

(assert (=> b!378643 m!375795))

(check-sat b_and!15711 (not b!378641) (not start!37314) tp_is_empty!9103 (not b_next!8455) (not b!378655) (not b!378649) (not b!378646) (not b!378647) (not b!378650) (not b!378643) (not b!378644) (not mapNonEmpty!15219) (not b!378653))
(check-sat b_and!15711 (not b_next!8455))
