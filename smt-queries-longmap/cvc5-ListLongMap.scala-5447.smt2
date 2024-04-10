; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72466 () Bool)

(assert start!72466)

(declare-fun b_free!13651 () Bool)

(declare-fun b_next!13651 () Bool)

(assert (=> start!72466 (= b_free!13651 (not b_next!13651))))

(declare-fun tp!48051 () Bool)

(declare-fun b_and!22737 () Bool)

(assert (=> start!72466 (= tp!48051 b_and!22737)))

(declare-fun b!840506 () Bool)

(declare-fun res!571405 () Bool)

(declare-fun e!468976 () Bool)

(assert (=> b!840506 (=> (not res!571405) (not e!468976))))

(declare-datatypes ((array!47312 0))(
  ( (array!47313 (arr!22687 (Array (_ BitVec 32) (_ BitVec 64))) (size!23127 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47312)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47312 (_ BitVec 32)) Bool)

(assert (=> b!840506 (= res!571405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840507 () Bool)

(assert (=> b!840507 (= e!468976 (not true))))

(declare-fun e!468974 () Bool)

(assert (=> b!840507 e!468974))

(declare-fun c!91336 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!840507 (= c!91336 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28867 0))(
  ( (Unit!28868) )
))
(declare-fun lt!380842 () Unit!28867)

(declare-datatypes ((V!25737 0))(
  ( (V!25738 (val!7806 Int)) )
))
(declare-fun v!557 () V!25737)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7319 0))(
  ( (ValueCellFull!7319 (v!10231 V!25737)) (EmptyCell!7319) )
))
(declare-datatypes ((array!47314 0))(
  ( (array!47315 (arr!22688 (Array (_ BitVec 32) ValueCell!7319)) (size!23128 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47314)

(declare-fun minValue!654 () V!25737)

(declare-fun zeroValue!654 () V!25737)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!279 (array!47312 array!47314 (_ BitVec 32) (_ BitVec 32) V!25737 V!25737 (_ BitVec 32) (_ BitVec 64) V!25737 (_ BitVec 32) Int) Unit!28867)

(assert (=> b!840507 (= lt!380842 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!279 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840508 () Bool)

(declare-fun res!571402 () Bool)

(assert (=> b!840508 (=> (not res!571402) (not e!468976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840508 (= res!571402 (validMask!0 mask!1196))))

(declare-datatypes ((tuple2!10346 0))(
  ( (tuple2!10347 (_1!5184 (_ BitVec 64)) (_2!5184 V!25737)) )
))
(declare-datatypes ((List!16136 0))(
  ( (Nil!16133) (Cons!16132 (h!17263 tuple2!10346) (t!22507 List!16136)) )
))
(declare-datatypes ((ListLongMap!9115 0))(
  ( (ListLongMap!9116 (toList!4573 List!16136)) )
))
(declare-fun call!37186 () ListLongMap!9115)

(declare-fun b!840509 () Bool)

(declare-fun call!37187 () ListLongMap!9115)

(declare-fun +!2042 (ListLongMap!9115 tuple2!10346) ListLongMap!9115)

(assert (=> b!840509 (= e!468974 (= call!37187 (+!2042 call!37186 (tuple2!10347 k!854 v!557))))))

(declare-fun b!840510 () Bool)

(declare-fun res!571406 () Bool)

(assert (=> b!840510 (=> (not res!571406) (not e!468976))))

(assert (=> b!840510 (= res!571406 (and (= (size!23128 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23127 _keys!868) (size!23128 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37183 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2560 (array!47312 array!47314 (_ BitVec 32) (_ BitVec 32) V!25737 V!25737 (_ BitVec 32) Int) ListLongMap!9115)

(assert (=> bm!37183 (= call!37186 (getCurrentListMapNoExtraKeys!2560 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840511 () Bool)

(declare-fun res!571409 () Bool)

(assert (=> b!840511 (=> (not res!571409) (not e!468976))))

(assert (=> b!840511 (= res!571409 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23127 _keys!868))))))

(declare-fun bm!37184 () Bool)

(assert (=> bm!37184 (= call!37187 (getCurrentListMapNoExtraKeys!2560 _keys!868 (array!47315 (store (arr!22688 _values!688) i!612 (ValueCellFull!7319 v!557)) (size!23128 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840512 () Bool)

(declare-fun e!468971 () Bool)

(declare-fun tp_is_empty!15517 () Bool)

(assert (=> b!840512 (= e!468971 tp_is_empty!15517)))

(declare-fun mapIsEmpty!24875 () Bool)

(declare-fun mapRes!24875 () Bool)

(assert (=> mapIsEmpty!24875 mapRes!24875))

(declare-fun res!571404 () Bool)

(assert (=> start!72466 (=> (not res!571404) (not e!468976))))

(assert (=> start!72466 (= res!571404 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23127 _keys!868))))))

(assert (=> start!72466 e!468976))

(assert (=> start!72466 tp_is_empty!15517))

(assert (=> start!72466 true))

(assert (=> start!72466 tp!48051))

(declare-fun array_inv!18060 (array!47312) Bool)

(assert (=> start!72466 (array_inv!18060 _keys!868)))

(declare-fun e!468975 () Bool)

(declare-fun array_inv!18061 (array!47314) Bool)

(assert (=> start!72466 (and (array_inv!18061 _values!688) e!468975)))

(declare-fun mapNonEmpty!24875 () Bool)

(declare-fun tp!48052 () Bool)

(assert (=> mapNonEmpty!24875 (= mapRes!24875 (and tp!48052 e!468971))))

(declare-fun mapKey!24875 () (_ BitVec 32))

(declare-fun mapRest!24875 () (Array (_ BitVec 32) ValueCell!7319))

(declare-fun mapValue!24875 () ValueCell!7319)

(assert (=> mapNonEmpty!24875 (= (arr!22688 _values!688) (store mapRest!24875 mapKey!24875 mapValue!24875))))

(declare-fun b!840513 () Bool)

(declare-fun res!571403 () Bool)

(assert (=> b!840513 (=> (not res!571403) (not e!468976))))

(declare-datatypes ((List!16137 0))(
  ( (Nil!16134) (Cons!16133 (h!17264 (_ BitVec 64)) (t!22508 List!16137)) )
))
(declare-fun arrayNoDuplicates!0 (array!47312 (_ BitVec 32) List!16137) Bool)

(assert (=> b!840513 (= res!571403 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16134))))

(declare-fun b!840514 () Bool)

(assert (=> b!840514 (= e!468974 (= call!37187 call!37186))))

(declare-fun b!840515 () Bool)

(declare-fun res!571408 () Bool)

(assert (=> b!840515 (=> (not res!571408) (not e!468976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840515 (= res!571408 (validKeyInArray!0 k!854))))

(declare-fun b!840516 () Bool)

(declare-fun e!468973 () Bool)

(assert (=> b!840516 (= e!468975 (and e!468973 mapRes!24875))))

(declare-fun condMapEmpty!24875 () Bool)

(declare-fun mapDefault!24875 () ValueCell!7319)

