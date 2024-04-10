; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37300 () Bool)

(assert start!37300)

(declare-fun b_free!8427 () Bool)

(declare-fun b_next!8427 () Bool)

(assert (=> start!37300 (= b_free!8427 (not b_next!8427))))

(declare-fun tp!29996 () Bool)

(declare-fun b_and!15669 () Bool)

(assert (=> start!37300 (= tp!29996 b_and!15669)))

(declare-fun b!378051 () Bool)

(declare-fun e!230123 () Bool)

(declare-fun e!230124 () Bool)

(declare-fun mapRes!15177 () Bool)

(assert (=> b!378051 (= e!230123 (and e!230124 mapRes!15177))))

(declare-fun condMapEmpty!15177 () Bool)

(declare-datatypes ((V!13205 0))(
  ( (V!13206 (val!4582 Int)) )
))
(declare-datatypes ((ValueCell!4194 0))(
  ( (ValueCellFull!4194 (v!6779 V!13205)) (EmptyCell!4194) )
))
(declare-datatypes ((array!22077 0))(
  ( (array!22078 (arr!10507 (Array (_ BitVec 32) ValueCell!4194)) (size!10859 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22077)

(declare-fun mapDefault!15177 () ValueCell!4194)

(assert (=> b!378051 (= condMapEmpty!15177 (= (arr!10507 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4194)) mapDefault!15177)))))

(declare-fun b!378052 () Bool)

(declare-fun e!230119 () Bool)

(declare-fun e!230122 () Bool)

(assert (=> b!378052 (= e!230119 e!230122)))

(declare-fun res!214036 () Bool)

(assert (=> b!378052 (=> res!214036 e!230122)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!378052 (= res!214036 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6116 0))(
  ( (tuple2!6117 (_1!3069 (_ BitVec 64)) (_2!3069 V!13205)) )
))
(declare-datatypes ((List!5954 0))(
  ( (Nil!5951) (Cons!5950 (h!6806 tuple2!6116) (t!11104 List!5954)) )
))
(declare-datatypes ((ListLongMap!5029 0))(
  ( (ListLongMap!5030 (toList!2530 List!5954)) )
))
(declare-fun lt!176034 () ListLongMap!5029)

(declare-fun lt!176030 () ListLongMap!5029)

(assert (=> b!378052 (= lt!176034 lt!176030)))

(declare-fun lt!176025 () ListLongMap!5029)

(declare-fun lt!176035 () tuple2!6116)

(declare-fun +!876 (ListLongMap!5029 tuple2!6116) ListLongMap!5029)

(assert (=> b!378052 (= lt!176030 (+!876 lt!176025 lt!176035))))

(declare-fun lt!176026 () ListLongMap!5029)

(declare-fun lt!176031 () ListLongMap!5029)

(assert (=> b!378052 (= lt!176026 lt!176031)))

(declare-fun lt!176027 () ListLongMap!5029)

(assert (=> b!378052 (= lt!176031 (+!876 lt!176027 lt!176035))))

(declare-fun lt!176029 () ListLongMap!5029)

(assert (=> b!378052 (= lt!176034 (+!876 lt!176029 lt!176035))))

(declare-fun zeroValue!472 () V!13205)

(assert (=> b!378052 (= lt!176035 (tuple2!6117 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!378053 () Bool)

(declare-fun tp_is_empty!9075 () Bool)

(assert (=> b!378053 (= e!230124 tp_is_empty!9075)))

(declare-fun b!378054 () Bool)

(declare-fun res!214037 () Bool)

(declare-fun e!230120 () Bool)

(assert (=> b!378054 (=> (not res!214037) (not e!230120))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22079 0))(
  ( (array!22080 (arr!10508 (Array (_ BitVec 32) (_ BitVec 64))) (size!10860 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22079)

(assert (=> b!378054 (= res!214037 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10860 _keys!658))))))

(declare-fun b!378055 () Bool)

(assert (=> b!378055 (= e!230122 true)))

(declare-fun lt!176032 () tuple2!6116)

(assert (=> b!378055 (= lt!176030 (+!876 lt!176031 lt!176032))))

(declare-datatypes ((Unit!11652 0))(
  ( (Unit!11653) )
))
(declare-fun lt!176036 () Unit!11652)

(declare-fun v!373 () V!13205)

(declare-fun addCommutativeForDiffKeys!282 (ListLongMap!5029 (_ BitVec 64) V!13205 (_ BitVec 64) V!13205) Unit!11652)

(assert (=> b!378055 (= lt!176036 (addCommutativeForDiffKeys!282 lt!176027 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!378056 () Bool)

(declare-fun res!214046 () Bool)

(assert (=> b!378056 (=> (not res!214046) (not e!230120))))

(declare-datatypes ((List!5955 0))(
  ( (Nil!5952) (Cons!5951 (h!6807 (_ BitVec 64)) (t!11105 List!5955)) )
))
(declare-fun arrayNoDuplicates!0 (array!22079 (_ BitVec 32) List!5955) Bool)

(assert (=> b!378056 (= res!214046 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5952))))

(declare-fun b!378057 () Bool)

(declare-fun res!214043 () Bool)

(assert (=> b!378057 (=> (not res!214043) (not e!230120))))

(declare-fun arrayContainsKey!0 (array!22079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378057 (= res!214043 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378058 () Bool)

(declare-fun e!230125 () Bool)

(assert (=> b!378058 (= e!230125 tp_is_empty!9075)))

(declare-fun mapNonEmpty!15177 () Bool)

(declare-fun tp!29997 () Bool)

(assert (=> mapNonEmpty!15177 (= mapRes!15177 (and tp!29997 e!230125))))

(declare-fun mapKey!15177 () (_ BitVec 32))

(declare-fun mapRest!15177 () (Array (_ BitVec 32) ValueCell!4194))

(declare-fun mapValue!15177 () ValueCell!4194)

(assert (=> mapNonEmpty!15177 (= (arr!10507 _values!506) (store mapRest!15177 mapKey!15177 mapValue!15177))))

(declare-fun mapIsEmpty!15177 () Bool)

(assert (=> mapIsEmpty!15177 mapRes!15177))

(declare-fun b!378060 () Bool)

(declare-fun e!230126 () Bool)

(assert (=> b!378060 (= e!230126 (not e!230119))))

(declare-fun res!214040 () Bool)

(assert (=> b!378060 (=> res!214040 e!230119)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378060 (= res!214040 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13205)

(declare-fun getCurrentListMap!1957 (array!22079 array!22077 (_ BitVec 32) (_ BitVec 32) V!13205 V!13205 (_ BitVec 32) Int) ListLongMap!5029)

(assert (=> b!378060 (= lt!176026 (getCurrentListMap!1957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176033 () array!22077)

(declare-fun lt!176037 () array!22079)

(assert (=> b!378060 (= lt!176034 (getCurrentListMap!1957 lt!176037 lt!176033 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378060 (and (= lt!176029 lt!176025) (= lt!176025 lt!176029))))

(assert (=> b!378060 (= lt!176025 (+!876 lt!176027 lt!176032))))

(assert (=> b!378060 (= lt!176032 (tuple2!6117 k0!778 v!373))))

(declare-fun lt!176028 () Unit!11652)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!115 (array!22079 array!22077 (_ BitVec 32) (_ BitVec 32) V!13205 V!13205 (_ BitVec 32) (_ BitVec 64) V!13205 (_ BitVec 32) Int) Unit!11652)

(assert (=> b!378060 (= lt!176028 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!115 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!791 (array!22079 array!22077 (_ BitVec 32) (_ BitVec 32) V!13205 V!13205 (_ BitVec 32) Int) ListLongMap!5029)

(assert (=> b!378060 (= lt!176029 (getCurrentListMapNoExtraKeys!791 lt!176037 lt!176033 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378060 (= lt!176033 (array!22078 (store (arr!10507 _values!506) i!548 (ValueCellFull!4194 v!373)) (size!10859 _values!506)))))

(assert (=> b!378060 (= lt!176027 (getCurrentListMapNoExtraKeys!791 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378061 () Bool)

(declare-fun res!214038 () Bool)

(assert (=> b!378061 (=> (not res!214038) (not e!230126))))

(assert (=> b!378061 (= res!214038 (arrayNoDuplicates!0 lt!176037 #b00000000000000000000000000000000 Nil!5952))))

(declare-fun b!378062 () Bool)

(declare-fun res!214035 () Bool)

(assert (=> b!378062 (=> (not res!214035) (not e!230120))))

(assert (=> b!378062 (= res!214035 (or (= (select (arr!10508 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10508 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378063 () Bool)

(declare-fun res!214044 () Bool)

(assert (=> b!378063 (=> (not res!214044) (not e!230120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22079 (_ BitVec 32)) Bool)

(assert (=> b!378063 (= res!214044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378064 () Bool)

(declare-fun res!214039 () Bool)

(assert (=> b!378064 (=> (not res!214039) (not e!230120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378064 (= res!214039 (validKeyInArray!0 k0!778))))

(declare-fun b!378065 () Bool)

(assert (=> b!378065 (= e!230120 e!230126)))

(declare-fun res!214042 () Bool)

(assert (=> b!378065 (=> (not res!214042) (not e!230126))))

(assert (=> b!378065 (= res!214042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176037 mask!970))))

(assert (=> b!378065 (= lt!176037 (array!22080 (store (arr!10508 _keys!658) i!548 k0!778) (size!10860 _keys!658)))))

(declare-fun res!214045 () Bool)

(assert (=> start!37300 (=> (not res!214045) (not e!230120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37300 (= res!214045 (validMask!0 mask!970))))

(assert (=> start!37300 e!230120))

(declare-fun array_inv!7740 (array!22077) Bool)

(assert (=> start!37300 (and (array_inv!7740 _values!506) e!230123)))

(assert (=> start!37300 tp!29996))

(assert (=> start!37300 true))

(assert (=> start!37300 tp_is_empty!9075))

(declare-fun array_inv!7741 (array!22079) Bool)

(assert (=> start!37300 (array_inv!7741 _keys!658)))

(declare-fun b!378059 () Bool)

(declare-fun res!214041 () Bool)

(assert (=> b!378059 (=> (not res!214041) (not e!230120))))

(assert (=> b!378059 (= res!214041 (and (= (size!10859 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10860 _keys!658) (size!10859 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37300 res!214045) b!378059))

(assert (= (and b!378059 res!214041) b!378063))

(assert (= (and b!378063 res!214044) b!378056))

(assert (= (and b!378056 res!214046) b!378054))

(assert (= (and b!378054 res!214037) b!378064))

(assert (= (and b!378064 res!214039) b!378062))

(assert (= (and b!378062 res!214035) b!378057))

(assert (= (and b!378057 res!214043) b!378065))

(assert (= (and b!378065 res!214042) b!378061))

(assert (= (and b!378061 res!214038) b!378060))

(assert (= (and b!378060 (not res!214040)) b!378052))

(assert (= (and b!378052 (not res!214036)) b!378055))

(assert (= (and b!378051 condMapEmpty!15177) mapIsEmpty!15177))

(assert (= (and b!378051 (not condMapEmpty!15177)) mapNonEmpty!15177))

(get-info :version)

(assert (= (and mapNonEmpty!15177 ((_ is ValueCellFull!4194) mapValue!15177)) b!378058))

(assert (= (and b!378051 ((_ is ValueCellFull!4194) mapDefault!15177)) b!378053))

(assert (= start!37300 b!378051))

(declare-fun m!374859 () Bool)

(assert (=> b!378064 m!374859))

(declare-fun m!374861 () Bool)

(assert (=> b!378057 m!374861))

(declare-fun m!374863 () Bool)

(assert (=> b!378061 m!374863))

(declare-fun m!374865 () Bool)

(assert (=> mapNonEmpty!15177 m!374865))

(declare-fun m!374867 () Bool)

(assert (=> b!378062 m!374867))

(declare-fun m!374869 () Bool)

(assert (=> b!378056 m!374869))

(declare-fun m!374871 () Bool)

(assert (=> b!378063 m!374871))

(declare-fun m!374873 () Bool)

(assert (=> start!37300 m!374873))

(declare-fun m!374875 () Bool)

(assert (=> start!37300 m!374875))

(declare-fun m!374877 () Bool)

(assert (=> start!37300 m!374877))

(declare-fun m!374879 () Bool)

(assert (=> b!378052 m!374879))

(declare-fun m!374881 () Bool)

(assert (=> b!378052 m!374881))

(declare-fun m!374883 () Bool)

(assert (=> b!378052 m!374883))

(declare-fun m!374885 () Bool)

(assert (=> b!378065 m!374885))

(declare-fun m!374887 () Bool)

(assert (=> b!378065 m!374887))

(declare-fun m!374889 () Bool)

(assert (=> b!378060 m!374889))

(declare-fun m!374891 () Bool)

(assert (=> b!378060 m!374891))

(declare-fun m!374893 () Bool)

(assert (=> b!378060 m!374893))

(declare-fun m!374895 () Bool)

(assert (=> b!378060 m!374895))

(declare-fun m!374897 () Bool)

(assert (=> b!378060 m!374897))

(declare-fun m!374899 () Bool)

(assert (=> b!378060 m!374899))

(declare-fun m!374901 () Bool)

(assert (=> b!378060 m!374901))

(declare-fun m!374903 () Bool)

(assert (=> b!378055 m!374903))

(declare-fun m!374905 () Bool)

(assert (=> b!378055 m!374905))

(check-sat (not b!378061) (not b!378052) (not mapNonEmpty!15177) (not b!378057) (not start!37300) (not b_next!8427) tp_is_empty!9075 (not b!378056) (not b!378065) b_and!15669 (not b!378060) (not b!378063) (not b!378064) (not b!378055))
(check-sat b_and!15669 (not b_next!8427))
