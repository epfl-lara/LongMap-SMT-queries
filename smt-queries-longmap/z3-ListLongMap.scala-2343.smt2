; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37522 () Bool)

(assert start!37522)

(declare-fun b_free!8649 () Bool)

(declare-fun b_next!8649 () Bool)

(assert (=> start!37522 (= b_free!8649 (not b_next!8649))))

(declare-fun tp!30663 () Bool)

(declare-fun b_and!15891 () Bool)

(assert (=> start!37522 (= tp!30663 b_and!15891)))

(declare-fun mapIsEmpty!15510 () Bool)

(declare-fun mapRes!15510 () Bool)

(assert (=> mapIsEmpty!15510 mapRes!15510))

(declare-fun b!382906 () Bool)

(declare-fun e!232636 () Bool)

(declare-fun e!232640 () Bool)

(assert (=> b!382906 (= e!232636 e!232640)))

(declare-fun res!217900 () Bool)

(assert (=> b!382906 (=> (not res!217900) (not e!232640))))

(declare-datatypes ((array!22503 0))(
  ( (array!22504 (arr!10720 (Array (_ BitVec 32) (_ BitVec 64))) (size!11072 (_ BitVec 32))) )
))
(declare-fun lt!179723 () array!22503)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22503 (_ BitVec 32)) Bool)

(assert (=> b!382906 (= res!217900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179723 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22503)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382906 (= lt!179723 (array!22504 (store (arr!10720 _keys!658) i!548 k0!778) (size!11072 _keys!658)))))

(declare-fun mapNonEmpty!15510 () Bool)

(declare-fun tp!30662 () Bool)

(declare-fun e!232637 () Bool)

(assert (=> mapNonEmpty!15510 (= mapRes!15510 (and tp!30662 e!232637))))

(declare-fun mapKey!15510 () (_ BitVec 32))

