; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37236 () Bool)

(assert start!37236)

(declare-fun b_free!8377 () Bool)

(declare-fun b_next!8377 () Bool)

(assert (=> start!37236 (= b_free!8377 (not b_next!8377))))

(declare-fun tp!29846 () Bool)

(declare-fun b_and!15593 () Bool)

(assert (=> start!37236 (= tp!29846 b_and!15593)))

(declare-fun b!376655 () Bool)

(declare-fun e!229348 () Bool)

(declare-fun e!229350 () Bool)

(declare-fun mapRes!15102 () Bool)

(assert (=> b!376655 (= e!229348 (and e!229350 mapRes!15102))))

(declare-fun condMapEmpty!15102 () Bool)

(declare-datatypes ((V!13139 0))(
  ( (V!13140 (val!4557 Int)) )
))
(declare-datatypes ((ValueCell!4169 0))(
  ( (ValueCellFull!4169 (v!6748 V!13139)) (EmptyCell!4169) )
))
(declare-datatypes ((array!21961 0))(
  ( (array!21962 (arr!10449 (Array (_ BitVec 32) ValueCell!4169)) (size!10802 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21961)

(declare-fun mapDefault!15102 () ValueCell!4169)

(assert (=> b!376655 (= condMapEmpty!15102 (= (arr!10449 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4169)) mapDefault!15102)))))

(declare-fun mapNonEmpty!15102 () Bool)

(declare-fun tp!29847 () Bool)

(declare-fun e!229349 () Bool)

(assert (=> mapNonEmpty!15102 (= mapRes!15102 (and tp!29847 e!229349))))

(declare-fun mapKey!15102 () (_ BitVec 32))

(declare-fun mapRest!15102 () (Array (_ BitVec 32) ValueCell!4169))

(declare-fun mapValue!15102 () ValueCell!4169)

(assert (=> mapNonEmpty!15102 (= (arr!10449 _values!506) (store mapRest!15102 mapKey!15102 mapValue!15102))))

(declare-fun b!376656 () Bool)

(declare-fun tp_is_empty!9025 () Bool)

(assert (=> b!376656 (= e!229350 tp_is_empty!9025)))

(declare-fun b!376657 () Bool)

(declare-fun e!229351 () Bool)

(declare-fun e!229347 () Bool)

(assert (=> b!376657 (= e!229351 e!229347)))

(declare-fun res!213010 () Bool)

(assert (=> b!376657 (=> (not res!213010) (not e!229347))))

(declare-datatypes ((array!21963 0))(
  ( (array!21964 (arr!10450 (Array (_ BitVec 32) (_ BitVec 64))) (size!10803 (_ BitVec 32))) )
))
(declare-fun lt!174826 () array!21963)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21963 (_ BitVec 32)) Bool)

(assert (=> b!376657 (= res!213010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174826 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21963)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376657 (= lt!174826 (array!21964 (store (arr!10450 _keys!658) i!548 k0!778) (size!10803 _keys!658)))))

(declare-fun res!213014 () Bool)

(assert (=> start!37236 (=> (not res!213014) (not e!229351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37236 (= res!213014 (validMask!0 mask!970))))

(assert (=> start!37236 e!229351))

(declare-fun array_inv!7704 (array!21961) Bool)

(assert (=> start!37236 (and (array_inv!7704 _values!506) e!229348)))

(assert (=> start!37236 tp!29846))

(assert (=> start!37236 true))

(assert (=> start!37236 tp_is_empty!9025))

(declare-fun array_inv!7705 (array!21963) Bool)

(assert (=> start!37236 (array_inv!7705 _keys!658)))

(declare-fun b!376658 () Bool)

(declare-fun res!213007 () Bool)

(assert (=> b!376658 (=> (not res!213007) (not e!229351))))

(assert (=> b!376658 (= res!213007 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10803 _keys!658))))))

(declare-fun b!376659 () Bool)

(declare-fun res!213017 () Bool)

(assert (=> b!376659 (=> (not res!213017) (not e!229351))))

