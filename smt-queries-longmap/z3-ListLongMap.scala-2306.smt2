; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37284 () Bool)

(assert start!37284)

(declare-fun b_free!8425 () Bool)

(declare-fun b_next!8425 () Bool)

(assert (=> start!37284 (= b_free!8425 (not b_next!8425))))

(declare-fun tp!29990 () Bool)

(declare-fun b_and!15681 () Bool)

(assert (=> start!37284 (= tp!29990 b_and!15681)))

(declare-fun b!377957 () Bool)

(declare-fun e!230067 () Bool)

(declare-fun e!230068 () Bool)

(assert (=> b!377957 (= e!230067 e!230068)))

(declare-fun res!213998 () Bool)

(assert (=> b!377957 (=> res!213998 e!230068)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!377957 (= res!213998 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13203 0))(
  ( (V!13204 (val!4581 Int)) )
))
(declare-datatypes ((tuple2!6020 0))(
  ( (tuple2!6021 (_1!3021 (_ BitVec 64)) (_2!3021 V!13203)) )
))
(declare-datatypes ((List!5860 0))(
  ( (Nil!5857) (Cons!5856 (h!6712 tuple2!6020) (t!11002 List!5860)) )
))
(declare-datatypes ((ListLongMap!4935 0))(
  ( (ListLongMap!4936 (toList!2483 List!5860)) )
))
(declare-fun lt!176016 () ListLongMap!4935)

(declare-fun lt!176011 () ListLongMap!4935)

(assert (=> b!377957 (= lt!176016 lt!176011)))

(declare-fun lt!176012 () ListLongMap!4935)

(declare-fun lt!176006 () tuple2!6020)

(declare-fun +!879 (ListLongMap!4935 tuple2!6020) ListLongMap!4935)

(assert (=> b!377957 (= lt!176011 (+!879 lt!176012 lt!176006))))

(declare-fun lt!176015 () ListLongMap!4935)

(declare-fun lt!176007 () ListLongMap!4935)

(assert (=> b!377957 (= lt!176015 lt!176007)))

(declare-fun lt!176010 () ListLongMap!4935)

(assert (=> b!377957 (= lt!176007 (+!879 lt!176010 lt!176006))))

(declare-fun lt!176013 () ListLongMap!4935)

(assert (=> b!377957 (= lt!176016 (+!879 lt!176013 lt!176006))))

(declare-fun zeroValue!472 () V!13203)

