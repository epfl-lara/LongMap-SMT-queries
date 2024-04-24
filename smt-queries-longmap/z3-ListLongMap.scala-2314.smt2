; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37332 () Bool)

(assert start!37332)

(declare-fun b_free!8473 () Bool)

(declare-fun b_next!8473 () Bool)

(assert (=> start!37332 (= b_free!8473 (not b_next!8473))))

(declare-fun tp!30134 () Bool)

(declare-fun b_and!15729 () Bool)

(assert (=> start!37332 (= tp!30134 b_and!15729)))

(declare-fun b!379046 () Bool)

(declare-fun res!214874 () Bool)

(declare-fun e!230641 () Bool)

(assert (=> b!379046 (=> (not res!214874) (not e!230641))))

(declare-datatypes ((array!22152 0))(
  ( (array!22153 (arr!10544 (Array (_ BitVec 32) (_ BitVec 64))) (size!10896 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22152)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379046 (= res!214874 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379047 () Bool)

(declare-fun res!214878 () Bool)

(assert (=> b!379047 (=> (not res!214878) (not e!230641))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22152 (_ BitVec 32)) Bool)

(assert (=> b!379047 (= res!214878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379048 () Bool)

(declare-fun res!214876 () Bool)

(assert (=> b!379048 (=> (not res!214876) (not e!230641))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13267 0))(
  ( (V!13268 (val!4605 Int)) )
))
(declare-datatypes ((ValueCell!4217 0))(
  ( (ValueCellFull!4217 (v!6803 V!13267)) (EmptyCell!4217) )
))
(declare-datatypes ((array!22154 0))(
  ( (array!22155 (arr!10545 (Array (_ BitVec 32) ValueCell!4217)) (size!10897 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22154)

(assert (=> b!379048 (= res!214876 (and (= (size!10897 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10896 _keys!658) (size!10897 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379049 () Bool)

(declare-fun e!230645 () Bool)

(declare-fun e!230640 () Bool)

(assert (=> b!379049 (= e!230645 (not e!230640))))

(declare-fun res!214872 () Bool)

(assert (=> b!379049 (=> res!214872 e!230640)))

(assert (=> b!379049 (= res!214872 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13267)

(declare-datatypes ((tuple2!6054 0))(
  ( (tuple2!6055 (_1!3038 (_ BitVec 64)) (_2!3038 V!13267)) )
))
(declare-datatypes ((List!5892 0))(
  ( (Nil!5889) (Cons!5888 (h!6744 tuple2!6054) (t!11034 List!5892)) )
))
(declare-datatypes ((ListLongMap!4969 0))(
  ( (ListLongMap!4970 (toList!2500 List!5892)) )
))
(declare-fun lt!176911 () ListLongMap!4969)

(declare-fun minValue!472 () V!13267)

(declare-fun getCurrentListMap!1941 (array!22152 array!22154 (_ BitVec 32) (_ BitVec 32) V!13267 V!13267 (_ BitVec 32) Int) ListLongMap!4969)

(assert (=> b!379049 (= lt!176911 (getCurrentListMap!1941 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176914 () ListLongMap!4969)

(declare-fun lt!176906 () array!22154)

(declare-fun lt!176915 () array!22152)

(assert (=> b!379049 (= lt!176914 (getCurrentListMap!1941 lt!176915 lt!176906 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176912 () ListLongMap!4969)

(declare-fun lt!176908 () ListLongMap!4969)

(assert (=> b!379049 (and (= lt!176912 lt!176908) (= lt!176908 lt!176912))))

(declare-fun lt!176909 () ListLongMap!4969)

(declare-fun lt!176910 () tuple2!6054)

(declare-fun +!896 (ListLongMap!4969 tuple2!6054) ListLongMap!4969)

(assert (=> b!379049 (= lt!176908 (+!896 lt!176909 lt!176910))))

(declare-fun v!373 () V!13267)

(assert (=> b!379049 (= lt!176910 (tuple2!6055 k0!778 v!373))))

(declare-datatypes ((Unit!11675 0))(
  ( (Unit!11676) )
))
(declare-fun lt!176916 () Unit!11675)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!128 (array!22152 array!22154 (_ BitVec 32) (_ BitVec 32) V!13267 V!13267 (_ BitVec 32) (_ BitVec 64) V!13267 (_ BitVec 32) Int) Unit!11675)

(assert (=> b!379049 (= lt!176916 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!128 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!788 (array!22152 array!22154 (_ BitVec 32) (_ BitVec 32) V!13267 V!13267 (_ BitVec 32) Int) ListLongMap!4969)

(assert (=> b!379049 (= lt!176912 (getCurrentListMapNoExtraKeys!788 lt!176915 lt!176906 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379049 (= lt!176906 (array!22155 (store (arr!10545 _values!506) i!548 (ValueCellFull!4217 v!373)) (size!10897 _values!506)))))

(assert (=> b!379049 (= lt!176909 (getCurrentListMapNoExtraKeys!788 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!214875 () Bool)

(assert (=> start!37332 (=> (not res!214875) (not e!230641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37332 (= res!214875 (validMask!0 mask!970))))

(assert (=> start!37332 e!230641))

(declare-fun e!230642 () Bool)

(declare-fun array_inv!7814 (array!22154) Bool)

(assert (=> start!37332 (and (array_inv!7814 _values!506) e!230642)))

(assert (=> start!37332 tp!30134))

(assert (=> start!37332 true))

(declare-fun tp_is_empty!9121 () Bool)

(assert (=> start!37332 tp_is_empty!9121))

(declare-fun array_inv!7815 (array!22152) Bool)

(assert (=> start!37332 (array_inv!7815 _keys!658)))

(declare-fun b!379050 () Bool)

(declare-fun res!214879 () Bool)

(assert (=> b!379050 (=> (not res!214879) (not e!230641))))

(assert (=> b!379050 (= res!214879 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10896 _keys!658))))))

(declare-fun b!379051 () Bool)

(declare-fun e!230644 () Bool)

(assert (=> b!379051 (= e!230644 tp_is_empty!9121)))

(declare-fun b!379052 () Bool)

(declare-fun res!214869 () Bool)

(assert (=> b!379052 (=> (not res!214869) (not e!230641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379052 (= res!214869 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!15246 () Bool)

(declare-fun mapRes!15246 () Bool)

(assert (=> mapIsEmpty!15246 mapRes!15246))

(declare-fun b!379053 () Bool)

(declare-fun e!230639 () Bool)

(assert (=> b!379053 (= e!230640 e!230639)))

(declare-fun res!214871 () Bool)

(assert (=> b!379053 (=> res!214871 e!230639)))

(assert (=> b!379053 (= res!214871 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176913 () ListLongMap!4969)

(assert (=> b!379053 (= lt!176911 lt!176913)))

(declare-fun lt!176905 () tuple2!6054)

(assert (=> b!379053 (= lt!176913 (+!896 lt!176909 lt!176905))))

(declare-fun lt!176907 () ListLongMap!4969)

(assert (=> b!379053 (= lt!176914 lt!176907)))

(assert (=> b!379053 (= lt!176907 (+!896 lt!176908 lt!176905))))

(assert (=> b!379053 (= lt!176914 (+!896 lt!176912 lt!176905))))

(assert (=> b!379053 (= lt!176905 (tuple2!6055 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379054 () Bool)

(declare-fun e!230646 () Bool)

(assert (=> b!379054 (= e!230646 tp_is_empty!9121)))

(declare-fun b!379055 () Bool)

(assert (=> b!379055 (= e!230639 true)))

(assert (=> b!379055 (= lt!176907 (+!896 lt!176913 lt!176910))))

(declare-fun lt!176917 () Unit!11675)

(declare-fun addCommutativeForDiffKeys!309 (ListLongMap!4969 (_ BitVec 64) V!13267 (_ BitVec 64) V!13267) Unit!11675)

(assert (=> b!379055 (= lt!176917 (addCommutativeForDiffKeys!309 lt!176909 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379056 () Bool)

(declare-fun res!214873 () Bool)

(assert (=> b!379056 (=> (not res!214873) (not e!230641))))

(declare-datatypes ((List!5893 0))(
  ( (Nil!5890) (Cons!5889 (h!6745 (_ BitVec 64)) (t!11035 List!5893)) )
))
(declare-fun arrayNoDuplicates!0 (array!22152 (_ BitVec 32) List!5893) Bool)

(assert (=> b!379056 (= res!214873 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5890))))

(declare-fun mapNonEmpty!15246 () Bool)

(declare-fun tp!30135 () Bool)

(assert (=> mapNonEmpty!15246 (= mapRes!15246 (and tp!30135 e!230644))))

(declare-fun mapRest!15246 () (Array (_ BitVec 32) ValueCell!4217))

(declare-fun mapValue!15246 () ValueCell!4217)

(declare-fun mapKey!15246 () (_ BitVec 32))

(assert (=> mapNonEmpty!15246 (= (arr!10545 _values!506) (store mapRest!15246 mapKey!15246 mapValue!15246))))

(declare-fun b!379057 () Bool)

(declare-fun res!214877 () Bool)

(assert (=> b!379057 (=> (not res!214877) (not e!230641))))

(assert (=> b!379057 (= res!214877 (or (= (select (arr!10544 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10544 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379058 () Bool)

(assert (=> b!379058 (= e!230642 (and e!230646 mapRes!15246))))

(declare-fun condMapEmpty!15246 () Bool)

(declare-fun mapDefault!15246 () ValueCell!4217)

(assert (=> b!379058 (= condMapEmpty!15246 (= (arr!10545 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4217)) mapDefault!15246)))))

(declare-fun b!379059 () Bool)

(declare-fun res!214880 () Bool)

(assert (=> b!379059 (=> (not res!214880) (not e!230645))))

(assert (=> b!379059 (= res!214880 (arrayNoDuplicates!0 lt!176915 #b00000000000000000000000000000000 Nil!5890))))

(declare-fun b!379060 () Bool)

(assert (=> b!379060 (= e!230641 e!230645)))

(declare-fun res!214870 () Bool)

(assert (=> b!379060 (=> (not res!214870) (not e!230645))))

(assert (=> b!379060 (= res!214870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176915 mask!970))))

(assert (=> b!379060 (= lt!176915 (array!22153 (store (arr!10544 _keys!658) i!548 k0!778) (size!10896 _keys!658)))))

(assert (= (and start!37332 res!214875) b!379048))

(assert (= (and b!379048 res!214876) b!379047))

(assert (= (and b!379047 res!214878) b!379056))

(assert (= (and b!379056 res!214873) b!379050))

(assert (= (and b!379050 res!214879) b!379052))

(assert (= (and b!379052 res!214869) b!379057))

(assert (= (and b!379057 res!214877) b!379046))

(assert (= (and b!379046 res!214874) b!379060))

(assert (= (and b!379060 res!214870) b!379059))

(assert (= (and b!379059 res!214880) b!379049))

(assert (= (and b!379049 (not res!214872)) b!379053))

(assert (= (and b!379053 (not res!214871)) b!379055))

(assert (= (and b!379058 condMapEmpty!15246) mapIsEmpty!15246))

(assert (= (and b!379058 (not condMapEmpty!15246)) mapNonEmpty!15246))

(get-info :version)

(assert (= (and mapNonEmpty!15246 ((_ is ValueCellFull!4217) mapValue!15246)) b!379051))

(assert (= (and b!379058 ((_ is ValueCellFull!4217) mapDefault!15246)) b!379054))

(assert (= start!37332 b!379058))

(declare-fun m!376181 () Bool)

(assert (=> start!37332 m!376181))

(declare-fun m!376183 () Bool)

(assert (=> start!37332 m!376183))

(declare-fun m!376185 () Bool)

(assert (=> start!37332 m!376185))

(declare-fun m!376187 () Bool)

(assert (=> b!379049 m!376187))

(declare-fun m!376189 () Bool)

(assert (=> b!379049 m!376189))

(declare-fun m!376191 () Bool)

(assert (=> b!379049 m!376191))

(declare-fun m!376193 () Bool)

(assert (=> b!379049 m!376193))

(declare-fun m!376195 () Bool)

(assert (=> b!379049 m!376195))

(declare-fun m!376197 () Bool)

(assert (=> b!379049 m!376197))

(declare-fun m!376199 () Bool)

(assert (=> b!379049 m!376199))

(declare-fun m!376201 () Bool)

(assert (=> b!379060 m!376201))

(declare-fun m!376203 () Bool)

(assert (=> b!379060 m!376203))

(declare-fun m!376205 () Bool)

(assert (=> b!379046 m!376205))

(declare-fun m!376207 () Bool)

(assert (=> b!379047 m!376207))

(declare-fun m!376209 () Bool)

(assert (=> b!379059 m!376209))

(declare-fun m!376211 () Bool)

(assert (=> b!379056 m!376211))

(declare-fun m!376213 () Bool)

(assert (=> mapNonEmpty!15246 m!376213))

(declare-fun m!376215 () Bool)

(assert (=> b!379052 m!376215))

(declare-fun m!376217 () Bool)

(assert (=> b!379057 m!376217))

(declare-fun m!376219 () Bool)

(assert (=> b!379053 m!376219))

(declare-fun m!376221 () Bool)

(assert (=> b!379053 m!376221))

(declare-fun m!376223 () Bool)

(assert (=> b!379053 m!376223))

(declare-fun m!376225 () Bool)

(assert (=> b!379055 m!376225))

(declare-fun m!376227 () Bool)

(assert (=> b!379055 m!376227))

(check-sat (not b_next!8473) (not b!379055) (not b!379060) (not b!379052) (not mapNonEmpty!15246) (not b!379049) (not b!379056) (not b!379053) (not start!37332) b_and!15729 (not b!379046) tp_is_empty!9121 (not b!379047) (not b!379059))
(check-sat b_and!15729 (not b_next!8473))
