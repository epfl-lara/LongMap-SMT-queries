; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72502 () Bool)

(assert start!72502)

(declare-fun b_free!13687 () Bool)

(declare-fun b_next!13687 () Bool)

(assert (=> start!72502 (= b_free!13687 (not b_next!13687))))

(declare-fun tp!48159 () Bool)

(declare-fun b_and!22773 () Bool)

(assert (=> start!72502 (= tp!48159 b_and!22773)))

(declare-fun b!841208 () Bool)

(declare-fun res!571841 () Bool)

(declare-fun e!469297 () Bool)

(assert (=> b!841208 (=> (not res!571841) (not e!469297))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841208 (= res!571841 (validKeyInArray!0 k!854))))

(declare-fun b!841209 () Bool)

(declare-fun res!571840 () Bool)

(assert (=> b!841209 (=> (not res!571840) (not e!469297))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841209 (= res!571840 (validMask!0 mask!1196))))

(declare-datatypes ((V!25785 0))(
  ( (V!25786 (val!7824 Int)) )
))
(declare-datatypes ((tuple2!10380 0))(
  ( (tuple2!10381 (_1!5201 (_ BitVec 64)) (_2!5201 V!25785)) )
))
(declare-datatypes ((List!16164 0))(
  ( (Nil!16161) (Cons!16160 (h!17291 tuple2!10380) (t!22535 List!16164)) )
))
(declare-datatypes ((ListLongMap!9149 0))(
  ( (ListLongMap!9150 (toList!4590 List!16164)) )
))
(declare-fun call!37295 () ListLongMap!9149)

(declare-fun e!469298 () Bool)

(declare-fun call!37294 () ListLongMap!9149)

(declare-fun v!557 () V!25785)

(declare-fun b!841210 () Bool)

(declare-fun +!2057 (ListLongMap!9149 tuple2!10380) ListLongMap!9149)

(assert (=> b!841210 (= e!469298 (= call!37294 (+!2057 call!37295 (tuple2!10381 k!854 v!557))))))

(declare-fun b!841211 () Bool)

(declare-fun res!571835 () Bool)

(assert (=> b!841211 (=> (not res!571835) (not e!469297))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!47384 0))(
  ( (array!47385 (arr!22723 (Array (_ BitVec 32) (_ BitVec 64))) (size!23163 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47384)

(declare-datatypes ((ValueCell!7337 0))(
  ( (ValueCellFull!7337 (v!10249 V!25785)) (EmptyCell!7337) )
))
(declare-datatypes ((array!47386 0))(
  ( (array!47387 (arr!22724 (Array (_ BitVec 32) ValueCell!7337)) (size!23164 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47386)

(assert (=> b!841211 (= res!571835 (and (= (size!23164 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23163 _keys!868) (size!23164 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841212 () Bool)

(assert (=> b!841212 (= e!469297 (not true))))

(assert (=> b!841212 e!469298))

(declare-fun c!91390 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841212 (= c!91390 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!25785)

(declare-fun zeroValue!654 () V!25785)

(declare-datatypes ((Unit!28895 0))(
  ( (Unit!28896) )
))
(declare-fun lt!380896 () Unit!28895)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!293 (array!47384 array!47386 (_ BitVec 32) (_ BitVec 32) V!25785 V!25785 (_ BitVec 32) (_ BitVec 64) V!25785 (_ BitVec 32) Int) Unit!28895)

(assert (=> b!841212 (= lt!380896 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!293 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841213 () Bool)

(assert (=> b!841213 (= e!469298 (= call!37294 call!37295))))

(declare-fun b!841214 () Bool)

(declare-fun e!469300 () Bool)

(declare-fun tp_is_empty!15553 () Bool)

(assert (=> b!841214 (= e!469300 tp_is_empty!15553)))

(declare-fun b!841215 () Bool)

(declare-fun e!469296 () Bool)

(declare-fun mapRes!24929 () Bool)

(assert (=> b!841215 (= e!469296 (and e!469300 mapRes!24929))))

(declare-fun condMapEmpty!24929 () Bool)

(declare-fun mapDefault!24929 () ValueCell!7337)

