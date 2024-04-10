; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72988 () Bool)

(assert start!72988)

(declare-fun b_free!13903 () Bool)

(declare-fun b_next!13903 () Bool)

(assert (=> start!72988 (= b_free!13903 (not b_next!13903))))

(declare-fun tp!49213 () Bool)

(declare-fun b_and!22989 () Bool)

(assert (=> start!72988 (= tp!49213 b_and!22989)))

(declare-fun b!847924 () Bool)

(declare-fun res!576100 () Bool)

(declare-fun e!473125 () Bool)

(assert (=> b!847924 (=> (not res!576100) (not e!473125))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48288 0))(
  ( (array!48289 (arr!23175 (Array (_ BitVec 32) (_ BitVec 64))) (size!23615 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48288)

(assert (=> b!847924 (= res!576100 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23615 _keys!868))))))

(declare-fun b!847925 () Bool)

(declare-fun e!473123 () Bool)

(assert (=> b!847925 (= e!473125 e!473123)))

(declare-fun res!576094 () Bool)

(assert (=> b!847925 (=> (not res!576094) (not e!473123))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!847925 (= res!576094 (= from!1053 i!612))))

(declare-datatypes ((V!26433 0))(
  ( (V!26434 (val!8067 Int)) )
))
(declare-datatypes ((tuple2!10544 0))(
  ( (tuple2!10545 (_1!5283 (_ BitVec 64)) (_2!5283 V!26433)) )
))
(declare-datatypes ((List!16402 0))(
  ( (Nil!16399) (Cons!16398 (h!17529 tuple2!10544) (t!22773 List!16402)) )
))
(declare-datatypes ((ListLongMap!9313 0))(
  ( (ListLongMap!9314 (toList!4672 List!16402)) )
))
(declare-fun lt!381876 () ListLongMap!9313)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7580 0))(
  ( (ValueCellFull!7580 (v!10492 V!26433)) (EmptyCell!7580) )
))
(declare-datatypes ((array!48290 0))(
  ( (array!48291 (arr!23176 (Array (_ BitVec 32) ValueCell!7580)) (size!23616 (_ BitVec 32))) )
))
(declare-fun lt!381877 () array!48290)

(declare-fun minValue!654 () V!26433)

(declare-fun zeroValue!654 () V!26433)

(declare-fun getCurrentListMapNoExtraKeys!2656 (array!48288 array!48290 (_ BitVec 32) (_ BitVec 32) V!26433 V!26433 (_ BitVec 32) Int) ListLongMap!9313)

(assert (=> b!847925 (= lt!381876 (getCurrentListMapNoExtraKeys!2656 _keys!868 lt!381877 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26433)

(declare-fun _values!688 () array!48290)

(assert (=> b!847925 (= lt!381877 (array!48291 (store (arr!23176 _values!688) i!612 (ValueCellFull!7580 v!557)) (size!23616 _values!688)))))

(declare-fun lt!381875 () ListLongMap!9313)

(assert (=> b!847925 (= lt!381875 (getCurrentListMapNoExtraKeys!2656 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847926 () Bool)

(assert (=> b!847926 (= e!473123 (not true))))

(declare-fun e!473124 () Bool)

(assert (=> b!847926 e!473124))

(declare-fun c!91525 () Bool)

(assert (=> b!847926 (= c!91525 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((Unit!28959 0))(
  ( (Unit!28960) )
))
(declare-fun lt!381874 () Unit!28959)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!325 (array!48288 array!48290 (_ BitVec 32) (_ BitVec 32) V!26433 V!26433 (_ BitVec 32) (_ BitVec 64) V!26433 (_ BitVec 32) Int) Unit!28959)

(assert (=> b!847926 (= lt!381874 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!325 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847927 () Bool)

(declare-fun res!576101 () Bool)

(assert (=> b!847927 (=> (not res!576101) (not e!473125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847927 (= res!576101 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25658 () Bool)

(declare-fun mapRes!25658 () Bool)

(assert (=> mapIsEmpty!25658 mapRes!25658))

(declare-fun b!847928 () Bool)

(declare-fun res!576099 () Bool)

(assert (=> b!847928 (=> (not res!576099) (not e!473125))))

(assert (=> b!847928 (= res!576099 (and (= (size!23616 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23615 _keys!868) (size!23616 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847929 () Bool)

(declare-fun res!576093 () Bool)

(assert (=> b!847929 (=> (not res!576093) (not e!473125))))

(declare-datatypes ((List!16403 0))(
  ( (Nil!16400) (Cons!16399 (h!17530 (_ BitVec 64)) (t!22774 List!16403)) )
))
(declare-fun arrayNoDuplicates!0 (array!48288 (_ BitVec 32) List!16403) Bool)

(assert (=> b!847929 (= res!576093 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16400))))

(declare-fun b!847930 () Bool)

(declare-fun e!473127 () Bool)

(declare-fun tp_is_empty!16039 () Bool)

(assert (=> b!847930 (= e!473127 tp_is_empty!16039)))

(declare-fun b!847931 () Bool)

(declare-fun e!473126 () Bool)

(assert (=> b!847931 (= e!473126 (and e!473127 mapRes!25658))))

(declare-fun condMapEmpty!25658 () Bool)

(declare-fun mapDefault!25658 () ValueCell!7580)