(assert (=> b!377957 (= lt!176006 (tuple2!6021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377958 () Bool)

(declare-fun res!213996 () Bool)

(declare-fun e!230066 () Bool)

(assert (=> b!377958 (=> (not res!213996) (not e!230066))))

(declare-datatypes ((array!22062 0))(
  ( (array!22063 (arr!10499 (Array (_ BitVec 32) (_ BitVec 64))) (size!10851 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22062)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22062 (_ BitVec 32)) Bool)

(assert (=> b!377958 (= res!213996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377959 () Bool)

(declare-fun e!230069 () Bool)

(declare-fun tp_is_empty!9073 () Bool)

(assert (=> b!377959 (= e!230069 tp_is_empty!9073)))

(declare-fun mapNonEmpty!15174 () Bool)

(declare-fun mapRes!15174 () Bool)

(declare-fun tp!29991 () Bool)

(assert (=> mapNonEmpty!15174 (= mapRes!15174 (and tp!29991 e!230069))))

(declare-fun mapKey!15174 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4193 0))(
  ( (ValueCellFull!4193 (v!6779 V!13203)) (EmptyCell!4193) )
))
(declare-datatypes ((array!22064 0))(
  ( (array!22065 (arr!10500 (Array (_ BitVec 32) ValueCell!4193)) (size!10852 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22064)

(declare-fun mapValue!15174 () ValueCell!4193)

(declare-fun mapRest!15174 () (Array (_ BitVec 32) ValueCell!4193))

(assert (=> mapNonEmpty!15174 (= (arr!10500 _values!506) (store mapRest!15174 mapKey!15174 mapValue!15174))))

(declare-fun b!377960 () Bool)

(declare-fun res!214002 () Bool)

(assert (=> b!377960 (=> (not res!214002) (not e!230066))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377960 (= res!214002 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10851 _keys!658))))))

(declare-fun b!377961 () Bool)

(declare-fun res!214000 () Bool)

(assert (=> b!377961 (=> (not res!214000) (not e!230066))))

(declare-fun arrayContainsKey!0 (array!22062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377961 (= res!214000 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377962 () Bool)

(declare-fun res!214007 () Bool)

(assert (=> b!377962 (=> (not res!214007) (not e!230066))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377962 (= res!214007 (and (= (size!10852 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10851 _keys!658) (size!10852 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377963 () Bool)

(declare-fun e!230063 () Bool)

(declare-fun e!230065 () Bool)

(assert (=> b!377963 (= e!230063 (and e!230065 mapRes!15174))))

(declare-fun condMapEmpty!15174 () Bool)

(declare-fun mapDefault!15174 () ValueCell!4193)

(assert (=> b!377963 (= condMapEmpty!15174 (= (arr!10500 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4193)) mapDefault!15174)))))

(declare-fun b!377964 () Bool)

(declare-fun e!230064 () Bool)

(assert (=> b!377964 (= e!230066 e!230064)))

(declare-fun res!214004 () Bool)

(assert (=> b!377964 (=> (not res!214004) (not e!230064))))

(declare-fun lt!176005 () array!22062)

(assert (=> b!377964 (= res!214004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176005 mask!970))))

(assert (=> b!377964 (= lt!176005 (array!22063 (store (arr!10499 _keys!658) i!548 k0!778) (size!10851 _keys!658)))))

(declare-fun b!377965 () Bool)

(assert (=> b!377965 (= e!230064 (not e!230067))))

(declare-fun res!214003 () Bool)

(assert (=> b!377965 (=> res!214003 e!230067)))

(assert (=> b!377965 (= res!214003 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13203)

(declare-fun getCurrentListMap!1927 (array!22062 array!22064 (_ BitVec 32) (_ BitVec 32) V!13203 V!13203 (_ BitVec 32) Int) ListLongMap!4935)

(assert (=> b!377965 (= lt!176015 (getCurrentListMap!1927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176017 () array!22064)

(assert (=> b!377965 (= lt!176016 (getCurrentListMap!1927 lt!176005 lt!176017 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377965 (and (= lt!176013 lt!176012) (= lt!176012 lt!176013))))

(declare-fun lt!176008 () tuple2!6020)

(assert (=> b!377965 (= lt!176012 (+!879 lt!176010 lt!176008))))

(declare-fun v!373 () V!13203)

(assert (=> b!377965 (= lt!176008 (tuple2!6021 k0!778 v!373))))

(declare-datatypes ((Unit!11641 0))(
  ( (Unit!11642) )
))
(declare-fun lt!176014 () Unit!11641)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!114 (array!22062 array!22064 (_ BitVec 32) (_ BitVec 32) V!13203 V!13203 (_ BitVec 32) (_ BitVec 64) V!13203 (_ BitVec 32) Int) Unit!11641)

(assert (=> b!377965 (= lt!176014 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!114 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!774 (array!22062 array!22064 (_ BitVec 32) (_ BitVec 32) V!13203 V!13203 (_ BitVec 32) Int) ListLongMap!4935)

(assert (=> b!377965 (= lt!176013 (getCurrentListMapNoExtraKeys!774 lt!176005 lt!176017 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377965 (= lt!176017 (array!22065 (store (arr!10500 _values!506) i!548 (ValueCellFull!4193 v!373)) (size!10852 _values!506)))))

(assert (=> b!377965 (= lt!176010 (getCurrentListMapNoExtraKeys!774 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15174 () Bool)

(assert (=> mapIsEmpty!15174 mapRes!15174))

(declare-fun res!213997 () Bool)

(assert (=> start!37284 (=> (not res!213997) (not e!230066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37284 (= res!213997 (validMask!0 mask!970))))

(assert (=> start!37284 e!230066))

(declare-fun array_inv!7786 (array!22064) Bool)

(assert (=> start!37284 (and (array_inv!7786 _values!506) e!230063)))

(assert (=> start!37284 tp!29990))

(assert (=> start!37284 true))

(assert (=> start!37284 tp_is_empty!9073))

(declare-fun array_inv!7787 (array!22062) Bool)

(assert (=> start!37284 (array_inv!7787 _keys!658)))

(declare-fun b!377966 () Bool)

(declare-fun res!214005 () Bool)

(assert (=> b!377966 (=> (not res!214005) (not e!230064))))

(declare-datatypes ((List!5861 0))(
  ( (Nil!5858) (Cons!5857 (h!6713 (_ BitVec 64)) (t!11003 List!5861)) )
))
(declare-fun arrayNoDuplicates!0 (array!22062 (_ BitVec 32) List!5861) Bool)

(assert (=> b!377966 (= res!214005 (arrayNoDuplicates!0 lt!176005 #b00000000000000000000000000000000 Nil!5858))))

(declare-fun b!377967 () Bool)

(assert (=> b!377967 (= e!230068 true)))

(assert (=> b!377967 (= lt!176011 (+!879 lt!176007 lt!176008))))

(declare-fun lt!176009 () Unit!11641)

(declare-fun addCommutativeForDiffKeys!295 (ListLongMap!4935 (_ BitVec 64) V!13203 (_ BitVec 64) V!13203) Unit!11641)

(assert (=> b!377967 (= lt!176009 (addCommutativeForDiffKeys!295 lt!176010 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377968 () Bool)

(declare-fun res!213999 () Bool)

(assert (=> b!377968 (=> (not res!213999) (not e!230066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377968 (= res!213999 (validKeyInArray!0 k0!778))))

(declare-fun b!377969 () Bool)

(declare-fun res!214006 () Bool)

(assert (=> b!377969 (=> (not res!214006) (not e!230066))))

(assert (=> b!377969 (= res!214006 (or (= (select (arr!10499 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10499 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377970 () Bool)

(declare-fun res!214001 () Bool)

(assert (=> b!377970 (=> (not res!214001) (not e!230066))))

(assert (=> b!377970 (= res!214001 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5858))))

(declare-fun b!377971 () Bool)

(assert (=> b!377971 (= e!230065 tp_is_empty!9073)))

(assert (= (and start!37284 res!213997) b!377962))

(assert (= (and b!377962 res!214007) b!377958))

(assert (= (and b!377958 res!213996) b!377970))

(assert (= (and b!377970 res!214001) b!377960))

(assert (= (and b!377960 res!214002) b!377968))

(assert (= (and b!377968 res!213999) b!377969))

(assert (= (and b!377969 res!214006) b!377961))

(assert (= (and b!377961 res!214000) b!377964))

(assert (= (and b!377964 res!214004) b!377966))

(assert (= (and b!377966 res!214005) b!377965))

(assert (= (and b!377965 (not res!214003)) b!377957))

(assert (= (and b!377957 (not res!213998)) b!377967))

(assert (= (and b!377963 condMapEmpty!15174) mapIsEmpty!15174))

(assert (= (and b!377963 (not condMapEmpty!15174)) mapNonEmpty!15174))

(get-info :version)

(assert (= (and mapNonEmpty!15174 ((_ is ValueCellFull!4193) mapValue!15174)) b!377959))

(assert (= (and b!377963 ((_ is ValueCellFull!4193) mapDefault!15174)) b!377971))

(assert (= start!37284 b!377963))

(declare-fun m!375041 () Bool)

(assert (=> b!377969 m!375041))

(declare-fun m!375043 () Bool)

(assert (=> b!377967 m!375043))

(declare-fun m!375045 () Bool)

(assert (=> b!377967 m!375045))

(declare-fun m!375047 () Bool)

(assert (=> mapNonEmpty!15174 m!375047))

(declare-fun m!375049 () Bool)

(assert (=> b!377964 m!375049))

(declare-fun m!375051 () Bool)

(assert (=> b!377964 m!375051))

(declare-fun m!375053 () Bool)

(assert (=> b!377958 m!375053))

(declare-fun m!375055 () Bool)

(assert (=> b!377957 m!375055))

(declare-fun m!375057 () Bool)

(assert (=> b!377957 m!375057))

(declare-fun m!375059 () Bool)

(assert (=> b!377957 m!375059))

(declare-fun m!375061 () Bool)

(assert (=> start!37284 m!375061))

(declare-fun m!375063 () Bool)

(assert (=> start!37284 m!375063))

(declare-fun m!375065 () Bool)

(assert (=> start!37284 m!375065))

(declare-fun m!375067 () Bool)

(assert (=> b!377968 m!375067))

(declare-fun m!375069 () Bool)

(assert (=> b!377966 m!375069))

(declare-fun m!375071 () Bool)

(assert (=> b!377961 m!375071))

(declare-fun m!375073 () Bool)

(assert (=> b!377970 m!375073))

(declare-fun m!375075 () Bool)

(assert (=> b!377965 m!375075))

(declare-fun m!375077 () Bool)

(assert (=> b!377965 m!375077))

(declare-fun m!375079 () Bool)

(assert (=> b!377965 m!375079))

(declare-fun m!375081 () Bool)

(assert (=> b!377965 m!375081))

(declare-fun m!375083 () Bool)

(assert (=> b!377965 m!375083))

(declare-fun m!375085 () Bool)

(assert (=> b!377965 m!375085))

(declare-fun m!375087 () Bool)

(assert (=> b!377965 m!375087))

(check-sat (not b!377965) (not start!37284) (not b!377961) (not b!377957) (not b_next!8425) (not b!377964) (not mapNonEmpty!15174) (not b!377968) (not b!377958) tp_is_empty!9073 (not b!377970) (not b!377967) (not b!377966) b_and!15681)
(check-sat b_and!15681 (not b_next!8425))
