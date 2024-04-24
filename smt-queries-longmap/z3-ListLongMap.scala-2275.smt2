; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37098 () Bool)

(assert start!37098)

(declare-fun b_free!8239 () Bool)

(declare-fun b_next!8239 () Bool)

(assert (=> start!37098 (= b_free!8239 (not b_next!8239))))

(declare-fun tp!29432 () Bool)

(declare-fun b_and!15495 () Bool)

(assert (=> start!37098 (= tp!29432 b_and!15495)))

(declare-fun b!373764 () Bool)

(declare-fun res!210643 () Bool)

(declare-fun e!227832 () Bool)

(assert (=> b!373764 (=> (not res!210643) (not e!227832))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373764 (= res!210643 (validKeyInArray!0 k0!778))))

(declare-fun b!373765 () Bool)

(declare-fun res!210642 () Bool)

(assert (=> b!373765 (=> (not res!210642) (not e!227832))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12955 0))(
  ( (V!12956 (val!4488 Int)) )
))
(declare-datatypes ((ValueCell!4100 0))(
  ( (ValueCellFull!4100 (v!6686 V!12955)) (EmptyCell!4100) )
))
(declare-datatypes ((array!21696 0))(
  ( (array!21697 (arr!10316 (Array (_ BitVec 32) ValueCell!4100)) (size!10668 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21696)

(declare-datatypes ((array!21698 0))(
  ( (array!21699 (arr!10317 (Array (_ BitVec 32) (_ BitVec 64))) (size!10669 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21698)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!373765 (= res!210642 (and (= (size!10668 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10669 _keys!658) (size!10668 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373766 () Bool)

(declare-fun e!227833 () Bool)

(assert (=> b!373766 (= e!227833 true)))

(declare-datatypes ((tuple2!5864 0))(
  ( (tuple2!5865 (_1!2943 (_ BitVec 64)) (_2!2943 V!12955)) )
))
(declare-datatypes ((List!5709 0))(
  ( (Nil!5706) (Cons!5705 (h!6561 tuple2!5864) (t!10851 List!5709)) )
))
(declare-datatypes ((ListLongMap!4779 0))(
  ( (ListLongMap!4780 (toList!2405 List!5709)) )
))
(declare-fun lt!171934 () ListLongMap!4779)

(declare-fun lt!171920 () tuple2!5864)

(declare-fun lt!171921 () tuple2!5864)

(declare-fun lt!171932 () ListLongMap!4779)

(declare-fun +!801 (ListLongMap!4779 tuple2!5864) ListLongMap!4779)

(assert (=> b!373766 (= (+!801 lt!171932 lt!171921) (+!801 lt!171934 lt!171920))))

(declare-datatypes ((Unit!11491 0))(
  ( (Unit!11492) )
))
(declare-fun lt!171919 () Unit!11491)

(declare-fun v!373 () V!12955)

(declare-fun minValue!472 () V!12955)

(declare-fun lt!171929 () ListLongMap!4779)

(declare-fun addCommutativeForDiffKeys!229 (ListLongMap!4779 (_ BitVec 64) V!12955 (_ BitVec 64) V!12955) Unit!11491)

(assert (=> b!373766 (= lt!171919 (addCommutativeForDiffKeys!229 lt!171929 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373767 () Bool)

(declare-fun res!210639 () Bool)

(assert (=> b!373767 (=> (not res!210639) (not e!227832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21698 (_ BitVec 32)) Bool)

(assert (=> b!373767 (= res!210639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373768 () Bool)

(declare-fun e!227835 () Bool)

(declare-fun e!227831 () Bool)

(declare-fun mapRes!14895 () Bool)

(assert (=> b!373768 (= e!227835 (and e!227831 mapRes!14895))))

(declare-fun condMapEmpty!14895 () Bool)

(declare-fun mapDefault!14895 () ValueCell!4100)

(assert (=> b!373768 (= condMapEmpty!14895 (= (arr!10316 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4100)) mapDefault!14895)))))

(declare-fun b!373769 () Bool)

(declare-fun e!227838 () Bool)

(assert (=> b!373769 (= e!227832 e!227838)))

(declare-fun res!210649 () Bool)

(assert (=> b!373769 (=> (not res!210649) (not e!227838))))

(declare-fun lt!171923 () array!21698)

(assert (=> b!373769 (= res!210649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171923 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373769 (= lt!171923 (array!21699 (store (arr!10317 _keys!658) i!548 k0!778) (size!10669 _keys!658)))))

(declare-fun mapIsEmpty!14895 () Bool)

(assert (=> mapIsEmpty!14895 mapRes!14895))

(declare-fun b!373770 () Bool)

(declare-fun e!227834 () Bool)

(assert (=> b!373770 (= e!227834 e!227833)))

(declare-fun res!210645 () Bool)

(assert (=> b!373770 (=> res!210645 e!227833)))

(assert (=> b!373770 (= res!210645 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!171926 () ListLongMap!4779)

(assert (=> b!373770 (= lt!171926 lt!171932)))

(assert (=> b!373770 (= lt!171932 (+!801 lt!171929 lt!171920))))

(declare-fun lt!171933 () Unit!11491)

(declare-fun zeroValue!472 () V!12955)

(declare-fun lt!171918 () ListLongMap!4779)

(assert (=> b!373770 (= lt!171933 (addCommutativeForDiffKeys!229 lt!171918 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171931 () ListLongMap!4779)

(assert (=> b!373770 (= lt!171931 (+!801 lt!171926 lt!171921))))

(declare-fun lt!171927 () ListLongMap!4779)

(declare-fun lt!171930 () tuple2!5864)

(assert (=> b!373770 (= lt!171926 (+!801 lt!171927 lt!171930))))

(declare-fun lt!171924 () ListLongMap!4779)

(assert (=> b!373770 (= lt!171924 lt!171934)))

(assert (=> b!373770 (= lt!171934 (+!801 lt!171929 lt!171921))))

(assert (=> b!373770 (= lt!171929 (+!801 lt!171918 lt!171930))))

(declare-fun lt!171922 () ListLongMap!4779)

(assert (=> b!373770 (= lt!171931 (+!801 (+!801 lt!171922 lt!171930) lt!171921))))

(assert (=> b!373770 (= lt!171921 (tuple2!5865 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373770 (= lt!171930 (tuple2!5865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!210640 () Bool)

(assert (=> start!37098 (=> (not res!210640) (not e!227832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37098 (= res!210640 (validMask!0 mask!970))))

(assert (=> start!37098 e!227832))

(declare-fun array_inv!7658 (array!21696) Bool)

(assert (=> start!37098 (and (array_inv!7658 _values!506) e!227835)))

(assert (=> start!37098 tp!29432))

(assert (=> start!37098 true))

(declare-fun tp_is_empty!8887 () Bool)

(assert (=> start!37098 tp_is_empty!8887))

(declare-fun array_inv!7659 (array!21698) Bool)

(assert (=> start!37098 (array_inv!7659 _keys!658)))

(declare-fun b!373763 () Bool)

(declare-fun e!227837 () Bool)

(assert (=> b!373763 (= e!227837 tp_is_empty!8887)))

(declare-fun b!373771 () Bool)

(assert (=> b!373771 (= e!227838 (not e!227834))))

(declare-fun res!210650 () Bool)

(assert (=> b!373771 (=> res!210650 e!227834)))

(assert (=> b!373771 (= res!210650 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1866 (array!21698 array!21696 (_ BitVec 32) (_ BitVec 32) V!12955 V!12955 (_ BitVec 32) Int) ListLongMap!4779)

(assert (=> b!373771 (= lt!171924 (getCurrentListMap!1866 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171928 () array!21696)

(assert (=> b!373771 (= lt!171931 (getCurrentListMap!1866 lt!171923 lt!171928 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373771 (and (= lt!171922 lt!171927) (= lt!171927 lt!171922))))

(assert (=> b!373771 (= lt!171927 (+!801 lt!171918 lt!171920))))

(assert (=> b!373771 (= lt!171920 (tuple2!5865 k0!778 v!373))))

(declare-fun lt!171925 () Unit!11491)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!53 (array!21698 array!21696 (_ BitVec 32) (_ BitVec 32) V!12955 V!12955 (_ BitVec 32) (_ BitVec 64) V!12955 (_ BitVec 32) Int) Unit!11491)

(assert (=> b!373771 (= lt!171925 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!53 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!713 (array!21698 array!21696 (_ BitVec 32) (_ BitVec 32) V!12955 V!12955 (_ BitVec 32) Int) ListLongMap!4779)

(assert (=> b!373771 (= lt!171922 (getCurrentListMapNoExtraKeys!713 lt!171923 lt!171928 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373771 (= lt!171928 (array!21697 (store (arr!10316 _values!506) i!548 (ValueCellFull!4100 v!373)) (size!10668 _values!506)))))

(assert (=> b!373771 (= lt!171918 (getCurrentListMapNoExtraKeys!713 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373772 () Bool)

(declare-fun res!210644 () Bool)

(assert (=> b!373772 (=> (not res!210644) (not e!227832))))

(declare-fun arrayContainsKey!0 (array!21698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373772 (= res!210644 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14895 () Bool)

(declare-fun tp!29433 () Bool)

(assert (=> mapNonEmpty!14895 (= mapRes!14895 (and tp!29433 e!227837))))

(declare-fun mapRest!14895 () (Array (_ BitVec 32) ValueCell!4100))

(declare-fun mapKey!14895 () (_ BitVec 32))

(declare-fun mapValue!14895 () ValueCell!4100)

(assert (=> mapNonEmpty!14895 (= (arr!10316 _values!506) (store mapRest!14895 mapKey!14895 mapValue!14895))))

(declare-fun b!373773 () Bool)

(declare-fun res!210648 () Bool)

(assert (=> b!373773 (=> (not res!210648) (not e!227832))))

(assert (=> b!373773 (= res!210648 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10669 _keys!658))))))

(declare-fun b!373774 () Bool)

(declare-fun res!210647 () Bool)

(assert (=> b!373774 (=> (not res!210647) (not e!227838))))

(declare-datatypes ((List!5710 0))(
  ( (Nil!5707) (Cons!5706 (h!6562 (_ BitVec 64)) (t!10852 List!5710)) )
))
(declare-fun arrayNoDuplicates!0 (array!21698 (_ BitVec 32) List!5710) Bool)

(assert (=> b!373774 (= res!210647 (arrayNoDuplicates!0 lt!171923 #b00000000000000000000000000000000 Nil!5707))))

(declare-fun b!373775 () Bool)

(declare-fun res!210641 () Bool)

(assert (=> b!373775 (=> (not res!210641) (not e!227832))))

(assert (=> b!373775 (= res!210641 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5707))))

(declare-fun b!373776 () Bool)

(assert (=> b!373776 (= e!227831 tp_is_empty!8887)))

(declare-fun b!373777 () Bool)

(declare-fun res!210646 () Bool)

(assert (=> b!373777 (=> (not res!210646) (not e!227832))))

(assert (=> b!373777 (= res!210646 (or (= (select (arr!10317 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10317 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37098 res!210640) b!373765))

(assert (= (and b!373765 res!210642) b!373767))

(assert (= (and b!373767 res!210639) b!373775))

(assert (= (and b!373775 res!210641) b!373773))

(assert (= (and b!373773 res!210648) b!373764))

(assert (= (and b!373764 res!210643) b!373777))

(assert (= (and b!373777 res!210646) b!373772))

(assert (= (and b!373772 res!210644) b!373769))

(assert (= (and b!373769 res!210649) b!373774))

(assert (= (and b!373774 res!210647) b!373771))

(assert (= (and b!373771 (not res!210650)) b!373770))

(assert (= (and b!373770 (not res!210645)) b!373766))

(assert (= (and b!373768 condMapEmpty!14895) mapIsEmpty!14895))

(assert (= (and b!373768 (not condMapEmpty!14895)) mapNonEmpty!14895))

(get-info :version)

(assert (= (and mapNonEmpty!14895 ((_ is ValueCellFull!4100) mapValue!14895)) b!373763))

(assert (= (and b!373768 ((_ is ValueCellFull!4100) mapDefault!14895)) b!373776))

(assert (= start!37098 b!373768))

(declare-fun m!370085 () Bool)

(assert (=> b!373774 m!370085))

(declare-fun m!370087 () Bool)

(assert (=> b!373769 m!370087))

(declare-fun m!370089 () Bool)

(assert (=> b!373769 m!370089))

(declare-fun m!370091 () Bool)

(assert (=> b!373764 m!370091))

(declare-fun m!370093 () Bool)

(assert (=> b!373777 m!370093))

(declare-fun m!370095 () Bool)

(assert (=> b!373767 m!370095))

(declare-fun m!370097 () Bool)

(assert (=> b!373770 m!370097))

(declare-fun m!370099 () Bool)

(assert (=> b!373770 m!370099))

(declare-fun m!370101 () Bool)

(assert (=> b!373770 m!370101))

(declare-fun m!370103 () Bool)

(assert (=> b!373770 m!370103))

(declare-fun m!370105 () Bool)

(assert (=> b!373770 m!370105))

(declare-fun m!370107 () Bool)

(assert (=> b!373770 m!370107))

(declare-fun m!370109 () Bool)

(assert (=> b!373770 m!370109))

(declare-fun m!370111 () Bool)

(assert (=> b!373770 m!370111))

(assert (=> b!373770 m!370107))

(declare-fun m!370113 () Bool)

(assert (=> b!373771 m!370113))

(declare-fun m!370115 () Bool)

(assert (=> b!373771 m!370115))

(declare-fun m!370117 () Bool)

(assert (=> b!373771 m!370117))

(declare-fun m!370119 () Bool)

(assert (=> b!373771 m!370119))

(declare-fun m!370121 () Bool)

(assert (=> b!373771 m!370121))

(declare-fun m!370123 () Bool)

(assert (=> b!373771 m!370123))

(declare-fun m!370125 () Bool)

(assert (=> b!373771 m!370125))

(declare-fun m!370127 () Bool)

(assert (=> b!373766 m!370127))

(declare-fun m!370129 () Bool)

(assert (=> b!373766 m!370129))

(declare-fun m!370131 () Bool)

(assert (=> b!373766 m!370131))

(declare-fun m!370133 () Bool)

(assert (=> start!37098 m!370133))

(declare-fun m!370135 () Bool)

(assert (=> start!37098 m!370135))

(declare-fun m!370137 () Bool)

(assert (=> start!37098 m!370137))

(declare-fun m!370139 () Bool)

(assert (=> b!373772 m!370139))

(declare-fun m!370141 () Bool)

(assert (=> mapNonEmpty!14895 m!370141))

(declare-fun m!370143 () Bool)

(assert (=> b!373775 m!370143))

(check-sat (not b!373771) (not b!373774) tp_is_empty!8887 b_and!15495 (not b!373772) (not b!373767) (not start!37098) (not b!373764) (not b!373775) (not b!373769) (not b!373770) (not mapNonEmpty!14895) (not b!373766) (not b_next!8239))
(check-sat b_and!15495 (not b_next!8239))
