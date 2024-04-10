; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37110 () Bool)

(assert start!37110)

(declare-fun b_free!8237 () Bool)

(declare-fun b_next!8237 () Bool)

(assert (=> start!37110 (= b_free!8237 (not b_next!8237))))

(declare-fun tp!29427 () Bool)

(declare-fun b_and!15479 () Bool)

(assert (=> start!37110 (= tp!29427 b_and!15479)))

(declare-fun b!373767 () Bool)

(declare-fun e!227846 () Bool)

(declare-fun e!227839 () Bool)

(assert (=> b!373767 (= e!227846 e!227839)))

(declare-fun res!210612 () Bool)

(assert (=> b!373767 (=> res!210612 e!227839)))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!373767 (= res!210612 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!12951 0))(
  ( (V!12952 (val!4487 Int)) )
))
(declare-datatypes ((tuple2!5960 0))(
  ( (tuple2!5961 (_1!2991 (_ BitVec 64)) (_2!2991 V!12951)) )
))
(declare-datatypes ((List!5805 0))(
  ( (Nil!5802) (Cons!5801 (h!6657 tuple2!5960) (t!10955 List!5805)) )
))
(declare-datatypes ((ListLongMap!4873 0))(
  ( (ListLongMap!4874 (toList!2452 List!5805)) )
))
(declare-fun lt!171853 () ListLongMap!4873)

(declare-fun lt!171848 () ListLongMap!4873)

(assert (=> b!373767 (= lt!171853 lt!171848)))

(declare-fun lt!171856 () ListLongMap!4873)

(declare-fun lt!171859 () tuple2!5960)

(declare-fun +!798 (ListLongMap!4873 tuple2!5960) ListLongMap!4873)

(assert (=> b!373767 (= lt!171848 (+!798 lt!171856 lt!171859))))

(declare-fun v!373 () V!12951)

(declare-fun lt!171862 () ListLongMap!4873)

(declare-datatypes ((Unit!11502 0))(
  ( (Unit!11503) )
))
(declare-fun lt!171855 () Unit!11502)

(declare-fun zeroValue!472 () V!12951)

(declare-fun addCommutativeForDiffKeys!222 (ListLongMap!4873 (_ BitVec 64) V!12951 (_ BitVec 64) V!12951) Unit!11502)

