; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37188 () Bool)

(assert start!37188)

(declare-fun b_free!8329 () Bool)

(declare-fun b_next!8329 () Bool)

(assert (=> start!37188 (= b_free!8329 (not b_next!8329))))

(declare-fun tp!29702 () Bool)

(declare-fun b_and!15585 () Bool)

(assert (=> start!37188 (= tp!29702 b_and!15585)))

(declare-fun b!375797 () Bool)

(declare-fun res!212273 () Bool)

(declare-fun e!228911 () Bool)

(assert (=> b!375797 (=> (not res!212273) (not e!228911))))

(declare-datatypes ((array!21872 0))(
  ( (array!21873 (arr!10404 (Array (_ BitVec 32) (_ BitVec 64))) (size!10756 (_ BitVec 32))) )
))
(declare-fun lt!174133 () array!21872)

(declare-datatypes ((List!5783 0))(
  ( (Nil!5780) (Cons!5779 (h!6635 (_ BitVec 64)) (t!10925 List!5783)) )
))
(declare-fun arrayNoDuplicates!0 (array!21872 (_ BitVec 32) List!5783) Bool)

(assert (=> b!375797 (= res!212273 (arrayNoDuplicates!0 lt!174133 #b00000000000000000000000000000000 Nil!5780))))

(declare-fun b!375798 () Bool)

(declare-fun e!228912 () Bool)

(declare-fun e!228914 () Bool)

(declare-fun mapRes!15030 () Bool)

(assert (=> b!375798 (= e!228912 (and e!228914 mapRes!15030))))

(declare-fun condMapEmpty!15030 () Bool)

(declare-datatypes ((V!13075 0))(
  ( (V!13076 (val!4533 Int)) )
))
(declare-datatypes ((ValueCell!4145 0))(
  ( (ValueCellFull!4145 (v!6731 V!13075)) (EmptyCell!4145) )
))
(declare-datatypes ((array!21874 0))(
  ( (array!21875 (arr!10405 (Array (_ BitVec 32) ValueCell!4145)) (size!10757 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21874)

(declare-fun mapDefault!15030 () ValueCell!4145)

(assert (=> b!375798 (= condMapEmpty!15030 (= (arr!10405 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4145)) mapDefault!15030)))))

(declare-fun b!375799 () Bool)

(declare-fun res!212278 () Bool)

(declare-fun e!228917 () Bool)

(assert (=> b!375799 (=> (not res!212278) (not e!228917))))

(declare-fun _keys!658 () array!21872)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21872 (_ BitVec 32)) Bool)

(assert (=> b!375799 (= res!212278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15030 () Bool)

(declare-fun tp!29703 () Bool)

(declare-fun e!228913 () Bool)

(assert (=> mapNonEmpty!15030 (= mapRes!15030 (and tp!29703 e!228913))))

(declare-fun mapRest!15030 () (Array (_ BitVec 32) ValueCell!4145))

(declare-fun mapKey!15030 () (_ BitVec 32))

(declare-fun mapValue!15030 () ValueCell!4145)

(assert (=> mapNonEmpty!15030 (= (arr!10405 _values!506) (store mapRest!15030 mapKey!15030 mapValue!15030))))

(declare-fun res!212277 () Bool)

(assert (=> start!37188 (=> (not res!212277) (not e!228917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37188 (= res!212277 (validMask!0 mask!970))))

(assert (=> start!37188 e!228917))

(declare-fun array_inv!7720 (array!21874) Bool)

(assert (=> start!37188 (and (array_inv!7720 _values!506) e!228912)))

(assert (=> start!37188 tp!29702))

(assert (=> start!37188 true))

(declare-fun tp_is_empty!8977 () Bool)

(assert (=> start!37188 tp_is_empty!8977))

(declare-fun array_inv!7721 (array!21872) Bool)

(assert (=> start!37188 (array_inv!7721 _keys!658)))

(declare-fun b!375800 () Bool)

(declare-fun e!228915 () Bool)

(assert (=> b!375800 (= e!228915 true)))

(declare-datatypes ((tuple2!5940 0))(
  ( (tuple2!5941 (_1!2981 (_ BitVec 64)) (_2!2981 V!13075)) )
))
(declare-datatypes ((List!5784 0))(
  ( (Nil!5781) (Cons!5780 (h!6636 tuple2!5940) (t!10926 List!5784)) )
))
(declare-datatypes ((ListLongMap!4855 0))(
  ( (ListLongMap!4856 (toList!2443 List!5784)) )
))
(declare-fun lt!174140 () ListLongMap!4855)

(declare-fun lt!174134 () ListLongMap!4855)

(declare-fun lt!174136 () tuple2!5940)

(declare-fun +!839 (ListLongMap!4855 tuple2!5940) ListLongMap!4855)

(assert (=> b!375800 (= lt!174140 (+!839 lt!174134 lt!174136))))

(declare-fun lt!174138 () ListLongMap!4855)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13075)

(declare-datatypes ((Unit!11565 0))(
  ( (Unit!11566) )
))
(declare-fun lt!174145 () Unit!11565)

(declare-fun v!373 () V!13075)

(declare-fun addCommutativeForDiffKeys!263 (ListLongMap!4855 (_ BitVec 64) V!13075 (_ BitVec 64) V!13075) Unit!11565)

(assert (=> b!375800 (= lt!174145 (addCommutativeForDiffKeys!263 lt!174138 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375801 () Bool)

(declare-fun res!212274 () Bool)

(assert (=> b!375801 (=> (not res!212274) (not e!228917))))

(assert (=> b!375801 (= res!212274 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5780))))

(declare-fun b!375802 () Bool)

(assert (=> b!375802 (= e!228914 tp_is_empty!8977)))

(declare-fun b!375803 () Bool)

(assert (=> b!375803 (= e!228917 e!228911)))

(declare-fun res!212270 () Bool)

(assert (=> b!375803 (=> (not res!212270) (not e!228911))))

(assert (=> b!375803 (= res!212270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174133 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375803 (= lt!174133 (array!21873 (store (arr!10404 _keys!658) i!548 k0!778) (size!10756 _keys!658)))))

(declare-fun b!375804 () Bool)

(declare-fun res!212275 () Bool)

(assert (=> b!375804 (=> (not res!212275) (not e!228917))))

(declare-fun arrayContainsKey!0 (array!21872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375804 (= res!212275 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375805 () Bool)

(declare-fun e!228916 () Bool)

(assert (=> b!375805 (= e!228916 e!228915)))

(declare-fun res!212279 () Bool)

(assert (=> b!375805 (=> res!212279 e!228915)))

(assert (=> b!375805 (= res!212279 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!174141 () ListLongMap!4855)

(assert (=> b!375805 (= lt!174141 lt!174140)))

(declare-fun lt!174143 () ListLongMap!4855)

(declare-fun lt!174135 () tuple2!5940)

(assert (=> b!375805 (= lt!174140 (+!839 lt!174143 lt!174135))))

(declare-fun lt!174139 () ListLongMap!4855)

(assert (=> b!375805 (= lt!174139 lt!174134)))

(assert (=> b!375805 (= lt!174134 (+!839 lt!174138 lt!174135))))

(declare-fun lt!174142 () ListLongMap!4855)

(assert (=> b!375805 (= lt!174141 (+!839 lt!174142 lt!174135))))

(assert (=> b!375805 (= lt!174135 (tuple2!5941 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapIsEmpty!15030 () Bool)

(assert (=> mapIsEmpty!15030 mapRes!15030))

(declare-fun b!375806 () Bool)

(assert (=> b!375806 (= e!228913 tp_is_empty!8977)))

(declare-fun b!375807 () Bool)

(declare-fun res!212271 () Bool)

(assert (=> b!375807 (=> (not res!212271) (not e!228917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375807 (= res!212271 (validKeyInArray!0 k0!778))))

(declare-fun b!375808 () Bool)

(assert (=> b!375808 (= e!228911 (not e!228916))))

(declare-fun res!212272 () Bool)

(assert (=> b!375808 (=> res!212272 e!228916)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375808 (= res!212272 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13075)

(declare-fun getCurrentListMap!1895 (array!21872 array!21874 (_ BitVec 32) (_ BitVec 32) V!13075 V!13075 (_ BitVec 32) Int) ListLongMap!4855)

(assert (=> b!375808 (= lt!174139 (getCurrentListMap!1895 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174137 () array!21874)

(assert (=> b!375808 (= lt!174141 (getCurrentListMap!1895 lt!174133 lt!174137 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375808 (and (= lt!174142 lt!174143) (= lt!174143 lt!174142))))

(assert (=> b!375808 (= lt!174143 (+!839 lt!174138 lt!174136))))

(assert (=> b!375808 (= lt!174136 (tuple2!5941 k0!778 v!373))))

(declare-fun lt!174144 () Unit!11565)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!82 (array!21872 array!21874 (_ BitVec 32) (_ BitVec 32) V!13075 V!13075 (_ BitVec 32) (_ BitVec 64) V!13075 (_ BitVec 32) Int) Unit!11565)

(assert (=> b!375808 (= lt!174144 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!82 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!742 (array!21872 array!21874 (_ BitVec 32) (_ BitVec 32) V!13075 V!13075 (_ BitVec 32) Int) ListLongMap!4855)

(assert (=> b!375808 (= lt!174142 (getCurrentListMapNoExtraKeys!742 lt!174133 lt!174137 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375808 (= lt!174137 (array!21875 (store (arr!10405 _values!506) i!548 (ValueCellFull!4145 v!373)) (size!10757 _values!506)))))

(assert (=> b!375808 (= lt!174138 (getCurrentListMapNoExtraKeys!742 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375809 () Bool)

(declare-fun res!212276 () Bool)

(assert (=> b!375809 (=> (not res!212276) (not e!228917))))

(assert (=> b!375809 (= res!212276 (and (= (size!10757 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10756 _keys!658) (size!10757 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375810 () Bool)

(declare-fun res!212268 () Bool)

(assert (=> b!375810 (=> (not res!212268) (not e!228917))))

(assert (=> b!375810 (= res!212268 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10756 _keys!658))))))

(declare-fun b!375811 () Bool)

(declare-fun res!212269 () Bool)

(assert (=> b!375811 (=> (not res!212269) (not e!228917))))

(assert (=> b!375811 (= res!212269 (or (= (select (arr!10404 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10404 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37188 res!212277) b!375809))

(assert (= (and b!375809 res!212276) b!375799))

(assert (= (and b!375799 res!212278) b!375801))

(assert (= (and b!375801 res!212274) b!375810))

(assert (= (and b!375810 res!212268) b!375807))

(assert (= (and b!375807 res!212271) b!375811))

(assert (= (and b!375811 res!212269) b!375804))

(assert (= (and b!375804 res!212275) b!375803))

(assert (= (and b!375803 res!212270) b!375797))

(assert (= (and b!375797 res!212273) b!375808))

(assert (= (and b!375808 (not res!212272)) b!375805))

(assert (= (and b!375805 (not res!212279)) b!375800))

(assert (= (and b!375798 condMapEmpty!15030) mapIsEmpty!15030))

(assert (= (and b!375798 (not condMapEmpty!15030)) mapNonEmpty!15030))

(get-info :version)

(assert (= (and mapNonEmpty!15030 ((_ is ValueCellFull!4145) mapValue!15030)) b!375806))

(assert (= (and b!375798 ((_ is ValueCellFull!4145) mapDefault!15030)) b!375802))

(assert (= start!37188 b!375798))

(declare-fun m!372737 () Bool)

(assert (=> start!37188 m!372737))

(declare-fun m!372739 () Bool)

(assert (=> start!37188 m!372739))

(declare-fun m!372741 () Bool)

(assert (=> start!37188 m!372741))

(declare-fun m!372743 () Bool)

(assert (=> b!375807 m!372743))

(declare-fun m!372745 () Bool)

(assert (=> b!375803 m!372745))

(declare-fun m!372747 () Bool)

(assert (=> b!375803 m!372747))

(declare-fun m!372749 () Bool)

(assert (=> b!375799 m!372749))

(declare-fun m!372751 () Bool)

(assert (=> b!375797 m!372751))

(declare-fun m!372753 () Bool)

(assert (=> b!375804 m!372753))

(declare-fun m!372755 () Bool)

(assert (=> b!375801 m!372755))

(declare-fun m!372757 () Bool)

(assert (=> b!375800 m!372757))

(declare-fun m!372759 () Bool)

(assert (=> b!375800 m!372759))

(declare-fun m!372761 () Bool)

(assert (=> mapNonEmpty!15030 m!372761))

(declare-fun m!372763 () Bool)

(assert (=> b!375811 m!372763))

(declare-fun m!372765 () Bool)

(assert (=> b!375808 m!372765))

(declare-fun m!372767 () Bool)

(assert (=> b!375808 m!372767))

(declare-fun m!372769 () Bool)

(assert (=> b!375808 m!372769))

(declare-fun m!372771 () Bool)

(assert (=> b!375808 m!372771))

(declare-fun m!372773 () Bool)

(assert (=> b!375808 m!372773))

(declare-fun m!372775 () Bool)

(assert (=> b!375808 m!372775))

(declare-fun m!372777 () Bool)

(assert (=> b!375808 m!372777))

(declare-fun m!372779 () Bool)

(assert (=> b!375805 m!372779))

(declare-fun m!372781 () Bool)

(assert (=> b!375805 m!372781))

(declare-fun m!372783 () Bool)

(assert (=> b!375805 m!372783))

(check-sat b_and!15585 (not b!375807) (not b!375797) (not b!375803) (not b!375804) (not start!37188) (not b!375805) (not mapNonEmpty!15030) tp_is_empty!8977 (not b!375799) (not b!375808) (not b!375801) (not b_next!8329) (not b!375800))
(check-sat b_and!15585 (not b_next!8329))
