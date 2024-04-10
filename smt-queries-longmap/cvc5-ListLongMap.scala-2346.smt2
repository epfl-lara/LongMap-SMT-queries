; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37538 () Bool)

(assert start!37538)

(declare-fun b_free!8665 () Bool)

(declare-fun b_next!8665 () Bool)

(assert (=> start!37538 (= b_free!8665 (not b_next!8665))))

(declare-fun tp!30711 () Bool)

(declare-fun b_and!15907 () Bool)

(assert (=> start!37538 (= tp!30711 b_and!15907)))

(declare-fun b!383242 () Bool)

(declare-fun res!218159 () Bool)

(declare-fun e!232804 () Bool)

(assert (=> b!383242 (=> (not res!218159) (not e!232804))))

(declare-datatypes ((array!22533 0))(
  ( (array!22534 (arr!10735 (Array (_ BitVec 32) (_ BitVec 64))) (size!11087 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22533)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22533 (_ BitVec 32)) Bool)

(assert (=> b!383242 (= res!218159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383243 () Bool)

(declare-fun e!232802 () Bool)

(declare-fun tp_is_empty!9313 () Bool)

(assert (=> b!383243 (= e!232802 tp_is_empty!9313)))

(declare-fun res!218163 () Bool)

(assert (=> start!37538 (=> (not res!218163) (not e!232804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37538 (= res!218163 (validMask!0 mask!970))))

(assert (=> start!37538 e!232804))

(declare-datatypes ((V!13523 0))(
  ( (V!13524 (val!4701 Int)) )
))
(declare-datatypes ((ValueCell!4313 0))(
  ( (ValueCellFull!4313 (v!6898 V!13523)) (EmptyCell!4313) )
))
(declare-datatypes ((array!22535 0))(
  ( (array!22536 (arr!10736 (Array (_ BitVec 32) ValueCell!4313)) (size!11088 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22535)

(declare-fun e!232803 () Bool)

(declare-fun array_inv!7902 (array!22535) Bool)

(assert (=> start!37538 (and (array_inv!7902 _values!506) e!232803)))

(assert (=> start!37538 tp!30711))

(assert (=> start!37538 true))

(assert (=> start!37538 tp_is_empty!9313))

(declare-fun array_inv!7903 (array!22533) Bool)

(assert (=> start!37538 (array_inv!7903 _keys!658)))

(declare-fun b!383244 () Bool)

(declare-fun res!218164 () Bool)

(assert (=> b!383244 (=> (not res!218164) (not e!232804))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383244 (= res!218164 (and (= (size!11088 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11087 _keys!658) (size!11088 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383245 () Bool)

(declare-fun e!232806 () Bool)

(assert (=> b!383245 (= e!232804 e!232806)))

(declare-fun res!218156 () Bool)

(assert (=> b!383245 (=> (not res!218156) (not e!232806))))

(declare-fun lt!179965 () array!22533)

(assert (=> b!383245 (= res!218156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179965 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383245 (= lt!179965 (array!22534 (store (arr!10735 _keys!658) i!548 k!778) (size!11087 _keys!658)))))

(declare-fun b!383246 () Bool)

(declare-fun e!232807 () Bool)

(assert (=> b!383246 (= e!232807 tp_is_empty!9313)))

(declare-fun b!383247 () Bool)

(declare-fun res!218155 () Bool)

(assert (=> b!383247 (=> (not res!218155) (not e!232804))))

(assert (=> b!383247 (= res!218155 (or (= (select (arr!10735 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10735 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15534 () Bool)

(declare-fun mapRes!15534 () Bool)

(assert (=> mapIsEmpty!15534 mapRes!15534))

(declare-fun b!383248 () Bool)

(declare-fun res!218157 () Bool)

(assert (=> b!383248 (=> (not res!218157) (not e!232804))))

(declare-datatypes ((List!6156 0))(
  ( (Nil!6153) (Cons!6152 (h!7008 (_ BitVec 64)) (t!11306 List!6156)) )
))
(declare-fun arrayNoDuplicates!0 (array!22533 (_ BitVec 32) List!6156) Bool)

(assert (=> b!383248 (= res!218157 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6153))))

(declare-fun b!383249 () Bool)

(declare-fun res!218162 () Bool)

(assert (=> b!383249 (=> (not res!218162) (not e!232806))))

(assert (=> b!383249 (= res!218162 (arrayNoDuplicates!0 lt!179965 #b00000000000000000000000000000000 Nil!6153))))

(declare-fun b!383250 () Bool)

(declare-fun e!232805 () Bool)

(assert (=> b!383250 (= e!232806 (not e!232805))))

(declare-fun res!218160 () Bool)

(assert (=> b!383250 (=> res!218160 e!232805)))

(declare-fun lt!179960 () Bool)

(assert (=> b!383250 (= res!218160 (or (and (not lt!179960) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179960) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179960)))))

(assert (=> b!383250 (= lt!179960 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13523)

(declare-datatypes ((tuple2!6322 0))(
  ( (tuple2!6323 (_1!3172 (_ BitVec 64)) (_2!3172 V!13523)) )
))
(declare-datatypes ((List!6157 0))(
  ( (Nil!6154) (Cons!6153 (h!7009 tuple2!6322) (t!11307 List!6157)) )
))
(declare-datatypes ((ListLongMap!5235 0))(
  ( (ListLongMap!5236 (toList!2633 List!6157)) )
))
(declare-fun lt!179969 () ListLongMap!5235)

(declare-fun minValue!472 () V!13523)

(declare-fun getCurrentListMap!2038 (array!22533 array!22535 (_ BitVec 32) (_ BitVec 32) V!13523 V!13523 (_ BitVec 32) Int) ListLongMap!5235)

(assert (=> b!383250 (= lt!179969 (getCurrentListMap!2038 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179964 () array!22535)

(declare-fun lt!179967 () ListLongMap!5235)

(assert (=> b!383250 (= lt!179967 (getCurrentListMap!2038 lt!179965 lt!179964 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179961 () ListLongMap!5235)

(declare-fun lt!179966 () ListLongMap!5235)

(assert (=> b!383250 (and (= lt!179961 lt!179966) (= lt!179966 lt!179961))))

(declare-fun lt!179970 () ListLongMap!5235)

(declare-fun lt!179963 () tuple2!6322)

(declare-fun +!968 (ListLongMap!5235 tuple2!6322) ListLongMap!5235)

(assert (=> b!383250 (= lt!179966 (+!968 lt!179970 lt!179963))))

(declare-fun v!373 () V!13523)

(assert (=> b!383250 (= lt!179963 (tuple2!6323 k!778 v!373))))

(declare-datatypes ((Unit!11830 0))(
  ( (Unit!11831) )
))
(declare-fun lt!179968 () Unit!11830)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!196 (array!22533 array!22535 (_ BitVec 32) (_ BitVec 32) V!13523 V!13523 (_ BitVec 32) (_ BitVec 64) V!13523 (_ BitVec 32) Int) Unit!11830)

(assert (=> b!383250 (= lt!179968 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!196 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!872 (array!22533 array!22535 (_ BitVec 32) (_ BitVec 32) V!13523 V!13523 (_ BitVec 32) Int) ListLongMap!5235)

(assert (=> b!383250 (= lt!179961 (getCurrentListMapNoExtraKeys!872 lt!179965 lt!179964 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383250 (= lt!179964 (array!22536 (store (arr!10736 _values!506) i!548 (ValueCellFull!4313 v!373)) (size!11088 _values!506)))))

(assert (=> b!383250 (= lt!179970 (getCurrentListMapNoExtraKeys!872 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15534 () Bool)

(declare-fun tp!30710 () Bool)

(assert (=> mapNonEmpty!15534 (= mapRes!15534 (and tp!30710 e!232802))))

(declare-fun mapRest!15534 () (Array (_ BitVec 32) ValueCell!4313))

(declare-fun mapValue!15534 () ValueCell!4313)

(declare-fun mapKey!15534 () (_ BitVec 32))

(assert (=> mapNonEmpty!15534 (= (arr!10736 _values!506) (store mapRest!15534 mapKey!15534 mapValue!15534))))

(declare-fun b!383251 () Bool)

(declare-fun res!218161 () Bool)

(assert (=> b!383251 (=> (not res!218161) (not e!232804))))

(declare-fun arrayContainsKey!0 (array!22533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383251 (= res!218161 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!383252 () Bool)

(declare-fun res!218158 () Bool)

(assert (=> b!383252 (=> (not res!218158) (not e!232804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383252 (= res!218158 (validKeyInArray!0 k!778))))

(declare-fun b!383253 () Bool)

(declare-fun res!218165 () Bool)

(assert (=> b!383253 (=> (not res!218165) (not e!232804))))

(assert (=> b!383253 (= res!218165 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11087 _keys!658))))))

(declare-fun b!383254 () Bool)

(assert (=> b!383254 (= e!232805 true)))

(declare-fun lt!179962 () ListLongMap!5235)

(assert (=> b!383254 (= lt!179962 (+!968 lt!179969 lt!179963))))

(assert (=> b!383254 (= lt!179967 lt!179961)))

(declare-fun b!383255 () Bool)

(assert (=> b!383255 (= e!232803 (and e!232807 mapRes!15534))))

(declare-fun condMapEmpty!15534 () Bool)

(declare-fun mapDefault!15534 () ValueCell!4313)

