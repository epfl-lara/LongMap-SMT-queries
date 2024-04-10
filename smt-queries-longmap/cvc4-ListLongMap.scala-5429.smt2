; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72362 () Bool)

(assert start!72362)

(declare-fun b_free!13547 () Bool)

(declare-fun b_next!13547 () Bool)

(assert (=> start!72362 (= b_free!13547 (not b_next!13547))))

(declare-fun tp!47740 () Bool)

(declare-fun b_and!22633 () Bool)

(assert (=> start!72362 (= tp!47740 b_and!22633)))

(declare-fun b!838478 () Bool)

(declare-fun res!570156 () Bool)

(declare-fun e!468036 () Bool)

(assert (=> b!838478 (=> (not res!570156) (not e!468036))))

(declare-datatypes ((array!47114 0))(
  ( (array!47115 (arr!22588 (Array (_ BitVec 32) (_ BitVec 64))) (size!23028 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47114)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47114 (_ BitVec 32)) Bool)

(assert (=> b!838478 (= res!570156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838479 () Bool)

(declare-fun e!468039 () Bool)

(declare-fun tp_is_empty!15413 () Bool)

(assert (=> b!838479 (= e!468039 tp_is_empty!15413)))

(declare-fun b!838480 () Bool)

(declare-fun e!468040 () Bool)

(declare-datatypes ((V!25597 0))(
  ( (V!25598 (val!7754 Int)) )
))
(declare-datatypes ((tuple2!10256 0))(
  ( (tuple2!10257 (_1!5139 (_ BitVec 64)) (_2!5139 V!25597)) )
))
(declare-datatypes ((List!16060 0))(
  ( (Nil!16057) (Cons!16056 (h!17187 tuple2!10256) (t!22431 List!16060)) )
))
(declare-datatypes ((ListLongMap!9025 0))(
  ( (ListLongMap!9026 (toList!4528 List!16060)) )
))
(declare-fun call!36875 () ListLongMap!9025)

(declare-fun call!36874 () ListLongMap!9025)

(assert (=> b!838480 (= e!468040 (= call!36875 call!36874))))

(declare-fun b!838481 () Bool)

(declare-fun res!570161 () Bool)

(assert (=> b!838481 (=> (not res!570161) (not e!468036))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7267 0))(
  ( (ValueCellFull!7267 (v!10179 V!25597)) (EmptyCell!7267) )
))
(declare-datatypes ((array!47116 0))(
  ( (array!47117 (arr!22589 (Array (_ BitVec 32) ValueCell!7267)) (size!23029 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47116)

(assert (=> b!838481 (= res!570161 (and (= (size!23029 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23028 _keys!868) (size!23029 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!36871 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25597)

(declare-fun zeroValue!654 () V!25597)

(declare-fun getCurrentListMapNoExtraKeys!2520 (array!47114 array!47116 (_ BitVec 32) (_ BitVec 32) V!25597 V!25597 (_ BitVec 32) Int) ListLongMap!9025)

(assert (=> bm!36871 (= call!36874 (getCurrentListMapNoExtraKeys!2520 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!25597)

(declare-fun b!838482 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2002 (ListLongMap!9025 tuple2!10256) ListLongMap!9025)

(assert (=> b!838482 (= e!468040 (= call!36875 (+!2002 call!36874 (tuple2!10257 k!854 v!557))))))

(declare-fun b!838483 () Bool)

(declare-fun res!570160 () Bool)

(assert (=> b!838483 (=> (not res!570160) (not e!468036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838483 (= res!570160 (validMask!0 mask!1196))))

(declare-fun b!838484 () Bool)

(declare-fun res!570159 () Bool)

(assert (=> b!838484 (=> (not res!570159) (not e!468036))))

(declare-datatypes ((List!16061 0))(
  ( (Nil!16058) (Cons!16057 (h!17188 (_ BitVec 64)) (t!22432 List!16061)) )
))
(declare-fun arrayNoDuplicates!0 (array!47114 (_ BitVec 32) List!16061) Bool)

(assert (=> b!838484 (= res!570159 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16058))))

(declare-fun b!838485 () Bool)

(declare-fun res!570157 () Bool)

(assert (=> b!838485 (=> (not res!570157) (not e!468036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838485 (= res!570157 (validKeyInArray!0 k!854))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun bm!36872 () Bool)

(assert (=> bm!36872 (= call!36875 (getCurrentListMapNoExtraKeys!2520 _keys!868 (array!47117 (store (arr!22589 _values!688) i!612 (ValueCellFull!7267 v!557)) (size!23029 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838486 () Bool)

(declare-fun e!468035 () Bool)

(assert (=> b!838486 (= e!468035 tp_is_empty!15413)))

(declare-fun b!838487 () Bool)

(assert (=> b!838487 (= e!468036 (not true))))

(assert (=> b!838487 e!468040))

(declare-fun c!91180 () Bool)

(assert (=> b!838487 (= c!91180 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28797 0))(
  ( (Unit!28798) )
))
(declare-fun lt!380686 () Unit!28797)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!244 (array!47114 array!47116 (_ BitVec 32) (_ BitVec 32) V!25597 V!25597 (_ BitVec 32) (_ BitVec 64) V!25597 (_ BitVec 32) Int) Unit!28797)

(assert (=> b!838487 (= lt!380686 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!244 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838488 () Bool)

(declare-fun res!570158 () Bool)

(assert (=> b!838488 (=> (not res!570158) (not e!468036))))

(assert (=> b!838488 (= res!570158 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23028 _keys!868))))))

(declare-fun b!838489 () Bool)

(declare-fun e!468037 () Bool)

(declare-fun mapRes!24719 () Bool)

(assert (=> b!838489 (= e!468037 (and e!468039 mapRes!24719))))

(declare-fun condMapEmpty!24719 () Bool)

(declare-fun mapDefault!24719 () ValueCell!7267)

