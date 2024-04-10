; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37572 () Bool)

(assert start!37572)

(declare-fun b_free!8699 () Bool)

(declare-fun b_next!8699 () Bool)

(assert (=> start!37572 (= b_free!8699 (not b_next!8699))))

(declare-fun tp!30812 () Bool)

(declare-fun b_and!15941 () Bool)

(assert (=> start!37572 (= tp!30812 b_and!15941)))

(declare-fun b!383956 () Bool)

(declare-fun res!218717 () Bool)

(declare-fun e!233164 () Bool)

(assert (=> b!383956 (=> (not res!218717) (not e!233164))))

(declare-datatypes ((array!22599 0))(
  ( (array!22600 (arr!10768 (Array (_ BitVec 32) (_ BitVec 64))) (size!11120 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22599)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22599 (_ BitVec 32)) Bool)

(assert (=> b!383956 (= res!218717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!218726 () Bool)

(assert (=> start!37572 (=> (not res!218726) (not e!233164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37572 (= res!218726 (validMask!0 mask!970))))

(assert (=> start!37572 e!233164))

(declare-datatypes ((V!13567 0))(
  ( (V!13568 (val!4718 Int)) )
))
(declare-datatypes ((ValueCell!4330 0))(
  ( (ValueCellFull!4330 (v!6915 V!13567)) (EmptyCell!4330) )
))
(declare-datatypes ((array!22601 0))(
  ( (array!22602 (arr!10769 (Array (_ BitVec 32) ValueCell!4330)) (size!11121 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22601)

(declare-fun e!233165 () Bool)

(declare-fun array_inv!7924 (array!22601) Bool)

(assert (=> start!37572 (and (array_inv!7924 _values!506) e!233165)))

(assert (=> start!37572 tp!30812))

(assert (=> start!37572 true))

(declare-fun tp_is_empty!9347 () Bool)

(assert (=> start!37572 tp_is_empty!9347))

(declare-fun array_inv!7925 (array!22599) Bool)

(assert (=> start!37572 (array_inv!7925 _keys!658)))

(declare-fun b!383957 () Bool)

(declare-fun res!218723 () Bool)

(assert (=> b!383957 (=> (not res!218723) (not e!233164))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383957 (= res!218723 (validKeyInArray!0 k!778))))

(declare-fun b!383958 () Bool)

(declare-fun e!233162 () Bool)

(assert (=> b!383958 (= e!233162 tp_is_empty!9347)))

(declare-fun b!383959 () Bool)

(declare-fun e!233159 () Bool)

(assert (=> b!383959 (= e!233159 true)))

(declare-datatypes ((tuple2!6348 0))(
  ( (tuple2!6349 (_1!3185 (_ BitVec 64)) (_2!3185 V!13567)) )
))
(declare-datatypes ((List!6184 0))(
  ( (Nil!6181) (Cons!6180 (h!7036 tuple2!6348) (t!11334 List!6184)) )
))
(declare-datatypes ((ListLongMap!5261 0))(
  ( (ListLongMap!5262 (toList!2646 List!6184)) )
))
(declare-fun lt!180528 () ListLongMap!5261)

(declare-fun lt!180522 () ListLongMap!5261)

(declare-fun lt!180525 () tuple2!6348)

(declare-fun +!981 (ListLongMap!5261 tuple2!6348) ListLongMap!5261)

(assert (=> b!383959 (= lt!180528 (+!981 lt!180522 lt!180525))))

(declare-fun lt!180529 () ListLongMap!5261)

(declare-fun lt!180521 () ListLongMap!5261)

(assert (=> b!383959 (= lt!180529 lt!180521)))

(declare-fun mapIsEmpty!15585 () Bool)

(declare-fun mapRes!15585 () Bool)

(assert (=> mapIsEmpty!15585 mapRes!15585))

(declare-fun b!383960 () Bool)

(declare-fun e!233163 () Bool)

(assert (=> b!383960 (= e!233164 e!233163)))

(declare-fun res!218724 () Bool)

(assert (=> b!383960 (=> (not res!218724) (not e!233163))))

(declare-fun lt!180526 () array!22599)

(assert (=> b!383960 (= res!218724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180526 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383960 (= lt!180526 (array!22600 (store (arr!10768 _keys!658) i!548 k!778) (size!11120 _keys!658)))))

(declare-fun mapNonEmpty!15585 () Bool)

(declare-fun tp!30813 () Bool)

(assert (=> mapNonEmpty!15585 (= mapRes!15585 (and tp!30813 e!233162))))

(declare-fun mapKey!15585 () (_ BitVec 32))

(declare-fun mapValue!15585 () ValueCell!4330)

(declare-fun mapRest!15585 () (Array (_ BitVec 32) ValueCell!4330))

(assert (=> mapNonEmpty!15585 (= (arr!10769 _values!506) (store mapRest!15585 mapKey!15585 mapValue!15585))))

(declare-fun b!383961 () Bool)

(declare-fun e!233161 () Bool)

(assert (=> b!383961 (= e!233161 tp_is_empty!9347)))

(declare-fun b!383962 () Bool)

(assert (=> b!383962 (= e!233163 (not e!233159))))

(declare-fun res!218720 () Bool)

(assert (=> b!383962 (=> res!218720 e!233159)))

(declare-fun lt!180527 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383962 (= res!218720 (or (and (not lt!180527) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180527) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180527)))))

(assert (=> b!383962 (= lt!180527 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13567)

(declare-fun minValue!472 () V!13567)

(declare-fun getCurrentListMap!2049 (array!22599 array!22601 (_ BitVec 32) (_ BitVec 32) V!13567 V!13567 (_ BitVec 32) Int) ListLongMap!5261)

(assert (=> b!383962 (= lt!180522 (getCurrentListMap!2049 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180524 () array!22601)

(assert (=> b!383962 (= lt!180529 (getCurrentListMap!2049 lt!180526 lt!180524 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180530 () ListLongMap!5261)

(assert (=> b!383962 (and (= lt!180521 lt!180530) (= lt!180530 lt!180521))))

(declare-fun lt!180523 () ListLongMap!5261)

(assert (=> b!383962 (= lt!180530 (+!981 lt!180523 lt!180525))))

(declare-fun v!373 () V!13567)

(assert (=> b!383962 (= lt!180525 (tuple2!6349 k!778 v!373))))

(declare-datatypes ((Unit!11852 0))(
  ( (Unit!11853) )
))
(declare-fun lt!180531 () Unit!11852)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!207 (array!22599 array!22601 (_ BitVec 32) (_ BitVec 32) V!13567 V!13567 (_ BitVec 32) (_ BitVec 64) V!13567 (_ BitVec 32) Int) Unit!11852)

(assert (=> b!383962 (= lt!180531 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!207 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!883 (array!22599 array!22601 (_ BitVec 32) (_ BitVec 32) V!13567 V!13567 (_ BitVec 32) Int) ListLongMap!5261)

(assert (=> b!383962 (= lt!180521 (getCurrentListMapNoExtraKeys!883 lt!180526 lt!180524 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383962 (= lt!180524 (array!22602 (store (arr!10769 _values!506) i!548 (ValueCellFull!4330 v!373)) (size!11121 _values!506)))))

(assert (=> b!383962 (= lt!180523 (getCurrentListMapNoExtraKeys!883 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383963 () Bool)

(declare-fun res!218721 () Bool)

(assert (=> b!383963 (=> (not res!218721) (not e!233164))))

(declare-datatypes ((List!6185 0))(
  ( (Nil!6182) (Cons!6181 (h!7037 (_ BitVec 64)) (t!11335 List!6185)) )
))
(declare-fun arrayNoDuplicates!0 (array!22599 (_ BitVec 32) List!6185) Bool)

(assert (=> b!383963 (= res!218721 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6182))))

(declare-fun b!383964 () Bool)

(declare-fun res!218718 () Bool)

(assert (=> b!383964 (=> (not res!218718) (not e!233164))))

(assert (=> b!383964 (= res!218718 (or (= (select (arr!10768 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10768 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383965 () Bool)

(declare-fun res!218722 () Bool)

(assert (=> b!383965 (=> (not res!218722) (not e!233164))))

(declare-fun arrayContainsKey!0 (array!22599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383965 (= res!218722 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!383966 () Bool)

(declare-fun res!218725 () Bool)

(assert (=> b!383966 (=> (not res!218725) (not e!233163))))

(assert (=> b!383966 (= res!218725 (arrayNoDuplicates!0 lt!180526 #b00000000000000000000000000000000 Nil!6182))))

(declare-fun b!383967 () Bool)

(assert (=> b!383967 (= e!233165 (and e!233161 mapRes!15585))))

(declare-fun condMapEmpty!15585 () Bool)

(declare-fun mapDefault!15585 () ValueCell!4330)

