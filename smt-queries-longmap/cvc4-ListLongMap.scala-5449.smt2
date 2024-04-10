; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72482 () Bool)

(assert start!72482)

(declare-fun b_free!13667 () Bool)

(declare-fun b_next!13667 () Bool)

(assert (=> start!72482 (= b_free!13667 (not b_next!13667))))

(declare-fun tp!48099 () Bool)

(declare-fun b_and!22753 () Bool)

(assert (=> start!72482 (= tp!48099 b_and!22753)))

(declare-fun b!840818 () Bool)

(declare-fun e!469120 () Bool)

(declare-datatypes ((V!25757 0))(
  ( (V!25758 (val!7814 Int)) )
))
(declare-datatypes ((tuple2!10360 0))(
  ( (tuple2!10361 (_1!5191 (_ BitVec 64)) (_2!5191 V!25757)) )
))
(declare-datatypes ((List!16148 0))(
  ( (Nil!16145) (Cons!16144 (h!17275 tuple2!10360) (t!22519 List!16148)) )
))
(declare-datatypes ((ListLongMap!9129 0))(
  ( (ListLongMap!9130 (toList!4580 List!16148)) )
))
(declare-fun call!37235 () ListLongMap!9129)

(declare-fun call!37234 () ListLongMap!9129)

(assert (=> b!840818 (= e!469120 (= call!37235 call!37234))))

(declare-fun b!840819 () Bool)

(declare-fun res!571596 () Bool)

(declare-fun e!469118 () Bool)

(assert (=> b!840819 (=> (not res!571596) (not e!469118))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840819 (= res!571596 (validKeyInArray!0 k!854))))

(declare-fun b!840820 () Bool)

(declare-fun res!571594 () Bool)

(assert (=> b!840820 (=> (not res!571594) (not e!469118))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47344 0))(
  ( (array!47345 (arr!22703 (Array (_ BitVec 32) (_ BitVec 64))) (size!23143 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47344)

(assert (=> b!840820 (= res!571594 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23143 _keys!868))))))

(declare-fun b!840821 () Bool)

(assert (=> b!840821 (= e!469118 (not true))))

(assert (=> b!840821 e!469120))

(declare-fun c!91360 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!840821 (= c!91360 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25757)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7327 0))(
  ( (ValueCellFull!7327 (v!10239 V!25757)) (EmptyCell!7327) )
))
(declare-datatypes ((array!47346 0))(
  ( (array!47347 (arr!22704 (Array (_ BitVec 32) ValueCell!7327)) (size!23144 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47346)

(declare-fun minValue!654 () V!25757)

(declare-fun zeroValue!654 () V!25757)

(declare-datatypes ((Unit!28881 0))(
  ( (Unit!28882) )
))
(declare-fun lt!380866 () Unit!28881)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!286 (array!47344 array!47346 (_ BitVec 32) (_ BitVec 32) V!25757 V!25757 (_ BitVec 32) (_ BitVec 64) V!25757 (_ BitVec 32) Int) Unit!28881)

(assert (=> b!840821 (= lt!380866 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!286 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37231 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2567 (array!47344 array!47346 (_ BitVec 32) (_ BitVec 32) V!25757 V!25757 (_ BitVec 32) Int) ListLongMap!9129)

(assert (=> bm!37231 (= call!37235 (getCurrentListMapNoExtraKeys!2567 _keys!868 (array!47347 (store (arr!22704 _values!688) i!612 (ValueCellFull!7327 v!557)) (size!23144 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!571599 () Bool)

(assert (=> start!72482 (=> (not res!571599) (not e!469118))))

(assert (=> start!72482 (= res!571599 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23143 _keys!868))))))

(assert (=> start!72482 e!469118))

(declare-fun tp_is_empty!15533 () Bool)

(assert (=> start!72482 tp_is_empty!15533))

(assert (=> start!72482 true))

(assert (=> start!72482 tp!48099))

(declare-fun array_inv!18074 (array!47344) Bool)

(assert (=> start!72482 (array_inv!18074 _keys!868)))

(declare-fun e!469115 () Bool)

(declare-fun array_inv!18075 (array!47346) Bool)

(assert (=> start!72482 (and (array_inv!18075 _values!688) e!469115)))

(declare-fun mapNonEmpty!24899 () Bool)

(declare-fun mapRes!24899 () Bool)

(declare-fun tp!48100 () Bool)

(declare-fun e!469116 () Bool)

(assert (=> mapNonEmpty!24899 (= mapRes!24899 (and tp!48100 e!469116))))

(declare-fun mapRest!24899 () (Array (_ BitVec 32) ValueCell!7327))

(declare-fun mapKey!24899 () (_ BitVec 32))

(declare-fun mapValue!24899 () ValueCell!7327)

(assert (=> mapNonEmpty!24899 (= (arr!22704 _values!688) (store mapRest!24899 mapKey!24899 mapValue!24899))))

(declare-fun mapIsEmpty!24899 () Bool)

(assert (=> mapIsEmpty!24899 mapRes!24899))

(declare-fun b!840822 () Bool)

(declare-fun e!469119 () Bool)

(assert (=> b!840822 (= e!469119 tp_is_empty!15533)))

(declare-fun bm!37232 () Bool)

(assert (=> bm!37232 (= call!37234 (getCurrentListMapNoExtraKeys!2567 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840823 () Bool)

(declare-fun res!571600 () Bool)

(assert (=> b!840823 (=> (not res!571600) (not e!469118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47344 (_ BitVec 32)) Bool)

(assert (=> b!840823 (= res!571600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840824 () Bool)

(declare-fun res!571597 () Bool)

(assert (=> b!840824 (=> (not res!571597) (not e!469118))))

(assert (=> b!840824 (= res!571597 (and (= (size!23144 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23143 _keys!868) (size!23144 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840825 () Bool)

(declare-fun +!2049 (ListLongMap!9129 tuple2!10360) ListLongMap!9129)

(assert (=> b!840825 (= e!469120 (= call!37235 (+!2049 call!37234 (tuple2!10361 k!854 v!557))))))

(declare-fun b!840826 () Bool)

(assert (=> b!840826 (= e!469116 tp_is_empty!15533)))

(declare-fun b!840827 () Bool)

(assert (=> b!840827 (= e!469115 (and e!469119 mapRes!24899))))

(declare-fun condMapEmpty!24899 () Bool)

(declare-fun mapDefault!24899 () ValueCell!7327)

