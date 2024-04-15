; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37242 () Bool)

(assert start!37242)

(declare-fun b_free!8383 () Bool)

(declare-fun b_next!8383 () Bool)

(assert (=> start!37242 (= b_free!8383 (not b_next!8383))))

(declare-fun tp!29864 () Bool)

(declare-fun b_and!15599 () Bool)

(assert (=> start!37242 (= tp!29864 b_and!15599)))

(declare-fun b!376790 () Bool)

(declare-fun res!213125 () Bool)

(declare-fun e!229417 () Bool)

(assert (=> b!376790 (=> (not res!213125) (not e!229417))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13147 0))(
  ( (V!13148 (val!4560 Int)) )
))
(declare-datatypes ((ValueCell!4172 0))(
  ( (ValueCellFull!4172 (v!6751 V!13147)) (EmptyCell!4172) )
))
(declare-datatypes ((array!21973 0))(
  ( (array!21974 (arr!10455 (Array (_ BitVec 32) ValueCell!4172)) (size!10808 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21973)

(declare-datatypes ((array!21975 0))(
  ( (array!21976 (arr!10456 (Array (_ BitVec 32) (_ BitVec 64))) (size!10809 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21975)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!376790 (= res!213125 (and (= (size!10808 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10809 _keys!658) (size!10808 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376791 () Bool)

(declare-fun res!213120 () Bool)

(assert (=> b!376791 (=> (not res!213120) (not e!229417))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376791 (= res!213120 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10809 _keys!658))))))

(declare-fun b!376792 () Bool)

(declare-fun res!213115 () Bool)

(assert (=> b!376792 (=> (not res!213115) (not e!229417))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376792 (= res!213115 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376793 () Bool)

(declare-fun e!229423 () Bool)

(assert (=> b!376793 (= e!229417 e!229423)))

(declare-fun res!213124 () Bool)

(assert (=> b!376793 (=> (not res!213124) (not e!229423))))

(declare-fun lt!174933 () array!21975)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21975 (_ BitVec 32)) Bool)

(assert (=> b!376793 (= res!213124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174933 mask!970))))

(assert (=> b!376793 (= lt!174933 (array!21976 (store (arr!10456 _keys!658) i!548 k0!778) (size!10809 _keys!658)))))

(declare-fun b!376794 () Bool)

(declare-fun e!229418 () Bool)

(declare-fun tp_is_empty!9031 () Bool)

(assert (=> b!376794 (= e!229418 tp_is_empty!9031)))

(declare-fun b!376795 () Bool)

(declare-fun res!213121 () Bool)

(assert (=> b!376795 (=> (not res!213121) (not e!229417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376795 (= res!213121 (validKeyInArray!0 k0!778))))

(declare-fun b!376796 () Bool)

(declare-fun res!213123 () Bool)

(assert (=> b!376796 (=> (not res!213123) (not e!229423))))

(declare-datatypes ((List!5888 0))(
  ( (Nil!5885) (Cons!5884 (h!6740 (_ BitVec 64)) (t!11029 List!5888)) )
))
(declare-fun arrayNoDuplicates!0 (array!21975 (_ BitVec 32) List!5888) Bool)

(assert (=> b!376796 (= res!213123 (arrayNoDuplicates!0 lt!174933 #b00000000000000000000000000000000 Nil!5885))))

(declare-fun b!376797 () Bool)

(declare-fun e!229419 () Bool)

(assert (=> b!376797 (= e!229423 (not e!229419))))

(declare-fun res!213116 () Bool)

(assert (=> b!376797 (=> res!213116 e!229419)))

(assert (=> b!376797 (= res!213116 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6058 0))(
  ( (tuple2!6059 (_1!3040 (_ BitVec 64)) (_2!3040 V!13147)) )
))
(declare-datatypes ((List!5889 0))(
  ( (Nil!5886) (Cons!5885 (h!6741 tuple2!6058) (t!11030 List!5889)) )
))
(declare-datatypes ((ListLongMap!4961 0))(
  ( (ListLongMap!4962 (toList!2496 List!5889)) )
))
(declare-fun lt!174940 () ListLongMap!4961)

(declare-fun zeroValue!472 () V!13147)

(declare-fun minValue!472 () V!13147)

(declare-fun getCurrentListMap!1906 (array!21975 array!21973 (_ BitVec 32) (_ BitVec 32) V!13147 V!13147 (_ BitVec 32) Int) ListLongMap!4961)

(assert (=> b!376797 (= lt!174940 (getCurrentListMap!1906 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174943 () array!21973)

(declare-fun lt!174937 () ListLongMap!4961)

(assert (=> b!376797 (= lt!174937 (getCurrentListMap!1906 lt!174933 lt!174943 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174945 () ListLongMap!4961)

(declare-fun lt!174944 () ListLongMap!4961)

(assert (=> b!376797 (and (= lt!174945 lt!174944) (= lt!174944 lt!174945))))

(declare-fun lt!174938 () ListLongMap!4961)

(declare-fun lt!174934 () tuple2!6058)

(declare-fun +!864 (ListLongMap!4961 tuple2!6058) ListLongMap!4961)

(assert (=> b!376797 (= lt!174944 (+!864 lt!174938 lt!174934))))

(declare-fun v!373 () V!13147)

(assert (=> b!376797 (= lt!174934 (tuple2!6059 k0!778 v!373))))

(declare-datatypes ((Unit!11598 0))(
  ( (Unit!11599) )
))
(declare-fun lt!174941 () Unit!11598)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!99 (array!21975 array!21973 (_ BitVec 32) (_ BitVec 32) V!13147 V!13147 (_ BitVec 32) (_ BitVec 64) V!13147 (_ BitVec 32) Int) Unit!11598)

(assert (=> b!376797 (= lt!174941 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!99 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!771 (array!21975 array!21973 (_ BitVec 32) (_ BitVec 32) V!13147 V!13147 (_ BitVec 32) Int) ListLongMap!4961)

(assert (=> b!376797 (= lt!174945 (getCurrentListMapNoExtraKeys!771 lt!174933 lt!174943 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376797 (= lt!174943 (array!21974 (store (arr!10455 _values!506) i!548 (ValueCellFull!4172 v!373)) (size!10808 _values!506)))))

(assert (=> b!376797 (= lt!174938 (getCurrentListMapNoExtraKeys!771 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376798 () Bool)

(declare-fun e!229420 () Bool)

(declare-fun e!229424 () Bool)

(declare-fun mapRes!15111 () Bool)

(assert (=> b!376798 (= e!229420 (and e!229424 mapRes!15111))))

(declare-fun condMapEmpty!15111 () Bool)

(declare-fun mapDefault!15111 () ValueCell!4172)

(assert (=> b!376798 (= condMapEmpty!15111 (= (arr!10455 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4172)) mapDefault!15111)))))

(declare-fun mapNonEmpty!15111 () Bool)

(declare-fun tp!29865 () Bool)

(assert (=> mapNonEmpty!15111 (= mapRes!15111 (and tp!29865 e!229418))))

(declare-fun mapKey!15111 () (_ BitVec 32))

(declare-fun mapRest!15111 () (Array (_ BitVec 32) ValueCell!4172))

(declare-fun mapValue!15111 () ValueCell!4172)

(assert (=> mapNonEmpty!15111 (= (arr!10455 _values!506) (store mapRest!15111 mapKey!15111 mapValue!15111))))

(declare-fun b!376799 () Bool)

(assert (=> b!376799 (= e!229424 tp_is_empty!9031)))

(declare-fun b!376801 () Bool)

(declare-fun res!213118 () Bool)

(assert (=> b!376801 (=> (not res!213118) (not e!229417))))

(assert (=> b!376801 (= res!213118 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5885))))

(declare-fun mapIsEmpty!15111 () Bool)

(assert (=> mapIsEmpty!15111 mapRes!15111))

(declare-fun b!376802 () Bool)

(declare-fun res!213119 () Bool)

(assert (=> b!376802 (=> (not res!213119) (not e!229417))))

(assert (=> b!376802 (= res!213119 (or (= (select (arr!10456 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10456 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376803 () Bool)

(declare-fun res!213122 () Bool)

(assert (=> b!376803 (=> (not res!213122) (not e!229417))))

(assert (=> b!376803 (= res!213122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376804 () Bool)

(declare-fun e!229421 () Bool)

(assert (=> b!376804 (= e!229419 e!229421)))

(declare-fun res!213114 () Bool)

(assert (=> b!376804 (=> res!213114 e!229421)))

(assert (=> b!376804 (= res!213114 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!174939 () ListLongMap!4961)

(assert (=> b!376804 (= lt!174937 lt!174939)))

(declare-fun lt!174942 () tuple2!6058)

(assert (=> b!376804 (= lt!174939 (+!864 lt!174944 lt!174942))))

(declare-fun lt!174936 () ListLongMap!4961)

(assert (=> b!376804 (= lt!174940 lt!174936)))

(assert (=> b!376804 (= lt!174936 (+!864 lt!174938 lt!174942))))

(assert (=> b!376804 (= lt!174937 (+!864 lt!174945 lt!174942))))

(assert (=> b!376804 (= lt!174942 (tuple2!6059 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!213117 () Bool)

(assert (=> start!37242 (=> (not res!213117) (not e!229417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37242 (= res!213117 (validMask!0 mask!970))))

(assert (=> start!37242 e!229417))

(declare-fun array_inv!7708 (array!21973) Bool)

(assert (=> start!37242 (and (array_inv!7708 _values!506) e!229420)))

(assert (=> start!37242 tp!29864))

(assert (=> start!37242 true))

(assert (=> start!37242 tp_is_empty!9031))

(declare-fun array_inv!7709 (array!21975) Bool)

(assert (=> start!37242 (array_inv!7709 _keys!658)))

(declare-fun b!376800 () Bool)

(assert (=> b!376800 (= e!229421 true)))

(assert (=> b!376800 (= lt!174939 (+!864 lt!174936 lt!174934))))

(declare-fun lt!174935 () Unit!11598)

(declare-fun addCommutativeForDiffKeys!271 (ListLongMap!4961 (_ BitVec 64) V!13147 (_ BitVec 64) V!13147) Unit!11598)

(assert (=> b!376800 (= lt!174935 (addCommutativeForDiffKeys!271 lt!174938 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37242 res!213117) b!376790))

(assert (= (and b!376790 res!213125) b!376803))

(assert (= (and b!376803 res!213122) b!376801))

(assert (= (and b!376801 res!213118) b!376791))

(assert (= (and b!376791 res!213120) b!376795))

(assert (= (and b!376795 res!213121) b!376802))

(assert (= (and b!376802 res!213119) b!376792))

(assert (= (and b!376792 res!213115) b!376793))

(assert (= (and b!376793 res!213124) b!376796))

(assert (= (and b!376796 res!213123) b!376797))

(assert (= (and b!376797 (not res!213116)) b!376804))

(assert (= (and b!376804 (not res!213114)) b!376800))

(assert (= (and b!376798 condMapEmpty!15111) mapIsEmpty!15111))

(assert (= (and b!376798 (not condMapEmpty!15111)) mapNonEmpty!15111))

(get-info :version)

(assert (= (and mapNonEmpty!15111 ((_ is ValueCellFull!4172) mapValue!15111)) b!376794))

(assert (= (and b!376798 ((_ is ValueCellFull!4172) mapDefault!15111)) b!376799))

(assert (= start!37242 b!376798))

(declare-fun m!373079 () Bool)

(assert (=> start!37242 m!373079))

(declare-fun m!373081 () Bool)

(assert (=> start!37242 m!373081))

(declare-fun m!373083 () Bool)

(assert (=> start!37242 m!373083))

(declare-fun m!373085 () Bool)

(assert (=> b!376804 m!373085))

(declare-fun m!373087 () Bool)

(assert (=> b!376804 m!373087))

(declare-fun m!373089 () Bool)

(assert (=> b!376804 m!373089))

(declare-fun m!373091 () Bool)

(assert (=> b!376801 m!373091))

(declare-fun m!373093 () Bool)

(assert (=> mapNonEmpty!15111 m!373093))

(declare-fun m!373095 () Bool)

(assert (=> b!376792 m!373095))

(declare-fun m!373097 () Bool)

(assert (=> b!376795 m!373097))

(declare-fun m!373099 () Bool)

(assert (=> b!376800 m!373099))

(declare-fun m!373101 () Bool)

(assert (=> b!376800 m!373101))

(declare-fun m!373103 () Bool)

(assert (=> b!376803 m!373103))

(declare-fun m!373105 () Bool)

(assert (=> b!376797 m!373105))

(declare-fun m!373107 () Bool)

(assert (=> b!376797 m!373107))

(declare-fun m!373109 () Bool)

(assert (=> b!376797 m!373109))

(declare-fun m!373111 () Bool)

(assert (=> b!376797 m!373111))

(declare-fun m!373113 () Bool)

(assert (=> b!376797 m!373113))

(declare-fun m!373115 () Bool)

(assert (=> b!376797 m!373115))

(declare-fun m!373117 () Bool)

(assert (=> b!376797 m!373117))

(declare-fun m!373119 () Bool)

(assert (=> b!376793 m!373119))

(declare-fun m!373121 () Bool)

(assert (=> b!376793 m!373121))

(declare-fun m!373123 () Bool)

(assert (=> b!376796 m!373123))

(declare-fun m!373125 () Bool)

(assert (=> b!376802 m!373125))

(check-sat b_and!15599 (not mapNonEmpty!15111) (not b!376796) (not b!376800) (not b!376803) (not start!37242) (not b!376792) (not b!376801) (not b!376804) (not b!376793) (not b_next!8383) tp_is_empty!9031 (not b!376795) (not b!376797))
(check-sat b_and!15599 (not b_next!8383))
