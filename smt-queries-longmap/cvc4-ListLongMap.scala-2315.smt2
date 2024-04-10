; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37356 () Bool)

(assert start!37356)

(declare-fun b_free!8483 () Bool)

(declare-fun b_next!8483 () Bool)

(assert (=> start!37356 (= b_free!8483 (not b_next!8483))))

(declare-fun tp!30164 () Bool)

(declare-fun b_and!15725 () Bool)

(assert (=> start!37356 (= tp!30164 b_and!15725)))

(declare-fun b!379320 () Bool)

(declare-fun res!215058 () Bool)

(declare-fun e!230794 () Bool)

(assert (=> b!379320 (=> (not res!215058) (not e!230794))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22185 0))(
  ( (array!22186 (arr!10561 (Array (_ BitVec 32) (_ BitVec 64))) (size!10913 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22185)

(assert (=> b!379320 (= res!215058 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10913 _keys!658))))))

(declare-fun b!379321 () Bool)

(declare-fun res!215063 () Bool)

(assert (=> b!379321 (=> (not res!215063) (not e!230794))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379321 (= res!215063 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15261 () Bool)

(declare-fun mapRes!15261 () Bool)

(assert (=> mapIsEmpty!15261 mapRes!15261))

(declare-fun b!379322 () Bool)

(declare-fun e!230796 () Bool)

(assert (=> b!379322 (= e!230796 true)))

(declare-datatypes ((V!13279 0))(
  ( (V!13280 (val!4610 Int)) )
))
(declare-datatypes ((tuple2!6168 0))(
  ( (tuple2!6169 (_1!3095 (_ BitVec 64)) (_2!3095 V!13279)) )
))
(declare-datatypes ((List!6004 0))(
  ( (Nil!6001) (Cons!6000 (h!6856 tuple2!6168) (t!11154 List!6004)) )
))
(declare-datatypes ((ListLongMap!5081 0))(
  ( (ListLongMap!5082 (toList!2556 List!6004)) )
))
(declare-fun lt!177086 () ListLongMap!5081)

(declare-fun lt!177092 () ListLongMap!5081)

(declare-fun lt!177084 () tuple2!6168)

(declare-fun +!902 (ListLongMap!5081 tuple2!6168) ListLongMap!5081)

(assert (=> b!379322 (= lt!177086 (+!902 lt!177092 lt!177084))))

(declare-datatypes ((Unit!11702 0))(
  ( (Unit!11703) )
))
(declare-fun lt!177093 () Unit!11702)

(declare-fun v!373 () V!13279)

(declare-fun lt!177082 () ListLongMap!5081)

(declare-fun minValue!472 () V!13279)

(declare-fun addCommutativeForDiffKeys!301 (ListLongMap!5081 (_ BitVec 64) V!13279 (_ BitVec 64) V!13279) Unit!11702)

(assert (=> b!379322 (= lt!177093 (addCommutativeForDiffKeys!301 lt!177082 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379323 () Bool)

(declare-fun res!215062 () Bool)

(assert (=> b!379323 (=> (not res!215062) (not e!230794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379323 (= res!215062 (validKeyInArray!0 k!778))))

(declare-fun b!379324 () Bool)

(declare-fun e!230791 () Bool)

(assert (=> b!379324 (= e!230794 e!230791)))

(declare-fun res!215055 () Bool)

(assert (=> b!379324 (=> (not res!215055) (not e!230791))))

(declare-fun lt!177087 () array!22185)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22185 (_ BitVec 32)) Bool)

(assert (=> b!379324 (= res!215055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177087 mask!970))))

(assert (=> b!379324 (= lt!177087 (array!22186 (store (arr!10561 _keys!658) i!548 k!778) (size!10913 _keys!658)))))

(declare-fun mapNonEmpty!15261 () Bool)

(declare-fun tp!30165 () Bool)

(declare-fun e!230793 () Bool)

(assert (=> mapNonEmpty!15261 (= mapRes!15261 (and tp!30165 e!230793))))

(declare-fun mapKey!15261 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4222 0))(
  ( (ValueCellFull!4222 (v!6807 V!13279)) (EmptyCell!4222) )
))
(declare-datatypes ((array!22187 0))(
  ( (array!22188 (arr!10562 (Array (_ BitVec 32) ValueCell!4222)) (size!10914 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22187)

(declare-fun mapRest!15261 () (Array (_ BitVec 32) ValueCell!4222))

(declare-fun mapValue!15261 () ValueCell!4222)

(assert (=> mapNonEmpty!15261 (= (arr!10562 _values!506) (store mapRest!15261 mapKey!15261 mapValue!15261))))

(declare-fun b!379325 () Bool)

(declare-fun e!230798 () Bool)

(assert (=> b!379325 (= e!230798 e!230796)))

(declare-fun res!215054 () Bool)

(assert (=> b!379325 (=> res!215054 e!230796)))

(assert (=> b!379325 (= res!215054 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!177090 () ListLongMap!5081)

(assert (=> b!379325 (= lt!177090 lt!177092)))

(declare-fun lt!177089 () tuple2!6168)

(assert (=> b!379325 (= lt!177092 (+!902 lt!177082 lt!177089))))

(declare-fun lt!177083 () ListLongMap!5081)

(assert (=> b!379325 (= lt!177083 lt!177086)))

(declare-fun lt!177081 () ListLongMap!5081)

(assert (=> b!379325 (= lt!177086 (+!902 lt!177081 lt!177089))))

(declare-fun lt!177088 () ListLongMap!5081)

(assert (=> b!379325 (= lt!177083 (+!902 lt!177088 lt!177089))))

(assert (=> b!379325 (= lt!177089 (tuple2!6169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379326 () Bool)

(declare-fun res!215061 () Bool)

(assert (=> b!379326 (=> (not res!215061) (not e!230791))))

(declare-datatypes ((List!6005 0))(
  ( (Nil!6002) (Cons!6001 (h!6857 (_ BitVec 64)) (t!11155 List!6005)) )
))
(declare-fun arrayNoDuplicates!0 (array!22185 (_ BitVec 32) List!6005) Bool)

(assert (=> b!379326 (= res!215061 (arrayNoDuplicates!0 lt!177087 #b00000000000000000000000000000000 Nil!6002))))

(declare-fun res!215056 () Bool)

(assert (=> start!37356 (=> (not res!215056) (not e!230794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37356 (= res!215056 (validMask!0 mask!970))))

(assert (=> start!37356 e!230794))

(declare-fun e!230795 () Bool)

(declare-fun array_inv!7778 (array!22187) Bool)

(assert (=> start!37356 (and (array_inv!7778 _values!506) e!230795)))

(assert (=> start!37356 tp!30164))

(assert (=> start!37356 true))

(declare-fun tp_is_empty!9131 () Bool)

(assert (=> start!37356 tp_is_empty!9131))

(declare-fun array_inv!7779 (array!22185) Bool)

(assert (=> start!37356 (array_inv!7779 _keys!658)))

(declare-fun b!379327 () Bool)

(assert (=> b!379327 (= e!230791 (not e!230798))))

(declare-fun res!215052 () Bool)

(assert (=> b!379327 (=> res!215052 e!230798)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379327 (= res!215052 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13279)

(declare-fun getCurrentListMap!1978 (array!22185 array!22187 (_ BitVec 32) (_ BitVec 32) V!13279 V!13279 (_ BitVec 32) Int) ListLongMap!5081)

(assert (=> b!379327 (= lt!177090 (getCurrentListMap!1978 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177085 () array!22187)

(assert (=> b!379327 (= lt!177083 (getCurrentListMap!1978 lt!177087 lt!177085 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379327 (and (= lt!177088 lt!177081) (= lt!177081 lt!177088))))

(assert (=> b!379327 (= lt!177081 (+!902 lt!177082 lt!177084))))

(assert (=> b!379327 (= lt!177084 (tuple2!6169 k!778 v!373))))

(declare-fun lt!177091 () Unit!11702)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!136 (array!22185 array!22187 (_ BitVec 32) (_ BitVec 32) V!13279 V!13279 (_ BitVec 32) (_ BitVec 64) V!13279 (_ BitVec 32) Int) Unit!11702)

(assert (=> b!379327 (= lt!177091 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!136 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!812 (array!22185 array!22187 (_ BitVec 32) (_ BitVec 32) V!13279 V!13279 (_ BitVec 32) Int) ListLongMap!5081)

(assert (=> b!379327 (= lt!177088 (getCurrentListMapNoExtraKeys!812 lt!177087 lt!177085 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379327 (= lt!177085 (array!22188 (store (arr!10562 _values!506) i!548 (ValueCellFull!4222 v!373)) (size!10914 _values!506)))))

(assert (=> b!379327 (= lt!177082 (getCurrentListMapNoExtraKeys!812 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379328 () Bool)

(declare-fun e!230797 () Bool)

(assert (=> b!379328 (= e!230795 (and e!230797 mapRes!15261))))

(declare-fun condMapEmpty!15261 () Bool)

(declare-fun mapDefault!15261 () ValueCell!4222)