(assert (=> b!373767 (= lt!171855 (addCommutativeForDiffKeys!222 lt!171862 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171858 () ListLongMap!4873)

(declare-fun lt!171850 () tuple2!5960)

(assert (=> b!373767 (= lt!171858 (+!798 lt!171853 lt!171850))))

(declare-fun lt!171861 () ListLongMap!4873)

(declare-fun lt!171863 () tuple2!5960)

(assert (=> b!373767 (= lt!171853 (+!798 lt!171861 lt!171863))))

(declare-fun lt!171857 () ListLongMap!4873)

(declare-fun lt!171851 () ListLongMap!4873)

(assert (=> b!373767 (= lt!171857 lt!171851)))

(assert (=> b!373767 (= lt!171851 (+!798 lt!171856 lt!171850))))

(assert (=> b!373767 (= lt!171856 (+!798 lt!171862 lt!171863))))

(declare-fun lt!171852 () ListLongMap!4873)

(assert (=> b!373767 (= lt!171858 (+!798 (+!798 lt!171852 lt!171863) lt!171850))))

(declare-fun minValue!472 () V!12951)

(assert (=> b!373767 (= lt!171850 (tuple2!5961 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373767 (= lt!171863 (tuple2!5961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373768 () Bool)

(assert (=> b!373768 (= e!227839 true)))

(assert (=> b!373768 (= (+!798 lt!171848 lt!171850) (+!798 lt!171851 lt!171859))))

(declare-fun lt!171864 () Unit!11502)

(assert (=> b!373768 (= lt!171864 (addCommutativeForDiffKeys!222 lt!171856 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!14892 () Bool)

(declare-fun mapRes!14892 () Bool)

(declare-fun tp!29426 () Bool)

(declare-fun e!227844 () Bool)

(assert (=> mapNonEmpty!14892 (= mapRes!14892 (and tp!29426 e!227844))))

(declare-fun mapKey!14892 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4099 0))(
  ( (ValueCellFull!4099 (v!6684 V!12951)) (EmptyCell!4099) )
))
(declare-datatypes ((array!21709 0))(
  ( (array!21710 (arr!10323 (Array (_ BitVec 32) ValueCell!4099)) (size!10675 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21709)

(declare-fun mapRest!14892 () (Array (_ BitVec 32) ValueCell!4099))

(declare-fun mapValue!14892 () ValueCell!4099)

(assert (=> mapNonEmpty!14892 (= (arr!10323 _values!506) (store mapRest!14892 mapKey!14892 mapValue!14892))))

(declare-fun b!373769 () Bool)

(declare-fun e!227841 () Bool)

(assert (=> b!373769 (= e!227841 (not e!227846))))

(declare-fun res!210606 () Bool)

(assert (=> b!373769 (=> res!210606 e!227846)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373769 (= res!210606 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((array!21711 0))(
  ( (array!21712 (arr!10324 (Array (_ BitVec 32) (_ BitVec 64))) (size!10676 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21711)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun getCurrentListMap!1892 (array!21711 array!21709 (_ BitVec 32) (_ BitVec 32) V!12951 V!12951 (_ BitVec 32) Int) ListLongMap!4873)

(assert (=> b!373769 (= lt!171857 (getCurrentListMap!1892 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171860 () array!21709)

(declare-fun lt!171849 () array!21711)

(assert (=> b!373769 (= lt!171858 (getCurrentListMap!1892 lt!171849 lt!171860 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373769 (and (= lt!171852 lt!171861) (= lt!171861 lt!171852))))

(assert (=> b!373769 (= lt!171861 (+!798 lt!171862 lt!171859))))

(assert (=> b!373769 (= lt!171859 (tuple2!5961 k!778 v!373))))

(declare-fun lt!171854 () Unit!11502)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!50 (array!21711 array!21709 (_ BitVec 32) (_ BitVec 32) V!12951 V!12951 (_ BitVec 32) (_ BitVec 64) V!12951 (_ BitVec 32) Int) Unit!11502)

(assert (=> b!373769 (= lt!171854 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!50 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!726 (array!21711 array!21709 (_ BitVec 32) (_ BitVec 32) V!12951 V!12951 (_ BitVec 32) Int) ListLongMap!4873)

(assert (=> b!373769 (= lt!171852 (getCurrentListMapNoExtraKeys!726 lt!171849 lt!171860 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373769 (= lt!171860 (array!21710 (store (arr!10323 _values!506) i!548 (ValueCellFull!4099 v!373)) (size!10675 _values!506)))))

(assert (=> b!373769 (= lt!171862 (getCurrentListMapNoExtraKeys!726 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373770 () Bool)

(declare-fun res!210616 () Bool)

(declare-fun e!227840 () Bool)

(assert (=> b!373770 (=> (not res!210616) (not e!227840))))

(assert (=> b!373770 (= res!210616 (and (= (size!10675 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10676 _keys!658) (size!10675 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373772 () Bool)

(declare-fun res!210613 () Bool)

(assert (=> b!373772 (=> (not res!210613) (not e!227840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373772 (= res!210613 (validKeyInArray!0 k!778))))

(declare-fun b!373773 () Bool)

(declare-fun res!210608 () Bool)

(assert (=> b!373773 (=> (not res!210608) (not e!227840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21711 (_ BitVec 32)) Bool)

(assert (=> b!373773 (= res!210608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373774 () Bool)

(declare-fun res!210614 () Bool)

(assert (=> b!373774 (=> (not res!210614) (not e!227840))))

(assert (=> b!373774 (= res!210614 (or (= (select (arr!10324 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10324 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373775 () Bool)

(declare-fun res!210611 () Bool)

(assert (=> b!373775 (=> (not res!210611) (not e!227841))))

(declare-datatypes ((List!5806 0))(
  ( (Nil!5803) (Cons!5802 (h!6658 (_ BitVec 64)) (t!10956 List!5806)) )
))
(declare-fun arrayNoDuplicates!0 (array!21711 (_ BitVec 32) List!5806) Bool)

(assert (=> b!373775 (= res!210611 (arrayNoDuplicates!0 lt!171849 #b00000000000000000000000000000000 Nil!5803))))

(declare-fun mapIsEmpty!14892 () Bool)

(assert (=> mapIsEmpty!14892 mapRes!14892))

(declare-fun b!373776 () Bool)

(declare-fun tp_is_empty!8885 () Bool)

(assert (=> b!373776 (= e!227844 tp_is_empty!8885)))

(declare-fun b!373777 () Bool)

(declare-fun e!227845 () Bool)

(assert (=> b!373777 (= e!227845 tp_is_empty!8885)))

(declare-fun b!373778 () Bool)

(declare-fun res!210615 () Bool)

(assert (=> b!373778 (=> (not res!210615) (not e!227840))))

(assert (=> b!373778 (= res!210615 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10676 _keys!658))))))

(declare-fun b!373779 () Bool)

(assert (=> b!373779 (= e!227840 e!227841)))

(declare-fun res!210617 () Bool)

(assert (=> b!373779 (=> (not res!210617) (not e!227841))))

(assert (=> b!373779 (= res!210617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171849 mask!970))))

(assert (=> b!373779 (= lt!171849 (array!21712 (store (arr!10324 _keys!658) i!548 k!778) (size!10676 _keys!658)))))

(declare-fun b!373780 () Bool)

(declare-fun res!210607 () Bool)

(assert (=> b!373780 (=> (not res!210607) (not e!227840))))

(assert (=> b!373780 (= res!210607 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5803))))

(declare-fun b!373781 () Bool)

(declare-fun res!210610 () Bool)

(assert (=> b!373781 (=> (not res!210610) (not e!227840))))

(declare-fun arrayContainsKey!0 (array!21711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373781 (= res!210610 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun res!210609 () Bool)

(assert (=> start!37110 (=> (not res!210609) (not e!227840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37110 (= res!210609 (validMask!0 mask!970))))

(assert (=> start!37110 e!227840))

(declare-fun e!227843 () Bool)

(declare-fun array_inv!7608 (array!21709) Bool)

(assert (=> start!37110 (and (array_inv!7608 _values!506) e!227843)))

(assert (=> start!37110 tp!29427))

(assert (=> start!37110 true))

(assert (=> start!37110 tp_is_empty!8885))

(declare-fun array_inv!7609 (array!21711) Bool)

(assert (=> start!37110 (array_inv!7609 _keys!658)))

(declare-fun b!373771 () Bool)

(assert (=> b!373771 (= e!227843 (and e!227845 mapRes!14892))))

(declare-fun condMapEmpty!14892 () Bool)

(declare-fun mapDefault!14892 () ValueCell!4099)

