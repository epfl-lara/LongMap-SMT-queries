; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37296 () Bool)

(assert start!37296)

(declare-fun b_free!8423 () Bool)

(declare-fun b_next!8423 () Bool)

(assert (=> start!37296 (= b_free!8423 (not b_next!8423))))

(declare-fun tp!29985 () Bool)

(declare-fun b_and!15665 () Bool)

(assert (=> start!37296 (= tp!29985 b_and!15665)))

(declare-fun b!377961 () Bool)

(declare-fun res!213971 () Bool)

(declare-fun e!230077 () Bool)

(assert (=> b!377961 (=> (not res!213971) (not e!230077))))

(declare-datatypes ((array!22069 0))(
  ( (array!22070 (arr!10503 (Array (_ BitVec 32) (_ BitVec 64))) (size!10855 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22069)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377961 (= res!213971 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!377962 () Bool)

(declare-fun res!213964 () Bool)

(assert (=> b!377962 (=> (not res!213964) (not e!230077))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377962 (= res!213964 (or (= (select (arr!10503 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10503 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377963 () Bool)

(declare-fun res!213967 () Bool)

(assert (=> b!377963 (=> (not res!213967) (not e!230077))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22069 (_ BitVec 32)) Bool)

(assert (=> b!377963 (= res!213967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377964 () Bool)

(declare-fun e!230072 () Bool)

(declare-fun e!230076 () Bool)

(assert (=> b!377964 (= e!230072 (not e!230076))))

(declare-fun res!213965 () Bool)

(assert (=> b!377964 (=> res!213965 e!230076)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377964 (= res!213965 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13199 0))(
  ( (V!13200 (val!4580 Int)) )
))
(declare-datatypes ((ValueCell!4192 0))(
  ( (ValueCellFull!4192 (v!6777 V!13199)) (EmptyCell!4192) )
))
(declare-datatypes ((array!22071 0))(
  ( (array!22072 (arr!10504 (Array (_ BitVec 32) ValueCell!4192)) (size!10856 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22071)

(declare-datatypes ((tuple2!6112 0))(
  ( (tuple2!6113 (_1!3067 (_ BitVec 64)) (_2!3067 V!13199)) )
))
(declare-datatypes ((List!5950 0))(
  ( (Nil!5947) (Cons!5946 (h!6802 tuple2!6112) (t!11100 List!5950)) )
))
(declare-datatypes ((ListLongMap!5025 0))(
  ( (ListLongMap!5026 (toList!2528 List!5950)) )
))
(declare-fun lt!175955 () ListLongMap!5025)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13199)

(declare-fun minValue!472 () V!13199)

(declare-fun getCurrentListMap!1955 (array!22069 array!22071 (_ BitVec 32) (_ BitVec 32) V!13199 V!13199 (_ BitVec 32) Int) ListLongMap!5025)

(assert (=> b!377964 (= lt!175955 (getCurrentListMap!1955 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175948 () array!22071)

(declare-fun lt!175949 () array!22069)

(declare-fun lt!175957 () ListLongMap!5025)

(assert (=> b!377964 (= lt!175957 (getCurrentListMap!1955 lt!175949 lt!175948 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175947 () ListLongMap!5025)

(declare-fun lt!175953 () ListLongMap!5025)

(assert (=> b!377964 (and (= lt!175947 lt!175953) (= lt!175953 lt!175947))))

(declare-fun lt!175958 () ListLongMap!5025)

(declare-fun lt!175959 () tuple2!6112)

(declare-fun +!874 (ListLongMap!5025 tuple2!6112) ListLongMap!5025)

(assert (=> b!377964 (= lt!175953 (+!874 lt!175958 lt!175959))))

(declare-fun v!373 () V!13199)

(assert (=> b!377964 (= lt!175959 (tuple2!6113 k!778 v!373))))

(declare-datatypes ((Unit!11648 0))(
  ( (Unit!11649) )
))
(declare-fun lt!175951 () Unit!11648)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!113 (array!22069 array!22071 (_ BitVec 32) (_ BitVec 32) V!13199 V!13199 (_ BitVec 32) (_ BitVec 64) V!13199 (_ BitVec 32) Int) Unit!11648)

(assert (=> b!377964 (= lt!175951 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!113 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!789 (array!22069 array!22071 (_ BitVec 32) (_ BitVec 32) V!13199 V!13199 (_ BitVec 32) Int) ListLongMap!5025)

(assert (=> b!377964 (= lt!175947 (getCurrentListMapNoExtraKeys!789 lt!175949 lt!175948 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377964 (= lt!175948 (array!22072 (store (arr!10504 _values!506) i!548 (ValueCellFull!4192 v!373)) (size!10856 _values!506)))))

(assert (=> b!377964 (= lt!175958 (getCurrentListMapNoExtraKeys!789 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15171 () Bool)

(declare-fun mapRes!15171 () Bool)

(declare-fun tp!29984 () Bool)

(declare-fun e!230078 () Bool)

(assert (=> mapNonEmpty!15171 (= mapRes!15171 (and tp!29984 e!230078))))

(declare-fun mapKey!15171 () (_ BitVec 32))

(declare-fun mapRest!15171 () (Array (_ BitVec 32) ValueCell!4192))

(declare-fun mapValue!15171 () ValueCell!4192)

(assert (=> mapNonEmpty!15171 (= (arr!10504 _values!506) (store mapRest!15171 mapKey!15171 mapValue!15171))))

(declare-fun b!377965 () Bool)

(declare-fun tp_is_empty!9071 () Bool)

(assert (=> b!377965 (= e!230078 tp_is_empty!9071)))

(declare-fun b!377966 () Bool)

(declare-fun res!213963 () Bool)

(assert (=> b!377966 (=> (not res!213963) (not e!230072))))

(declare-datatypes ((List!5951 0))(
  ( (Nil!5948) (Cons!5947 (h!6803 (_ BitVec 64)) (t!11101 List!5951)) )
))
(declare-fun arrayNoDuplicates!0 (array!22069 (_ BitVec 32) List!5951) Bool)

(assert (=> b!377966 (= res!213963 (arrayNoDuplicates!0 lt!175949 #b00000000000000000000000000000000 Nil!5948))))

(declare-fun b!377967 () Bool)

(assert (=> b!377967 (= e!230077 e!230072)))

(declare-fun res!213968 () Bool)

(assert (=> b!377967 (=> (not res!213968) (not e!230072))))

(assert (=> b!377967 (= res!213968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175949 mask!970))))

(assert (=> b!377967 (= lt!175949 (array!22070 (store (arr!10503 _keys!658) i!548 k!778) (size!10855 _keys!658)))))

(declare-fun b!377968 () Bool)

(declare-fun res!213969 () Bool)

(assert (=> b!377968 (=> (not res!213969) (not e!230077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377968 (= res!213969 (validKeyInArray!0 k!778))))

(declare-fun mapIsEmpty!15171 () Bool)

(assert (=> mapIsEmpty!15171 mapRes!15171))

(declare-fun b!377969 () Bool)

(declare-fun res!213973 () Bool)

(assert (=> b!377969 (=> (not res!213973) (not e!230077))))

(assert (=> b!377969 (= res!213973 (and (= (size!10856 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10855 _keys!658) (size!10856 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377970 () Bool)

(declare-fun e!230073 () Bool)

(assert (=> b!377970 (= e!230073 true)))

(declare-fun lt!175954 () ListLongMap!5025)

(declare-fun lt!175952 () ListLongMap!5025)

(assert (=> b!377970 (= lt!175954 (+!874 lt!175952 lt!175959))))

(declare-fun lt!175950 () Unit!11648)

(declare-fun addCommutativeForDiffKeys!281 (ListLongMap!5025 (_ BitVec 64) V!13199 (_ BitVec 64) V!13199) Unit!11648)

(assert (=> b!377970 (= lt!175950 (addCommutativeForDiffKeys!281 lt!175958 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377971 () Bool)

(declare-fun res!213966 () Bool)

(assert (=> b!377971 (=> (not res!213966) (not e!230077))))

(assert (=> b!377971 (= res!213966 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5948))))

(declare-fun res!213974 () Bool)

(assert (=> start!37296 (=> (not res!213974) (not e!230077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37296 (= res!213974 (validMask!0 mask!970))))

(assert (=> start!37296 e!230077))

(declare-fun e!230075 () Bool)

(declare-fun array_inv!7736 (array!22071) Bool)

(assert (=> start!37296 (and (array_inv!7736 _values!506) e!230075)))

(assert (=> start!37296 tp!29985))

(assert (=> start!37296 true))

(assert (=> start!37296 tp_is_empty!9071))

(declare-fun array_inv!7737 (array!22069) Bool)

(assert (=> start!37296 (array_inv!7737 _keys!658)))

(declare-fun b!377972 () Bool)

(declare-fun e!230071 () Bool)

(assert (=> b!377972 (= e!230071 tp_is_empty!9071)))

(declare-fun b!377973 () Bool)

(assert (=> b!377973 (= e!230075 (and e!230071 mapRes!15171))))

(declare-fun condMapEmpty!15171 () Bool)

(declare-fun mapDefault!15171 () ValueCell!4192)

