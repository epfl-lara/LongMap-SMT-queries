; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37108 () Bool)

(assert start!37108)

(declare-fun b_free!8235 () Bool)

(declare-fun b_next!8235 () Bool)

(assert (=> start!37108 (= b_free!8235 (not b_next!8235))))

(declare-fun tp!29421 () Bool)

(declare-fun b_and!15477 () Bool)

(assert (=> start!37108 (= tp!29421 b_and!15477)))

(declare-fun b!373722 () Bool)

(declare-fun e!227822 () Bool)

(declare-fun tp_is_empty!8883 () Bool)

(assert (=> b!373722 (= e!227822 tp_is_empty!8883)))

(declare-fun mapNonEmpty!14889 () Bool)

(declare-fun mapRes!14889 () Bool)

(declare-fun tp!29420 () Bool)

(assert (=> mapNonEmpty!14889 (= mapRes!14889 (and tp!29420 e!227822))))

(declare-datatypes ((V!12949 0))(
  ( (V!12950 (val!4486 Int)) )
))
(declare-datatypes ((ValueCell!4098 0))(
  ( (ValueCellFull!4098 (v!6683 V!12949)) (EmptyCell!4098) )
))
(declare-datatypes ((array!21705 0))(
  ( (array!21706 (arr!10321 (Array (_ BitVec 32) ValueCell!4098)) (size!10673 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21705)

(declare-fun mapKey!14889 () (_ BitVec 32))

(declare-fun mapValue!14889 () ValueCell!4098)

(declare-fun mapRest!14889 () (Array (_ BitVec 32) ValueCell!4098))

(assert (=> mapNonEmpty!14889 (= (arr!10321 _values!506) (store mapRest!14889 mapKey!14889 mapValue!14889))))

(declare-fun b!373723 () Bool)

(declare-fun e!227817 () Bool)

(declare-fun e!227815 () Bool)

(assert (=> b!373723 (= e!227817 (not e!227815))))

(declare-fun res!210579 () Bool)

(assert (=> b!373723 (=> res!210579 e!227815)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373723 (= res!210579 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!5958 0))(
  ( (tuple2!5959 (_1!2990 (_ BitVec 64)) (_2!2990 V!12949)) )
))
(declare-datatypes ((List!5803 0))(
  ( (Nil!5800) (Cons!5799 (h!6655 tuple2!5958) (t!10953 List!5803)) )
))
(declare-datatypes ((ListLongMap!4871 0))(
  ( (ListLongMap!4872 (toList!2451 List!5803)) )
))
(declare-fun lt!171797 () ListLongMap!4871)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12949)

(declare-datatypes ((array!21707 0))(
  ( (array!21708 (arr!10322 (Array (_ BitVec 32) (_ BitVec 64))) (size!10674 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21707)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12949)

(declare-fun getCurrentListMap!1891 (array!21707 array!21705 (_ BitVec 32) (_ BitVec 32) V!12949 V!12949 (_ BitVec 32) Int) ListLongMap!4871)

(assert (=> b!373723 (= lt!171797 (getCurrentListMap!1891 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171798 () ListLongMap!4871)

(declare-fun lt!171811 () array!21705)

(declare-fun lt!171808 () array!21707)

(assert (=> b!373723 (= lt!171798 (getCurrentListMap!1891 lt!171808 lt!171811 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171806 () ListLongMap!4871)

(declare-fun lt!171803 () ListLongMap!4871)

(assert (=> b!373723 (and (= lt!171806 lt!171803) (= lt!171803 lt!171806))))

(declare-fun lt!171801 () ListLongMap!4871)

(declare-fun lt!171807 () tuple2!5958)

(declare-fun +!797 (ListLongMap!4871 tuple2!5958) ListLongMap!4871)

(assert (=> b!373723 (= lt!171803 (+!797 lt!171801 lt!171807))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!12949)

(assert (=> b!373723 (= lt!171807 (tuple2!5959 k0!778 v!373))))

(declare-datatypes ((Unit!11500 0))(
  ( (Unit!11501) )
))
(declare-fun lt!171805 () Unit!11500)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!49 (array!21707 array!21705 (_ BitVec 32) (_ BitVec 32) V!12949 V!12949 (_ BitVec 32) (_ BitVec 64) V!12949 (_ BitVec 32) Int) Unit!11500)

(assert (=> b!373723 (= lt!171805 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!49 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!725 (array!21707 array!21705 (_ BitVec 32) (_ BitVec 32) V!12949 V!12949 (_ BitVec 32) Int) ListLongMap!4871)

(assert (=> b!373723 (= lt!171806 (getCurrentListMapNoExtraKeys!725 lt!171808 lt!171811 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373723 (= lt!171811 (array!21706 (store (arr!10321 _values!506) i!548 (ValueCellFull!4098 v!373)) (size!10673 _values!506)))))

(assert (=> b!373723 (= lt!171801 (getCurrentListMapNoExtraKeys!725 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373725 () Bool)

(declare-fun res!210576 () Bool)

(declare-fun e!227818 () Bool)

(assert (=> b!373725 (=> (not res!210576) (not e!227818))))

(declare-datatypes ((List!5804 0))(
  ( (Nil!5801) (Cons!5800 (h!6656 (_ BitVec 64)) (t!10954 List!5804)) )
))
(declare-fun arrayNoDuplicates!0 (array!21707 (_ BitVec 32) List!5804) Bool)

(assert (=> b!373725 (= res!210576 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5801))))

(declare-fun b!373726 () Bool)

(declare-fun e!227819 () Bool)

(assert (=> b!373726 (= e!227815 e!227819)))

(declare-fun res!210574 () Bool)

(assert (=> b!373726 (=> res!210574 e!227819)))

(assert (=> b!373726 (= res!210574 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!171813 () ListLongMap!4871)

(declare-fun lt!171802 () ListLongMap!4871)

(assert (=> b!373726 (= lt!171813 lt!171802)))

(declare-fun lt!171812 () ListLongMap!4871)

(assert (=> b!373726 (= lt!171802 (+!797 lt!171812 lt!171807))))

(declare-fun lt!171800 () Unit!11500)

(declare-fun addCommutativeForDiffKeys!221 (ListLongMap!4871 (_ BitVec 64) V!12949 (_ BitVec 64) V!12949) Unit!11500)

(assert (=> b!373726 (= lt!171800 (addCommutativeForDiffKeys!221 lt!171801 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171804 () tuple2!5958)

(assert (=> b!373726 (= lt!171798 (+!797 lt!171813 lt!171804))))

(declare-fun lt!171809 () tuple2!5958)

(assert (=> b!373726 (= lt!171813 (+!797 lt!171803 lt!171809))))

(declare-fun lt!171799 () ListLongMap!4871)

(assert (=> b!373726 (= lt!171797 lt!171799)))

(assert (=> b!373726 (= lt!171799 (+!797 lt!171812 lt!171804))))

(assert (=> b!373726 (= lt!171812 (+!797 lt!171801 lt!171809))))

(assert (=> b!373726 (= lt!171798 (+!797 (+!797 lt!171806 lt!171809) lt!171804))))

(assert (=> b!373726 (= lt!171804 (tuple2!5959 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373726 (= lt!171809 (tuple2!5959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373727 () Bool)

(declare-fun e!227816 () Bool)

(assert (=> b!373727 (= e!227816 tp_is_empty!8883)))

(declare-fun b!373728 () Bool)

(declare-fun res!210572 () Bool)

(assert (=> b!373728 (=> (not res!210572) (not e!227818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21707 (_ BitVec 32)) Bool)

(assert (=> b!373728 (= res!210572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373729 () Bool)

(declare-fun res!210581 () Bool)

(assert (=> b!373729 (=> (not res!210581) (not e!227818))))

(assert (=> b!373729 (= res!210581 (or (= (select (arr!10322 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10322 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373730 () Bool)

(assert (=> b!373730 (= e!227819 true)))

(assert (=> b!373730 (= (+!797 lt!171802 lt!171804) (+!797 lt!171799 lt!171807))))

(declare-fun lt!171810 () Unit!11500)

(assert (=> b!373730 (= lt!171810 (addCommutativeForDiffKeys!221 lt!171812 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!14889 () Bool)

(assert (=> mapIsEmpty!14889 mapRes!14889))

(declare-fun b!373731 () Bool)

(declare-fun res!210570 () Bool)

(assert (=> b!373731 (=> (not res!210570) (not e!227817))))

(assert (=> b!373731 (= res!210570 (arrayNoDuplicates!0 lt!171808 #b00000000000000000000000000000000 Nil!5801))))

(declare-fun b!373732 () Bool)

(declare-fun res!210575 () Bool)

(assert (=> b!373732 (=> (not res!210575) (not e!227818))))

(declare-fun arrayContainsKey!0 (array!21707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373732 (= res!210575 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373724 () Bool)

(declare-fun res!210580 () Bool)

(assert (=> b!373724 (=> (not res!210580) (not e!227818))))

(assert (=> b!373724 (= res!210580 (and (= (size!10673 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10674 _keys!658) (size!10673 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!210573 () Bool)

(assert (=> start!37108 (=> (not res!210573) (not e!227818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37108 (= res!210573 (validMask!0 mask!970))))

(assert (=> start!37108 e!227818))

(declare-fun e!227821 () Bool)

(declare-fun array_inv!7606 (array!21705) Bool)

(assert (=> start!37108 (and (array_inv!7606 _values!506) e!227821)))

(assert (=> start!37108 tp!29421))

(assert (=> start!37108 true))

(assert (=> start!37108 tp_is_empty!8883))

(declare-fun array_inv!7607 (array!21707) Bool)

(assert (=> start!37108 (array_inv!7607 _keys!658)))

(declare-fun b!373733 () Bool)

(assert (=> b!373733 (= e!227821 (and e!227816 mapRes!14889))))

(declare-fun condMapEmpty!14889 () Bool)

(declare-fun mapDefault!14889 () ValueCell!4098)

(assert (=> b!373733 (= condMapEmpty!14889 (= (arr!10321 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4098)) mapDefault!14889)))))

(declare-fun b!373734 () Bool)

(assert (=> b!373734 (= e!227818 e!227817)))

(declare-fun res!210571 () Bool)

(assert (=> b!373734 (=> (not res!210571) (not e!227817))))

(assert (=> b!373734 (= res!210571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171808 mask!970))))

(assert (=> b!373734 (= lt!171808 (array!21708 (store (arr!10322 _keys!658) i!548 k0!778) (size!10674 _keys!658)))))

(declare-fun b!373735 () Bool)

(declare-fun res!210578 () Bool)

(assert (=> b!373735 (=> (not res!210578) (not e!227818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373735 (= res!210578 (validKeyInArray!0 k0!778))))

(declare-fun b!373736 () Bool)

(declare-fun res!210577 () Bool)

(assert (=> b!373736 (=> (not res!210577) (not e!227818))))

(assert (=> b!373736 (= res!210577 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10674 _keys!658))))))

(assert (= (and start!37108 res!210573) b!373724))

(assert (= (and b!373724 res!210580) b!373728))

(assert (= (and b!373728 res!210572) b!373725))

(assert (= (and b!373725 res!210576) b!373736))

(assert (= (and b!373736 res!210577) b!373735))

(assert (= (and b!373735 res!210578) b!373729))

(assert (= (and b!373729 res!210581) b!373732))

(assert (= (and b!373732 res!210575) b!373734))

(assert (= (and b!373734 res!210571) b!373731))

(assert (= (and b!373731 res!210570) b!373723))

(assert (= (and b!373723 (not res!210579)) b!373726))

(assert (= (and b!373726 (not res!210574)) b!373730))

(assert (= (and b!373733 condMapEmpty!14889) mapIsEmpty!14889))

(assert (= (and b!373733 (not condMapEmpty!14889)) mapNonEmpty!14889))

(get-info :version)

(assert (= (and mapNonEmpty!14889 ((_ is ValueCellFull!4098) mapValue!14889)) b!373722))

(assert (= (and b!373733 ((_ is ValueCellFull!4098) mapDefault!14889)) b!373727))

(assert (= start!37108 b!373733))

(declare-fun m!369735 () Bool)

(assert (=> b!373725 m!369735))

(declare-fun m!369737 () Bool)

(assert (=> b!373728 m!369737))

(declare-fun m!369739 () Bool)

(assert (=> b!373726 m!369739))

(declare-fun m!369741 () Bool)

(assert (=> b!373726 m!369741))

(declare-fun m!369743 () Bool)

(assert (=> b!373726 m!369743))

(declare-fun m!369745 () Bool)

(assert (=> b!373726 m!369745))

(declare-fun m!369747 () Bool)

(assert (=> b!373726 m!369747))

(declare-fun m!369749 () Bool)

(assert (=> b!373726 m!369749))

(declare-fun m!369751 () Bool)

(assert (=> b!373726 m!369751))

(declare-fun m!369753 () Bool)

(assert (=> b!373726 m!369753))

(assert (=> b!373726 m!369747))

(declare-fun m!369755 () Bool)

(assert (=> b!373732 m!369755))

(declare-fun m!369757 () Bool)

(assert (=> mapNonEmpty!14889 m!369757))

(declare-fun m!369759 () Bool)

(assert (=> b!373730 m!369759))

(declare-fun m!369761 () Bool)

(assert (=> b!373730 m!369761))

(declare-fun m!369763 () Bool)

(assert (=> b!373730 m!369763))

(declare-fun m!369765 () Bool)

(assert (=> start!37108 m!369765))

(declare-fun m!369767 () Bool)

(assert (=> start!37108 m!369767))

(declare-fun m!369769 () Bool)

(assert (=> start!37108 m!369769))

(declare-fun m!369771 () Bool)

(assert (=> b!373729 m!369771))

(declare-fun m!369773 () Bool)

(assert (=> b!373723 m!369773))

(declare-fun m!369775 () Bool)

(assert (=> b!373723 m!369775))

(declare-fun m!369777 () Bool)

(assert (=> b!373723 m!369777))

(declare-fun m!369779 () Bool)

(assert (=> b!373723 m!369779))

(declare-fun m!369781 () Bool)

(assert (=> b!373723 m!369781))

(declare-fun m!369783 () Bool)

(assert (=> b!373723 m!369783))

(declare-fun m!369785 () Bool)

(assert (=> b!373723 m!369785))

(declare-fun m!369787 () Bool)

(assert (=> b!373735 m!369787))

(declare-fun m!369789 () Bool)

(assert (=> b!373731 m!369789))

(declare-fun m!369791 () Bool)

(assert (=> b!373734 m!369791))

(declare-fun m!369793 () Bool)

(assert (=> b!373734 m!369793))

(check-sat (not b!373728) (not b!373726) (not b_next!8235) (not b!373734) (not b!373731) (not b!373730) (not b!373725) b_and!15477 (not start!37108) (not b!373732) (not b!373735) (not mapNonEmpty!14889) tp_is_empty!8883 (not b!373723))
(check-sat b_and!15477 (not b_next!8235))
