; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37120 () Bool)

(assert start!37120)

(declare-fun b_free!8247 () Bool)

(declare-fun b_next!8247 () Bool)

(assert (=> start!37120 (= b_free!8247 (not b_next!8247))))

(declare-fun tp!29456 () Bool)

(declare-fun b_and!15489 () Bool)

(assert (=> start!37120 (= tp!29456 b_and!15489)))

(declare-fun mapNonEmpty!14907 () Bool)

(declare-fun mapRes!14907 () Bool)

(declare-fun tp!29457 () Bool)

(declare-fun e!227961 () Bool)

(assert (=> mapNonEmpty!14907 (= mapRes!14907 (and tp!29457 e!227961))))

(declare-datatypes ((V!12965 0))(
  ( (V!12966 (val!4492 Int)) )
))
(declare-datatypes ((ValueCell!4104 0))(
  ( (ValueCellFull!4104 (v!6689 V!12965)) (EmptyCell!4104) )
))
(declare-datatypes ((array!21729 0))(
  ( (array!21730 (arr!10333 (Array (_ BitVec 32) ValueCell!4104)) (size!10685 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21729)

(declare-fun mapRest!14907 () (Array (_ BitVec 32) ValueCell!4104))

(declare-fun mapValue!14907 () ValueCell!4104)

(declare-fun mapKey!14907 () (_ BitVec 32))

(assert (=> mapNonEmpty!14907 (= (arr!10333 _values!506) (store mapRest!14907 mapKey!14907 mapValue!14907))))

(declare-fun b!373992 () Bool)

(declare-fun e!227962 () Bool)

(assert (=> b!373992 (= e!227962 true)))

(declare-datatypes ((tuple2!5968 0))(
  ( (tuple2!5969 (_1!2995 (_ BitVec 64)) (_2!2995 V!12965)) )
))
(declare-datatypes ((List!5813 0))(
  ( (Nil!5810) (Cons!5809 (h!6665 tuple2!5968) (t!10963 List!5813)) )
))
(declare-datatypes ((ListLongMap!4881 0))(
  ( (ListLongMap!4882 (toList!2456 List!5813)) )
))
(declare-fun lt!172107 () ListLongMap!4881)

(declare-fun lt!172110 () tuple2!5968)

(declare-fun lt!172113 () tuple2!5968)

(declare-fun lt!172104 () ListLongMap!4881)

(declare-fun +!802 (ListLongMap!4881 tuple2!5968) ListLongMap!4881)

(assert (=> b!373992 (= (+!802 lt!172107 lt!172113) (+!802 lt!172104 lt!172110))))

(declare-datatypes ((Unit!11510 0))(
  ( (Unit!11511) )
))
(declare-fun lt!172115 () Unit!11510)

(declare-fun lt!172118 () ListLongMap!4881)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun minValue!472 () V!12965)

(declare-fun v!373 () V!12965)

(declare-fun addCommutativeForDiffKeys!226 (ListLongMap!4881 (_ BitVec 64) V!12965 (_ BitVec 64) V!12965) Unit!11510)

(assert (=> b!373992 (= lt!172115 (addCommutativeForDiffKeys!226 lt!172118 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373993 () Bool)

(declare-fun e!227960 () Bool)

(declare-fun tp_is_empty!8895 () Bool)

(assert (=> b!373993 (= e!227960 tp_is_empty!8895)))

(declare-fun b!373994 () Bool)

(declare-fun e!227964 () Bool)

(assert (=> b!373994 (= e!227964 e!227962)))

(declare-fun res!210796 () Bool)

(assert (=> b!373994 (=> res!210796 e!227962)))

(assert (=> b!373994 (= res!210796 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172108 () ListLongMap!4881)

(assert (=> b!373994 (= lt!172108 lt!172107)))

(assert (=> b!373994 (= lt!172107 (+!802 lt!172118 lt!172110))))

(declare-fun lt!172116 () Unit!11510)

(declare-fun lt!172112 () ListLongMap!4881)

(declare-fun zeroValue!472 () V!12965)

(assert (=> b!373994 (= lt!172116 (addCommutativeForDiffKeys!226 lt!172112 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!172105 () ListLongMap!4881)

(assert (=> b!373994 (= lt!172105 (+!802 lt!172108 lt!172113))))

(declare-fun lt!172119 () ListLongMap!4881)

(declare-fun lt!172111 () tuple2!5968)

(assert (=> b!373994 (= lt!172108 (+!802 lt!172119 lt!172111))))

(declare-fun lt!172114 () ListLongMap!4881)

(assert (=> b!373994 (= lt!172114 lt!172104)))

(assert (=> b!373994 (= lt!172104 (+!802 lt!172118 lt!172113))))

(assert (=> b!373994 (= lt!172118 (+!802 lt!172112 lt!172111))))

(declare-fun lt!172106 () ListLongMap!4881)

(assert (=> b!373994 (= lt!172105 (+!802 (+!802 lt!172106 lt!172111) lt!172113))))

(assert (=> b!373994 (= lt!172113 (tuple2!5969 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373994 (= lt!172111 (tuple2!5969 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373995 () Bool)

(declare-fun res!210793 () Bool)

(declare-fun e!227959 () Bool)

(assert (=> b!373995 (=> (not res!210793) (not e!227959))))

(declare-datatypes ((array!21731 0))(
  ( (array!21732 (arr!10334 (Array (_ BitVec 32) (_ BitVec 64))) (size!10686 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21731)

(declare-fun arrayContainsKey!0 (array!21731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373995 (= res!210793 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14907 () Bool)

(assert (=> mapIsEmpty!14907 mapRes!14907))

(declare-fun b!373997 () Bool)

(declare-fun res!210795 () Bool)

(assert (=> b!373997 (=> (not res!210795) (not e!227959))))

(declare-datatypes ((List!5814 0))(
  ( (Nil!5811) (Cons!5810 (h!6666 (_ BitVec 64)) (t!10964 List!5814)) )
))
(declare-fun arrayNoDuplicates!0 (array!21731 (_ BitVec 32) List!5814) Bool)

(assert (=> b!373997 (= res!210795 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5811))))

(declare-fun b!373998 () Bool)

(declare-fun e!227966 () Bool)

(assert (=> b!373998 (= e!227966 (not e!227964))))

(declare-fun res!210786 () Bool)

(assert (=> b!373998 (=> res!210786 e!227964)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373998 (= res!210786 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun getCurrentListMap!1895 (array!21731 array!21729 (_ BitVec 32) (_ BitVec 32) V!12965 V!12965 (_ BitVec 32) Int) ListLongMap!4881)

(assert (=> b!373998 (= lt!172114 (getCurrentListMap!1895 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172109 () array!21731)

(declare-fun lt!172103 () array!21729)

(assert (=> b!373998 (= lt!172105 (getCurrentListMap!1895 lt!172109 lt!172103 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373998 (and (= lt!172106 lt!172119) (= lt!172119 lt!172106))))

(assert (=> b!373998 (= lt!172119 (+!802 lt!172112 lt!172110))))

(assert (=> b!373998 (= lt!172110 (tuple2!5969 k0!778 v!373))))

(declare-fun lt!172117 () Unit!11510)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!53 (array!21731 array!21729 (_ BitVec 32) (_ BitVec 32) V!12965 V!12965 (_ BitVec 32) (_ BitVec 64) V!12965 (_ BitVec 32) Int) Unit!11510)

(assert (=> b!373998 (= lt!172117 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!53 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!729 (array!21731 array!21729 (_ BitVec 32) (_ BitVec 32) V!12965 V!12965 (_ BitVec 32) Int) ListLongMap!4881)

(assert (=> b!373998 (= lt!172106 (getCurrentListMapNoExtraKeys!729 lt!172109 lt!172103 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373998 (= lt!172103 (array!21730 (store (arr!10333 _values!506) i!548 (ValueCellFull!4104 v!373)) (size!10685 _values!506)))))

(assert (=> b!373998 (= lt!172112 (getCurrentListMapNoExtraKeys!729 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373999 () Bool)

(declare-fun res!210787 () Bool)

(assert (=> b!373999 (=> (not res!210787) (not e!227959))))

(assert (=> b!373999 (= res!210787 (or (= (select (arr!10334 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10334 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374000 () Bool)

(assert (=> b!374000 (= e!227959 e!227966)))

(declare-fun res!210794 () Bool)

(assert (=> b!374000 (=> (not res!210794) (not e!227966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21731 (_ BitVec 32)) Bool)

(assert (=> b!374000 (= res!210794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172109 mask!970))))

(assert (=> b!374000 (= lt!172109 (array!21732 (store (arr!10334 _keys!658) i!548 k0!778) (size!10686 _keys!658)))))

(declare-fun b!374001 () Bool)

(assert (=> b!374001 (= e!227961 tp_is_empty!8895)))

(declare-fun b!374002 () Bool)

(declare-fun e!227963 () Bool)

(assert (=> b!374002 (= e!227963 (and e!227960 mapRes!14907))))

(declare-fun condMapEmpty!14907 () Bool)

(declare-fun mapDefault!14907 () ValueCell!4104)

(assert (=> b!374002 (= condMapEmpty!14907 (= (arr!10333 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4104)) mapDefault!14907)))))

(declare-fun b!373996 () Bool)

(declare-fun res!210792 () Bool)

(assert (=> b!373996 (=> (not res!210792) (not e!227959))))

(assert (=> b!373996 (= res!210792 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10686 _keys!658))))))

(declare-fun res!210790 () Bool)

(assert (=> start!37120 (=> (not res!210790) (not e!227959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37120 (= res!210790 (validMask!0 mask!970))))

(assert (=> start!37120 e!227959))

(declare-fun array_inv!7618 (array!21729) Bool)

(assert (=> start!37120 (and (array_inv!7618 _values!506) e!227963)))

(assert (=> start!37120 tp!29456))

(assert (=> start!37120 true))

(assert (=> start!37120 tp_is_empty!8895))

(declare-fun array_inv!7619 (array!21731) Bool)

(assert (=> start!37120 (array_inv!7619 _keys!658)))

(declare-fun b!374003 () Bool)

(declare-fun res!210788 () Bool)

(assert (=> b!374003 (=> (not res!210788) (not e!227959))))

(assert (=> b!374003 (= res!210788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374004 () Bool)

(declare-fun res!210791 () Bool)

(assert (=> b!374004 (=> (not res!210791) (not e!227959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374004 (= res!210791 (validKeyInArray!0 k0!778))))

(declare-fun b!374005 () Bool)

(declare-fun res!210797 () Bool)

(assert (=> b!374005 (=> (not res!210797) (not e!227959))))

(assert (=> b!374005 (= res!210797 (and (= (size!10685 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10686 _keys!658) (size!10685 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374006 () Bool)

(declare-fun res!210789 () Bool)

(assert (=> b!374006 (=> (not res!210789) (not e!227966))))

(assert (=> b!374006 (= res!210789 (arrayNoDuplicates!0 lt!172109 #b00000000000000000000000000000000 Nil!5811))))

(assert (= (and start!37120 res!210790) b!374005))

(assert (= (and b!374005 res!210797) b!374003))

(assert (= (and b!374003 res!210788) b!373997))

(assert (= (and b!373997 res!210795) b!373996))

(assert (= (and b!373996 res!210792) b!374004))

(assert (= (and b!374004 res!210791) b!373999))

(assert (= (and b!373999 res!210787) b!373995))

(assert (= (and b!373995 res!210793) b!374000))

(assert (= (and b!374000 res!210794) b!374006))

(assert (= (and b!374006 res!210789) b!373998))

(assert (= (and b!373998 (not res!210786)) b!373994))

(assert (= (and b!373994 (not res!210796)) b!373992))

(assert (= (and b!374002 condMapEmpty!14907) mapIsEmpty!14907))

(assert (= (and b!374002 (not condMapEmpty!14907)) mapNonEmpty!14907))

(get-info :version)

(assert (= (and mapNonEmpty!14907 ((_ is ValueCellFull!4104) mapValue!14907)) b!374001))

(assert (= (and b!374002 ((_ is ValueCellFull!4104) mapDefault!14907)) b!373993))

(assert (= start!37120 b!374002))

(declare-fun m!370095 () Bool)

(assert (=> b!374003 m!370095))

(declare-fun m!370097 () Bool)

(assert (=> b!373997 m!370097))

(declare-fun m!370099 () Bool)

(assert (=> b!374000 m!370099))

(declare-fun m!370101 () Bool)

(assert (=> b!374000 m!370101))

(declare-fun m!370103 () Bool)

(assert (=> b!373995 m!370103))

(declare-fun m!370105 () Bool)

(assert (=> b!373994 m!370105))

(declare-fun m!370107 () Bool)

(assert (=> b!373994 m!370107))

(declare-fun m!370109 () Bool)

(assert (=> b!373994 m!370109))

(declare-fun m!370111 () Bool)

(assert (=> b!373994 m!370111))

(declare-fun m!370113 () Bool)

(assert (=> b!373994 m!370113))

(assert (=> b!373994 m!370113))

(declare-fun m!370115 () Bool)

(assert (=> b!373994 m!370115))

(declare-fun m!370117 () Bool)

(assert (=> b!373994 m!370117))

(declare-fun m!370119 () Bool)

(assert (=> b!373994 m!370119))

(declare-fun m!370121 () Bool)

(assert (=> b!374006 m!370121))

(declare-fun m!370123 () Bool)

(assert (=> start!37120 m!370123))

(declare-fun m!370125 () Bool)

(assert (=> start!37120 m!370125))

(declare-fun m!370127 () Bool)

(assert (=> start!37120 m!370127))

(declare-fun m!370129 () Bool)

(assert (=> b!374004 m!370129))

(declare-fun m!370131 () Bool)

(assert (=> b!373998 m!370131))

(declare-fun m!370133 () Bool)

(assert (=> b!373998 m!370133))

(declare-fun m!370135 () Bool)

(assert (=> b!373998 m!370135))

(declare-fun m!370137 () Bool)

(assert (=> b!373998 m!370137))

(declare-fun m!370139 () Bool)

(assert (=> b!373998 m!370139))

(declare-fun m!370141 () Bool)

(assert (=> b!373998 m!370141))

(declare-fun m!370143 () Bool)

(assert (=> b!373998 m!370143))

(declare-fun m!370145 () Bool)

(assert (=> mapNonEmpty!14907 m!370145))

(declare-fun m!370147 () Bool)

(assert (=> b!373992 m!370147))

(declare-fun m!370149 () Bool)

(assert (=> b!373992 m!370149))

(declare-fun m!370151 () Bool)

(assert (=> b!373992 m!370151))

(declare-fun m!370153 () Bool)

(assert (=> b!373999 m!370153))

(check-sat (not b!374006) (not b!373995) (not b!373992) (not b_next!8247) (not b!373998) (not b!374004) tp_is_empty!8895 (not mapNonEmpty!14907) (not b!373994) (not b!374000) (not start!37120) (not b!373997) b_and!15489 (not b!374003))
(check-sat b_and!15489 (not b_next!8247))
