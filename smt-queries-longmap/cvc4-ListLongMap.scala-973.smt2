; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21080 () Bool)

(assert start!21080)

(declare-fun b_free!5591 () Bool)

(declare-fun b_next!5591 () Bool)

(assert (=> start!21080 (= b_free!5591 (not b_next!5591))))

(declare-fun tp!19834 () Bool)

(declare-fun b_and!12421 () Bool)

(assert (=> start!21080 (= tp!19834 b_and!12421)))

(declare-fun b!212056 () Bool)

(declare-fun e!137999 () Bool)

(declare-fun e!138000 () Bool)

(assert (=> b!212056 (= e!137999 (not e!138000))))

(declare-fun res!103628 () Bool)

(assert (=> b!212056 (=> res!103628 e!138000)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212056 (= res!103628 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6917 0))(
  ( (V!6918 (val!2771 Int)) )
))
(declare-datatypes ((tuple2!4192 0))(
  ( (tuple2!4193 (_1!2107 (_ BitVec 64)) (_2!2107 V!6917)) )
))
(declare-datatypes ((List!3083 0))(
  ( (Nil!3080) (Cons!3079 (h!3721 tuple2!4192) (t!8028 List!3083)) )
))
(declare-datatypes ((ListLongMap!3105 0))(
  ( (ListLongMap!3106 (toList!1568 List!3083)) )
))
(declare-fun lt!109202 () ListLongMap!3105)

(declare-datatypes ((ValueCell!2383 0))(
  ( (ValueCellFull!2383 (v!4769 V!6917)) (EmptyCell!2383) )
))
(declare-datatypes ((array!10109 0))(
  ( (array!10110 (arr!4798 (Array (_ BitVec 32) ValueCell!2383)) (size!5123 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10109)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6917)

(declare-datatypes ((array!10111 0))(
  ( (array!10112 (arr!4799 (Array (_ BitVec 32) (_ BitVec 64))) (size!5124 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10111)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6917)

(declare-fun getCurrentListMap!1101 (array!10111 array!10109 (_ BitVec 32) (_ BitVec 32) V!6917 V!6917 (_ BitVec 32) Int) ListLongMap!3105)

(assert (=> b!212056 (= lt!109202 (getCurrentListMap!1101 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109196 () array!10109)

(declare-fun lt!109204 () ListLongMap!3105)

(assert (=> b!212056 (= lt!109204 (getCurrentListMap!1101 _keys!825 lt!109196 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109205 () ListLongMap!3105)

(declare-fun lt!109198 () ListLongMap!3105)

(assert (=> b!212056 (and (= lt!109205 lt!109198) (= lt!109198 lt!109205))))

(declare-fun lt!109201 () ListLongMap!3105)

(declare-fun lt!109200 () tuple2!4192)

(declare-fun +!571 (ListLongMap!3105 tuple2!4192) ListLongMap!3105)

(assert (=> b!212056 (= lt!109198 (+!571 lt!109201 lt!109200))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6917)

(assert (=> b!212056 (= lt!109200 (tuple2!4193 k!843 v!520))))

(declare-datatypes ((Unit!6436 0))(
  ( (Unit!6437) )
))
(declare-fun lt!109199 () Unit!6436)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!218 (array!10111 array!10109 (_ BitVec 32) (_ BitVec 32) V!6917 V!6917 (_ BitVec 32) (_ BitVec 64) V!6917 (_ BitVec 32) Int) Unit!6436)

(assert (=> b!212056 (= lt!109199 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!218 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!503 (array!10111 array!10109 (_ BitVec 32) (_ BitVec 32) V!6917 V!6917 (_ BitVec 32) Int) ListLongMap!3105)

(assert (=> b!212056 (= lt!109205 (getCurrentListMapNoExtraKeys!503 _keys!825 lt!109196 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212056 (= lt!109196 (array!10110 (store (arr!4798 _values!649) i!601 (ValueCellFull!2383 v!520)) (size!5123 _values!649)))))

(assert (=> b!212056 (= lt!109201 (getCurrentListMapNoExtraKeys!503 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212057 () Bool)

(declare-fun e!138002 () Bool)

(declare-fun e!137998 () Bool)

(declare-fun mapRes!9269 () Bool)

(assert (=> b!212057 (= e!138002 (and e!137998 mapRes!9269))))

(declare-fun condMapEmpty!9269 () Bool)

(declare-fun mapDefault!9269 () ValueCell!2383)