(assert (=> b!376659 (= res!213017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376660 () Bool)

(declare-fun res!213006 () Bool)

(assert (=> b!376660 (=> (not res!213006) (not e!229351))))

(declare-datatypes ((List!5882 0))(
  ( (Nil!5879) (Cons!5878 (h!6734 (_ BitVec 64)) (t!11023 List!5882)) )
))
(declare-fun arrayNoDuplicates!0 (array!21963 (_ BitVec 32) List!5882) Bool)

(assert (=> b!376660 (= res!213006 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5879))))

(declare-fun b!376661 () Bool)

(declare-fun e!229346 () Bool)

(assert (=> b!376661 (= e!229346 (bvsle #b00000000000000000000000000000000 (size!10803 _keys!658)))))

(declare-datatypes ((tuple2!6052 0))(
  ( (tuple2!6053 (_1!3037 (_ BitVec 64)) (_2!3037 V!13139)) )
))
(declare-datatypes ((List!5883 0))(
  ( (Nil!5880) (Cons!5879 (h!6735 tuple2!6052) (t!11024 List!5883)) )
))
(declare-datatypes ((ListLongMap!4955 0))(
  ( (ListLongMap!4956 (toList!2493 List!5883)) )
))
(declare-fun lt!174818 () ListLongMap!4955)

(declare-fun lt!174825 () ListLongMap!4955)

(declare-fun lt!174828 () tuple2!6052)

(declare-fun +!861 (ListLongMap!4955 tuple2!6052) ListLongMap!4955)

(assert (=> b!376661 (= lt!174818 (+!861 lt!174825 lt!174828))))

(declare-fun v!373 () V!13139)

(declare-datatypes ((Unit!11592 0))(
  ( (Unit!11593) )
))
(declare-fun lt!174823 () Unit!11592)

(declare-fun zeroValue!472 () V!13139)

(declare-fun lt!174820 () ListLongMap!4955)

(declare-fun addCommutativeForDiffKeys!269 (ListLongMap!4955 (_ BitVec 64) V!13139 (_ BitVec 64) V!13139) Unit!11592)

(assert (=> b!376661 (= lt!174823 (addCommutativeForDiffKeys!269 lt!174820 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376662 () Bool)

(assert (=> b!376662 (= e!229349 tp_is_empty!9025)))

(declare-fun b!376663 () Bool)

(declare-fun res!213016 () Bool)

(assert (=> b!376663 (=> (not res!213016) (not e!229351))))

(assert (=> b!376663 (= res!213016 (or (= (select (arr!10450 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10450 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376664 () Bool)

(declare-fun res!213008 () Bool)

(assert (=> b!376664 (=> (not res!213008) (not e!229351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376664 (= res!213008 (validKeyInArray!0 k0!778))))

(declare-fun b!376665 () Bool)

(declare-fun res!213015 () Bool)

(assert (=> b!376665 (=> (not res!213015) (not e!229347))))

(assert (=> b!376665 (= res!213015 (arrayNoDuplicates!0 lt!174826 #b00000000000000000000000000000000 Nil!5879))))

(declare-fun b!376666 () Bool)

(declare-fun e!229352 () Bool)

(assert (=> b!376666 (= e!229352 e!229346)))

(declare-fun res!213011 () Bool)

(assert (=> b!376666 (=> res!213011 e!229346)))

(assert (=> b!376666 (= res!213011 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!174817 () ListLongMap!4955)

(assert (=> b!376666 (= lt!174817 lt!174818)))

(declare-fun lt!174822 () ListLongMap!4955)

(declare-fun lt!174827 () tuple2!6052)

(assert (=> b!376666 (= lt!174818 (+!861 lt!174822 lt!174827))))

(declare-fun lt!174819 () ListLongMap!4955)

(assert (=> b!376666 (= lt!174819 lt!174825)))

(assert (=> b!376666 (= lt!174825 (+!861 lt!174820 lt!174827))))

(declare-fun lt!174824 () ListLongMap!4955)

(assert (=> b!376666 (= lt!174817 (+!861 lt!174824 lt!174827))))

(assert (=> b!376666 (= lt!174827 (tuple2!6053 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapIsEmpty!15102 () Bool)

(assert (=> mapIsEmpty!15102 mapRes!15102))

(declare-fun b!376667 () Bool)

(declare-fun res!213012 () Bool)

(assert (=> b!376667 (=> (not res!213012) (not e!229351))))

(declare-fun arrayContainsKey!0 (array!21963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376667 (= res!213012 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376668 () Bool)

(assert (=> b!376668 (= e!229347 (not e!229352))))

(declare-fun res!213013 () Bool)

(assert (=> b!376668 (=> res!213013 e!229352)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376668 (= res!213013 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13139)

(declare-fun getCurrentListMap!1903 (array!21963 array!21961 (_ BitVec 32) (_ BitVec 32) V!13139 V!13139 (_ BitVec 32) Int) ListLongMap!4955)

(assert (=> b!376668 (= lt!174819 (getCurrentListMap!1903 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174816 () array!21961)

(assert (=> b!376668 (= lt!174817 (getCurrentListMap!1903 lt!174826 lt!174816 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376668 (and (= lt!174824 lt!174822) (= lt!174822 lt!174824))))

(assert (=> b!376668 (= lt!174822 (+!861 lt!174820 lt!174828))))

(assert (=> b!376668 (= lt!174828 (tuple2!6053 k0!778 v!373))))

(declare-fun lt!174821 () Unit!11592)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!96 (array!21963 array!21961 (_ BitVec 32) (_ BitVec 32) V!13139 V!13139 (_ BitVec 32) (_ BitVec 64) V!13139 (_ BitVec 32) Int) Unit!11592)

(assert (=> b!376668 (= lt!174821 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!96 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!768 (array!21963 array!21961 (_ BitVec 32) (_ BitVec 32) V!13139 V!13139 (_ BitVec 32) Int) ListLongMap!4955)

(assert (=> b!376668 (= lt!174824 (getCurrentListMapNoExtraKeys!768 lt!174826 lt!174816 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376668 (= lt!174816 (array!21962 (store (arr!10449 _values!506) i!548 (ValueCellFull!4169 v!373)) (size!10802 _values!506)))))

(assert (=> b!376668 (= lt!174820 (getCurrentListMapNoExtraKeys!768 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376669 () Bool)

(declare-fun res!213009 () Bool)

(assert (=> b!376669 (=> (not res!213009) (not e!229351))))

(assert (=> b!376669 (= res!213009 (and (= (size!10802 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10803 _keys!658) (size!10802 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37236 res!213014) b!376669))

(assert (= (and b!376669 res!213009) b!376659))

(assert (= (and b!376659 res!213017) b!376660))

(assert (= (and b!376660 res!213006) b!376658))

(assert (= (and b!376658 res!213007) b!376664))

(assert (= (and b!376664 res!213008) b!376663))

(assert (= (and b!376663 res!213016) b!376667))

(assert (= (and b!376667 res!213012) b!376657))

(assert (= (and b!376657 res!213010) b!376665))

(assert (= (and b!376665 res!213015) b!376668))

(assert (= (and b!376668 (not res!213013)) b!376666))

(assert (= (and b!376666 (not res!213011)) b!376661))

(assert (= (and b!376655 condMapEmpty!15102) mapIsEmpty!15102))

(assert (= (and b!376655 (not condMapEmpty!15102)) mapNonEmpty!15102))

(get-info :version)

(assert (= (and mapNonEmpty!15102 ((_ is ValueCellFull!4169) mapValue!15102)) b!376662))

(assert (= (and b!376655 ((_ is ValueCellFull!4169) mapDefault!15102)) b!376656))

(assert (= start!37236 b!376655))

(declare-fun m!372935 () Bool)

(assert (=> start!37236 m!372935))

(declare-fun m!372937 () Bool)

(assert (=> start!37236 m!372937))

(declare-fun m!372939 () Bool)

(assert (=> start!37236 m!372939))

(declare-fun m!372941 () Bool)

(assert (=> mapNonEmpty!15102 m!372941))

(declare-fun m!372943 () Bool)

(assert (=> b!376667 m!372943))

(declare-fun m!372945 () Bool)

(assert (=> b!376663 m!372945))

(declare-fun m!372947 () Bool)

(assert (=> b!376661 m!372947))

(declare-fun m!372949 () Bool)

(assert (=> b!376661 m!372949))

(declare-fun m!372951 () Bool)

(assert (=> b!376668 m!372951))

(declare-fun m!372953 () Bool)

(assert (=> b!376668 m!372953))

(declare-fun m!372955 () Bool)

(assert (=> b!376668 m!372955))

(declare-fun m!372957 () Bool)

(assert (=> b!376668 m!372957))

(declare-fun m!372959 () Bool)

(assert (=> b!376668 m!372959))

(declare-fun m!372961 () Bool)

(assert (=> b!376668 m!372961))

(declare-fun m!372963 () Bool)

(assert (=> b!376668 m!372963))

(declare-fun m!372965 () Bool)

(assert (=> b!376659 m!372965))

(declare-fun m!372967 () Bool)

(assert (=> b!376657 m!372967))

(declare-fun m!372969 () Bool)

(assert (=> b!376657 m!372969))

(declare-fun m!372971 () Bool)

(assert (=> b!376660 m!372971))

(declare-fun m!372973 () Bool)

(assert (=> b!376664 m!372973))

(declare-fun m!372975 () Bool)

(assert (=> b!376665 m!372975))

(declare-fun m!372977 () Bool)

(assert (=> b!376666 m!372977))

(declare-fun m!372979 () Bool)

(assert (=> b!376666 m!372979))

(declare-fun m!372981 () Bool)

(assert (=> b!376666 m!372981))

(check-sat (not b!376665) (not b!376666) (not start!37236) (not b!376659) (not b_next!8377) b_and!15593 (not b!376660) (not b!376664) (not b!376661) tp_is_empty!9025 (not b!376668) (not mapNonEmpty!15102) (not b!376667) (not b!376657))
(check-sat b_and!15593 (not b_next!8377))