(declare-datatypes ((V!13501 0))(
  ( (V!13502 (val!4693 Int)) )
))
(declare-datatypes ((ValueCell!4305 0))(
  ( (ValueCellFull!4305 (v!6890 V!13501)) (EmptyCell!4305) )
))
(declare-datatypes ((array!22505 0))(
  ( (array!22506 (arr!10721 (Array (_ BitVec 32) ValueCell!4305)) (size!11073 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22505)

(declare-fun mapRest!15510 () (Array (_ BitVec 32) ValueCell!4305))

(declare-fun mapValue!15510 () ValueCell!4305)

(assert (=> mapNonEmpty!15510 (= (arr!10721 _values!506) (store mapRest!15510 mapKey!15510 mapValue!15510))))

(declare-fun b!382907 () Bool)

(declare-fun res!217895 () Bool)

(assert (=> b!382907 (=> (not res!217895) (not e!232636))))

(assert (=> b!382907 (= res!217895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382908 () Bool)

(declare-fun e!232639 () Bool)

(declare-fun e!232635 () Bool)

(assert (=> b!382908 (= e!232639 (and e!232635 mapRes!15510))))

(declare-fun condMapEmpty!15510 () Bool)

(declare-fun mapDefault!15510 () ValueCell!4305)

(assert (=> b!382908 (= condMapEmpty!15510 (= (arr!10721 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4305)) mapDefault!15510)))))

(declare-fun res!217892 () Bool)

(assert (=> start!37522 (=> (not res!217892) (not e!232636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37522 (= res!217892 (validMask!0 mask!970))))

(assert (=> start!37522 e!232636))

(declare-fun array_inv!7892 (array!22505) Bool)

(assert (=> start!37522 (and (array_inv!7892 _values!506) e!232639)))

(assert (=> start!37522 tp!30663))

(assert (=> start!37522 true))

(declare-fun tp_is_empty!9297 () Bool)

(assert (=> start!37522 tp_is_empty!9297))

(declare-fun array_inv!7893 (array!22503) Bool)

(assert (=> start!37522 (array_inv!7893 _keys!658)))

(declare-fun b!382909 () Bool)

(declare-fun res!217897 () Bool)

(assert (=> b!382909 (=> (not res!217897) (not e!232636))))

(assert (=> b!382909 (= res!217897 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11072 _keys!658))))))

(declare-fun b!382910 () Bool)

(assert (=> b!382910 (= e!232635 tp_is_empty!9297)))

(declare-fun b!382911 () Bool)

(declare-fun res!217901 () Bool)

(assert (=> b!382911 (=> (not res!217901) (not e!232636))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382911 (= res!217901 (and (= (size!11073 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11072 _keys!658) (size!11073 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382912 () Bool)

(assert (=> b!382912 (= e!232637 tp_is_empty!9297)))

(declare-fun b!382913 () Bool)

(declare-fun res!217896 () Bool)

(assert (=> b!382913 (=> (not res!217896) (not e!232636))))

(assert (=> b!382913 (= res!217896 (or (= (select (arr!10720 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10720 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382914 () Bool)

(declare-fun res!217894 () Bool)

(assert (=> b!382914 (=> (not res!217894) (not e!232636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382914 (= res!217894 (validKeyInArray!0 k0!778))))

(declare-fun b!382915 () Bool)

(declare-fun res!217893 () Bool)

(assert (=> b!382915 (=> (not res!217893) (not e!232636))))

(declare-datatypes ((List!6144 0))(
  ( (Nil!6141) (Cons!6140 (h!6996 (_ BitVec 64)) (t!11294 List!6144)) )
))
(declare-fun arrayNoDuplicates!0 (array!22503 (_ BitVec 32) List!6144) Bool)

(assert (=> b!382915 (= res!217893 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6141))))

(declare-fun b!382916 () Bool)

(declare-fun res!217891 () Bool)

(assert (=> b!382916 (=> (not res!217891) (not e!232640))))

(assert (=> b!382916 (= res!217891 (arrayNoDuplicates!0 lt!179723 #b00000000000000000000000000000000 Nil!6141))))

(declare-fun b!382917 () Bool)

(declare-fun e!232638 () Bool)

(assert (=> b!382917 (= e!232640 (not e!232638))))

(declare-fun res!217898 () Bool)

(assert (=> b!382917 (=> res!217898 e!232638)))

(declare-fun lt!179730 () Bool)

(assert (=> b!382917 (= res!217898 (or (and (not lt!179730) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179730) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179730)))))

(assert (=> b!382917 (= lt!179730 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6312 0))(
  ( (tuple2!6313 (_1!3167 (_ BitVec 64)) (_2!3167 V!13501)) )
))
(declare-datatypes ((List!6145 0))(
  ( (Nil!6142) (Cons!6141 (h!6997 tuple2!6312) (t!11295 List!6145)) )
))
(declare-datatypes ((ListLongMap!5225 0))(
  ( (ListLongMap!5226 (toList!2628 List!6145)) )
))
(declare-fun lt!179727 () ListLongMap!5225)

(declare-fun zeroValue!472 () V!13501)

(declare-fun minValue!472 () V!13501)

(declare-fun getCurrentListMap!2033 (array!22503 array!22505 (_ BitVec 32) (_ BitVec 32) V!13501 V!13501 (_ BitVec 32) Int) ListLongMap!5225)

(assert (=> b!382917 (= lt!179727 (getCurrentListMap!2033 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179725 () array!22505)

(declare-fun lt!179728 () ListLongMap!5225)

(assert (=> b!382917 (= lt!179728 (getCurrentListMap!2033 lt!179723 lt!179725 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179722 () ListLongMap!5225)

(declare-fun lt!179726 () ListLongMap!5225)

(assert (=> b!382917 (and (= lt!179722 lt!179726) (= lt!179726 lt!179722))))

(declare-fun lt!179724 () ListLongMap!5225)

(declare-fun v!373 () V!13501)

(declare-fun +!963 (ListLongMap!5225 tuple2!6312) ListLongMap!5225)

(assert (=> b!382917 (= lt!179726 (+!963 lt!179724 (tuple2!6313 k0!778 v!373)))))

(declare-datatypes ((Unit!11820 0))(
  ( (Unit!11821) )
))
(declare-fun lt!179729 () Unit!11820)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!191 (array!22503 array!22505 (_ BitVec 32) (_ BitVec 32) V!13501 V!13501 (_ BitVec 32) (_ BitVec 64) V!13501 (_ BitVec 32) Int) Unit!11820)

(assert (=> b!382917 (= lt!179729 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!191 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!867 (array!22503 array!22505 (_ BitVec 32) (_ BitVec 32) V!13501 V!13501 (_ BitVec 32) Int) ListLongMap!5225)

(assert (=> b!382917 (= lt!179722 (getCurrentListMapNoExtraKeys!867 lt!179723 lt!179725 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382917 (= lt!179725 (array!22506 (store (arr!10721 _values!506) i!548 (ValueCellFull!4305 v!373)) (size!11073 _values!506)))))

(assert (=> b!382917 (= lt!179724 (getCurrentListMapNoExtraKeys!867 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382918 () Bool)

(declare-fun res!217899 () Bool)

(assert (=> b!382918 (=> (not res!217899) (not e!232636))))

(declare-fun arrayContainsKey!0 (array!22503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382918 (= res!217899 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382919 () Bool)

(assert (=> b!382919 (= e!232638 true)))

(assert (=> b!382919 (= lt!179728 lt!179722)))

(assert (= (and start!37522 res!217892) b!382911))

(assert (= (and b!382911 res!217901) b!382907))

(assert (= (and b!382907 res!217895) b!382915))

(assert (= (and b!382915 res!217893) b!382909))

(assert (= (and b!382909 res!217897) b!382914))

(assert (= (and b!382914 res!217894) b!382913))

(assert (= (and b!382913 res!217896) b!382918))

(assert (= (and b!382918 res!217899) b!382906))

(assert (= (and b!382906 res!217900) b!382916))

(assert (= (and b!382916 res!217891) b!382917))

(assert (= (and b!382917 (not res!217898)) b!382919))

(assert (= (and b!382908 condMapEmpty!15510) mapIsEmpty!15510))

(assert (= (and b!382908 (not condMapEmpty!15510)) mapNonEmpty!15510))

(get-info :version)

(assert (= (and mapNonEmpty!15510 ((_ is ValueCellFull!4305) mapValue!15510)) b!382912))

(assert (= (and b!382908 ((_ is ValueCellFull!4305) mapDefault!15510)) b!382910))

(assert (= start!37522 b!382908))

(declare-fun m!379685 () Bool)

(assert (=> b!382914 m!379685))

(declare-fun m!379687 () Bool)

(assert (=> b!382915 m!379687))

(declare-fun m!379689 () Bool)

(assert (=> mapNonEmpty!15510 m!379689))

(declare-fun m!379691 () Bool)

(assert (=> start!37522 m!379691))

(declare-fun m!379693 () Bool)

(assert (=> start!37522 m!379693))

(declare-fun m!379695 () Bool)

(assert (=> start!37522 m!379695))

(declare-fun m!379697 () Bool)

(assert (=> b!382916 m!379697))

(declare-fun m!379699 () Bool)

(assert (=> b!382918 m!379699))

(declare-fun m!379701 () Bool)

(assert (=> b!382917 m!379701))

(declare-fun m!379703 () Bool)

(assert (=> b!382917 m!379703))

(declare-fun m!379705 () Bool)

(assert (=> b!382917 m!379705))

(declare-fun m!379707 () Bool)

(assert (=> b!382917 m!379707))

(declare-fun m!379709 () Bool)

(assert (=> b!382917 m!379709))

(declare-fun m!379711 () Bool)

(assert (=> b!382917 m!379711))

(declare-fun m!379713 () Bool)

(assert (=> b!382917 m!379713))

(declare-fun m!379715 () Bool)

(assert (=> b!382907 m!379715))

(declare-fun m!379717 () Bool)

(assert (=> b!382906 m!379717))

(declare-fun m!379719 () Bool)

(assert (=> b!382906 m!379719))

(declare-fun m!379721 () Bool)

(assert (=> b!382913 m!379721))

(check-sat (not b!382917) tp_is_empty!9297 (not b_next!8649) (not b!382916) (not b!382914) (not b!382915) (not b!382906) (not b!382918) b_and!15891 (not b!382907) (not mapNonEmpty!15510) (not start!37522))
(check-sat b_and!15891 (not b_next!8649))
